<?php
session_start();
include "../inc/config.php";
include "../lib/prosesupdate/ProgressUpdater.php";



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


$data = file_get_contents('http://simak.uinsgd.ac.id/gtakademik/services/my_service/feeder_matakuliah.php?prodi='.$_GET['jurusan'].'&tahun='.$_GET['tahun']);


	  $dta = json_decode($data);

$i=1;
$error_count = 0;
$error = array();
$sukses = 0;
foreach ($dta->data as $dt) {

		$check = $db->check_exist('mat_kurikulum',array('kode_mk' => $dt->kode_mk,'tahun'=>$_GET['tahun']));
	if ($check==true) {
		$error_count++;
		$error[] = $dt->kode_mk." Sudah Ada";
	} else {
		$sukses++;
	$data = array(
	"id_kurikulum"=>$_GET["id_kur"],
	'tahun' => $_GET['tahun'],
	"kode_mk"=>$dt->kode_mk,
	"nama_mk"=>$dt->nm_mk,
	"id_jenj_didik"=>$dt->id_jenj_didik,
	"jns_mk"=>$dt->jns_mk,
	"sks_tm"=>$dt->sks_tm,
	"sks_prak"=>$dt->sks_prak,
	"sks_prak_lap"=>$dt->sks_prak_lap,
	"sks_sim"=>$dt->sks_sim,
	"a_sap"=>$dt->a_sap,
	"s_silabus"=>$dt->a_silabus,
	"a_bahan_ajar"=>$dt->a_bahan_ajar,
	"acara_prakata_dikdat"=>$dt->acara_praka_diktat,
	"semester"=>$dt->semester,
	"kode_jurusan" =>$_GET["jurusan"]
	);

	$in = $db->insert('mat_kurikulum',$data);

}
	 $pu->incrementStageItems(1, true);

$i++;

}


$msg = '';
if (($sukses>0) || ($error_count>0)) {
	$msg =  "<div class=\"alert alert-warning\" role=\"alert\">
			<font color=\"#3c763d\">".$sukses." data Matakuliah baru berhasil Diunduh</font><br />
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



