
<?php
switch ($path_act) {
  case "tambah":
          foreach ($db->fetch_all("sys_menu") as $isi) {
               if ($path_url==$isi->url&&$path_act=="tambah") {
                          if ($role_act["insert_act"]=="Y") {
                             include "hapus_mahasiswa_add.php";
                          } else {
                            echo "permission denied";
                          }
                       } 

      }
    break;
  case "edit":  
  include "lib/nusoap/nusoap.php";
  $config = $db->fetch_single_row('config_user','username','201004e1');
  $url = 'http://'.$config->url.':8082/ws/live.php?wsdl'; // gunakan sandbox
  //untuk coba-coba
  // $url = 'http://pddikti.uinsgd.ac.id:8082/ws/live.php?wsdl'; // gunakan live bila
  $client = new nusoap_client($url, true);
  $proxy = $client->getProxy();

  # MENDAPATKAN TOKEN
  $username = $config->username;
  $password = $config->password;
  $result   = $proxy->GetToken($username, $password);
  $token    = $result;
  $filter_mahasiswa = "p.id_reg_pd='$path_id'";
  $mhs = $proxy->GetRecord($token,"mahasiswa_pt",$filter_mahasiswa);
  $id_pd = $mhs['result']['id_pd'];
  $filter_mahasiswa = "p.id_pd='$id_pd'";
  $hsl =  $proxy->GetRecord($token,"mahasiswa", $filter_mahasiswa);
  //print_r($hsl['result']);
        foreach ($db->fetch_all("sys_menu") as $isi) {
                      if ($path_url==$isi->url&&$path_act=="edit") {
                          if ($role_act["up_act"]=="Y") {
                            //foreach ($hsl['result'] as $data_edit) {
                              $mhs_pt = $mhs['result'];
                              $data_edit = $hsl['result'];
                              include "hapus_mahasiswa_edit.php";
                           // }
                             
                          } else {
                            echo "permission denied";
                          }
                       } 

      }

    break;
      case "detail":
    $data_edit = $db->fetch_single_row("krs","id",$path_id);
    include "hapus_mahasiswa_detail.php";
    break;
     case 'choose':
    $id_jur = $path_id;

       include "hapus_mahasiswa_view_detail.php";
      break;
  default:
    include "hapus_mahasiswa_view.php";
    break;
}

?>