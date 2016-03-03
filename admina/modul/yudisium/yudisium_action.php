<?php
session_start();
include "../../inc/config.php";
session_check();
switch ($_GET["act"]) {
  case "in":
  
  
  
  $data = array("tgl_masuk_sp"=>$_POST["tgl_masuk_sp"],"id_jns_daftar"=>$_POST["id_jns_daftar"],"id_jns_keluar"=>$_POST["id_jns_keluar"],"tgl_keluar"=>$_POST["tgl_keluar"],"ket"=>$_POST["ket"],"a_pernah_paud"=>$_POST["a_pernah_paud"],"a_pernah_tk"=>$_POST["a_pernah_tk"],"skhun"=>$_POST["skhun"],"mulai_smt"=>$_POST["mulai_smt"],"kewarganegaraan"=>$_POST["kewarganegaraan"],"nm_pt_asal"=>$_POST["nm_pt_asal"],"nm_prodi_asal"=>$_POST["nm_prodi_asal"],"smt_kum"=>$_POST["smt_kum"],"sks_diakui"=>$_POST["sks_diakui"],"jalur_skripsi"=>$_POST["jalur_skripsi"],"judul_skripsi"=>$_POST["judul_skripsi"],"bln_awal_bimbingan"=>$_POST["bln_awal_bimbingan"],"bln_akhir_bimbingan"=>$_POST["bln_akhir_bimbingan"],"sk_yudisium"=>$_POST["sk_yudisium"],"tgl_sk_yudisium"=>$_POST["tgl_sk_yudisium"],"ipk"=>$_POST["ipk"],"no_seri_ijazah"=>$_POST["no_seri_ijazah"],"sert_prof"=>$_POST["sert_prof"],"a_pindah_mhs_asing"=>$_POST["a_pindah_mhs_asing"],);
  
  
  
   
    $in = $db->insert("mahasiswa",$data);
    
    if ($in=true) {
      echo "good";
    } else {
      return false;
    }
    break;
  case "delete":
    
    
    
    $db->delete("mahasiswa","id_pd",$_GET["id"]);
    break;
  case "up":
   $data = array("tgl_masuk_sp"=>$_POST["tgl_masuk_sp"],"id_jns_daftar"=>$_POST["id_jns_daftar"],"id_jns_keluar"=>$_POST["id_jns_keluar"],"tgl_keluar"=>$_POST["tgl_keluar"],"ket"=>$_POST["ket"],"a_pernah_paud"=>$_POST["a_pernah_paud"],"a_pernah_tk"=>$_POST["a_pernah_tk"],"skhun"=>$_POST["skhun"],"mulai_smt"=>$_POST["mulai_smt"],"kewarganegaraan"=>$_POST["kewarganegaraan"],"nm_pt_asal"=>$_POST["nm_pt_asal"],"nm_prodi_asal"=>$_POST["nm_prodi_asal"],"smt_kum"=>$_POST["smt_kum"],"sks_diakui"=>$_POST["sks_diakui"],"jalur_skripsi"=>$_POST["jalur_skripsi"],"judul_skripsi"=>$_POST["judul_skripsi"],"bln_awal_bimbingan"=>$_POST["bln_awal_bimbingan"],"bln_akhir_bimbingan"=>$_POST["bln_akhir_bimbingan"],"sk_yudisium"=>$_POST["sk_yudisium"],"tgl_sk_yudisium"=>$_POST["tgl_sk_yudisium"],"ipk"=>$_POST["ipk"],"no_seri_ijazah"=>$_POST["no_seri_ijazah"],"sert_prof"=>$_POST["sert_prof"],"a_pindah_mhs_asing"=>$_POST["a_pindah_mhs_asing"],);
   
   
   

    
    $up = $db->update("mahasiswa",$data,"id_pd",$_POST["id"]);
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