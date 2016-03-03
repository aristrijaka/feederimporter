-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.9-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table feederimporter.agama
CREATE TABLE IF NOT EXISTS `agama` (
  `id_agama` int(11) NOT NULL AUTO_INCREMENT,
  `nm_agama` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_agama`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table feederimporter.ajar_dosen
CREATE TABLE IF NOT EXISTS `ajar_dosen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `semester` varchar(50) NOT NULL,
  `nidn` varchar(50) NOT NULL,
  `nama_dosen` varchar(150) NOT NULL,
  `kode_mk` varchar(150) NOT NULL,
  `nama_mk` varchar(150) NOT NULL,
  `nama_kelas` varchar(150) NOT NULL,
  `rencana_tatap_muka` int(11) NOT NULL,
  `tatap_muka_real` int(11) NOT NULL,
  `kode_jurusan` varchar(50) NOT NULL,
  `status_error` int(11) DEFAULT '0',
  `keterangan` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kode_jurusan` (`kode_jurusan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table feederimporter.config_user
CREATE TABLE IF NOT EXISTS `config_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `url` varchar(150) DEFAULT NULL,
  `port` varchar(150) DEFAULT NULL,
  `id_sp` varchar(150) DEFAULT NULL,
  `live` enum('Y','N') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table feederimporter.fakultas
CREATE TABLE IF NOT EXISTS `fakultas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_fakultas` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table feederimporter.jenjang_pendidikan
CREATE TABLE IF NOT EXISTS `jenjang_pendidikan` (
  `id_jenj_didik` int(11) NOT NULL AUTO_INCREMENT,
  `nm_jenj_didik` varchar(50) DEFAULT '0',
  `u_jenj_lemb` int(11) DEFAULT '0',
  `u_jenj_org` int(11) DEFAULT '0',
  PRIMARY KEY (`id_jenj_didik`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='id_jenj_didik	nm_jenj_didik	u_jenj_lemb	u_jenj_org';

-- Data exporting was unselected.


-- Dumping structure for table feederimporter.jurusan
CREATE TABLE IF NOT EXISTS `jurusan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_jurusan` varchar(50) DEFAULT NULL,
  `nama_jurusan` varchar(150) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `jenjang` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table feederimporter.kelas_kuliah
CREATE TABLE IF NOT EXISTS `kelas_kuliah` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `semester` varchar(50) NOT NULL,
  `kode_mk` varchar(50) NOT NULL,
  `nama_mk` varchar(150) NOT NULL,
  `nama_kelas` varchar(50) NOT NULL,
  `kode_jurusan` varchar(50) NOT NULL,
  `status_error` int(11) NOT NULL,
  `keterangan` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kode_jurusan` (`kode_jurusan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table feederimporter.krs
CREATE TABLE IF NOT EXISTS `krs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nim` varchar(50) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `kode_mk` varchar(50) NOT NULL,
  `nama_mk` varchar(150) NOT NULL,
  `nama_kelas` varchar(50) NOT NULL DEFAULT '01',
  `semester` varchar(50) NOT NULL,
  `kode_jurusan` varchar(50) NOT NULL,
  `status_error` int(11) NOT NULL DEFAULT '0',
  `keterangan` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kode_jurusan` (`kode_jurusan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table feederimporter.krs_coba
CREATE TABLE IF NOT EXISTS `krs_coba` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nim` varchar(50) NOT NULL,
  `nama` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table feederimporter.kurikulum
CREATE TABLE IF NOT EXISTS `kurikulum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kur` varchar(150) NOT NULL,
  `mulai_berlaku` varchar(5) NOT NULL,
  `kode_jurusan` varchar(50) NOT NULL,
  `jml_sks_wajib` int(11) NOT NULL,
  `jml_sks_pilihan` int(11) NOT NULL,
  `total_sks` int(11) NOT NULL,
  `status_error` int(1) NOT NULL,
  `keterangan` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table feederimporter.mahasiswa
CREATE TABLE IF NOT EXISTS `mahasiswa` (
  `id_pd` varchar(100) NOT NULL,
  `angkatan` varchar(5) NOT NULL,
  `id_reg_pd` varchar(100) NOT NULL,
  `nipd` varchar(15) NOT NULL,
  `id_sp` varchar(100) NOT NULL,
  `id_sms` varchar(100) NOT NULL,
  `kode_prodi` varchar(10) NOT NULL,
  `nm_pd` varchar(60) NOT NULL,
  `jk` varchar(1) DEFAULT NULL,
  `nik` varchar(16) DEFAULT NULL,
  `tmpt_lahir` varchar(32) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `id_agama` varchar(1) DEFAULT NULL,
  `id_kk` int(10) DEFAULT NULL,
  `jln` varchar(80) DEFAULT NULL,
  `rt` int(2) DEFAULT NULL,
  `rw` int(2) DEFAULT NULL,
  `nm_dsn` varchar(50) DEFAULT NULL,
  `ds_kel` varchar(50) DEFAULT NULL,
  `id_wil` varchar(8) DEFAULT NULL,
  `kode_pos` varchar(5) DEFAULT NULL,
  `id_jns_tinggal` int(2) DEFAULT NULL,
  `id_alat_transport` int(2) DEFAULT NULL,
  `telepon_rumah` varchar(20) DEFAULT NULL,
  `telepon_seluler` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `a_terima_kps` int(1) DEFAULT NULL,
  `no_kps` varchar(40) DEFAULT NULL,
  `stat_pd` varchar(1) DEFAULT NULL,
  `nm_ayah` varchar(60) DEFAULT NULL,
  `tgl_lahir_ayah` date DEFAULT NULL,
  `id_jenjang_pendidikan_ayah` int(11) DEFAULT NULL,
  `id_pekerjaan_ayah` int(11) DEFAULT NULL,
  `id_penghasilan_ayah` int(11) DEFAULT NULL,
  `id_kebutuhan_khusus_ayah` int(11) DEFAULT '0',
  `nm_ibu_kandung` varchar(60) DEFAULT '0',
  `tgl_lahir_ibu` date DEFAULT NULL,
  `id_jenjang_pendidikan_ibu` int(11) DEFAULT NULL,
  `id_penghasilan_ibu` int(11) DEFAULT NULL,
  `id_pekerjaan_ibu` int(11) DEFAULT NULL,
  `id_kebutuhan_khusus_ibu` int(11) DEFAULT NULL,
  `nm_wali` varchar(30) DEFAULT NULL,
  `tgl_lahir_wali` date DEFAULT NULL,
  `id_jenjang_pendidikan_wali` int(11) DEFAULT NULL,
  `id_pekerjaan_wali` int(11) DEFAULT NULL,
  `id_penghasilan_wali` int(11) DEFAULT NULL,
  `tgl_masuk_sp` date DEFAULT NULL,
  `id_jns_daftar` int(1) DEFAULT NULL,
  `id_jns_keluar` int(1) DEFAULT NULL,
  `tgl_keluar` date DEFAULT NULL,
  `ket` varchar(128) DEFAULT NULL,
  `a_pernah_paud` varchar(1) DEFAULT '0',
  `a_pernah_tk` varchar(1) DEFAULT '0',
  `skhun` varchar(20) DEFAULT NULL,
  `mulai_smt` varchar(5) DEFAULT NULL,
  `kewarganegaraan` varchar(2) DEFAULT 'ID',
  `nm_pt_asal` varchar(50) DEFAULT '0',
  `nm_prodi_asal` varchar(50) DEFAULT '0',
  `smt_kum` int(2) DEFAULT '0',
  `sks_diakui` int(4) DEFAULT '0',
  `jalur_skripsi` int(1) DEFAULT '0',
  `judul_skripsi` varchar(250) DEFAULT '0',
  `bln_awal_bimbingan` date DEFAULT NULL,
  `bln_akhir_bimbingan` date DEFAULT NULL,
  `sk_yudisium` varchar(40) DEFAULT NULL,
  `tgl_sk_yudisium` date DEFAULT NULL,
  `ipk` double DEFAULT NULL,
  `no_seri_ijazah` varchar(40) DEFAULT NULL,
  `sert_prof` varchar(40) DEFAULT NULL,
  `a_pindah_mhs_asing` int(1) DEFAULT NULL,
  `status` enum('A','L','C','D') DEFAULT 'A',
  `nim` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`id_pd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table feederimporter.mat_kurikulum
CREATE TABLE IF NOT EXISTS `mat_kurikulum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_kurikulum` int(11) NOT NULL DEFAULT '0',
  `kode_mk` varchar(50) NOT NULL,
  `tahun` varchar(4) NOT NULL,
  `nama_mk` varchar(150) NOT NULL,
  `id_jenj_didik` int(11) NOT NULL,
  `jns_mk` varchar(50) NOT NULL,
  `sks_tm` int(11) NOT NULL,
  `sks_prak` int(11) NOT NULL,
  `sks_prak_lap` int(11) NOT NULL,
  `sks_sim` int(11) NOT NULL,
  `a_sap` int(11) NOT NULL,
  `s_silabus` int(11) NOT NULL,
  `a_bahan_ajar` int(11) NOT NULL,
  `acara_prakata_dikdat` int(11) NOT NULL,
  `semester` int(11) DEFAULT NULL,
  `kode_jurusan` varchar(50) NOT NULL,
  `status_error` int(11) NOT NULL,
  `keterangan` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_mat_kurikulum_kurikulum` (`id_kurikulum`),
  CONSTRAINT `FK_mat_kurikulum_kurikulum` FOREIGN KEY (`id_kurikulum`) REFERENCES `kurikulum` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table feederimporter.nilai
CREATE TABLE IF NOT EXISTS `nilai` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nim` varchar(50) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `kode_mk` varchar(50) NOT NULL,
  `nama_mk` varchar(150) NOT NULL,
  `nama_kelas` varchar(50) NOT NULL DEFAULT '01',
  `semester` varchar(50) NOT NULL,
  `kode_jurusan` varchar(50) NOT NULL,
  `status_error` int(11) NOT NULL DEFAULT '0',
  `keterangan` varchar(250) NOT NULL,
  `nilai_huruf` varchar(1) DEFAULT NULL,
  `nilai_indek` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kode_jurusan` (`kode_jurusan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table feederimporter.nilai_akm
CREATE TABLE IF NOT EXISTS `nilai_akm` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `semester` varchar(50) DEFAULT NULL,
  `nim` varchar(50) DEFAULT NULL,
  `nama` varchar(150) DEFAULT NULL,
  `ips` decimal(3,2) DEFAULT NULL,
  `ipk` decimal(3,2) DEFAULT NULL,
  `sks_smt` int(11) DEFAULT NULL,
  `sks_total` int(11) DEFAULT NULL,
  `kode_jurusan` varchar(50) DEFAULT NULL,
  `status_kuliah` varchar(1) DEFAULT NULL,
  `status_error` int(11) DEFAULT '0',
  `valid` int(11) DEFAULT '0',
  `ket_valid_ips` varchar(250) DEFAULT NULL,
  `ket_sks_sem` varchar(250) DEFAULT NULL,
  `ket_krs_ada` varchar(250) DEFAULT NULL,
  `ket_valid_ipk` varchar(250) DEFAULT NULL,
  `ket_valid_ips_ipk` varchar(250) DEFAULT NULL,
  `keterangan` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kode_jurusan` (`kode_jurusan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table feederimporter.pekerjaan
CREATE TABLE IF NOT EXISTS `pekerjaan` (
  `id_pekerjaan` int(11) NOT NULL AUTO_INCREMENT,
  `nm_pekerjaan` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_pekerjaan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='id_pekerjaan	nm_pekerjaan';

-- Data exporting was unselected.


-- Dumping structure for table feederimporter.penghasilan
CREATE TABLE IF NOT EXISTS `penghasilan` (
  `id_penghasilan` int(11) NOT NULL AUTO_INCREMENT,
  `nm_penghasilan` varchar(50) DEFAULT '0',
  `batas_bawah` int(11) DEFAULT '0',
  `batas_atas` int(11) DEFAULT '0',
  PRIMARY KEY (`id_penghasilan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='id_penghasilan	nm_penghasilan	batas_bawah	batas_atas';

-- Data exporting was unselected.


-- Dumping structure for table feederimporter.prodi
CREATE TABLE IF NOT EXISTS `prodi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_jurusan` varchar(50) DEFAULT NULL,
  `kode_jurusan_dikti` varchar(50) DEFAULT NULL,
  `nama_jurusan` varchar(150) DEFAULT NULL,
  `jenjang` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table feederimporter.program_studi_dikti
CREATE TABLE IF NOT EXISTS `program_studi_dikti` (
  `prodidiktiKode` varchar(10) NOT NULL DEFAULT '0',
  `prodidiktiKodeJenjang` char(1) DEFAULT NULL,
  `prodidiktiNama` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`prodidiktiKode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Data referensi program Studi menurut dikti.';

-- Data exporting was unselected.


-- Dumping structure for table feederimporter.semester
CREATE TABLE IF NOT EXISTS `semester` (
  `semester` varchar(5) NOT NULL,
  `nama_semester` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`semester`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table feederimporter.sys_group_users
CREATE TABLE IF NOT EXISTS `sys_group_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` varchar(50) DEFAULT NULL,
  `deskripsi` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table feederimporter.sys_menu
CREATE TABLE IF NOT EXISTS `sys_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nav_act` varchar(150) DEFAULT NULL,
  `page_name` varchar(150) DEFAULT NULL,
  `url` varchar(100) NOT NULL,
  `main_table` varchar(150) DEFAULT NULL,
  `icon` varchar(150) DEFAULT NULL,
  `urutan_menu` int(11) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `dt_table` enum('Y','N') NOT NULL,
  `tampil` enum('Y','N') NOT NULL,
  `type_menu` enum('main','page') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table feederimporter.sys_menu_role
CREATE TABLE IF NOT EXISTS `sys_menu_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_menu` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `read_act` enum('Y','N') DEFAULT NULL,
  `insert_act` enum('Y','N') DEFAULT NULL,
  `update_act` enum('Y','N') DEFAULT NULL,
  `delete_act` enum('Y','N') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_sys_menu_role_sys_menu` (`id_menu`),
  KEY `FK_sys_menu_role_sys_users` (`group_id`),
  CONSTRAINT `FK_sys_menu_role_sys_group_users` FOREIGN KEY (`group_id`) REFERENCES `sys_group_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_sys_menu_role_sys_menu` FOREIGN KEY (`id_menu`) REFERENCES `sys_menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table feederimporter.sys_users
CREATE TABLE IF NOT EXISTS `sys_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL DEFAULT '0',
  `last_name` varchar(50) NOT NULL DEFAULT '0',
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `foto_user` varchar(150) DEFAULT NULL,
  `id_group` int(11) DEFAULT NULL,
  `kode_jurusan` int(11) DEFAULT NULL,
  `aktif` enum('Y','N') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_sys_users_sys_group_users` (`id_group`),
  CONSTRAINT `FK_sys_users_sys_group_users` FOREIGN KEY (`id_group`) REFERENCES `sys_group_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
