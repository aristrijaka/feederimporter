

                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                      Kurikulum Feeder
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="<?=base_index();?>"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="<?=base_index();?>kurikulum-feeder">Kurikulum Feeder</a></li>
                        <li class="active">Edit Kurikulum Feeder</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
<div class="row">
    <div class="col-lg-12">
        <div class="box box-solid box-primary">
                                   <div class="box-header">
                                    <h3 class="box-title">Edit Kurikulum Feeder</h3>
                                    <div class="box-tools pull-right">
                                        <button class="btn btn-info btn-sm" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                        <button class="btn btn-info btn-sm" data-widget="remove"><i class="fa fa-times"></i></button>
                                    </div>
                                </div>

                  <div class="box-body">
                     <form id="update" method="post" class="form-horizontal" action="<?=base_admin();?>modul/kurikulum_feeder/kurikulum_feeder_action.php?act=up">
                      <div class="form-group">
                        <label for="nama_kur" class="control-label col-lg-2">nama_kur</label>
                        <div class="col-lg-10">
                          <input type="text" name="nama_kur" value="<?=$data_edit->nama_kur;?>" class="form-control" > 
                        </div>
                      </div><!-- /.form-group -->
<div class="form-group">
                        <label for="mulai_berlaku" class="control-label col-lg-2">mulai_berlaku</label>
                        <div class="col-lg-10">
                          <input type="text" name="mulai_berlaku" value="<?=$data_edit->mulai_berlaku;?>" class="form-control" > 
                        </div>
                      </div><!-- /.form-group -->
<div class="form-group">
                        <label for="jml_sks_wajib" class="control-label col-lg-2">jml_sks_wajib</label>
                        <div class="col-lg-10">
                          <input type="text" name="jml_sks_wajib" value="<?=$data_edit->jml_sks_wajib;?>" class="form-control" > 
                        </div>
                      </div><!-- /.form-group -->
<div class="form-group">
                        <label for="jml_sks_pilihan" class="control-label col-lg-2">jml_sks_pilihan</label>
                        <div class="col-lg-10">
                          <input type="text" name="jml_sks_pilihan" value="<?=$data_edit->jml_sks_pilihan;?>" class="form-control" > 
                        </div>
                      </div><!-- /.form-group -->
<div class="form-group">
                        <label for="total_sks" class="control-label col-lg-2">total_sks</label>
                        <div class="col-lg-10">
                          <input type="text" name="total_sks" value="<?=$data_edit->total_sks;?>" class="form-control" > 
                        </div>
                      </div><!-- /.form-group -->

                      <input type="hidden" name="id" value="<?=$data_edit->id;?>">
                      <div class="form-group">
                        <label for="tags" class="control-label col-lg-2">&nbsp;</label>
                        <div class="col-lg-10">
                          <input type="submit" class="btn btn-primary btn-flat" value="submit">
                        </div>
                      </div><!-- /.form-group -->
                    </form>
                    <a href="<?=base_index();?>kurikulum-feeder" class="btn btn-success btn-flat"><i class="fa fa-step-backward"></i> Kembali</a>
          
                  </div>
                  </div>
              </div>
</div>
                  
                </section><!-- /.content -->
        
 