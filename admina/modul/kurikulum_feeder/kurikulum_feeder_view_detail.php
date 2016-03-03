
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Manage Kurikulum Feeder <?php echo $db->fetch_single_row('jurusan','kode_jurusan',$id_jur)->nama_jurusan;?>
                    </h1>
                        <ol class="breadcrumb">
                        <li><a href="<?=base_index();?>"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="<?=base_index();?>kurikulum">Kurikulum</a></li>
                        <li class="active">Kurikulum List</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box">
                                <div class="box-body table-responsive">
                                <div style="display:none" class="alert alert-danger alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <h4><i class="icon fa fa-ban"></i> Alert!</h4>
               <span id="hasil_delete"></span>
              </div>
                                    <table id="dtb_kurikulum" class="table table-bordered table-striped">
                                   <thead>
                                       <tr>
                                        <th rowspan="2" style="text-align: center;vertical-align: middle;">
                                       No
                                     </th>
                                     <th rowspan="2" style="text-align: center;vertical-align: middle;">
                                       Nama Kurikulum
                                     </th>
                                     <th rowspan="2" style="text-align: center;vertical-align: middle;">Mulai Berlaku</th>
                                     <th colspan="3" style="text-align: center;vertical-align: middle;">Aturan SKS</th>
                                     <th rowspan="2" style="text-align: center;vertical-align: middle;">Action</th>
                                   </tr>
                                     <tr>
                                     <th>Lulus</th>
                          <th>Wajib</th>
                          <th>Pilihan</th>

                          
                          
                       
                         
                        </tr>
                                      </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
                        </div>
                    </div>
        <?php
     
  foreach ($db->fetch_all("sys_menu") as $isi) {

  //jika url = url dari table menu
  if ($path_url==$isi->url) {
    //check edit permission
  if ($role_act["up_act"]=="Y") {
  $edit = '<a href="'.base_index()."kurikulum/edit/'+aData[indek]+'/$id_jur".'" class="btn btn-primary btn-flat"><i class="fa fa-pencil"></i></a>';
  } else {
    $edit ="";
  }
  if ($role_act['del_act']=='Y') {
   $del = "<span data-id='+aData[indek]+' data-uri=".base_admin()."modul/kurikulum_feeder/kurikulum_feeder_action.php".' class="btn btn-danger hapus_feeder btn-flat"><i class="fa fa-trash"></i></span>';
  } else {
    $del="";
  }
                   } 
  }

?>  
                </section><!-- /.content -->
        <script type="text/javascript">
var dataTable = $("#dtb_kurikulum").dataTable({
           "fnCreatedRow": function( nRow, aData, iDataIndex ) {
            var indek = aData.length-1;

     $('td:eq('+indek+')', nRow).html('<?=$edit;?> <?=$del;?>');

       $(nRow).attr('id', 'line_'+aData[indek]);
   },
           'bProcessing': true,
            'bServerSide': true,
            'ordering' : false,
            "ajax":{
              url :"<?=base_admin();?>modul/kurikulum_feeder/kurikulum_feeder_data.php",
            type: "post",  // method  , by default get
            data: function ( d ) {
                      d.jurusan = "<?=$id_jur;?>";
                  },


          error: function (xhr, error, thrown) {
            console.log(xhr);
              $(".dtb_krs-error").html("");
              $("#dtb_krs").append('<tbody class="dtb_krs-error"><tr><th colspan="4">No data found in the server</th></tr></tbody>');
              $("#dtb_krs_processing").css("display","none");

            },
      
          },

        });

    $.ajax({
     url: '<?=base_admin();?>stream/create_json.php?prodi='+<?=$id_jur;?>,
      });
</script>  
            