
<?php
switch ($path_act) {
  case "tambah":
          foreach ($db->fetch_all("sys_menu") as $isi) {
               if ($path_url==$isi->url&&$path_act=="tambah") {
                          if ($role_act["insert_act"]=="Y") {
                             include "yudisium_add.php";
                          } else {
                            echo "permission denied";
                          }
                       } 

      }
    break;
  case "edit":
    $data_edit = $db->fetch_single_row("mahasiswa","id_pd",$path_id);
        foreach ($db->fetch_all("sys_menu") as $isi) {
                      if ($path_url==$isi->url&&$path_act=="edit") {
                          if ($role_act["up_act"]=="Y") {
                             include "yudisium_edit.php";
                          } else {
                            echo "permission denied";
                          }
                       } 

      }

    break;
    case 'choose':
    $id_jur = $path_id;

       include "yudisium_view_detail.php";
      break;
      case "detail":
    $data_edit = $db->fetch_single_row("mahasiswa","id_pd",$path_id);
    include "yudisium_detail.php";
    break;
  default:
    include "yudisium_view.php";
    break;
}

?>