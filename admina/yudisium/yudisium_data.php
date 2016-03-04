<?php
session_start();
include "../../inc/config.php";

$columns = array(
	'nama',
	'jk',
	'nim',
	'angkatan'
	);

$query = $new_table->get_custom("select * from mahasiswa where kode_prodi='".$_POST['jurusan']."' and status='L' ",$columns);


$data = array();

foreach ($query	as $value) {
	$ResultData = array();
	$ResultData[] = $value->nm_pd;
	$ResultData[] = $value->jk;
	$ResultData[] = $value->id_pd;
	$ResultData[] = $value->angkatan;

	$data[] = $ResultData;
	
}
//set data
$new_table->set_data($data);
//create our json
$new_table->create_data();



