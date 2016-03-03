<?php


include "../inc/config.php";

include "../lib/prosesupdate/ProgressUpdater.php";




	$data = file_get_contents('http://simak.uinsgd.ac.id/gtakademik/services/my_service/feeder_krs.php?prodi='.$_GET['jurusan'].'&semester='.$_GET['sem'].'&ask=jumlah');
	  $dta = json_decode($data);
	  $jumlah = $dta->total;

$error_count = 0;
$error = array();
$sukses = 0;

	if ($jumlah>=500) {
		
		if ($jumlah%500==0) {
			$bagi = ($jumlah%500);
			$total = ceil($jumlah/500)+1;
		} else {
			$total = ceil($jumlah/500);
			$bagi = $jumlah%500;
		}



		$options = array(
		    'filename' => $_GET['jurusan'].'_progress.json',
		    'autoCalc' => true,
		    'totalStages' => $total
		);
		$pu = new Manticorp\ProgressUpdater($options);

		for ($i=0; $i <30 ; $i++) { 

		
			$datas = file_get_contents('http://simak.uinsgd.ac.id/gtakademik/services/my_service/feeder_krs.php?prodi='.$_GET['jurusan'].'&semester='.$_GET['sem'].'&page='.$i);
	 		$data = json_decode($datas);
			//let's push first page
			$stageOptions = array(
			    'name' => 'Page $i',
			    'message' => 'Some Message',
			    'totalItems' => $data->jumlah,
			);

			$pu->nextStage($stageOptions);

			

			if ($data->jumlah!=0) {
			foreach ($data->data as $dt) {

				if ($dt->nama_kelas=='') {
				$nama_kelas = "01";
			} else {
				$nama_kelas = $dt->nama_kelas;
			}

			$check = $db->check_exist('krs',array('nim'=>$dt->nim,'kode_mk' => $dt->kode_mk,'semester'=>$dt->semester,'nama_kelas'=>$dt->nama_kelas));
			if ($check==true) {
				$error_count++;
				$error[] = $dt->nim." ".$dt->kode_mk." Sudah Ada";
			} else {
				
				//$sukses++;
				$data = array(
				'semester' => $dt->semester,
				'nim' => $dt->nim,
				'nama' => $dt->nama,
				'kode_mk' => $dt->kode_mk,
				'nama_mk' => $dt->nama_mk,
				'nama_kelas' => $nama_kelas,
				'kode_jurusan' =>$_GET['jurusan'],
				);
				$in = $db->insert('krs',$data);
				$pu->setStageMessage("Proses $dt->nim $dt->nama");
				$pu->incrementStageItems(1, true);
			}


		}

	}

		$total_record = ($i*500+$bagi);
		}
	} else {

		$options = array(
		    'filename' => $_GET['jurusan'].'_progress.json',
		    'autoCalc' => true,
		    'totalStages' => 1
		);
		$new_pu = new Manticorp\ProgressUpdater($options);

		$datas = file_get_contents('http://simak.uinsgd.ac.id/gtakademik/services/my_service/feeder_krs.php?prodi='.$_GET['jurusan'].'&semester='.$_GET['sem']);
	 		$data = json_decode($datas);

			$stageOptions = array(
			    'name' => 'Page $i',
			    'message' => 'Some Message',
			    'totalItems' => $data->jumlah,
			);

			$new_pu->nextStage($stageOptions);

			foreach ($data->data as $dt) {
				//$sukses++;
				$data = array(
				'semester' => $dt->semester,
				'nim' => $dt->nim,
				'nama' => $dt->nama,
				'kode_mk' => $dt->kode_mk,
				'nama_mk' => $dt->nama_mk,
				'nama_kelas' => $nama_kelas,
				'kode_jurusan' =>$_GET['jurusan'],
				);
				$in = $db->insert('krs',$data);
				$pu->incrementStageItems(1, true);
			}

	}

	$msg =  "<div class=\"alert alert-warning \" role=\"alert\">
			<font color=\"#3c763d\">".$total_record." data Krs baru berhasil ditambah</font><br />";
			$msg .= "</div>";

$pu->totallyComplete($msg);	