<?php
session_start();
include "../../inc/config.php";

$columns = array(
	'nipd',
	'nm_pd',
	'jk',
	'tmpt_lahir',
	'status_error',
	'id',
	);

if (isset($_POST['semester'])) {

	if ($_POST['semester']=='all') {
		$semester = '';
	} else {
		$semester = "and mulai_smt='".$_POST['semester']."'";
	}


	if ($_POST['status_filter']=='all') {
		$status = '';
	} else {
		$status = " and status_error='".$_POST['status_filter']."'";
	}

		$query = $new_table->get_custom("select *,mhs_pt.id as id_mhs_pt from mhs inner join mhs_pt on mhs.id=mhs_pt.id_mhs where kode_jurusan='".$_POST['jurusan']."' $semester $status",$columns);

}

 else {

	$query = $new_table->get_custom("select *,mhs_pt.id as id_mhs_pt from mhs inner join mhs_pt on mhs.id=mhs_pt.id_mhs where kode_jurusan='".$_POST['jurusan']."'",$columns);
 }



$data = array();

foreach ($query	as $value) {
	$ResultData = array();
		$ResultData[] = "<input type='checkbox'  class='deleteRow' value='".$value->id."'/>";
	$ResultData[] = $value->nipd;
	$ResultData[] = $value->nm_pd;
	$ResultData[] = $value->jk;
	$ResultData[] = $value->tmpt_lahir;
		if ($value->status_error==1) {
		$ResultData[] = '<button rel="tooltip" type="button" class="btn btn-xs btn-success" data-toggle="tooltip" data-placement="left" title="" data-original-title="Sukses"><i class="fa fa-info-circle"></i></button> '.$value->status_error;
	} elseif ($value->status_error==0) {
		$ResultData[] = '<button rel="tooltip" type="button" class="btn btn-xs btn-warning tips" data-toggle="tooltip" data-placement="left" title="Belum diproses" data-original-title="Belum diproses"><i class="fa fa-info-circle"></i></button> '.$value->status_error;
	} else {
		$ResultData[] = '<button rel="tooltip" type="button" class="btn btn-xs btn-danger" data-toggle="tooltip" data-placement="left" title=\''.addslashes($value->keterangan).'\'" data-original-title=\''.addslashes($value->keterangan).'\'"><i class="fa fa-info-circle"></i></button> '.$value->status_error;
	}
	$ResultData[] = $value->id_mhs_pt;

	$data[] = $ResultData;
	
}
//set data
$new_table->set_data($data);
//create our json
$new_table->create_data();



