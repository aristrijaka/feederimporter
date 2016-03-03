<?php
session_start();
include "../inc/config.php";
include "../lib/prosesupdate/ProgressUpdater.php";



set_time_limit(600);


$options = array(
    'filename' => $_GET['jurusan'].'_progress.json',
    'autoCalc' => true,
    'totalStages' => 1
);
$pu = new Manticorp\ProgressUpdater($options);



$stageOptions = array(
    'name' => 'This AJAX process takes a long time',
    'message' => 'But this will keep the user updated on it\'s actual progress!',
    'totalItems' => $_GET['total'],
);


$pu->nextStage($stageOptions);


$data = file_get_contents('http://simak.uinsgd.ac.id/gtakademik/services/my_service/feeder_krs.php?prodi='.$_GET['jurusan'].'&semester='.$_GET['sem']);
	  $dta = json_decode($data);

$i=1;

$error_count = 0;
$error = array();
$sukses = 0;

foreach ($dta->data as $dt) {

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
		$sukses++;
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
}
	 $pu->incrementStageItems(1, true);

$i++;

}



$msg = '';
if (($sukses>0) || ($error_count>0)) {
	$msg =  "<div class=\"alert alert-warning\" role=\"alert\">
			<font color=\"#3c763d\">".$sukses." data Krs baru berhasil Diunduh</font><br />
			<font color=\"#ce4844\" >".$error_count." data tidak bisa ditambahkan </font>";
			if (!$error_count==0) {
				$msg .= "<a data-toggle=\"collapse\" href=\"#collapseExample\" aria-expanded=\"false\" aria-controls=\"collapseExample\">Detail error</a>";
			}
			//echo "<br />Total: ".$i." baris data";
			$msg .= "<div class=\"collapse\" id=\"collapseExample\">";
					$i=1;
					foreach ($error as $pesan) {
							$msg .= "<div class=\"bs-callout bs-callout-danger\">".$i.". ".$pesan."</div><br />";
						$i++;
						}
			$msg .= "</div>
		</div>";
}

$pu->totallyComplete($msg);



