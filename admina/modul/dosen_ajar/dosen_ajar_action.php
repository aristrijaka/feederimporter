<?php
session_start();
include "../../inc/config.php";
session_check();
 /** PHPExcel_IOFactory */
require_once '../../lib/PHPExcel/IOFactory.php';

switch ($_GET["act"]) {

  case 'delete_error':
    $db->fetch_custom("delete from ajar_dosen where status_error=2 and kode_jurusan='".$_POST['id']."'");
    break;
    case 'delete_all':
    $db->fetch_custom("delete from ajar_dosen where kode_jurusan='".$_POST['id']."'");
    break;
    
  case 'import':
     if (!is_dir("../../../upload/dosen_ajar")) {
              mkdir("../../../upload/dosen_ajar");
            }


   if (!preg_match("/.(xls|xlsx)$/i", $_FILES["semester"]["name"]) ) {

              echo "pastikan file yang anda pilih xls|xlsx";
              exit();

            } else {
              move_uploaded_file($_FILES["semester"]["tmp_name"], "../../../upload/dosen_ajar/".$_FILES['semester']['name']);
              $semester = array("semester"=>$_FILES["semester"]["name"]);

            }


$objPHPExcel = PHPExcel_IOFactory::load("../../../upload/dosen_ajar/".$_FILES['semester']['name']);
$error_count = 0;
$error = array();
$sukses = 0;
foreach ($objPHPExcel->getWorksheetIterator() as $worksheet) {
    $highestRow         = $worksheet->getHighestRow(); // e.g. 10
    $highestColumn      = $worksheet->getHighestColumn(); // e.g 'F'
  $highestColumnIndex = PHPExcel_Cell::columnIndexFromString($highestColumn);

    for ($row = 2; $row <= $highestRow; ++ $row) {
    $val=array();
  for ($col = 0; $col < $highestColumnIndex; ++ $col) {
   $cell = $worksheet->getCellByColumnAndRow($col, $row);
   $val[] = $cell->getValue();

  }
if ($val[0]!='') {
  $data = array(
            'semester'=>$val[0],
            'nidn'=>$val[1],
            'nama_dosen'=>$val[2],
            'kode_mk'=>$val[3],
            'nama_kelas'=>$val[4],
            'rencana_tatap_muka'=>$val[5],
            "tatap_muka_real" => $val[6],
            'kode_jurusan' => $_POST['jurusan']
                );

 $in = $db->insert("ajar_dosen",$data);
}


}

}


    unlink("../../../upload/dosen_ajar/".$_FILES['semester']['name']);
    if ($in=true) {
      echo "good";
    } else {
      return false;
    }
    break;
  case 'del_massal':
    $data_ids = $_REQUEST['data_ids'];
    $data_id_array = explode(",", $data_ids);
    if(!empty($data_id_array)) {
        foreach($data_id_array as $id) {
          $db->delete("ajar_dosen","id",$id);
         }
    }
    break;
  case "in":
  
  
  
  $data = array(
    "semester"=>$_POST["semester"],
    "nidn"=>$_POST["nidn"],
    "nama_dosen"=>$_POST["nama_dosen"],
    "kode_mk"=>$_POST["kode_mk"],
    "nama_kelas"=>$_POST["nama_kelas"],
    "rencana_tatap_muka" => $_POST['tatap_muka'],
    "tatap_muka_real" => $_POST['tatap_muka_real'],
    'kode_jurusan' => $_POST['jurusan']
    );
  
  
  
   
    $in = $db->insert("ajar_dosen",$data);
    
    if ($in=true) {
      echo "good";
    } else {
      return false;
    }
    break;
  case "delete":
    
    
    
    $db->delete("ajar_dosen","id",$_GET["id"]);
    break;
  case "up":
   $data = array("semester"=>$_POST["semester"],"nidn"=>$_POST["nidn"],"nama_dosen"=>$_POST["nama_dosen"],"kode_mk"=>$_POST["kode_mk"],"nama_kelas"=>$_POST["nama_kelas"],"rencana_tatap_muka" => $_POST['tatap_muka'],"tatap_muka_real" => $_POST['tatap_muka_real'],'kode_jurusan' => $_POST['jurusan']);
   
   
   

    
    $up = $db->update("ajar_dosen",$data,"id",$_POST["id"]);
    if ($up=true) {
      echo "good";
    } else {
      return false; 
    }
    break;
  default:
    # code...
    break;
}

?>