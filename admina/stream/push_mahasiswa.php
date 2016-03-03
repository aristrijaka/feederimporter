<?php
//include "inc/config.php";
include "../lib/nusoap/nusoap.php";

include "../inc/config.php";

include "../lib/prosesupdate/ProgressUpdater.php";
//set_time_limit(1000);

$options = array(
    'filename' => $_GET['jurusan'].'_progress.json',
    'autoCalc' => true,
    'totalStages' => 1
);

$pu = new Manticorp\ProgressUpdater($options);

$config = $db->fetch_single_row('config_user','id',1);

if ($config->live=='Y') {
	$url = 'http://'.$config->url.':'.$config->port.'/ws/live.php?wsdl'; // gunakan live
} else {
	$url = 'http://'.$config->url.':'.$config->port.'/ws/sandbox.php?wsdl'; // gunakan sandbox
}
//untuk coba-coba
// $url = 'http://pddikti.uinsgd.ac.id:8082/ws/live.php?wsdl'; // gunakan live bila

$client = new nusoap_client($url, true);
$proxy = $client->getProxy();



# MENDAPATKAN TOKEN
$username = $config->username;
$password = $config->password;
$result = $proxy->GetToken($username, $password);
$token = $result;

//$token = 'acdbbc82c3b29f99e9096dab1d5eafb4';


    $id_sms = '';
    $id_mk = '';
    $sks_mk = '';
    $sks_tm = '';
    $sks_prak = '';
    $sks_prak_lap = '';
    $sks_sim = '';
    $temp_data = array();
    $sukses_count = 0;
    $sukses_msg = '';
    $error_count = 0;
    $error_msg = array();
    $data_id = array();
    $error_id = array();
    //get id npsn
    $filter_sp = "npsn='".$config->id_sp."'";
	$get_id_sp = $proxy->GetRecord($token,'satuan_pendidikan',$filter_sp);

	$id_sp = $get_id_sp['result']['id_sp'];

    $arr_data = $db->fetch_custom("select * from 
        mahasiswa where kode_prodi='".$_GET['jurusan']."' and angkatan='".$_GET['angkatan']."'  ");


$stageOptions = array(
    'name' => 'This AJAX process takes a long time',
    'message' => 'But this will keep the user updated on it\'s actual progress!',
    'totalItems' => $arr_data->rowCount(),
);

$pu->nextStage($stageOptions);
$i=1;
    foreach ($arr_data as $value) {

        $nim = $value->nim;
        $filter_npm = "nm_lemb like '%".$nim."%'";
        $temp_npm = $proxy->GetRecord($token,'mahasiswa_pt',$filter_npm);
        //var_dump($temp_npm);
        if ($temp_npm['result']) {
            $id_reg_pd = $temp_npm['result']['id_reg_pd'];
            $stat_reg = TRUE;
        }

        if (($value->jk=='NULL') || ($value->jk=='')) {
           $jk="L";
        }else{$jk=$value->jk;}
        if (($value->tgl_lahir==NULL) || ($value->tgl_lahir=='')) {
           $tgl_lahir = '1980-01-01';
        }else{$tgl_lahir=$value->tgl_lahir;}
         if (($value->id_agama==NULL) || ($value->id_agama=='')) {
           $id_agama = '1';
        }else{$id_agama=$value->id_agama;}

        $nim = $value->nim;
        $filter_npm = "nipd like '%".$value->id_pd."%'";
        $temp_npm = $proxy->GetRecord($token,'mahasiswa_pt',$filter_npm);
        //var_dump($temp_npm);
        if ($temp_npm['result']) {
              
            $data = array(//"nm_pd"=>$_POST["nm_pd"],
                "jk"=>$value->jk,
                //"tmpt_lahir"=>$_POST["tmpt_lahir"],
                //"tgl_lahir"=>$_POST["tgl_lahir"],
                "id_agama"=>$value->id_agama,"jln"=>$value->jln,
                "rt"=>$value->rt,"rw"=>$value->rw,"nm_dsn"=>$value->nm_dsn,"ds_kel"=>$value->ds_kel,
              
                //"email"=>$_POST["email"],
               // "id_jenjang_pendidikan_ayah"=>$value->id_jenjang_pendidikan_ayah,
               // "id_pekerjaan_ayah"=>$value->id_pekerjaan_ayah,
               /* "tgl_lahir_ayah" => $tgl_lahir_ayah,
                "tgl_lahir_ibu" => $tgl_lahir_ibu,
                 "tgl_lahir_wali" => $tgl_lahir_wali,*/
               // "id_penghasilan_ayah"=>$value->id_penghasilan_ayah,
                // "nm_ibu_kandung"=>$_POST["nm_ibu_kandung"],
               // "id_jenjang_pendidikan_ibu"=>$value->id_jenjang_pendidikan_ibu,
              //  "id_penghasilan_ibu"=>$value->id_penghasilan_ibu,"id_pekerjaan_ibu"=>$value->id_pekerjaan_ibu,
                "nm_wali"=>$value->nm_wali,
               // "id_jenjang_pendidikan_wali"=>$value->id_jenjang_pendidikan_wali,
               // "id_pekerjaan_wali"=>$value->id_pekerjaan_wali,
               // "id_penghasilan_wali"=>$value->id_penghasilan_wali,
                );
             if (($value->telepon_rumah!='') && ($value->telepon_rumah!=0)) {
                 $data['telepon_rumah'] = $value->telepon_rumah;
               }
            
               if (($value->telepon_seluler!='') && ($value->telepon_seluler!=0)) {
                   $data['telepon_seluler'] = $value->telepon_seluler;
               }
            
               if (($value->tgl_lahir_ayah!='') && ($value->tgl_lahir_ayah!='0000-00-00')) {
                   $data['tgl_lahir_ayah'] = $value->tgl_lahir_ayah;
               }
            
               if (($value->tgl_lahir_ibu!='') && ($value->tgl_lahir_ibu!='0000-00-00')) {
                   $data['tgl_lahir_ibu'] = $value->tgl_lahir_ibu;
               }
             
               if (($value->tgl_lahir_wali!='') && ($value->tgl_lahir_wali!='0000-00-00')) {
                  $data['tgl_lahir_wali'] = $value->tgl_lahir_wali;
               }
               
             //  print_r($data);
    
                $id_pd = $temp_npm['result']['id_pd'];
                     // echo $id_pd;
                $key = array('id_pd' => $id_pd, );
                $xxx = array('key' => $key , 'data' => $data);
                $res_2 =  $proxy->UpdateRecord($token, 'mahasiswa', json_encode($xxx));
               // print_r($res_2);
        }
        else{
                  $temp_data = array(
                          'nm_pd'      => $value->nm_pd,
                          'jk'         => $jk,
                          'nisn'       => '',
                          'nik'        => '',
                          'tmpt_lahir' => "bandung",
                          'tgl_lahir'  => $tgl_lahir,
                          'id_agama'   => $id_agama,
                          'id_kk'      => '0',
                          'id_sp'      =>  $id_sp,
                          "jln" => $value->jln,
                          "rt" => "0",
                          "rw" => "0",
                          "nm_dsn" => "",
                          "ds_kel" => "",
                          "id_wil" => "000000",                        
                         // "kode_pos" => $value->kode_pos,
                          "id_jns_tinggal" => "1",
                          "id_alat_transport" => "1",
                          "telepon_rumah" => "",
                          "telepon_seluler" => $value->telepon_seluler,
                          "email" => $value->email,
                          "a_terima_kps" => "0",
                          "no_kps" => "0",
                          "stat_pd" => "A",
                          "nm_ayah" => $value->nm_ayah,
                         // "tgl_lahir_ayah" => $value->tgl_lahir_ayah,
                         // "id_jenjang_pendidikan_ayah" => $value->id_jenjang_pendidikan_ayah,
                         // "id_pekerjaan_ayah" => $value->id_pekerjaan_ayah,
                         // "id_penghasilan_ayah" => $value->id_penghasilan_ayah,
                          "id_kebutuhan_khusus_ayah" => "0",
                          "nm_ibu_kandung" => "ursih",
                        //  "tgl_lahir_ibu" => $value->tgl_lahir_ibu,
                        //  "id_jenjang_pendidikan_ibu" => $value->id_jenjang_pendidikan_ibu,
                         // "id_penghasilan_ibu" => $value->id_penghasilan_ibu,
                         // "id_pekerjaan_ibu" => $value->id_pekerjaan_ibu,
                         "id_kebutuhan_khusus_ibu" => "0",
                         // "nm_wali" => $value->nm_wali,
                         // "tgl_lahir_wali" => $value->tgl_lahir_wali,
                         // "id_jenjang_pendidikan_wali" => $value->id_jenjang_pendidikan_wali,
                         // "id_pekerjaan_wali" => $value->id_pekerjaan_wali,
                         // "id_penghasilan_wali" => $value->id_penghasilan_wali,
                          "kewarganegaraan" => "ID"
                        );

  $temp_result = $proxy->InsertRecord($token, 'mahasiswa', json_encode($temp_data));
 //  print_r($temp_result);
  // print_r($temp_data);
  $id_pd = $temp_result['result']['id_pd'];
  // echo $id_pd;
   $id_lokal = $db->fetch_single_row("jurusan","kode_jurusan",$_GET['jurusan'])->kode_jurusan;
   $filter_ptk = "p.id_sp='".$id_sp."' and p.kode_prodi='".$id_lokal."'";
        $temp_ptk = $proxy->GetRecord($token,'sms',$filter_ptk);
       // print_r($temp_ptk);
        if ($temp_ptk['result']) {
            $id_jenj_didik = $temp_ptk['result']['id_jenj_didik'];
            $id_sms = $temp_ptk['result']['id_sms'];
            $id_sp = $temp_ptk['result']['id_sp'];
        }
   if (($value->tgl_masuk_sp==NULL) || ($value->tgl_masuk_sp=='')) {
       $tgl_masuk = "1999-01-01";
   }else{$tgl_masuk=$value->tgl_masuk_sp;}
   $data2 = array('id_sms' => $id_sms,
                  'id_pd' => $id_pd,
                  //'id_pd' => '929e8498-39f6-4488-bce2-7b0dc749a2f5',
                  'id_sp' => $id_sp,
                  'id_jns_daftar' => '1',
                  'tgl_masuk_sp' => $tgl_masuk,
                  'a_pernah_paud' => '1',
                  'a_pernah_tk' => '1',
                  'mulai_smt' => $value->angkatan.'1',
                  'nipd' => $value->id_pd
                  );

 $res_2 =  $proxy->InsertRecord($token, 'mahasiswa_pt', json_encode($data2));
        }

 // print_r($res_2);
 //print_r($data2);
    $i++;
    $pu->incrementStageItems(1, true);
    $sukses_count++;

    }
//echo $id_pd;
$msg = '';
if ((!$sukses_count==0) || (!$error_count==0)) {
    $msg =  "<div class=\"alert alert-warning \" role=\"alert\">
            <font color=\"#3c763d\">".$sukses_count." data mahasiswa baru berhasil di Upload</font><br />
            <font color=\"#ce4844\" >".$error_count." data tidak bisa diupload </font>";
            
            if (!$error_count==0) {
                $msg .= "<a data-toggle=\"collapse\" href=\"#collapseExample\" aria-expanded=\"false\" aria-controls=\"collapseExample\">Detail error</a>";
            }
            //echo "<br />Total: ".$i." baris data";
            $msg .= "<div class=\"collapse\" id=\"collapseExample\">";
                    $i=1;
                    foreach ($error_msg as $pesan) {
                            $msg .= "<div class=\"bs-callout bs-callout-danger\">".$i.". ".$pesan."</div><br />";
                        $i++;
                        }
            $msg .= "</div>
        </div>";
}

$pu->totallyComplete($msg);


//$pu->totallyComplete();

