<?php
//include "inc/config.php";
include "../lib/nusoap/nusoap.php";

include "../inc/config.php";
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





	$filter_sp = "npsn='".$config->id_sp."'";
	$get_id_sp = $proxy->GetRecord($token,'satuan_pendidikan',$filter_sp);

	$id_sp = $get_id_sp['result']['id_sp'];

	echo "<pre>";



	/*	$filter_sms = "id_sp='".$id_sp."'";
		
		$prodi = $proxy->GetRecordset($token,"sms", $filter_sms,"", "","");
		$id_sms = '';

		$id_sms = $prodi['result']['id_sms'];


		foreach ($prodi['result'] as $data) {
			

			$filter_jenjang = "id_jenj_didik='".$data['id_jenj_didik']."'";
			$jenjang = $proxy->GetRecord($token,'jenjang_pendidikan',$filter_jenjang);

			$datas = array(
				'kode_jurusan' => $data['kode_prodi'],
				'nama_jurusan' => $stripped = preg_replace(array('/\s{2,}/', '/[\t\n]/'), ' ', $data['nm_lemb']),
				'status' => $data['stat_prodi'],
				'jenjang' => $jenjang['result']['nm_jenj_didik']
				);

			$db->insert('jurusan',$datas);
				
			}
*/
/*	$mulai_berlaku = "20151";
			$kode_prodi ='55201';
 $filter = "p.kode_prodi='".$kode_prodi."'";
$limit='10';
$offset=0;
$order= "";
$resultrecordset = $proxy->GetRecordset($token,'sms',$filter,$order,$limit,$offset);

print_r($resultrecordset);

	

		$filter_ptk = "p.id_sp='".$id_sp."' and p.kode_prodi='".$kode_prodi."'";
		$temp_ptk = $proxy->GetRecord($token,'sms',$filter_ptk);
		if ($temp_ptk['result']) {
			$id_jenj_didik = $temp_ptk['result']['id_jenj_didik'];
			$id_sms = $temp_ptk['result']['id_sms'];
		}




		$filter_check = "id_sms='".$id_sms."' and id_jenj_didik='".$id_jenj_didik."' and id_smt_berlaku='".$mulai_berlaku."'";

		print_r($filter_check);
		$temp_check = $proxy->GetRecord($token,'kurikulum',$filter_check);

		print_r($temp_check);


			$mulai_berlaku = "20151";
			$kode_prodi ='55201';
$filter_ptk = "p.id_sp='".$id_sp."' and p.kode_prodi='".$kode_prodi."'";
		$temp_ptk = $proxy->GetRecord($token,'sms',$filter_ptk);
		if ($temp_ptk['result']) {
			$id_jenj_didik = $temp_ptk['result']['id_jenj_didik'];
			$id_sms = $temp_ptk['result']['id_sms'];
		}
print_r($temp_ptk);





*/

$limit='10';
$offset=0;
$order= "";

/*$filter_ptk = "p.id_sp='".$id_sp."' and p.kode_prodi='".$kode_prodi."'";
		$temp_ptk = $proxy->GetRecord($token,'sms',$filter_ptk);
		if ($temp_ptk['result']) {
			$id_jenj_didik = $temp_ptk['result']['id_jenj_didik'];
			$id_sms = $temp_ptk['result']['id_sms'];
		}

$resultrecordset = $proxy->GetRecordset($token,'mahasiswa_pt', $filter,$order,$limit,$offset);


$i=1;
foreach ($resultrecordset['result'] as $isi) {*/

	
	$filter_nim = "p.id_pd='1a7732db-e0b5-47c9-aa8a-cdc9a392bf49'";



//	$data_kuliah = $proxy->GetRecord($token,'kuliah_mahasiswa',$filter_nim);
	$data_kuliah = $proxy->GetRecordset($token,'mahasiswa', $filter_nim,$order,$limit,$offset);

print_r($data_kuliah);
?>