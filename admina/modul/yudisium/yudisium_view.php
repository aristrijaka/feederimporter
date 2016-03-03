
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Manage Yudisium
                    </h1>
                        <ol class="breadcrumb">
                        <li><a href="<?=base_index();?>"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="<?=base_index();?>yudisium">yudisium</a></li>
                        <li class="active">mahasiswa List</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box">

                                <div class="box-body table-responsive">

                                    <table id="dtb_manual" class="table table-bordered table-striped">
                                   <thead>
                                     <tr>
                          <th>No</th>
                          <th>Nama Jurusan</th>

                          <th>Jumlah mahasiswa</th>

                        </tr>
                                      </thead>
                                        <tbody>
                                        <?php
$i=1;
if ($_SESSION['level']==1) {
$data = $db->fetch_custom("select jurusan.nama_jurusan,(select count(id_pd) from mahasiswa where status='L' and kode_prodi=jurusan.kode_jurusan) as jumlah_mahasiswa,jurusan.kode_jurusan from jurusan left join mahasiswa
on jurusan.kode_jurusan=mahasiswa.kode_prodi group by jurusan.kode_jurusan");
} else {
    $data = $db->fetch_custom("select jurusan.nama_jurusan,(select count(id_pd) from mahasiswa where status='L' and kode_prodi=jurusan.kode_jurusan) as jumlah_mahasiswa,jurusan.kode_jurusan from jurusan left join mahasiswa
on jurusan.kode_jurusan=mahasiswa.kode_prodi where jurusan.kode_jurusan='".$_SESSION['jurusan']."' group by jurusan.kode_jurusan
 ");
}
                                        foreach ($data as $dt) {
                                          ?>
<tr>
<td><?=$i;?></td>
<td>
<a href='<?=base_index();?>yudisium/choose/<?=$dt->kode_jurusan;?>'><?=$dt->nama_jurusan;?></a>
</td>
<td><?=$dt->jumlah_mahasiswa;?></td>
</tr>
<?php
$i++;
                                        }
                                        ?>
                                        </tbody>
                                    </table>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
                        </div>
                    </div>
