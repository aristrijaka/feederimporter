<?php
//include "inc/config.php";
include "../lib/nusoap/nusoap.php";

include "../inc/config.php";

include "../lib/prosesupdate/ProgressUpdater.php";


$config = $db->fetch_single_row('config_user','id',1);

if ($config->live=='Y') {
	$url = 'http://'.$config->url.':'.$config->port.'/ws/live.php?wsdl'; // gunakan live
} else {
	$url = 'http://'.$config->url.':'.$config->port.'/ws/sandbox.php?wsdl'; // gunakan sandbox
}
//untuk coba-coba
// $url = 'http://pddikti.uinsgd.ac.id:8082/ws/live.php?wsdl'; // gunakan live bila

$client = new nusoap_client($url, true);
$proxy = $client->getProxy();



# MENDAPATKAN TOKEN
$username = $config->username;
$password = $config->password;
$result = $proxy->GetToken($username, $password);
$token = $result;

//$token = 'acdbbc82c3b29f99e9096dab1d5eafb4';


	$id_sms = '';
	$id_mk = '';
	$sks_mk = '';
	$sks_tm = '';
	$sks_prak = '';
	$sks_prak_lap = '';
	$sks_sim = '';
	$temp_data = array();
	$sukses_count = 0;
	$temp_result=array();
	$sukses_msg = '';
	$error_count = 0;
	$error_msg = array();
	$data_id = array();
	$error_id = array();
	//get id npsn
	$filter_sp = "npsn='".$config->id_sp."'";
	$get_id_sp = $proxy->GetRecord($token,'satuan_pendidikan',$filter_sp);

	$id_sp = $get_id_sp['result']['id_sp'];

$table1 = 'kelas_kuliah';

	$arr_data = $db->fetch_custom("select *,nilai.id as id_nilai from nilai inner join jurusan on nilai.kode_jurusan=jurusan.kode_jurusan where jurusan.kode_jurusan='".$_GET['jurusan']."' and nilai.semester='".$_GET['sem']."' and status_error!=1");


$options = array(
    'filename' => $_GET['jurusan'].'_progress.json',
    'autoCalc' => true,
    'totalStages' => 1
);
$pu = new Manticorp\ProgressUpdater($options);



$stageOptions = array(
    'name' => 'This AJAX process takes a long time',
    'message' => 'But this will keep the user updated on it\'s actual progress!',
    'totalItems' => $arr_data->rowCount(),
);


$pu->nextStage($stageOptions);



$i=1;

	foreach ($arr_data as $value) {

		$nim = $value->nim;
		$kode_mk = $value->kode_mk;
		$kelas = $value->nama_kelas;
		$semester = $value->semester;

		//Filter id_mk
		$filter_mk = "kode_mk='".$kode_mk."'";
		$temp_mk = $proxy->GetRecord($token,'mata_kuliah',$filter_mk);
		$tot_mk = count($temp_mk['result']);
		if ($tot_mk != 0) {
			$id_mk = $temp_mk['result']['id_mk'];
		} else {
			$id_mk = '';
		}

		//Filter id_reg_pd
		$filter_mhs = "nipd like '%".$nim."%'";
		$temp_mhs = $proxy->GetRecord($token,'mahasiswa_pt',$filter_mhs);
		$tot_regpd = count($temp_mhs['result']);
		if ($tot_regpd!=0) {
			$id_reg_pd = $temp_mhs['result']['id_reg_pd'];
		} else {
			$id_reg_pd = '';
		}

		//Filter id_kls
		$filter_kls = "p.id_mk='".$id_mk."' AND p.id_smt='".$semester."' AND nm_kls='".$kelas."'";
		$temp_kls = $proxy->GetRecord($token,'kelas_kuliah',$filter_kls);
		$tot_kls = count($temp_kls['result']);

		if ($tot_kls != 0) {
			$id_kls = $temp_kls['result']['id_kls'];

			//inisial data
			$temp_key = array('id_kls' => $id_kls,
								'id_reg_pd' => $id_reg_pd
						);


			$temp_data = array(
								'nilai_angka' => $value->nilai_angka,
								'nilai_huruf' => $value->nilai_huruf,
								'nilai_indeks' => $value->nilai_indek,


						);
			$array_nilai = array('key'=>$temp_key,'data'=>$temp_data);
		} else {
			$id_kls = '';
		}

		if ($id_kls!='') { 
		//Jika Kelas kuliah terdaftar.
			$temp_result = $proxy->UpdateRecord($token,'nilai',json_encode($array_nilai));
				if ( $temp_result['result']['error_desc']==NULL) {
									++$sukses_count;
								
									$db->update('nilai',array('status_error'=>1,'keterangan'=>''),'id',$value->id_nilai);
								} else {
									++$error_count;
									$error_msg[] = "<h4>Error $kode_mk</h4>".$temp_result['result']['error_desc'];
									$db->update('nilai',array('status_error' => 2, 'keterangan'=>$temp_result['result']['error_desc']),'id',$value->id_nilai);
								}
		} else { 
		//Jika kelas kuliah belum terdaftar
			$error_msg[] = "Error $nim Pada Matkul $value->nama_mk Kelas $value->nama_kelas Belum Ada di Feeder";
			++$error_count;
			$db->update('nilai',array('status_error' => 2, 'keterangan'=>"Error $nim pada Matkul $value->nama_mk Kelas $value->nama_kelas Belum Ada di Feeder"),'id',$value->id_nilai);
		}


	
	$i++;
	 $pu->incrementStageItems(1, true);


	}

$msg = '';
		$msg =  "<div class=\"alert alert-warning \" role=\"alert\">
			<font color=\"#3c763d\">".$sukses_count." data Nilai berhasil ditambah</font><br />
			<font color=\"#ce4844\" >".$error_count." data tidak bisa ditambahkan </font>";
			
				$msg .= "<a data-toggle=\"collapse\" href=\"#collapseExample\" aria-expanded=\"false\" aria-controls=\"collapseExample\">Detail error</a>";
			//echo "<br />Total: ".$i." baris data";
			$msg .= "<div class=\"collapse\" id=\"collapseExample\">";
					$i=1;
					foreach ($error_msg as $pesan) {
							$msg .= "<div class=\"bs-callout bs-callout-danger\">".$i.". ".$pesan."</div><br />";
						$i++;
						}
			$msg .= "</div>
		</div>";

$pu->totallyComplete($msg);


//$pu->totallyComplete();

