<?php
include "../../inc/config.php";
include "../../lib/nusoap/nusoap.php";

 $config = $db->fetch_single_row('config_user','username','201004e1');


if ($config->live=='Y') {
  $url = 'http://'.$config->url.':'.$config->port.'/ws/live.php?wsdl'; // gunakan live
} else {
  $url = 'http://'.$config->url.':'.$config->port.'/ws/sandbox.php?wsdl'; // gunakan sandbox
}


  $client = new nusoap_client($url, true);
  $proxy = $client->getProxy();



  # MENDAPATKAN TOKEN
  $username = $config->username;
  $password = $config->password;
  $result = $proxy->GetToken($username, $password);
  $token = $result;




switch ($_GET["act"]) {
  case 'delete_all':
   $prodi = $db->fetch_single_row('jurusan','kode_jurusan',$_POST['id'])->kode_jurusan_dikti;
   $id_sp = $db->fetch_single_row('config_user','username','201004e1')->id_sp;

  $filter_sms = "id_sp='".$id_sp."' and kode_prodi ilike '%".$prodi."%'";
    $temp_sms = $proxy->GetRecord($token,'sms',$filter_sms);
    if ($temp_sms['result']) {
      $id_sms = $temp_sms['result']['id_sms'];
    }
  $filter_semester = "p.id_sms='".$id_sms."' and p.id_smt='".$_POST['sem']."'";
  $all_kelas = $proxy->GetRecordset($token,'kelas_kuliah',$filter_semester,'','','');
      foreach($all_kelas['result'] as $id) {
        $id_kls = $id['id_kls'];
        //hapus dosen ajar
  $filter_dosen = "p.id_kls='".$id_kls."'";
    $temp_dosen = $proxy->GetRecordset($token,'ajar_dosen',$filter_dosen,'','','');
    foreach ($temp_dosen['result'] as $reg) {
      $hapus_ajar = array(
      'id_ajar' => $reg['id_ajar'],
      );
       $temp_res = $proxy->DeleteRecord($token, 'ajar_dosen', json_encode($hapus_ajar));
     }

  //hapus krs
  $filter_nilai = "p.id_kls='".$id_kls."'";
    $temp_sms = $proxy->GetRecordset($token,'nilai',$filter_nilai,'','','');
    foreach ($temp_sms['result'] as $reg) {
      $hapus = array(
      'id_kls' => $reg['id_kls'],
      'id_reg_pd'=>$reg['id_reg_pd']
      );
    //print_r($hapus);
    $temp_result = $proxy->DeleteRecord($token, 'nilai', json_encode($hapus));

   // print_r($temp_result);
    
    }
  //hapus kelas 
   $hapus = array(
      'id_kls' => $id_kls,
      );
    //print_r($hapus);
    $temp_result = $proxy->DeleteRecord($token, 'kelas_kuliah', json_encode($hapus));


      }

    break;
  case "delete":
 
    $filter_nilai = "p.id_reg_pd='".$_GET['id']."'";
    $temp_sms = $proxy->GetRecordset($token,'nilai',$filter_nilai,'','','');
    foreach ($temp_sms['result'] as $reg) {
      $hapus = array(
      'id_kls' => $reg['id_kls'],
      'id_reg_pd'=>$reg['id_reg_pd']
      );  
     // print_r($hapus);
    $temp_result = $proxy->DeleteRecord($token, 'nilai', json_encode($hapus));
      print_r($temp_result);
    }
  $filter_akm = "id_reg_pd='".$_GET['id']."'";
    $temp_akm = $proxy->GetRecordset($token,'kuliah_mahasiswa',$filter_akm,'','','');
    foreach ($temp_akm['result'] as $reg) {
      $hapus = array(
      'id_smt' => $reg['id_smt'],
      'id_reg_pd'=>$reg['id_reg_pd']
      );
  //  print_r($hapus);
    $temp_result = $proxy->DeleteRecord($token, 'kuliah_mahasiswa', json_encode($hapus));
    print_r($temp_result);
  }

  //hapus mahasiswa_pt
  $filter_akm = "id_reg_pd='".$_GET['id']."'";
    $temp_akm = $proxy->GetRecord($token,'mahasiswa_pt',$filter_akm);
      $id_pd = $temp_akm['result']['id_pd'];
      $hapus = array(
        'id_reg_pd'=>$_GET['id']
      );
  //  print_r($hapus);
    $temp_result = $proxy->DeleteRecord($token, 'mahasiswa_pt', json_encode($hapus));
    print_r($temp_result);
  
   $hapus = array(     
      'id_pd'=>$id_pd
      );
  $temp_result = $proxy->DeleteRecord($token, 'mahasiswa', json_encode($hapus));
  print_r($temp_result);

  break;

  case 'del_massal':
     $data_ids = $_REQUEST['data_ids'];
    $data_id_array = explode(",", $data_ids);
    if(!empty($data_id_array)) {

      foreach($data_id_array as $id_kls) {

        //hapus dosen ajar
  $filter_dosen = "p.id_kls='".$id_kls."'";
    $temp_dosen = $proxy->GetRecordset($token,'ajar_dosen',$filter_dosen,'','','');
    foreach ($temp_dosen['result'] as $reg) {
      $hapus_ajar = array(
      'id_ajar' => $reg['id_ajar'],
      );
       $temp_res = $proxy->DeleteRecord($token, 'ajar_dosen', json_encode($hapus_ajar));
     }

  //hapus krs
  $filter_nilai = "p.id_kls='".$id_kls."'";
    $temp_sms = $proxy->GetRecordset($token,'nilai',$filter_nilai,'','','');
    foreach ($temp_sms['result'] as $reg) {
      $hapus = array(
      'id_kls' => $reg['id_kls'],
      'id_reg_pd'=>$reg['id_reg_pd']
      );
    //print_r($hapus);
    $temp_result = $proxy->DeleteRecord($token, 'nilai', json_encode($hapus));

   // print_r($temp_result);
    
    }
  //hapus kelas 
   $hapus = array(
      'id_kls' => $id_kls,
      );
    //print_r($hapus);
    $temp_result = $proxy->DeleteRecord($token, 'kelas_kuliah', json_encode($hapus));


      }

    }
    break;

}