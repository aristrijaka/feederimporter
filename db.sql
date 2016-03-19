-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 19, 2016 at 02:01 PM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `feederimporter`
--

-- --------------------------------------------------------

--
-- Table structure for table `agama`
--

CREATE TABLE `agama` (
  `id_agama` int(11) NOT NULL,
  `nm_agama` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agama`
--

INSERT INTO `agama` (`id_agama`, `nm_agama`) VALUES
(1, 'Islam'),
(2, 'Kristen'),
(3, 'Katholik'),
(4, 'Hindu'),
(5, 'Budha'),
(6, 'Konghuchu'),
(99, 'Lainnya');

-- --------------------------------------------------------

--
-- Table structure for table `ajar_dosen`
--

CREATE TABLE `ajar_dosen` (
  `id` int(11) NOT NULL,
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
  `keterangan` tinytext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `config_user`
--

CREATE TABLE `config_user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `url` varchar(150) DEFAULT NULL,
  `port` varchar(150) DEFAULT NULL,
  `id_sp` varchar(150) DEFAULT NULL,
  `live` enum('Y','N') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `config_user`
--

INSERT INTO `config_user` (`id`, `username`, `password`, `url`, `port`, `id_sp`, `live`) VALUES
(1, 'usernamefeeeder', 'passfeeder', 'localhost', '8082', '234', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `fakultas`
--

CREATE TABLE `fakultas` (
  `id` int(11) NOT NULL,
  `nama_fakultas` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jenis_keluar`
--

CREATE TABLE `jenis_keluar` (
  `id_jns_keluar` varchar(1) NOT NULL,
  `ket_keluar` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenis_keluar`
--

INSERT INTO `jenis_keluar` (`id_jns_keluar`, `ket_keluar`) VALUES
('	', 'Lainnya'),
('1', 'Lulus'),
('2', 'Mutasi'),
('3', 'Dikeluarkan'),
('4', 'Mengundurkan diri'),
('5', 'Putus Sekolah'),
('6', 'Wafat'),
('7', 'Hilang');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_pendaftaran`
--

CREATE TABLE `jenis_pendaftaran` (
  `id_jns_daftar` int(11) NOT NULL,
  `nm_jns_daftar` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenis_pendaftaran`
--

INSERT INTO `jenis_pendaftaran` (`id_jns_daftar`, `nm_jns_daftar`) VALUES
(1, 'Peserta didik baru'),
(2, 'Pindahan'),
(3, 'Naik kelas'),
(4, 'Akselerasi'),
(5, 'Mengulang'),
(6, 'Lanjutan semester'),
(8, 'Pindahan Alih Bentuk'),
(11, 'Alih Jenjang'),
(12, 'Lintas Jalur');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_tinggal`
--

CREATE TABLE `jenis_tinggal` (
  `id_jns_tinggal` int(11) NOT NULL,
  `nm_jns_tinggal` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenis_tinggal`
--

INSERT INTO `jenis_tinggal` (`id_jns_tinggal`, `nm_jns_tinggal`) VALUES
(1, 'Bersama orang tua'),
(2, 'Wali'),
(3, 'Kost'),
(4, 'Asrama'),
(5, 'Panti asuhan'),
(99, 'Lainnya');

-- --------------------------------------------------------

--
-- Table structure for table `jenjang_pendidikan`
--

CREATE TABLE `jenjang_pendidikan` (
  `id_jenj_didik` int(11) NOT NULL,
  `nm_jenj_didik` varchar(50) DEFAULT '0',
  `u_jenj_lemb` int(11) DEFAULT '0',
  `u_jenj_org` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='id_jenj_didik	nm_jenj_didik	u_jenj_lemb	u_jenj_org';

--
-- Dumping data for table `jenjang_pendidikan`
--

INSERT INTO `jenjang_pendidikan` (`id_jenj_didik`, `nm_jenj_didik`, `u_jenj_lemb`, `u_jenj_org`) VALUES
(1, 'Tidak Sekolah', 0, 0),
(2, 'Paud', 0, 0),
(3, 'TK / Sederajat', 0, 0),
(4, 'Putus SD', 0, 0),
(5, 'SD / Sederajat', 0, 0),
(6, 'SMP / Sederajat', 0, 0),
(7, 'SMA / Sederajat', 0, 0),
(8, 'Paket A', 0, 0),
(9, 'Paket B', 0, 0),
(10, 'Paket C', 0, 0),
(20, 'D1', 1, 1),
(21, 'D2', 1, 1),
(22, 'D3', 1, 1),
(23, 'D4', 1, 1),
(25, 'Profesi', 1, 1),
(30, 'S1', 1, 1),
(32, 'Sp-1', 1, 1),
(35, 'S2', 1, 1),
(37, 'Sp-2', 1, 1),
(40, 'S3', 1, 1),
(90, 'Non formal', 1, 0),
(91, 'Informal', 1, 0),
(99, 'Lainnya', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `id` int(11) NOT NULL,
  `kode_jurusan` varchar(50) DEFAULT NULL,
  `nama_jurusan` varchar(150) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `jenjang` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kelas_kuliah`
--

CREATE TABLE `kelas_kuliah` (
  `id` int(11) NOT NULL,
  `semester` varchar(50) NOT NULL,
  `kode_mk` varchar(50) NOT NULL,
  `nama_mk` varchar(150) NOT NULL,
  `nama_kelas` varchar(50) NOT NULL,
  `kode_jurusan` varchar(50) NOT NULL,
  `status_error` int(11) NOT NULL,
  `keterangan` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kelulusan`
--

CREATE TABLE `kelulusan` (
  `id` int(11) NOT NULL,
  `nim` varchar(50) NOT NULL,
  `kode_jurusan` varchar(50) NOT NULL,
  `nama` varchar(250) NOT NULL,
  `id_jenis_keluar` int(11) NOT NULL,
  `tanggal_keluar` date NOT NULL,
  `sk_yudisium` varchar(150) NOT NULL,
  `tgl_sk_yudisium` date NOT NULL,
  `ipk` varchar(50) NOT NULL,
  `no_seri_ijasah` varchar(150) NOT NULL,
  `jalur_skripsi` enum('1','0') NOT NULL,
  `judul_skripsi` tinytext NOT NULL,
  `bulan_awal_bimbingan` date NOT NULL,
  `bulan_akhir_bimbingan` date NOT NULL,
  `status_error` int(11) NOT NULL DEFAULT '0',
  `keterangan` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `krs`
--

CREATE TABLE `krs` (
  `id` int(11) NOT NULL,
  `nim` varchar(50) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `kode_mk` varchar(50) NOT NULL,
  `nama_mk` varchar(150) NOT NULL,
  `nama_kelas` varchar(50) NOT NULL DEFAULT '01',
  `semester` varchar(50) NOT NULL,
  `kode_jurusan` varchar(50) NOT NULL,
  `status_error` int(11) NOT NULL DEFAULT '0',
  `keterangan` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kurikulum`
--

CREATE TABLE `kurikulum` (
  `id` int(11) NOT NULL,
  `nama_kur` varchar(150) NOT NULL,
  `mulai_berlaku` varchar(5) NOT NULL,
  `kode_jurusan` varchar(50) NOT NULL,
  `jml_sks_wajib` int(11) NOT NULL,
  `jml_sks_pilihan` int(11) NOT NULL,
  `total_sks` int(11) NOT NULL,
  `status_error` int(1) NOT NULL,
  `keterangan` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mat_kurikulum`
--

CREATE TABLE `mat_kurikulum` (
  `id` int(11) NOT NULL,
  `id_kurikulum` int(11) NOT NULL DEFAULT '0',
  `kode_mk` varchar(50) NOT NULL,
  `tahun` varchar(5) NOT NULL,
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
  `keterangan` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mhs`
--

CREATE TABLE `mhs` (
  `id` int(11) NOT NULL,
  `nm_pd` varchar(150) DEFAULT NULL COMMENT 'Nama Mahasiswa',
  `jk` varchar(10) NOT NULL COMMENT 'L: Laki-laki, P: Perempuan, *: Belum ada informasi',
  `nisn` varchar(50) DEFAULT NULL COMMENT 'Nomor Induk Siswa Nasional',
  `nik` varchar(50) DEFAULT NULL COMMENT 'Nomor Induk Kependudukan',
  `tmpt_lahir` varchar(50) DEFAULT NULL,
  `tgl_lahir` date NOT NULL COMMENT 'yyyy-mm-dd',
  `id_agama` int(10) NOT NULL COMMENT 'Web Service: GetRecordset:agama',
  `id_kk` int(10) NOT NULL DEFAULT '0' COMMENT 'Default 0',
  `id_sp` varchar(50) NOT NULL COMMENT 'ID Perguruan Tinggi. Web Service: GetRecordset:satuan_pendidikan',
  `jln` varchar(250) DEFAULT NULL COMMENT 'Jalan',
  `rt` varchar(50) DEFAULT NULL,
  `rw` varchar(50) DEFAULT NULL,
  `nm_dsn` varchar(50) DEFAULT NULL COMMENT 'Nama Dusun',
  `ds_kel` varchar(50) NOT NULL,
  `id_wil` varchar(50) NOT NULL DEFAULT '000000' COMMENT 'ID Wilayah. Web Service: GetRecordset:wilayah',
  `kode_pos` varchar(50) DEFAULT NULL,
  `id_jns_tinggal` int(10) DEFAULT NULL COMMENT 'Web Service: GetRecordset:jenis_tinggal',
  `id_alat_transport` int(10) DEFAULT NULL COMMENT 'Web Service: GetRecordset:alat_transport',
  `telepon_rumah` varchar(50) DEFAULT NULL,
  `telepon_seluler` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `a_terima_kps` varchar(50) NOT NULL COMMENT '0: Bukan penerima KPS, 1: Penerima KPS',
  `no_kps` varchar(50) DEFAULT NULL COMMENT 'Nomor KPS (KARTU PERLINDUNGAN SOSIAL)',
  `stat_pd` varchar(10) NOT NULL COMMENT 'A: , C: , D: , L: , P: , K: , N: , G: , X: ',
  `nm_ayah` varchar(50) DEFAULT NULL,
  `tgl_lahir_ayah` varchar(50) DEFAULT NULL COMMENT 'yyyy-mm-dd',
  `id_jenjang_pendidikan_ayah` int(10) DEFAULT NULL COMMENT 'Web Service: GetRecordset:jenjang_pendidikan',
  `id_pekerjaan_ayah` int(10) DEFAULT NULL COMMENT 'Web Service: GetRecordset:pekerjaan',
  `id_penghasilan_ayah` int(10) DEFAULT NULL COMMENT 'Web Service: GetRecordset:penghasilan',
  `id_kebutuhan_khusus_ayah` int(10) NOT NULL DEFAULT '0' COMMENT 'Default 0',
  `nm_ibu_kandung` varchar(50) NOT NULL,
  `tgl_lahir_ibu` varchar(50) DEFAULT NULL COMMENT 'yyyy-mm-dd',
  `id_jenjang_pendidikan_ibu` int(10) DEFAULT NULL COMMENT 'Web Service: GetRecordset:jenjang_pendidikan',
  `id_penghasilan_ibu` int(10) DEFAULT NULL COMMENT 'Web Service: GetRecordset:penghasilan',
  `id_pekerjaan_ibu` int(10) DEFAULT NULL COMMENT 'Web Service: GetRecordset:pekerjaan',
  `id_kebutuhan_khusus_ibu` int(10) NOT NULL DEFAULT '0' COMMENT 'Default 0',
  `nm_wali` varchar(50) DEFAULT NULL,
  `tgl_lahir_wali` varchar(50) DEFAULT NULL COMMENT 'yyyy-mm-dd',
  `id_jenjang_pendidikan_wali` int(10) DEFAULT NULL COMMENT 'Web Service: GetRecordset:jenjang_pendidikan',
  `id_pekerjaan_wali` int(10) DEFAULT NULL COMMENT 'Web Service: GetRecordset:pekerjaan',
  `id_penghasilan_wali` int(10) DEFAULT NULL COMMENT 'Web Service: GetRecordset:penghasilan',
  `kewarganegaraan` varchar(50) NOT NULL DEFAULT 'ID'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mhs_pt`
--

CREATE TABLE `mhs_pt` (
  `id` int(11) NOT NULL,
  `kode_jurusan` varchar(50) NOT NULL COMMENT 'ID SMS (Satuan Manajemen Sumberdaya). Web Service: GetRecordset:sms',
  `id_mhs` int(10) NOT NULL COMMENT 'ID_PD Mahasiswa. Web Service: GetRecordset:mahasiswa',
  `id_jns_daftar` int(10) NOT NULL COMMENT 'Web Service: GetRecordset:jenis_pendaftaran',
  `nipd` varchar(50) DEFAULT NULL COMMENT 'NIM/NRP Mahasiswa',
  `tgl_masuk_sp` date NOT NULL COMMENT 'yyyy-mm-dd',
  `mulai_smt` varchar(50) DEFAULT NULL COMMENT 'ID Mulai Semester. Web Service: GetRecordset:semester',
  `status_error` int(11) DEFAULT '0',
  `keterangan` tinytext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `id` int(11) NOT NULL,
  `nim` varchar(50) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `kode_mk` varchar(50) NOT NULL,
  `nama_mk` varchar(150) NOT NULL,
  `nama_kelas` varchar(50) NOT NULL DEFAULT '01',
  `semester` varchar(50) NOT NULL,
  `kode_jurusan` varchar(50) NOT NULL,
  `status_error` int(11) NOT NULL DEFAULT '0',
  `keterangan` tinytext NOT NULL,
  `nilai_huruf` varchar(10) DEFAULT NULL,
  `nilai_indek` varchar(50) DEFAULT NULL,
  `nilai_angka` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `nilai_akm`
--

CREATE TABLE `nilai_akm` (
  `id` int(5) NOT NULL,
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
  `keterangan` tinytext
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `pekerjaan`
--

CREATE TABLE `pekerjaan` (
  `id_pekerjaan` int(11) NOT NULL,
  `nm_pekerjaan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='id_pekerjaan	nm_pekerjaan';

--
-- Dumping data for table `pekerjaan`
--

INSERT INTO `pekerjaan` (`id_pekerjaan`, `nm_pekerjaan`) VALUES
(1, 'Tidak Bekerja'),
(2, 'Nelayan'),
(3, 'Petani'),
(4, 'Peternak'),
(5, 'PNS/TNI/Polri'),
(6, 'Karyawan Swasta'),
(7, 'Pedagang Kecil'),
(8, 'Pedagang Besar'),
(9, 'Wiraswasta'),
(10, 'Wirausaha');

-- --------------------------------------------------------

--
-- Table structure for table `penghasilan`
--

CREATE TABLE `penghasilan` (
  `id_penghasilan` int(11) NOT NULL,
  `nm_penghasilan` varchar(50) DEFAULT '0',
  `batas_bawah` int(11) DEFAULT '0',
  `batas_atas` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='id_penghasilan	nm_penghasilan	batas_bawah	batas_atas';

--
-- Dumping data for table `penghasilan`
--

INSERT INTO `penghasilan` (`id_penghasilan`, `nm_penghasilan`, `batas_bawah`, `batas_atas`) VALUES
(11, '< Rp. 500.000', 0, 0),
(12, '500.000 - 1.000.000', 0, 0),
(13, '1.000.000 - 2 .000.000', 0, 0),
(14, '2.000.0000 - 5.000.000', 0, 0),
(15, '5.000.000 - 20.000.000', 0, 0),
(16, ' > 20 jt', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

CREATE TABLE `semester` (
  `semester` varchar(5) NOT NULL,
  `nama_semester` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `semester`
--

INSERT INTO `semester` (`semester`, `nama_semester`) VALUES
('20021', 'Ganjil'),
('20022', 'Genap'),
('20031', 'Ganjil'),
('20032', 'Genap'),
('20041', 'Ganjil'),
('20042', 'Genap'),
('20051', 'Ganjil'),
('20052', 'Genap'),
('20061', 'Ganjil'),
('20062', 'Genap'),
('20071', 'Ganjil'),
('20072', 'Genap'),
('20081', 'Ganjil'),
('20082', 'Genap'),
('20091', 'Ganjil'),
('20092', 'Genap'),
('20101', 'Ganjil'),
('20102', 'Genap'),
('20111', 'Ganjil'),
('20112', 'Genap'),
('20121', 'Ganjil'),
('20122', 'Genap'),
('20131', 'Ganjil'),
('20132', 'Genap'),
('20141', 'Ganjil'),
('20142', 'Genap'),
('20151', 'Ganjil'),
('20152', 'Genap');

-- --------------------------------------------------------

--
-- Table structure for table `sys_group_users`
--

CREATE TABLE `sys_group_users` (
  `id` int(11) NOT NULL,
  `level` varchar(50) DEFAULT NULL,
  `deskripsi` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sys_group_users`
--

INSERT INTO `sys_group_users` (`id`, `level`, `deskripsi`) VALUES
(1, 'admin', 'Administrator'),
(2, 'Jurusan', 'Operator Jurusan');

-- --------------------------------------------------------

--
-- Table structure for table `sys_menu`
--

CREATE TABLE `sys_menu` (
  `id` int(11) NOT NULL,
  `nav_act` varchar(150) DEFAULT NULL,
  `page_name` varchar(150) DEFAULT NULL,
  `url` varchar(100) NOT NULL,
  `main_table` varchar(150) DEFAULT NULL,
  `icon` varchar(150) DEFAULT NULL,
  `urutan_menu` int(11) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `dt_table` enum('Y','N') NOT NULL,
  `tampil` enum('Y','N') NOT NULL,
  `type_menu` enum('main','page') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sys_menu`
--

INSERT INTO `sys_menu` (`id`, `nav_act`, `page_name`, `url`, `main_table`, `icon`, `urutan_menu`, `parent`, `dt_table`, `tampil`, `type_menu`) VALUES
(1, NULL, 'import', '', NULL, 'fa-cloud-upload', 2, 0, 'Y', 'Y', 'main'),
(7, 'akm', 'akm', 'akm', 'nilai_akm', 'fa-book', 6, 1, 'Y', 'Y', 'page'),
(8, 'krs', 'krs', 'krs', 'krs', '', 2, 9, 'Y', 'Y', 'page'),
(9, NULL, 'kelas dan krs', '', NULL, 'fa-book', 3, 1, 'Y', 'Y', 'main'),
(10, 'kelas_kuliah', 'kelas kuliah', 'kelas-kuliah', 'kelas_kuliah', '', 1, 9, 'Y', 'Y', 'page'),
(11, 'dosen_ajar', 'dosen ajar', 'dosen-ajar', 'ajar_dosen', '', 3, 9, 'Y', 'Y', 'page'),
(13, 'nilai_perkuliahan', 'nilai perkuliahan', 'nilai-perkuliahan', 'nilai', '', 5, 1, 'Y', 'Y', 'page'),
(15, 'kurikulum', 'kurikulum', 'kurikulum', 'kurikulum', '', 1, 1, 'Y', 'Y', 'page'),
(16, 'matakuliah_kurikulum', 'matakuliah kurikulum', 'matakuliah-kurikulum', 'mat_kurikulum', '', 2, 1, 'Y', 'N', 'page'),
(17, NULL, 'master data', '', NULL, '', 1, 0, 'Y', 'Y', 'main'),
(19, 'jurusan', 'jurusan', 'jurusan', 'jurusan', '', 2, 17, 'Y', 'Y', 'page'),
(20, NULL, 'tool', '', NULL, '', 3, 0, 'Y', 'Y', 'main'),
(24, 'hapus_kelas', 'hapus kelas feeder', 'hapus-kelas', 'kelas_kuliah', '', 1, 20, 'Y', 'Y', 'page'),
(25, 'hapus_mahasiswa', 'Update/Hapus mahasiswa', 'hapus-mahasiswa', 'fakultas', '', 2, 20, 'Y', 'Y', 'page'),
(26, 'config_akun_feeder', 'config akun feeder', 'config-akun-feeder', 'config_user', '', 1, 17, 'Y', 'Y', 'page'),
(27, 'hapus_akm_feeder', 'hapus akm feeder', 'hapus-akm-feeder', 'config_user', '', 3, 20, 'Y', 'Y', 'page'),
(28, 'about', 'about', 'about', 'agama', '', 8, 0, 'Y', 'Y', 'page'),
(29, 'kelulusan', 'kelulusan', 'kelulusan', 'kelulusan', '', 9, 1, 'Y', 'Y', 'page'),
(30, 'mahasiswa', 'mahasiswa', 'mahasiswa', 'mhs', 'fa-user', 2, 1, 'Y', 'Y', 'page');

-- --------------------------------------------------------

--
-- Table structure for table `sys_menu_role`
--

CREATE TABLE `sys_menu_role` (
  `id` int(11) NOT NULL,
  `id_menu` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `read_act` enum('Y','N') DEFAULT NULL,
  `insert_act` enum('Y','N') DEFAULT NULL,
  `update_act` enum('Y','N') DEFAULT NULL,
  `delete_act` enum('Y','N') DEFAULT NULL,
  `push_act` enum('Y','N') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sys_menu_role`
--

INSERT INTO `sys_menu_role` (`id`, `id_menu`, `group_id`, `read_act`, `insert_act`, `update_act`, `delete_act`, `push_act`) VALUES
(1, 1, 1, 'Y', 'Y', 'Y', 'Y', 'Y'),
(5, 1, 2, 'Y', 'N', 'N', 'N', 'Y'),
(13, 7, 1, 'Y', 'Y', 'Y', 'Y', 'Y'),
(14, 7, 2, 'Y', 'Y', 'Y', 'Y', 'Y'),
(15, 8, 1, 'Y', 'Y', 'Y', 'Y', 'Y'),
(16, 8, 2, 'Y', 'Y', 'Y', 'Y', 'Y'),
(17, 9, 1, 'Y', 'Y', 'Y', 'Y', 'Y'),
(18, 9, 2, 'Y', 'N', 'N', 'N', 'Y'),
(19, 10, 1, 'Y', 'Y', 'Y', 'Y', 'Y'),
(20, 10, 2, 'Y', 'Y', 'Y', 'Y', 'Y'),
(21, 11, 1, 'Y', 'Y', 'Y', 'Y', 'Y'),
(22, 11, 2, 'Y', 'Y', 'Y', 'Y', 'Y'),
(25, 13, 1, 'Y', 'Y', 'Y', 'Y', 'Y'),
(26, 13, 2, 'Y', 'Y', 'Y', 'Y', 'Y'),
(29, 15, 1, 'Y', 'Y', 'Y', 'Y', 'Y'),
(30, 15, 2, 'Y', 'Y', 'Y', 'Y', 'Y'),
(33, 16, 1, 'Y', 'Y', 'Y', 'Y', 'Y'),
(34, 16, 2, 'Y', 'Y', 'Y', 'Y', 'Y'),
(35, 17, 1, 'Y', 'Y', 'Y', 'Y', 'Y'),
(36, 17, 2, 'Y', 'N', 'N', 'N', 'Y'),
(39, 19, 1, 'Y', 'Y', 'Y', 'Y', 'Y'),
(40, 19, 2, 'Y', 'Y', 'Y', 'Y', 'Y'),
(41, 20, 1, 'Y', 'Y', 'Y', 'Y', 'Y'),
(42, 20, 2, 'Y', 'N', 'N', 'N', 'Y'),
(49, 24, 1, 'Y', 'Y', 'Y', 'Y', 'Y'),
(50, 24, 2, 'Y', 'Y', 'Y', 'Y', 'Y'),
(51, 25, 1, 'Y', 'Y', 'Y', 'Y', NULL),
(52, 25, 2, 'N', 'N', 'N', 'N', NULL),
(53, 26, 1, 'Y', 'Y', 'Y', 'Y', 'Y'),
(54, 26, 2, 'N', 'N', 'N', 'N', 'Y'),
(55, 27, 1, 'Y', 'Y', 'Y', 'Y', 'Y'),
(56, 27, 2, 'N', 'N', 'N', 'N', 'Y'),
(57, 28, 1, 'Y', 'Y', 'Y', 'Y', 'Y'),
(58, 28, 2, 'Y', 'N', 'N', 'N', 'Y'),
(60, 29, 1, 'Y', 'Y', 'Y', 'Y', NULL),
(61, 29, 2, 'N', 'N', 'N', 'N', NULL),
(62, 30, 1, 'Y', 'Y', 'Y', 'Y', NULL),
(63, 30, 2, 'N', 'N', 'N', 'N', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sys_users`
--

CREATE TABLE `sys_users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL DEFAULT '0',
  `last_name` varchar(50) NOT NULL DEFAULT '0',
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `foto_user` varchar(150) DEFAULT NULL,
  `id_group` int(11) DEFAULT NULL,
  `kode_jurusan` int(11) DEFAULT NULL,
  `aktif` enum('Y','N') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sys_users`
--

INSERT INTO `sys_users` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `date_created`, `foto_user`, `id_group`, `kode_jurusan`, `aktif`) VALUES
(1, 'super', 'admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'wildannudin@gmail.com', '2015-01-26', '10965740_10206190197982755_22114424_n.jpg', 1, NULL, 'Y'),
(5, 'teknik', 'informatika', 'informatika', '270007185d0f4b290ded51f9345a7f29', 'informatika@kampus.com', '2016-02-27', 'Mercedes_A_45_AMG_Edition_1_03.jpg', 2, 55201, 'Y');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agama`
--
ALTER TABLE `agama`
  ADD PRIMARY KEY (`id_agama`);

--
-- Indexes for table `ajar_dosen`
--
ALTER TABLE `ajar_dosen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kode_jurusan` (`kode_jurusan`);

--
-- Indexes for table `config_user`
--
ALTER TABLE `config_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fakultas`
--
ALTER TABLE `fakultas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jenis_keluar`
--
ALTER TABLE `jenis_keluar`
  ADD PRIMARY KEY (`id_jns_keluar`);

--
-- Indexes for table `jenis_pendaftaran`
--
ALTER TABLE `jenis_pendaftaran`
  ADD PRIMARY KEY (`id_jns_daftar`);

--
-- Indexes for table `jenis_tinggal`
--
ALTER TABLE `jenis_tinggal`
  ADD PRIMARY KEY (`id_jns_tinggal`);

--
-- Indexes for table `jenjang_pendidikan`
--
ALTER TABLE `jenjang_pendidikan`
  ADD PRIMARY KEY (`id_jenj_didik`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kode_jurusan` (`kode_jurusan`);

--
-- Indexes for table `kelas_kuliah`
--
ALTER TABLE `kelas_kuliah`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kode_jurusan` (`kode_jurusan`);

--
-- Indexes for table `kelulusan`
--
ALTER TABLE `kelulusan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kode_jurusan` (`kode_jurusan`);

--
-- Indexes for table `krs`
--
ALTER TABLE `krs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kode_jurusan` (`kode_jurusan`);

--
-- Indexes for table `kurikulum`
--
ALTER TABLE `kurikulum`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mat_kurikulum`
--
ALTER TABLE `mat_kurikulum`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_mat_kurikulum_kurikulum` (`id_kurikulum`);

--
-- Indexes for table `mhs`
--
ALTER TABLE `mhs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mhs_pt`
--
ALTER TABLE `mhs_pt`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_mhs_pt_mhs` (`id_mhs`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kode_jurusan` (`kode_jurusan`);

--
-- Indexes for table `nilai_akm`
--
ALTER TABLE `nilai_akm`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kode_jurusan` (`kode_jurusan`);

--
-- Indexes for table `pekerjaan`
--
ALTER TABLE `pekerjaan`
  ADD PRIMARY KEY (`id_pekerjaan`);

--
-- Indexes for table `penghasilan`
--
ALTER TABLE `penghasilan`
  ADD PRIMARY KEY (`id_penghasilan`);

--
-- Indexes for table `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`semester`);

--
-- Indexes for table `sys_group_users`
--
ALTER TABLE `sys_group_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_menu`
--
ALTER TABLE `sys_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_menu_role`
--
ALTER TABLE `sys_menu_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_sys_menu_role_sys_menu` (`id_menu`),
  ADD KEY `FK_sys_menu_role_sys_users` (`group_id`);

--
-- Indexes for table `sys_users`
--
ALTER TABLE `sys_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_sys_users_sys_group_users` (`id_group`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agama`
--
ALTER TABLE `agama`
  MODIFY `id_agama` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;
--
-- AUTO_INCREMENT for table `ajar_dosen`
--
ALTER TABLE `ajar_dosen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `config_user`
--
ALTER TABLE `config_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `fakultas`
--
ALTER TABLE `fakultas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jenjang_pendidikan`
--
ALTER TABLE `jenjang_pendidikan`
  MODIFY `id_jenj_didik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;
--
-- AUTO_INCREMENT for table `jurusan`
--
ALTER TABLE `jurusan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `kelas_kuliah`
--
ALTER TABLE `kelas_kuliah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `kelulusan`
--
ALTER TABLE `kelulusan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `krs`
--
ALTER TABLE `krs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `kurikulum`
--
ALTER TABLE `kurikulum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `mat_kurikulum`
--
ALTER TABLE `mat_kurikulum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mhs`
--
ALTER TABLE `mhs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `mhs_pt`
--
ALTER TABLE `mhs_pt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `nilai_akm`
--
ALTER TABLE `nilai_akm`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pekerjaan`
--
ALTER TABLE `pekerjaan`
  MODIFY `id_pekerjaan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `penghasilan`
--
ALTER TABLE `penghasilan`
  MODIFY `id_penghasilan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `sys_group_users`
--
ALTER TABLE `sys_group_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sys_menu`
--
ALTER TABLE `sys_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `sys_menu_role`
--
ALTER TABLE `sys_menu_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;
--
-- AUTO_INCREMENT for table `sys_users`
--
ALTER TABLE `sys_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `mat_kurikulum`
--
ALTER TABLE `mat_kurikulum`
  ADD CONSTRAINT `FK_mat_kurikulum_kurikulum` FOREIGN KEY (`id_kurikulum`) REFERENCES `kurikulum` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mhs_pt`
--
ALTER TABLE `mhs_pt`
  ADD CONSTRAINT `FK_mhs_pt_mhs` FOREIGN KEY (`id_mhs`) REFERENCES `mhs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sys_menu_role`
--
ALTER TABLE `sys_menu_role`
  ADD CONSTRAINT `FK_sys_menu_role_sys_group_users` FOREIGN KEY (`group_id`) REFERENCES `sys_group_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_sys_menu_role_sys_menu` FOREIGN KEY (`id_menu`) REFERENCES `sys_menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sys_users`
--
ALTER TABLE `sys_users`
  ADD CONSTRAINT `FK_sys_users_sys_group_users` FOREIGN KEY (`id_group`) REFERENCES `sys_group_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
