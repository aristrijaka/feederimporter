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
        mahasiswa where kode_prodi='".$_GET['jurusan']."' and tgl_keluar like '%".$_GET['angkatan']."%' and id_pd='1209705098' limit 1
         ");


$stageOptions = array(
    'name' => 'This AJAX process takes a long time',
    'message' => 'But this will keep the user updated on it\'s actual progress!',
    'totalItems' => $arr_data->rowCount(),
);

$pu->nextStage($stageOptions);
$i=1;
    foreach ($arr_data as $value) {

        $nim = $value->nim;
        $filter_npm = "nipd like '%".$value->id_pd."%'";
        $temp_npm = $proxy->GetRecord($token,'mahasiswa_pt',$filter_npm);
        //var_dump($temp_npm);
        if ($temp_npm['result']) {
            $id_reg_pd = $temp_npm['result']['id_reg_pd'];
            $id_pd = $temp_npm['result']['id_pd'];
        }


   $id_lokal = $db->fetch_single_row("jurusan","kode_jurusan",$_GET['jurusan'])->kode_jurusan;
  $filter_ptk = "p.id_sp='".$id_sp."' and p.kode_prodi='".$id_lokal."'";
        $temp_ptk = $proxy->GetRecord($token,'sms',$filter_ptk);
        if ($temp_ptk['result']) {
            $id_jenj_didik = $temp_ptk['result']['id_jenj_didik'];
            $id_sms = $temp_ptk['result']['id_sms'];
        }
   if (($value->tgl_masuk_sp==NULL) || ($value->tgl_masuk_sp=='')) {
       $tgl_masuk = "1980-01-01";
   }else{$tgl_masuk=$value->tgl_masuk_sp;}
   $key =  array('id_reg_pd' => $id_reg_pd );
  // id_jns_keluar, tgl_keluar, ket, skhun, judul_skripsi, bln_awal_bimbingan, 
  // bln_akhir_bimbingan, sk_yudisium, tgl_sk_yudisium, ipk, no_seri_ijazah, sert_prof
   $data2 = array(
                 // 'id_sms' => $id_sms,
                 // 'id_pd' => $id_pd,
                  //'id_pd' => '2b57c7d8-e0dc-4e46-9b56-749000dae027',
                 // 'id_sp' => $id_sp,
                  //'id_jns_daftar' => '1',
                  'id_jns_keluar' => '1',
                  'tgl_keluar' => $value->tgl_keluar,
                //  'tgl_masuk_sp' => $tgl_masuk,
                 // 'a_pernah_paud' => '1',
                 // 'a_pernah_tk' => '1',
                  //'nipd' => $value->id_pd,
                 // 'mulai_smt' => $value->mulai_smt.'1',
                 // 'sks_diakui' => $value->sks_diakui,
                //  'jalur_skripsi' => $value->jalur_skripsi,
                  'judul_skripsi' => $value->judul_skripsi,
                  //'bln_awal_bimbingan' => $value->bln_awal_bimbingan,
                  //'bln_akhir_bimbingan' => $value->bln_akhir_bimbingan,
                  'sk_yudisium'=> $value->sk_yudisium,
                  'ipk' => $value->ipk,
                  'no_seri_ijazah' => $value->no_seri_ijazah,
                  );
   $xxx = array('key' => $key , 'data' => $data2);

   $res_2 =  $proxy->UpdateRecord($token, 'mahasiswa_pt', json_encode($xxx));
   print_r($res_2);
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

