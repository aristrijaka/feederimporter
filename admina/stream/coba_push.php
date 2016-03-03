<?php
date_default_timezone_set('Asia/Jakarta');

include "../inc/config.php";

include "../lib/prosesupdate/ProgressUpdater.php";


$config = $db->fetch_single_row('config_user','id',1);

$arr_data = $db->fetch_custom("select * from krs inner join jurusan on krs.kode_jurusan=jurusan.kode_jurusan where jurusan.kode_jurusan='".$_GET['jurusan']."' and krs.semester='".$_GET['sem']."'");

/*$arr_data = $db->fetch_custom("select * from krs inner join jurusan on krs.kode_jurusan=jurusan.kode_jurusan where jurusan.kode_jurusan='705' and krs.semester='20141'");*/


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
    'totalItems' => $arr_data->rowCount(),
);


$pu->nextStage($stageOptions);


$sukses_count=0;
$error_count=0;
$error_msg="";
$i=1;

	foreach ($arr_data as $value) {

		$nim = $value->nim;
		$kode_mk = $value->kode_mk;
		$kelas = $value->nama_kelas;
		$semester = $value->semester;

		$id_mk = $pgs->fetch_custom_single("select id_mk from matkul where kode_mk='$kode_mk'");

		if($id_mk!='')
		{
			$id_mk = $id_mk->id_mk;

			$data = array(
		   'id_mk' => $id_mk,
		   'nm_kls' => $kelas,
		   'id_smt' => $semester
		   );
		

			$id_kls = $pgs->fetch_custom_single("select id_kls from kelas_kuliah where id_mk=? and nm_kls=? and id_smt=?",$data);
		if($id_kls!='')
		{
			$id_kls = $id_kls->id_kls;
		



		$id_reg_pd = $pgs->fetch_custom_single("select id_reg_pd from reg_pd where nipd like '".$nim."%'");

		if($id_reg_pd!='')
		{
			$id_reg_pd = $id_reg_pd->id_reg_pd;

				$temp_data = array(
				'id_kls' => $id_kls,
				'id_reg_pd' => $id_reg_pd,
				'asal_data' => 9,
				'last_update' => date('Y-m-d H:m:s'),
				'soft_delete' => 0,
				'last_sync' => '1901-01-01',
				'id_updater' => '71caa5c6-c079-4bce-9751-8fd1325f174d'
				);
$in = $pgs->fetch_custom("UPDATE nilai_smt_mhs SET id_kls='$id_kls', id_reg_pd='$id_reg_pd' WHERE id_kls='$id_kls' and id_reg_pd='$id_reg_pd' ");
		$temp_result = $pgs->fetch_custom("
INSERT INTO nilai_smt_mhs (id_kls,id_reg_pd,asal_data,last_update,soft_delete,last_sync,id_updater)
       SELECT '$id_kls', '$id_reg_pd', 9,'".date('Y-m-d H:m:s')."',0, '1901-01-01','71caa5c6-c079-4bce-9751-8fd1325f174d'
       WHERE NOT EXISTS (SELECT 1 FROM nilai_smt_mhs WHERE id_kls='$id_kls' and id_reg_pd='$id_reg_pd')");
		}

	}

}
	
		
		
		
	if ($temp_result=true) {
            	++$sukses_count;
            }
            else {
            	++$error_count;
            }

		
	$i++;
	 $pu->incrementStageItems(1, true);


	}


if ((!$sukses_count==0) || (!$error_count==0)) {
	$msg=  "<div class=\"alert alert-warning\" role=\"alert\">
			<font color=\"#3c763d\">".$sukses_count." data Kelas baru berhasil ditambah</font><br />
			<font color=\"#ce4844\" >".$error_count." data tidak bisa ditambahkan </font>";
			if (!$error_count==0) {
				$msg.= "<a data-toggle=\"collapse\" href=\"#collapseExample\" aria-expanded=\"false\" aria-controls=\"collapseExample\">Detail error</a>";
			}
	
			$msg.= "
		</div>";
}

$pu->totallyComplete($msg);




