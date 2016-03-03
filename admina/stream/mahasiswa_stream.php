<?php
session_start();
include "../inc/config.php";
include "../lib/prosesupdate/ProgressUpdater.php";



set_time_limit(600);


$options = array(
    'filename' => $_GET['jurusan'].'_progress.json',
    'autoCalc' => true,
    'totalStages' => 1
);
$pu = new Manticorp\ProgressUpdater($options);



$stageOptions = array(
    'name' => 'This AJAX process takes a long time',
    'message' => 'But this will keep the user updated on it\'s actual progress!',
    'totalItems' => $_GET['total'],
);


$pu->nextStage($stageOptions);


$data = file_get_contents('http://simak.uinsgd.ac.id/gtakademik/services/my_service/feeder_mahasiswa.php?prodi='.$_GET['jurusan'].'&angkatan='.$_GET['angkatan']);
$dta = json_decode($data);

$i=1;
$error_count = 0;
$error = array();
$sukses = 0;
foreach ($dta->data as $dt) {

	$check = $db->check_exist('mahasiswa',array('id_pd'=>$dt->nim,));
	if ($check==true) {
		$error_count++;
		$error[] = $dt->nim." Sudah Ada";
	} else {
		$sukses++;
	$data = array(		
		          'angkatan' => $dt->angkatan,
		          'id_pd'   => $dt->nim,
                  'nm_pd'    => $dt->nm_pd,
                  'jk'         => $dt->jk,
                  'nipd'       => '',
                  'nik'        => '',
                  'kode_prodi' => $dt->kode_prodi,
                  'tmpt_lahir'  => $dt->tmpt_lahir,
                  'tgl_lahir'  => $dt->tgl_lahir,
                  'id_agama'    => $dt->id_agama,
                  'id_kk'      => '',
                  'id_sp'      => '',
                  "jln" => $dt->jln,
                  "rt" => "",
                  "rw" => "",
                  "nm_dsn" => "",
                  "ds_kel" => "",
                  "id_wil" => "",
                  "status" => $dt->status,
                  "kode_pos" => $dt->kode_pos,
                  "id_jns_tinggal" => "",
                  "id_alat_transport" => "",
                  "telepon_rumah" => "",
                  "telepon_seluler" => $dt->telepon_seluler,
                  "email" => $dt->email,
                  "a_terima_kps" => "0",
                  "no_kps" => "",
                  "stat_pd" => "",
                  "nm_ayah" => $dt->nm_ayah,
                  "tgl_lahir_ayah" => $dt->tgl_lahir_ayah,
                  "id_jenjang_pendidikan_ayah" => $dt->id_jenjang_pendidikan_ayah,
                  "id_pekerjaan_ayah" => $dt->id_pekerjaan_ayah,
                  "id_penghasilan_ayah" => $dt->id_penghasilan_ayah,
                  "id_kebutuhan_khusus_ayah" => "",
                  "nm_ibu_kandung" => $dt->nm_ibu_kandung,
                  "tgl_lahir_ibu" => $dt->tgl_lahir_ibu,
                  "id_jenjang_pendidikan_ibu" => $dt->id_jenjang_pendidikan_ibu,
                  "id_penghasilan_ibu" => $dt->id_penghasilan_ibu,
                  "id_pekerjaan_ibu" => $dt->id_pekerjaan_ibu,
                  "id_kebutuhan_khusus_ibu" => "",
                  "nm_wali" => $dt->nm_wali,
                  "tgl_lahir_wali" => $dt->tgl_lahir_wali,
                  "id_jenjang_pendidikan_wali" => $dt->id_jenjang_pendidikan_wali,
                  "id_pekerjaan_wali" => $dt->id_pekerjaan_wali,
                  "id_penghasilan_wali" => $dt->id_penghasilan_wali,
                  "kewarganegaraan" => $dt->kewarganegaraan,
                  "tgl_masuk_sp" => $dt->tgl_masuk_sp,
            
		);
		$in = $db->insert('mahasiswa',$data);
	}
	 $pu->incrementStageItems(1, true);

$i++;

}


$msg = '';
if (($sukses>0) || ($error_count>0)) {
	$msg =  "<div class=\"alert alert-warning\" role=\"alert\">
			<font color=\"#3c763d\">".$sukses." data Mahasiswa baru berhasil Diunduh</font><br />
			<font color=\"#ce4844\" >".$error_count." data tidak bisa ditambahkan </font>";
			if (!$error_count==0) {
				$msg .= "<a data-toggle=\"collapse\" href=\"#collapseExample\" aria-expanded=\"false\" aria-controls=\"collapseExample\">Detail error</a>";
			}
			//echo "<br />Total: ".$i." baris data";
			$msg .= "<div class=\"collapse\" id=\"collapseExample\">";
					$i=1;
					foreach ($error as $pesan) {
							$msg .= "<div class=\"bs-callout bs-callout-danger\">".$i.". ".$pesan."</div><br />";
						$i++;
						}
			$msg .= "</div>
		</div>";
}

$pu->totallyComplete($msg);




