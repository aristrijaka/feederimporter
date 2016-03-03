<?php
session_start();
include "../../inc/config.php";
session_check();
switch ($_GET["act"]) {
  case "in":
  
  
  
  $data = array("id_fakultas"=>$_POST["id_fakultas"],"kode_jurusan"=>$_POST["kode_jurusan"],"kode_jurusan"=>$_POST["kode_jurusan"],"nama_jurusan"=>$_POST["nama_jurusan"],);
  
  
  
   
    $in = $db->insert("jurusan",$data);
    
    if ($in=true) {
      echo "good";
    } else {
      return false;
    }
    break;
  case "delete":
    
    
    
    $db->delete("jurusan","id",$_GET["id"]);
    break;
  case "up":
   $data = array("id_fakultas"=>$_POST["id_fakultas"],"kode_jurusan"=>$_POST["kode_jurusan"],"kode_jurusan"=>$_POST["kode_jurusan"],"nama_jurusan"=>$_POST["nama_jurusan"],);
   
   
   

    
    $up = $db->update("jurusan",$data,"id",$_POST["id"]);
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