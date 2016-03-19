<?php
session_start();
include "../../inc/config.php";

  /** PHPExcel_IOFactory */
require_once '../../lib/PHPExcel/IOFactory.php';

session_check();
switch ($_GET["act"]) {
  case 'import':
     if (!is_dir("../../../upload/mahasiswa")) {
              mkdir("../../../upload/mahasiswa");
            }


   if (!preg_match("/.(xls|xlsx)$/i", $_FILES["semester"]["name"]) ) {

              echo "pastikan file yang anda pilih xls|xlsx";
              exit();

            } else {
              move_uploaded_file($_FILES["semester"]["tmp_name"], "../../../upload/mahasiswa/".$_FILES['semester']['name']);
              $semester = array("semester"=>$_FILES["semester"]["name"]);

            }


      $objPHPExcel = PHPExcel_IOFactory::load("../../../upload/mahasiswa/".$_FILES['semester']['name']);
      $error_count = 0;
      $error = array();
      $sukses = 0;
      foreach ($objPHPExcel->getWorksheetIterator() as $worksheet) {
          $highestRow         = $worksheet->getHighestRow(); // e.g. 10
          $highestColumn      = $worksheet->getHighestColumn(); // e.g 'F'
        $highestColumnIndex = PHPExcel_Cell::columnIndexFromString($highestColumn);


          for ($row = 2; $row <= $highestRow; ++ $row) {
          $val=array();
        for ($col = 0; $col < $highestColumnIndex; ++ $col) {
         $cell = $worksheet->getCellByColumnAndRow($col, $row);
         $val[] = $cell->getValue();

        }


          $check = $db->check_exist('mhs_pt',array('nipd' => $val[0]));
          if ($check==true) {
            $error_count++;
            $error[] = $val[0]." ".$val[1]." Sudah Ada";
          } else {
            $sukses++;

        $date1 = date_create('30-12-1899');
        date_add($date1, date_interval_create_from_date_string($val[3].' days'));
        $tgl_lahir = date_format($date1, 'Y-m-d');


        if ($val[24]!='') {
          $date = date_create('30-12-1899');
          date_add($date, date_interval_create_from_date_string($val[24].' days'));
          $tgl_lahir_ayah = date_format($date, 'Y-m-d');
        } else {
          $tgl_lahir_ayah = $val[24];
        }

        if ($val[29]!='') {
          $date2 = date_create('30-12-1899');
          date_add($date2, date_interval_create_from_date_string($val[29].' days'));
          $tgl_lahir_ibu = date_format($date2, 'Y-m-d');
        } else {
          $tgl_lahir_ibu = $val[29];
        }


        if ($val[34]!='') {
          $date3 = date_create('30-12-1899');
          date_add($date3, date_interval_create_from_date_string($val[34].' days'));
          $tgl_lahir_wali = date_format($date3, 'Y-m-d');
        } else {
          $tgl_lahir_wali = $val[34];
        }

          if ($val[8]!='') {
          $date3 = date_create('30-12-1899');
          date_add($date3, date_interval_create_from_date_string($val[8].' days'));
          $tgl_masuk_sp = date_format($date3, 'Y-m-d');
        } else {
          $tgl_masuk_sp = $val[8];
        }

        


          $data = array(
                  'nm_pd'      => $val[1],
                  'tmpt_lahir' => $val[2],
                  'tgl_lahir'  => $tgl_lahir,
                  'jk'         => $val[4],
                  'id_agama'   => $val[5],
                  'id_kk'      => $val[6],
                  "jln"        => $val[10],
                  "rt"         => $val[11],
                  "rw"         => $val[12],
                  "nm_dsn"     => $val[13],
                  "ds_kel"     => $val[14],
                  "kode_pos"   => $val[15],
                  "id_jns_tinggal"      => $val[16],
                  "telepon_rumah"       => $val[17],
                  "telepon_seluler"     => $val[18],
                  "email"               => $val[19],
                  "a_terima_kps"        => $val[20],
                  "no_kps"              => $val[21],
                  "stat_pd"             => $val[22],
                  "nm_ayah"             => $val[23],
                  "tgl_lahir_ayah"      => $tgl_lahir_ayah,
                  "id_jenjang_pendidikan_ayah" => $val[25],
                  "id_pekerjaan_ayah"   => $val[26],
                  "id_penghasilan_ayah" => $val[27],
                  "nm_ibu_kandung"      => $val[28],
                  "tgl_lahir_ibu"       => $tgl_lahir_ibu,
                  "id_jenjang_pendidikan_ibu" => $val[30],
                   "id_pekerjaan_ibu"    => $val[31],
                  "id_penghasilan_ibu"  => $val[32],
                  "nm_wali"             => $val[33],
                  "tgl_lahir_wali"      => $tgl_lahir_wali,
                  "id_jenjang_pendidikan_wali" => $val[35],
                  "id_pekerjaan_wali"   => $val[36],
                  "id_penghasilan_wali" => $val[37]
                 
          );

         
            $in = $db->insert('mhs',$data);

            $last_id = $db->get_last_id();

                 $data_mhs_pt = array(
            'nipd' => $val[0],
            'kode_jurusan' => $_POST['jurusan'],
            'id_mhs' => $last_id,
            'id_jns_daftar' => $val[7],
            'tgl_masuk_sp' => $tgl_masuk_sp,
            'mulai_smt' => $val[9]
            );

            $in = $db->insert('mhs_pt',$data_mhs_pt);

        }

      }

      }


          unlink("../../../upload/mahasiswa/".$_FILES['semester']['name']);
          $msg = '';
      if (($sukses>0) || ($error_count>0)) {
        $msg =  "<div class=\"alert alert-warning alert-dismissible\" role=\"alert\" >
        <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">×</button>
            <font color=\"#3c763d\">".$sukses." data Mahasiswa baru berhasil di import</font><br />
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
     echo $msg;
          break;

  case "in":
  $data_mhs = array(
    "nm_pd"=>$_POST["nm_pd"],"jk"=>$_POST["jk"],"nik"=>$_POST["nik"],"tmpt_lahir"=>$_POST["tmpt_lahir"],"tgl_lahir"=>$_POST["tgl_lahir"],"id_agama"=>$_POST["id_agama"],"jln"=>$_POST["jln"],"rt"=>$_POST["rt"],"rw"=>$_POST["rw"],"nm_dsn"=>$_POST["nm_dsn"],"ds_kel"=>$_POST["ds_kel"],"kode_pos"=>$_POST["kode_pos"],"id_jns_tinggal"=>$_POST["id_jns_tinggal"],"telepon_rumah"=>$_POST["telepon_rumah"],"telepon_seluler"=>$_POST["telepon_seluler"],"email"=>$_POST["email"],"stat_pd"=>$_POST["stat_pd"],"nm_ayah"=>$_POST["nm_ayah"],"tgl_lahir_ayah"=>$_POST["tgl_lahir_ayah"],"id_jenjang_pendidikan_ayah"=>$_POST["id_jenjang_pendidikan_ayah"],"id_pekerjaan_ayah"=>$_POST["id_pekerjaan_ayah"],"id_penghasilan_ayah"=>$_POST["id_penghasilan_ayah"],"nm_ibu_kandung"=>$_POST["nm_ibu_kandung"],"tgl_lahir_ibu"=>$_POST["tgl_lahir_ibu"],"id_jenjang_pendidikan_ibu"=>$_POST["id_jenjang_pendidikan_ibu"],"id_penghasilan_ibu"=>$_POST["id_penghasilan_ibu"],"id_pekerjaan_ibu"=>$_POST["id_pekerjaan_ibu"],"nm_wali"=>$_POST["nm_wali"],"tgl_lahir_wali"=>$_POST["tgl_lahir_wali"],"id_jenjang_pendidikan_wali"=>$_POST["id_jenjang_pendidikan_wali"],"id_pekerjaan_wali"=>$_POST["id_pekerjaan_wali"],"id_penghasilan_wali"=>$_POST["id_penghasilan_wali"],"id_penghasilan_wali"=>$_POST["id_penghasilan_wali"]);

   $data_mhs_pt = array("kode_jurusan"=>$_POST["kode_jurusan"],"id_jns_daftar"=>$_POST["id_jns_daftar"],"nipd"=>$_POST["nipd"],"tgl_masuk_sp"=>$_POST["tgl_masuk_sp"],"mulai_smt"=>$_POST["mulai_smt"]);
  
  
  
   
    $in = $db->insert("mhs",$data_mhs);
    $last_id = $db->get_last_id();
    $last = array('id_mhs' => $last_id);
    $data_mhs_pt = array_merge($data_mhs_pt,$last);

    $in_mhs_pt = $db->insert("mhs_pt",$data_mhs_pt);
    
    if ($in=true) {
      echo "good";
    } else {
      return false;
    }
    break;
  case "delete":
    
    $id = $db->fetch_single_row('mhs_pt','id',$_GET['id']);
    
    $db->delete("mhs","id",$id->id_mhs);
    break;
  case "up":
   $data = array("nm_pd"=>$_POST["nm_pd"],"jk"=>$_POST["jk"],"nik"=>$_POST["nik"],"tmpt_lahir"=>$_POST["tmpt_lahir"],"tgl_lahir"=>$_POST["tgl_lahir"],"id_agama"=>$_POST["id_agama"],"jln"=>$_POST["jln"],"rt"=>$_POST["rt"],"rw"=>$_POST["rw"],"nm_dsn"=>$_POST["nm_dsn"],"ds_kel"=>$_POST["ds_kel"],"kode_pos"=>$_POST["kode_pos"],"id_jns_tinggal"=>$_POST["id_jns_tinggal"],"telepon_rumah"=>$_POST["telepon_rumah"],"telepon_seluler"=>$_POST["telepon_seluler"],"email"=>$_POST["email"],"stat_pd"=>$_POST["stat_pd"],"nm_ayah"=>$_POST["nm_ayah"],"tgl_lahir_ayah"=>$_POST["tgl_lahir_ayah"],"id_jenjang_pendidikan_ayah"=>$_POST["id_jenjang_pendidikan_ayah"],"id_pekerjaan_ayah"=>$_POST["id_pekerjaan_ayah"],"id_penghasilan_ayah"=>$_POST["id_penghasilan_ayah"],"nm_ibu_kandung"=>$_POST["nm_ibu_kandung"],"tgl_lahir_ibu"=>$_POST["tgl_lahir_ibu"],"id_jenjang_pendidikan_ibu"=>$_POST["id_jenjang_pendidikan_ibu"],"id_penghasilan_ibu"=>$_POST["id_penghasilan_ibu"],"id_pekerjaan_ibu"=>$_POST["id_pekerjaan_ibu"],"nm_wali"=>$_POST["nm_wali"],"tgl_lahir_wali"=>$_POST["tgl_lahir_wali"],"id_jenjang_pendidikan_wali"=>$_POST["id_jenjang_pendidikan_wali"],"id_pekerjaan_wali"=>$_POST["id_pekerjaan_wali"],"id_penghasilan_wali"=>$_POST["id_penghasilan_wali"],"id_penghasilan_wali"=>$_POST["id_penghasilan_wali"],);
   

     $data_mhs_pt = array("kode_jurusan"=>$_POST["kode_jurusan"],"id_jns_daftar"=>$_POST["id_jns_daftar"],"nipd"=>$_POST["nipd"],"tgl_masuk_sp"=>$_POST["tgl_masuk_sp"],"mulai_smt"=>$_POST["mulai_smt"]);


     $id = $db->fetch_single_row('mhs_pt','id',$_POST['id']);
    $up = $db->update("mhs",$data,"id",$id->id_mhs);
     $up_pt = $db->update("mhs_pt",$data_mhs_pt,"id",$_POST["id"]);
    if ($up=true) {
      echo "good";
    } else {
      return false; 
    }
    break;
       case 'del_massal':
    $data_ids = $_REQUEST['data_ids'];
    $data_id_array = explode(",", $data_ids);
    if(!empty($data_id_array)) {
        foreach($data_id_array as $id) {
           $ids = $db->fetch_single_row('mhs_pt','id',$id);
          $db->delete("mhs","id",$ids->id_mhs);
         }
    }
    break;

  default:
    # code...
    break;
}

?>