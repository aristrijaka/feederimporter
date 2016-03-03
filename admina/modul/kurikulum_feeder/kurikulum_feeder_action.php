<?php
session_start();
include "../../inc/config.php";
include "../../lib/nusoap/nusoap.php";
session_check();
switch ($_GET["act"]) {
  case "in":
  
  
  
  $data = array("nama_kur"=>$_POST["nama_kur"],"mulai_berlaku"=>$_POST["mulai_berlaku"],"jml_sks_wajib"=>$_POST["jml_sks_wajib"],"jml_sks_pilihan"=>$_POST["jml_sks_pilihan"],"total_sks"=>$_POST["total_sks"],);
  
  
  
   
    $in = $db->insert("kurikulum",$data);
    
    if ($in=true) {
      echo "good";
    } else {
      return false;
    }
    break;
  case "delete":
    
    $config = $db->fetch_single_row('config_user','id',1);


  $url = 'http://'.$config->url.':8082/ws/live.php?wsdl'; // gunakan sandbox
  //untuk coba-coba
  // $url = 'http://pddikti.uinsgd.ac.id:8082/ws/live.php?wsdl'; // gunakan live bila

  $client = new nusoap_client($url, true);
  $proxy = $client->getProxy();



  # MENDAPATKAN TOKEN
  $username = $config->username;
  $password = $config->password;
  $result = $proxy->GetToken($username, $password);
  $token = $result;

  $hapus = array('id_kurikulum_sp' => $_GET["id"]);
  $temp_result = $proxy->DeleteRecord($token, 'kurikulum', json_encode($hapus));
  if ($temp_result['error_desc']=='') {
    echo "good";
  } else {
    echo $temp_result['error_desc'];
  }
  print_r($temp_result);
    break;
  case "up":


    
   
   
   

    
    $up = $db->update("kurikulum",$data,"id",$_POST["id"]);
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