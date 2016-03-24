<?php
session_start();
include "../../inc/config.php";

  /** PHPExcel_IOFactory */
require_once '../../lib/PHPExcel/IOFactory.php';
session_check();
switch ($_GET["act"]) {

  case 'import':
     if (!is_dir("../../../upload/kelulusan")) {
              mkdir("../../../upload/kelulusan");
            }


   if (!preg_match("/.(xls|xlsx)$/i", $_FILES["semester"]["name"]) ) {

              echo "pastikan file yang anda pilih xls|xlsx";
              exit();

            } else {
              move_uploaded_file($_FILES["semester"]["tmp_name"], "../../../upload/kelulusan/".$_FILES['semester']['name']);
              $semester = array("semester"=>$_FILES["semester"]["name"]);

            }


$objPHPExcel = PHPExcel_IOFactory::load("../../../upload/kelulusan/".$_FILES['semester']['name']);
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
if ($val[1]!='') {
  $check = $db->check_exist('kelulusan',array('nim'=>filter_var($val[1], FILTER_UNSAFE_RAW, FILTER_FLAG_STRIP_LOW|FILTER_FLAG_STRIP_HIGH)));
  if ($check==true) {
    $error_count++;
    $error[] = $val[1]." Sudah Ada";
  } else {
    $sukses++;

    $date1 = date_create('30-12-1899');
        date_add($date1, date_interval_create_from_date_string(filter_var($val[4], FILTER_UNSAFE_RAW, FILTER_FLAG_STRIP_LOW|FILTER_FLAG_STRIP_HIGH).' days'));
        $tgl_keluar = date_format($date1, 'Y-m-d');


        if ($val[6]!='') {
          $date = date_create('30-12-1899');
          date_add($date, date_interval_create_from_date_string(filter_var($val[6], FILTER_UNSAFE_RAW, FILTER_FLAG_STRIP_LOW|FILTER_FLAG_STRIP_HIGH).' days'));
          $tanggal_yudisium = date_format($date, 'Y-m-d');
        } else {
          $tanggal_yudisium = $val[6];
        }

        if ($val[10]!='') {
          $date2 = date_create('30-12-1899');
          date_add($date2, date_interval_create_from_date_string(filter_var($val[10], FILTER_UNSAFE_RAW, FILTER_FLAG_STRIP_LOW|FILTER_FLAG_STRIP_HIGH).' days'));
          $tgl_awal = date_format($date2, 'Y-m-d');
        } else {
          $tgl_awal = $val[10];
        }


        if ($val[11]!='') {
          $date3 = date_create('30-12-1899');
          date_add($date3, date_interval_create_from_date_string(filter_var($val[11], FILTER_UNSAFE_RAW, FILTER_FLAG_STRIP_LOW|FILTER_FLAG_STRIP_HIGH).' days'));
          $tgl_akhir = date_format($date3, 'Y-m-d');
        } else {
          $tgl_akhir = $val[11];
        }
      



    $data = array(
            'nim'=>filter_var($val[1], FILTER_UNSAFE_RAW, FILTER_FLAG_STRIP_LOW|FILTER_FLAG_STRIP_HIGH),
            'nama'=>filter_var($val[2], FILTER_UNSAFE_RAW, FILTER_FLAG_STRIP_LOW|FILTER_FLAG_STRIP_HIGH),
            'id_jenis_keluar'=>$val[3],
            'tanggal_keluar' => $tgl_keluar,
            'sk_yudisium'=>filter_var($val[5], FILTER_UNSAFE_RAW, FILTER_FLAG_STRIP_LOW|FILTER_FLAG_STRIP_HIGH),
            'tgl_sk_yudisium'=>$tanggal_yudisium,
            'ipk' => str_replace(",", ".", filter_var($val[7], FILTER_UNSAFE_RAW, FILTER_FLAG_STRIP_LOW|FILTER_FLAG_STRIP_HIGH)),
            'no_seri_ijasah'=>filter_var($val[8], FILTER_UNSAFE_RAW, FILTER_FLAG_STRIP_LOW|FILTER_FLAG_STRIP_HIGH),
            'judul_skripsi'=>filter_var($val[9], FILTER_UNSAFE_RAW, FILTER_FLAG_STRIP_LOW|FILTER_FLAG_STRIP_HIGH),
            'bulan_awal_bimbingan' => $tgl_awal,
            'bulan_akhir_bimbingan' => $tgl_akhir,
            'kode_jurusan' => $_POST['jurusan']
              );

      $in = $db->insert("kelulusan",$data);
  }
}


}

}


    unlink("../../../upload/kelulusan/".$_FILES['semester']['name']);
    $msg = '';
if (($sukses>0) || ($error_count>0)) {
  $msg =  "<div class=\"alert alert-warning alert-dismissible\" role=\"alert\" >
  <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">×</button>
      <font color=\"#3c763d\">".$sukses." data kelulusan baru berhasil Di import</font><br />
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
  
  
  
  $data = array(
    "nim"=>$_POST["nim"],
    "nama"=>$_POST["nama"],
    "tanggal_keluar" => $_POST["tanggal_keluar"],
    "kode_jurusan" => $_POST["jurusan"],
    "id_jenis_keluar"=>$_POST["id_jenis_keluar"],
    "sk_yudisium"=>$_POST["sk_yudisium"],
    "tgl_sk_yudisium"=>$_POST["tgl_sk_yudisium"],"ipk"=>$_POST["ipk"],"no_seri_ijasah"=>$_POST["no_seri_ijasah"],"judul_skripsi"=>$_POST["judul_skripsi"],"bulan_awal_bimbingan"=>$_POST["bulan_awal_bimbingan"],"bulan_akhir_bimbingan"=>$_POST["bulan_akhir_bimbingan"],);
  
  
  
   
    $in = $db->insert("kelulusan",$data);
    
    if ($in=true) {
      echo "good";
    } else {
      return false;
    }
    break;
  case "delete":
    
    
    
    $db->delete("kelulusan","id",$_GET["id"]);
    break;

        case 'del_massal':
    $data_ids = $_REQUEST['data_ids'];
    $data_id_array = explode(",", $data_ids);
    if(!empty($data_id_array)) {
        foreach($data_id_array as $id) {
          $db->delete("kelulusan","id",$id);
         }
    }
    break;

  case "up":
   $data = array(
    "nim"=>$_POST["nim"],
    "nama"=>$_POST["nama"],
    "id_jenis_keluar"=>$_POST["id_jenis_keluar"],
    "kode_jurusan" => $_POST["jurusan"],
     "tanggal_keluar" => $_POST["tanggal_keluar"],
     "sk_yudisium"=>$_POST["sk_yudisium"],"tgl_sk_yudisium"=>$_POST["tgl_sk_yudisium"],"ipk"=>$_POST["ipk"],"no_seri_ijasah"=>$_POST["no_seri_ijasah"],"judul_skripsi"=>$_POST["judul_skripsi"],"bulan_awal_bimbingan"=>$_POST["bulan_awal_bimbingan"],"bulan_akhir_bimbingan"=>$_POST["bulan_akhir_bimbingan"],);
   
   
   

    
    $up = $db->update("kelulusan",$data,"id",$_POST["id"]);
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