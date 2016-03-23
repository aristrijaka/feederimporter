<?php
include "../../inc/config.php";


$check_latest_version = $db->fetch_custom_single("select version from sys_update where status_complete='Y' order by id desc limit 1");


$data = file_get_contents('http://feeder-update.wildantea.com/version.php');


$dta = json_decode($data);

if ($dta->version>$check_latest_version->version) {

	$data_update = file_get_contents('http://feeder-update.wildantea.com/update.php?version='.$dta->version);

	$data_update = json_decode($data_update);

$sukses=0;
$success=array();
$create = "";
	foreach ($data_update as $dt) {
		$file_name = explode(".", $dt->nama_file);
		$data_file = file_get_contents('http://localhost/update/data/'.$dta->version.'/'.$dt->modul_name.'/'.$file_name[0].'.txt');
		$create = $db->buat_file('../../modul/'.$dt->modul_name.'/'.$dt->nama_file,$data_file);
		if ($create==1) {
			$sukses++;
			$success[] = "modul/".$dt->modul_name.'/'.$dt->nama_file." Berhasil Dibuat";
		} 
	}
	$db->insert('sys_update',array('version' => $dta->version,'status_complete' => 'Y'));

	if (($sukses>0)) {
  $msg =  "<div class=\"alert alert-warning alert-dismissible\" role=\"alert\" >
  <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">×</button>
      <font color=\"#3c763d\">".$sukses." File baru berhasil di Update</font><br />";
      if (!$sukses==0) {
        $msg .= "<a data-toggle=\"collapse\" href=\"#collapseExample\" aria-expanded=\"false\" aria-controls=\"collapseExample\">Detail</a>";
      }
      //echo "<br />Total: ".$i." baris data";
      $msg .= "<div class=\"collapse\" id=\"collapseExample\">";
          $i=1;
          foreach ($success as $pesan) {
              $msg .= "<div class=\"bs-callout bs-callout-danger\">".$i.". ".$pesan."</div><br />";
            $i++;
            }
      $msg .= "</div>
    </div>";
}
  
  echo $msg;

	
} else {
	echo "Aplikasi Masih Terbaru";
}

?>