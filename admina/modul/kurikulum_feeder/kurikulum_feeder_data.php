<?php
//include "inc/config.php";
include "../../lib/nusoap/nusoap.php";

include "../../inc/config.php";

include "../../lib/prosesupdate/ProgressUpdater.php";


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

//get id npsn
$filter_sp = "npsn='".$config->id_sp."'";
	$get_id_sp = $proxy->GetRecord($token,'satuan_pendidikan',$filter_sp);

	$id_sp = $get_id_sp['result']['id_sp'];

$id_sms = '';



		$requestData= $_REQUEST;

		$sSearch = $requestData['search']['value'];
		
		//$Data = $this->input->get('columns');
		//$orders = $requestData['order'];
		//$temp_order = 


		$iStart = $requestData['start'];
		$iLength = $requestData['length'];

		$temp_limit = $iLength;
		$temp_offset = $iStart?$iStart : 0;

		$filter = '';

		$kode_prodi = $requestData['jurusan'];

		$prodi = $db->fetch_single_row('jurusan','kode_jurusan',$kode_prodi)->kode_jurusan;


		$filter_sms = "id_sp='".$id_sp."' and kode_prodi ilike '%".$prodi."%'";
		$temp_sms = $proxy->GetRecord($token,'sms',$filter_sms);
		if ($temp_sms['result']) {
			$id_sms = $temp_sms['result']['id_sms'];
		}
		$filter_kurikulum = "id_sms='".$id_sms."'";


		$temp_total = $proxy->GetCountRecordset($token,"kurikulum",$filter_kurikulum);

		$totalData = $temp_total['result'];
		//var_dump($temp_total);
		//$totalData = $temp_total['result'];

		$totalFiltered = $totalData;
		 if( !empty($requestData['search']['value']) ) {
			$temp_filter = "id_sms ='".$id_sms."' and nm_kurikulum_sp like '%".$requestData['search']['value']."%'";
			$temp_rec = $proxy->GetRecordset($token,
												"kurikulum", $temp_filter,'id_smt_berlaku DESC', $temp_limit,$temp_offset
								);
			//var_dump($temp_rec);
			$__total = $proxy->GetCountRecordset($token,"kurikulum",$temp_filter);
			$totalFiltered = $__total['result'];
		} else {
			$temp_rec = $proxy->GetRecordset($token,"kurikulum", $filter_kurikulum,"id_smt_berlaku DESC", $temp_limit,$temp_offset
								);
			//var_dump($temp_rec['result']);
		}
		//var_dump($temp_rec);
		$temp_error_code = $temp_rec['error_code'];
		$temp_error_desc = $temp_rec['error_desc'];

		if (($temp_error_code==0) && ($temp_error_desc=='')) {
			$temp_data = array();
			$i=0;
			foreach ($temp_rec['result'] as $key) {
				$temps = array();
				
				$temps[] = ++$i+$temp_offset;
				$temps[] = $key['nm_kurikulum_sp'];
				$temps[] = $key['id_smt_berlaku'];
				$temps[] = $key['jml_sks_lulus'];
				$temps[] = $key['jml_sks_wajib'];
				$temps[] = $key['jml_sks_pilihan'];
				$temps[] = $key['id_kurikulum_sp'];
				
				$temp_data[] = $temps;
			}
			$temp_output = array(
									'draw' => intval($requestData['draw']),
									'recordsTotal' => intval( $totalData ),
									'recordsFiltered' => intval( $totalFiltered ),
									'data' => $temp_data
				);
			echo json_encode($temp_output);
}