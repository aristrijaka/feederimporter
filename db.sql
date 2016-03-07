-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 05, 2016 at 03:44 AM
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
  `keterangan` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

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
(1, 'usern', 'pass', 'localhost', '8082', 'kodept', 'Y');

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
  `keterangan` varchar(150) NOT NULL
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
  `keterangan` varchar(150) NOT NULL DEFAULT '0'
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
  `keterangan` varchar(250) NOT NULL
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
  `keterangan` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kurikulum`
--

INSERT INTO `kurikulum` (`id`, `nama_kur`, `mulai_berlaku`, `kode_jurusan`, `jml_sks_wajib`, `jml_sks_pilihan`, `total_sks`, `status_error`, `keterangan`) VALUES
(13, 'kurikulum IF tahun 2016', '20161', '55201', 40, 22, 62, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
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
  `nim` varchar(14) DEFAULT NULL
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
  `keterangan` varchar(150) NOT NULL
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
  `keterangan` varchar(250) NOT NULL,
  `nilai_huruf` varchar(10) DEFAULT NULL,
  `nilai_indek` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`id`, `nim`, `nama`, `kode_mk`, `nama_mk`, `nama_kelas`, `semester`, `kode_jurusan`, `status_error`, `keterangan`, `nilai_huruf`, `nilai_indek`) VALUES
(2, '1127050003', 'AGUNG RAMADHAN', 'EKT8801', 'EKONOMI TEKNIK', '1', '20152', '55201', 1, '', 'A', 4);

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
  `keterangan` varchar(150) DEFAULT NULL
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
-- Table structure for table `program_studi_dikti`
--

CREATE TABLE `program_studi_dikti` (
  `prodidiktiKode` varchar(10) NOT NULL DEFAULT '0',
  `prodidiktiKodeJenjang` char(1) DEFAULT NULL,
  `prodidiktiNama` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Data referensi program Studi menurut dikti.';

--
-- Dumping data for table `program_studi_dikti`
--

INSERT INTO `program_studi_dikti` (`prodidiktiKode`, `prodidiktiKodeJenjang`, `prodidiktiNama`) VALUES
('11001', 'A', 'ILMU KEDOKTERAN'),
('11002', 'A', 'ILMU KEDOKTERAN DASAR'),
('11006', 'A', 'BIOMEDIK'),
('11101', 'B', 'ILMU KEDOKTERAN DASAR'),
('11102', 'B', 'ILMU KEDOKTERAN KELUARGA'),
('11103', 'B', 'ILMU KEDOKTERAN KLINIS'),
('11104', 'B', 'ILMU KEDOKTERAN TROPIS'),
('11105', 'B', 'IMUNOLOGI'),
('11106', 'B', 'BIOMEDIK'),
('11107', 'B', 'PULMONOLOGI'),
('11108', 'B', 'ERGONOMI FISIOLOGI KERJA'),
('11109', 'B', 'PENDIDIKAN DOKTER'),
('11122', 'B', 'ILMU KESEHATAN OLAH RAGA'),
('11123', 'B', 'TEKNOLOGI BIOMEDIS'),
('11201', 'C', 'PENDIDIKAN DOKTER'),
('11202', 'C', 'FISIOTERAPI'),
('11301', 'D', 'FISIOTERAPI'),
('11306', 'D', 'PENGOBATAN TRADISIONAL CINA'),
('11401', 'E', 'FISIOTERAPI'),
('11402', 'E', 'RADIODIAGNOSTIK DAN RADIOTERAPI'),
('11403', 'E', 'OKUPASI TERAPI'),
('11404', 'E', 'REFRAKSI OPTISI'),
('11406', 'E', 'PENGOBATAN TRADISIONAL'),
('11407', 'E', 'AKUPUNKTUR'),
('11408', 'E', 'TEKNIK KARDIOVASCULER'),
('11409', 'E', 'MALARIOLOGI'),
('11608', 'G', 'TEKNIK TRANSFUSI DARAH'),
('11701', 'H', 'ILMU PENYAKIT MATA'),
('11702', 'H', 'ILMU PENYAKIT DALAM'),
('11703', 'H', 'ILMU PENYAKIT SYARAF'),
('11704', 'H', 'ILMU PENYAKIT KULIT DAN KELAMIN'),
('11705', 'H', 'ILMU PENYAKIT THT'),
('11706', 'H', 'ILMU ANESTESI'),
('11707', 'H', 'ILMU BEDAH'),
('11708', 'H', 'ILMU KEBIDANAN DAN PENYAKIT KANDUNGAN'),
('11709', 'H', 'ILMU PENYAKIT PARU'),
('11710', 'H', 'ILMU KEDOKTERAN FORENSIK'),
('11711', 'H', 'ILMU KESEHATAN ANAK'),
('11712', 'H', 'ILMU BEDAH ORTOPAEDI'),
('11713', 'H', 'ILMU BEDAH UROLOGI'),
('11714', 'H', 'ILMU BEDAH PLASTIK'),
('11715', 'H', 'ILMU PENYAKIT JANTUNG'),
('11717', 'H', 'ILMU BEDAH ANAK'),
('11718', 'H', 'ILMU PATOLOGI ANATOMI'),
('11719', 'H', 'ILMU PATOLOGI KLINIK'),
('11720', 'H', 'ILMU KEDOKTERAN NUKLIR'),
('11721', 'H', 'ILMU KEDOKTERAN FISIK DAN REHABILITASI'),
('11722', 'H', 'ILMU KEDOKTERAN OLAHRAGA'),
('11723', 'H', 'RADIOLOGI'),
('11724', 'H', 'PSIKIATRI'),
('11725', 'H', 'MIKROBIOLOGI KLINIK'),
('11726', 'H', 'FARMAKOLOGI KLINIK'),
('11727', 'H', 'ILMU KEDOKTERAN OKUPASI'),
('11728', 'H', 'ORTHOPAEDIK DAN TRAUMATOLOGI'),
('11729', 'H', 'ILMU BEDAH SYARAF'),
('11730', 'H', 'ILMU KEDOKTERAN KLINIS'),
('11802', 'I', 'ILMU PENYAKIT DALAM'),
('11901', 'J', 'PROFESI DOKTER'),
('12001', 'A', 'ILMU KEDOKTERAN GIGI'),
('12101', 'B', 'ILMU KEDOKTERAN GIGI'),
('12102', 'B', 'ILMU KEDOKTERAN GIGI DASAR'),
('12103', 'B', 'ILMU KEDOKTERAN GIGI KOMUNITAS'),
('12201', 'C', 'PENDIDIKAN DOKTER GIGI'),
('12401', 'E', 'TEKNIK GIGI'),
('12701', 'H', 'ILMU BEDAH MULUT'),
('12702', 'H', 'ILMU PENYAKIT MULUT'),
('12703', 'H', 'ILMU KONSERVASI GIGI'),
('12704', 'H', 'ILMU KESEHATAN GIGI ANAK'),
('12705', 'H', 'PERIODONSIA'),
('12706', 'H', 'ORTODONSIA'),
('12707', 'H', 'PROSTODONSIA'),
('12901', 'J', 'PROFESI DOKTER GIGI'),
('13001', 'A', 'ILMU KESEHATAN MASYARAKAT'),
('13011', 'A', 'ILMU GIZI'),
('13021', 'A', 'EPIDEMIOLOGI'),
('13101', 'B', 'ILMU KESEHATAN MASYARAKAT'),
('13111', 'B', 'ILMU GIZI'),
('13121', 'B', 'EPIDEMIOLOGI'),
('13122', 'B', 'KESEHATAN REPRODUKSI'),
('13131', 'B', 'PROMOSI KESEHATAN'),
('13141', 'B', 'KESEHATAN DAN KESELAMATAN KERJA'),
('13151', 'B', 'KESEHATAN LINGKUNGAN'),
('13161', 'B', 'ADMINISTRASI RUMAH SAKIT'),
('13163', 'B', 'ADMINISTRASI KEBIJAKAN KESEHATAN'),
('13201', 'C', 'KESEHATAN MASYARAKAT'),
('13211', 'C', 'ILMU GIZI'),
('13241', 'C', 'KESEHATAN DAN KESELAMATAN KERJA'),
('13251', 'C', 'KESEHATAN LINGKUNGAN'),
('13261', 'C', 'ADMINISTRASI RUMAH SAKIT'),
('13341', 'D', 'KESEHATAN DAN KESELAMATAN KERJA'),
('13353', 'D', 'ANALIS KESEHATAN'),
('13411', 'E', 'GIZI'),
('13421', 'E', 'EPIDEMIOLOGI'),
('13431', 'E', 'PROMOSI DAN PERILAKU KESEHATAN'),
('13441', 'E', 'HIPERKES DAN KESELAMATAN KERJA'),
('13451', 'E', 'KESEHATAN LINGKUNGAN'),
('13452', 'E', 'ANALIS LINGKUNGAN'),
('13453', 'E', 'ANALIS KESEHATAN'),
('13461', 'E', 'ADMINISTRASI RUMAH SAKIT'),
('13462', 'E', 'PEREKAM DAN INFORMASI KESEHATAN'),
('14001', 'A', 'ILMU KEPERAWATAN'),
('14101', 'B', 'ILMU KEPERAWATAN'),
('14201', 'C', 'ILMU KEPERAWATAN'),
('14301', 'D', 'PERAWAT PENDIDIK'),
('14401', 'E', 'KEPERAWATAN'),
('14701', 'H', 'ILMU KEPERAWATAN'),
('14901', 'J', 'NERS'),
('15101', 'B', 'KEBIDANAN'),
('15201', 'C', 'KEBIDANAN'),
('15301', 'D', 'BIDAN PENDIDIK'),
('15401', 'E', 'KEBIDANAN'),
('20001', 'A', 'ILMU TEKNIK ELEKTRO'),
('20002', 'A', 'OPTO ELEKTRONIKA LASER'),
('20101', 'B', 'TEKNIK ELEKTRO'),
('20102', 'B', 'OPTO ELEKTRONIKA LASER'),
('20103', 'B', 'INSTRUMENTASI DAN KONTROL'),
('20201', 'C', 'TEKNIK ELEKTRO'),
('20301', 'D', 'TEKNIK ELEKTRONIKA'),
('20302', 'D', 'TEKNIK TELEKOMUNIKASI'),
('20303', 'D', 'TEKNIK LISTRIK'),
('20304', 'D', 'TEKNIK TELEKOMUNIKASI NIRKABEL'),
('20401', 'E', 'TEKNIK ELEKTRONIKA'),
('20402', 'E', 'TEKNIK TELEKOMUNIKASI'),
('20403', 'E', 'TEKNIK LISTRIK'),
('20501', 'F', 'ELEKTRONIKA'),
('20601', 'G', 'ELEKTRONIKA'),
('20602', 'G', 'TELEKOMUNIKASI'),
('20603', 'G', 'TEKNIK LISTRIK'),
('21001', 'A', 'ILMU TEKNIK MESIN'),
('21101', 'B', 'TEKNIK MESIN'),
('21201', 'C', 'TEKNIK MESIN'),
('21301', 'D', 'TEKNIK MESIN PRODUKSI DAN PERAWATAN'),
('21303', 'D', 'TEKNIK OTOMOTIF ELEKTRONIK'),
('21306', 'D', 'TEKNIK KONSERVASI KONVERSI ENERGI'),
('21312', 'D', 'TEKNIK MEKATRONIKA'),
('21401', 'E', 'TEKNIK MESIN'),
('21402', 'E', 'MESIN INDUSTRI'),
('21403', 'E', 'MESIN OTOMOTIF'),
('21404', 'E', 'MESIN PERKAKAS'),
('21405', 'E', 'TEKNIK PENDINGIN DAN TATA UDARA'),
('21406', 'E', 'TEKNIK KONVERSI ENERGI'),
('21407', 'E', 'TEKNIK MANUFAKTUR'),
('21408', 'E', 'PERAWATAN DAN PERBAIKAN MESIN'),
('21409', 'E', 'PERANCANGAN MEKANIK'),
('21410', 'E', 'PENGECORAN LOGAM'),
('21411', 'E', 'TEKNIK PERANCANGAN MANUFAKTUR'),
('21412', 'E', 'TEKNIK MEKATRONIKA'),
('21413', 'E', 'ALAT BERAT'),
('21414', 'E', 'POLA PENGECORAN'),
('21501', 'F', 'TEKNIK MESIN'),
('21601', 'G', 'TEKNIK MESIN'),
('22001', 'A', 'ILMU TEKNIK SIPIL'),
('22101', 'B', 'TEKNIK SIPIL'),
('22102', 'B', 'SISTEM DAN TEKNIK JALAN RAYA'),
('22201', 'C', 'TEKNIK SIPIL'),
('22301', 'D', 'PERANCANGAN JALAN DAN JEMBATAN'),
('22302', 'D', 'MANAJEMEN REKAYASA KONSTRUKSI'),
('22303', 'D', 'TEKNIK PERUMAHAN DAN PEMUKIMAN'),
('22304', 'D', 'TEKNIK BANGUNAN RAWA'),
('22401', 'E', 'TEKNIK SIPIL'),
('22402', 'E', 'TEKNIK KONSTRUKSI SIPIL'),
('22403', 'E', 'TEKNIK KONSTRUKSI GEDUNG'),
('22404', 'E', 'TEKNIK SIPIL BANGUNAN AIR'),
('22405', 'E', 'TEKNIK SIPIL BANGUNAN TRANSPORTASI'),
('22406', 'E', 'TEKNIK JALAN RAYA'),
('22503', 'F', 'KONSTRUKSI GEDUNG'),
('23001', 'A', 'ILMU ARSITEKTUR'),
('23101', 'B', 'ARSITEKTUR'),
('23201', 'C', 'ARSITEKTUR'),
('23401', 'E', 'ARSITEKTUR'),
('23601', 'G', 'ARSITEKTUR'),
('24001', 'A', 'ILMU TEKNIK KIMIA'),
('24101', 'B', 'TEKNIK KIMIA'),
('24201', 'C', 'TEKNIK KIMIA'),
('24301', 'D', 'TEKNOLOGI KIMIA INDUSTRI'),
('24401', 'E', 'TEKNIK KIMIA'),
('24402', 'E', 'ANALIS KIMIA'),
('24403', 'E', 'PETRO DAN OLEO KIMIA'),
('24404', 'E', 'TEKNIK INDUSTRI TEKSTIL'),
('24604', 'G', 'TEKNIK TEKSTIL'),
('25001', 'A', 'ILMU TEKNIK LINGKUNGAN'),
('25101', 'B', 'TEKNIK LINGKUNGAN'),
('25102', 'B', 'ILMU LINGKUNGAN'),
('25103', 'B', 'TEKNIK AIR TANAH'),
('25201', 'C', 'TEKNIK LINGKUNGAN'),
('25401', 'E', 'TEKNIK LINGKUNGAN'),
('26001', 'A', 'TEKNIK INDUSTRI'),
('26101', 'B', 'TEKNIK INDUSTRI'),
('26201', 'C', 'TEKNIK INDUSTRI'),
('26302', 'D', 'TEKNIK MANAJEMEN PABRIK'),
('26303', 'D', 'TEKNOLOGI MEKANIK INDUSTRI'),
('26401', 'E', 'TEKNIK INDUSTRI'),
('26402', 'E', 'MANAJEMEN INDUSTRI'),
('27001', 'A', 'TEKNIK METALURGI'),
('27101', 'B', 'TEKNIK METALURGI'),
('27201', 'C', 'TEKNIK METALURGI'),
('27401', 'E', 'METALURGI'),
('28001', 'A', 'ILMU TEKNIK MATERIAL'),
('28101', 'B', 'TEKNIK MATERIAL'),
('28201', 'C', 'TEKNIK MATERIAL'),
('28401', 'E', 'MATERIAL'),
('29001', 'A', 'ILMU TEKNIK GEODESI'),
('29101', 'B', 'TEKNIK GEODESI'),
('29201', 'C', 'TEKNIK GEODESI'),
('29401', 'E', 'TEKNIK GEODESI'),
('30001', 'A', 'ILMU FISIKA TEKNIK'),
('30101', 'B', 'FISIKA TEKNIK'),
('30201', 'C', 'FISIKA TEKNIK'),
('30401', 'E', 'FISIKA INSTRUMENTASI'),
('31001', 'A', 'ILMU TEKNIK PERTAMBANGAN'),
('31101', 'B', 'TEKNIK PERTAMBANGAN'),
('31201', 'C', 'TEKNIK PERTAMBANGAN'),
('31401', 'E', 'TEKNIK PERTAMBANGAN'),
('32001', 'A', 'ILMU TEKNIK PERMINYAKAN'),
('32101', 'B', 'TEKNIK PERMINYAKAN'),
('32201', 'C', 'TEKNIK PERMINYAKAN'),
('32304', 'D', 'TEKNIK KESEHATAN DAN KESELAMATAN KERJA'),
('32401', 'E', 'EKSPLORASI MINYAK DAN GAS'),
('32402', 'E', 'PENGOLAHAN MINYAK DAN GAS'),
('32403', 'E', 'LABORATORIUM MINYAK DAN GAS'),
('32404', 'E', 'KESELAMATAN KERJA DAN PENCEGAHAN KEBAKARAN'),
('32405', 'E', 'INSTRMENTASI DAN ELEKTRONIKA MIGAS'),
('32604', 'G', 'FIRE AND SAFETY'),
('33001', 'A', 'ILMU GEOFISIKA'),
('33101', 'B', 'TEKNIK GEOFISIKA'),
('33201', 'C', 'TEKNIK GEOFISIKA'),
('33202', 'C', 'METEOROLOGI'),
('34001', 'A', 'ILMU TEKNIK GEOLOGI'),
('34002', 'A', 'SAINS KEBUMIAN'),
('34101', 'B', 'TEKNIK GEOLOGI'),
('34102', 'B', 'SAINS KEBUMIAN'),
('34201', 'C', 'TEKNIK GEOLOGI'),
('34401', 'E', 'GEOLOGI TERAPAN'),
('35001', 'A', 'ILMU PERENCANAAN WILAYAH DAN KOTA'),
('35101', 'B', 'PERENCANAAN WILAYAH DAN KOTA'),
('35102', 'B', 'RANCANG KOTA'),
('35201', 'C', 'PERENCANAAN WILAYAH DAN KOTA'),
('35401', 'E', 'SURVAI DAN PEMETAAN'),
('35601', 'G', 'SURVAI DAN PEMETAAN'),
('36001', 'A', 'ILMU TEKNIK PERKAPALAN'),
('36101', 'B', 'TEKNIK PERKAPALAN'),
('36201', 'C', 'TEKNIK PERKAPALAN'),
('36202', 'C', 'TEKNIK SISTEM PERKAPALAN'),
('36401', 'E', 'TEKNIK PERANCANGAN DAN KONSTRUKSI KAPAL'),
('36402', 'E', 'TEKNIK PERMESINAN KAPAL'),
('36403', 'E', 'TEKNIK BANGUNAN KAPAL'),
('36404', 'E', 'TEKNIK KELISTRIKAN KAPAL'),
('37001', 'A', 'ILMU DAN REKAYASA NUKLIR'),
('37101', 'B', 'ILMU DAN REKAYASA NUKLIR'),
('37201', 'C', 'TEKNIK NUKLIR'),
('38001', 'A', 'ILMU TEKNIK KELAUTAN'),
('38101', 'B', 'TEKNIK KELAUTAN'),
('38201', 'C', 'TEKNIK KELAUTAN'),
('38401', 'E', 'TEKNIK KELAUTAN'),
('39001', 'A', 'ILMU TRANSPORTASI'),
('39101', 'B', 'TRANSPORTASI'),
('39201', 'C', 'TRANSPORTASI'),
('39301', 'D', 'TRANSPORTASI'),
('39401', 'E', 'TRANSPORTASI'),
('40001', 'A', 'ILMU TEKNIK PENERBANGAN'),
('40101', 'B', 'TEKNIK PENERBANGAN'),
('40201', 'C', 'TEKNIK PENERBANGAN'),
('40401', 'E', 'LISTRIK PESAWAT'),
('40402', 'E', 'AERONAUTIKA'),
('40403', 'E', 'RANGKA PESAWAT'),
('40404', 'E', 'MOTOR PESAWAT'),
('40405', 'E', 'AVIONIKA'),
('40406', 'E', 'TEKNIK & MANAJEMEN LOGISTIK PENERBANGAN'),
('41001', 'A', 'ILMU TEKNIK PERTANIAN'),
('41011', 'A', 'TEKNOLOGI INDUSTRI PERTANIAN'),
('41021', 'A', 'ILMU DAN TEKNOLOGI PANGAN'),
('41031', 'A', 'TEKNOLOGI HASIL PERTANIAN'),
('41101', 'B', 'TEKNIK PERTANIAN'),
('41111', 'B', 'TEKNOLOGI INDUSTRI PERTANIAN'),
('41121', 'B', 'ILMU DAN TEKNOLOGI PANGAN'),
('41131', 'B', 'TEKNOLOGI HASIL PERTANIAN'),
('41133', 'B', 'TEKNOLOGI HASIL PERKEBUNAN'),
('41201', 'C', 'TEKNIK PERTANIAN'),
('41211', 'C', 'TEKNOLOGI INDUSTRI PERTANIAN'),
('41221', 'C', 'TEKNOLOGI PANGAN'),
('41231', 'C', 'TEKNOLOGI HASIL PERTANIAN'),
('41234', 'C', 'TEKNOLOGI PENGOLAHAN HASIL PERIKANAN'),
('41311', 'D', 'TEKNOLOGI INDUSTRI PERTANIAN'),
('41331', 'D', 'TEKNOLOGI PRODUKSI PERTANIAN'),
('41333', 'D', 'TEKNOLOGI PENGOLAHAN HASIL PERKEBUNAN'),
('41401', 'E', 'MESIN DAN PERALATAN PERTANIAN'),
('41402', 'E', 'TATA AIR PERTANIAN'),
('41411', 'E', 'TEKNOLOGI INDUSTRI PERTANIAN'),
('41421', 'E', 'TEKNOLOGI PANGAN'),
('41431', 'E', 'TEKNOLOGI PRODUKSI PERTANIAN'),
('41432', 'E', 'TEKNOLOGI PRODUKSI HORTIKULTURA'),
('41433', 'E', 'TEKNOLOGI PRODUKSI PERKEBUNAN'),
('41434', 'E', 'TEKNOLOGI PRODUKSI PERIKANAN'),
('44001', 'A', 'ILMU MATEMATIKA DAN ILMU PENGETAHUAN ALAM'),
('44002', 'A', 'ILMU MATEMATIKA'),
('44101', 'B', 'MATEMATIKA'),
('44201', 'C', 'MATEMATIKA'),
('44401', 'E', 'MATEMATIKA'),
('44601', 'G', 'MATEMATIKA'),
('45001', 'A', 'ILMU FISIKA'),
('45101', 'B', 'FISIKA'),
('45201', 'C', 'FISIKA'),
('45401', 'E', 'FISIKA'),
('46001', 'A', 'ILMU BIOLOGI'),
('46101', 'B', 'BIOLOGI'),
('46201', 'C', 'BIOLOGI'),
('46202', 'C', 'MIKROBIOLOGI'),
('46401', 'E', 'BIOLOGI'),
('46601', 'G', 'LINGKUNGAN'),
('47001', 'A', 'ILMU KIMIA'),
('47101', 'B', 'KIMIA'),
('47201', 'C', 'KIMIA'),
('47401', 'E', 'KIMIA'),
('48001', 'A', 'ILMU FARMASI'),
('48101', 'B', 'FARMASI'),
('48201', 'C', 'FARMASI'),
('48202', 'C', 'FARMASI KLINIK DAN KOMUNITAS'),
('48401', 'E', 'FARMASI'),
('48402', 'E', 'ANALIS FARMASI DAN MAKANAN'),
('48701', 'H', 'FARMASI'),
('48901', 'J', 'PROFESI APOTEKER'),
('49001', 'A', 'ILMU STATISTIK'),
('49101', 'B', 'STATISTIKA'),
('49201', 'C', 'STATISTIKA'),
('49401', 'E', 'STATISTIKA'),
('50001', 'A', 'ILMU ASTRONOMI'),
('50101', 'B', 'ASTRONOMI'),
('50201', 'C', 'ASTRONOMI'),
('51001', 'A', 'ILMU GEOGRAFI'),
('51101', 'B', 'GEOGRAFI'),
('51111', 'B', 'PENGINDERAAN JAUH'),
('51201', 'C', 'GEOGRAFI'),
('51211', 'C', 'KARTOGRAFI DAN PENGINDERAAN JAUH'),
('51401', 'E', 'GEOGRAFI'),
('51411', 'E', 'PENGINDERAAN JAUH DAN SIG'),
('54001', 'A', 'ILMU PERTANIAN'),
('54002', 'A', 'ILMU EKONOMI PERTANIAN'),
('54003', 'A', 'PENYULUHAN DAN KOMUNIKASI PEMBANGUNAN PERTANIAN'),
('54004', 'A', 'AGRONOMI'),
('54005', 'A', 'ILMU TANAH'),
('54010', 'A', 'AGROKLIMATOLOGI'),
('54031', 'A', 'ILMU TERNAK'),
('54032', 'A', 'BIOLOGI REPRODUKSI'),
('54041', 'A', 'ILMU KELAUTAN'),
('54042', 'A', 'MANAJEMEN SUMBER DAYA PERAIRAN'),
('54043', 'A', 'ILMU PERAIRAN'),
('54051', 'A', 'ILMU KEHUTANAN'),
('54101', 'B', 'AGRIBISNIS'),
('54102', 'B', 'EKONOMI PERTANIAN'),
('54103', 'B', 'PENYULUHAN DAN KOMUNIKASI PEMBANGUNAN PERTANIAN'),
('54104', 'B', 'AGRONOMI'),
('54105', 'B', 'ILMU TANAH'),
('54106', 'B', 'ILMU HAMA DAN PENYAKIT TUMBUHAN'),
('54107', 'B', 'PEMULIAAN TANAMAN DAN BIOTEKNOLOGI'),
('54108', 'B', 'ILMU PERTANIAN'),
('54110', 'B', 'AGROKLIMATOLOGI'),
('54131', 'B', 'PETERNAKAN'),
('54132', 'B', 'BIOLOGI REPRODUKSI'),
('54141', 'B', 'ILMU KELAUTAN'),
('54142', 'B', 'SUMBER DAYA PERAIRAN PESISIR DAN KELAUTAN'),
('54143', 'B', 'BUDIDAYA PERAIRAN'),
('54145', 'B', 'AGRIBISNIS PERIKANAN'),
('54146', 'B', 'MANAJEMEN SUMBER DAYA PERAIRAN'),
('54147', 'B', 'ILMU PERAIRAN'),
('54151', 'B', 'ILMU KEHUTANAN'),
('54153', 'B', 'KONSERVASI SUMBER DAYA LAHAN'),
('54157', 'B', 'MANAJEMEN PERKEBUNAN'),
('54162', 'B', 'KESEHATAN MASYARAKAT VETERINER'),
('54201', 'C', 'AGRIBISNIS'),
('54211', 'C', 'AGROTEKNOLOGI'),
('54231', 'C', 'PETERNAKAN'),
('54241', 'C', 'ILMU KELAUTAN'),
('54242', 'C', 'MANAJEMEN SUMBER DAYA PERAIRAN'),
('54243', 'C', 'BUDIDAYA PERAIRAN'),
('54244', 'C', 'TEKNOLOGI HASIL PERIKANAN'),
('54245', 'C', 'AGROBISNIS PERIKANAN'),
('54246', 'C', 'PEMANFAATAN SUMBER DAYA PERIKANAN'),
('54251', 'C', 'KEHUTANAN'),
('54261', 'C', 'PENDIDIKAN DOKTER HEWAN'),
('54271', 'C', 'BUDIDAYA PERKEBUNAN'),
('54312', 'D', 'TEKNOLOGI INDUSTRI HORTIKULTURA'),
('54331', 'D', 'TEKNOLOGI PAKAN TERNAK'),
('54357', 'D', 'MANAJEMEN PERKEBUNAN'),
('54371', 'D', 'BUDIDAYA PERKEBUNAN'),
('54401', 'E', 'SOSIAL EKONOMI PERTANIAN (AGROBISNIS)'),
('54403', 'E', 'PENYULUHAN DAN KOMUNIKASI PERTANIAN'),
('54411', 'E', 'AGRONOMI'),
('54412', 'E', 'HORTIKULTURA'),
('54413', 'E', 'PEMULIAAN TANAMAN'),
('54414', 'E', 'ARSITEKTUR LANSEKAP'),
('54415', 'E', 'ILMU TANAH'),
('54416', 'E', 'BUDIDAYA PERTANIAN'),
('54417', 'E', 'HAMA DAN PENYAKIT TUMBUHAN'),
('54431', 'E', 'NUTRISI DAN MAKANAN TERNAK'),
('54432', 'E', 'PRODUKSI TERNAK'),
('54433', 'E', 'BUDIDAYA TERNAK'),
('54434', 'E', 'TEKNOLOGI HASIL TERNAK'),
('54435', 'E', 'SOSIAL EKONOMI PETERNAKAN'),
('54442', 'E', 'SUMBER DAYA PERAIRAN'),
('54443', 'E', 'BUDIDAYA PERAIRAN'),
('54444', 'E', 'TEKNOLOGI HASIL PERIKANAN'),
('54445', 'E', 'AGRIBISNIS PERIKANAN'),
('54446', 'E', 'PEMANFAATAN SUMBER DAYA PERIKANAN'),
('54451', 'E', 'TEKNOLOGI HASIL HUTAN'),
('54452', 'E', 'BUDIDAYA HUTAN'),
('54453', 'E', 'KONSERVASI SUMBER DAYA HUTAN'),
('54454', 'E', 'MANAJEMEN HUTAN'),
('54457', 'E', 'MANAJEMEN PERKEBUNAN'),
('54461', 'E', 'KESEHATAN HEWAN'),
('54471', 'E', 'BUDIDAYA TANAMAN PERKEBUNAN'),
('54533', 'F', 'AGRIBISNIS PETERNAKAN'),
('54534', 'F', 'TEKNOLOGI HASIL TERNAK'),
('54555', 'F', 'PENYULUHAN KEHUTANAN'),
('54961', 'J', 'PROFESI DOKTER HEWAN'),
('55001', 'A', 'ILMU KOMPUTER'),
('55101', 'B', 'TEKNIK INFORMATIKA'),
('55201', 'C', 'TEKNIK INFORMATIKA'),
('55301', 'D', 'TEKNIK INFORMATIKA'),
('55401', 'E', 'TEKNIK INFORMATIKA'),
('55601', 'G', 'TEKNIK INFORMATIKA'),
('56101', 'B', 'SISTEM KOMPUTER'),
('56201', 'C', 'SISTEM KOMPUTER'),
('56301', 'D', 'TEKNIK KOMPUTER'),
('56401', 'E', 'TEKNIK KOMPUTER'),
('56501', 'F', 'TEKNIK KOMPUTER'),
('56601', 'G', 'TEKNIK KOMPUTER'),
('57101', 'B', 'SISTEM INFORMASI'),
('57201', 'C', 'SISTEM INFORMASI'),
('57301', 'D', 'MANAJEMEN INFORMATIKA'),
('57302', 'D', 'KOMPUTERISASI AKUNTANSI'),
('57401', 'E', 'MANAJEMEN INFORMATIKA'),
('57402', 'E', 'KOMPUTERISASI AKUNTANSI'),
('57501', 'F', 'MANAJEMEN INFORMATIKA'),
('57502', 'F', 'KOMPUTERISASI AKUNTANSI'),
('57601', 'G', 'MANAJEMEN INFORMATIKA'),
('57602', 'G', 'KOMPUTERISASI AKUNTANSI'),
('60001', 'A', 'ILMU EKONOMI'),
('60101', 'B', 'ILMU EKONOMI'),
('60102', 'B', 'Ekonomi Islam '),
('60201', 'C', 'EKONOMI PEMBANGUNAN'),
('61001', 'A', 'ILMU MANAJEMEN'),
('61101', 'B', 'MANAJEMEN'),
('61201', 'C', 'MANAJEMEN'),
('61211', 'C', 'Manajemen Keuangan Syariah '),
('61304', 'D', 'MANAJEMEN PEMASARAN'),
('61306', 'D', 'KEUANGAN DAN PERBANKAN'),
('61307', 'D', 'MANAJEMEN ASET'),
('61401', 'E', 'MANAJEMEN ADMINISTRASI'),
('61402', 'E', 'MANAJEMEN PERDAGANGAN'),
('61403', 'E', 'MANAJEMEN PERPAJAKAN'),
('61404', 'E', 'MANAJEMEN PEMASARAN'),
('61405', 'E', 'MANAJEMEN PERUSAHAAN'),
('61406', 'E', 'KEUANGAN DAN PERBANKAN'),
('61407', 'E', 'MANAJEMEN TRANSPORTASI LAUT'),
('61408', 'E', 'MANAJEMEN TRANSPORTASI UDARA'),
('61501', 'F', 'MANAJEMEN ADMINISTRASI'),
('61504', 'F', 'MANAJEMEN PEMASARAN'),
('61505', 'F', 'MANAJEMEN PERUSAHAAN'),
('61506', 'F', 'KEUANGAN DAN PERBANKAN'),
('61601', 'G', 'MANAJEMEN ADMINISTRASI'),
('61602', 'G', 'MANAJEMEN PERDAGANGAN'),
('61603', 'G', 'MANAJEMEN PERPAJAKAN'),
('61604', 'G', 'MANAJEMEN PEMASARAN'),
('61605', 'G', 'MANAJEMEN PERUSAHAAN'),
('61606', 'G', 'KEUANGAN DAN PERBANKAN'),
('62001', 'A', 'ILMU AKUNTANSI'),
('62101', 'B', 'AKUNTANSI'),
('62201', 'C', 'AKUNTANSI'),
('62301', 'D', 'AKUNTANSI'),
('62401', 'E', 'AKUNTANSI'),
('62501', 'F', 'AKUNTANSI'),
('62601', 'G', 'AKUNTANSI'),
('62901', 'J', 'PROFESI AKUNTAN'),
('63001', 'A', 'ILMU ADMINISTRASI'),
('63101', 'B', 'ILMU ADMINISTRASI NEGARA'),
('63111', 'B', 'ILMU ADMINISTRASI NIAGA'),
('63201', 'C', 'ILMU ADMINISTRASI NEGARA'),
('63211', 'C', 'ILMU ADMINISTRASI NIAGA'),
('63221', 'C', 'ILMU ADMINISTRASI PERPAJAKAN'),
('63301', 'D', 'ADMINISTRASI NEGARA'),
('63311', 'D', 'ADMINISTRASI BISNIS'),
('63312', 'D', 'KESEKRETARIATAN'),
('63401', 'E', 'ADMINISTRASI NEGARA'),
('63411', 'E', 'ADMINISTRASI BISNIS'),
('63412', 'E', 'SEKRETARI'),
('63413', 'E', 'ADMINISTRASI KEUANGAN'),
('63414', 'E', 'ADMINISTRASI LOGISTIK'),
('63421', 'E', 'ADMINISTRASI PERPAJAKAN'),
('63501', 'F', 'ADMINISTRASI NEGARA'),
('63511', 'F', 'ADMINISTRASI NIAGA'),
('63512', 'F', 'KESEKRETARIATAN'),
('63521', 'F', 'PERPAJAKAN'),
('63611', 'G', 'ADMINISTRASI BISNIS'),
('63612', 'G', 'SEKRETARI'),
('63621', 'G', 'PERPAJAKAN'),
('64101', 'B', 'ILMU HUBUNGAN INTERNASIONAL'),
('64201', 'C', 'HUBUNGAN INTERNASIONAL'),
('64401', 'E', 'HUBUNGAN INTERNASIONAL'),
('65001', 'A', 'ILMU PEMERINTAHAN'),
('65101', 'B', 'ILMU PEMERINTAHAN'),
('65201', 'C', 'ILMU PEMERINTAHAN'),
('65301', 'D', 'ADMINISTRASI PEMERINTAHAN'),
('65401', 'E', 'ADMINISTRASI PEMERINTAHAN'),
('66001', 'A', 'KRIMINOLOGI'),
('66101', 'B', 'KRIMINOLOGI'),
('66201', 'C', 'KRIMINOLOGI'),
('67001', 'A', 'ILMU POLITIK'),
('67101', 'B', 'ILMU POLITIK'),
('67201', 'C', 'ILMU POLITIK'),
('68001', 'A', 'ILMU SOSIAL'),
('68101', 'B', 'ILMU SOSIAL'),
('68201', 'C', 'ILMU SOSIATRI'),
('68401', 'E', 'PEMBANGUNAN MASYARAKAT DESA'),
('69001', 'A', 'ILMU SOSIOLOGI'),
('69101', 'B', 'SOSIOLOGI'),
('69201', 'C', 'SOSIOLOGI'),
('70001', 'A', 'ILMU KOMUNIKASI'),
('70101', 'B', 'ILMU KOMUNIKASI'),
('70133', 'B', 'Komunikasi dan Penyiaran Islam'),
('70201', 'C', 'ILMU KOMUNIKASI'),
('70230', 'C', 'Manajemen Dakwah'),
('70231', 'C', 'Pengembangan Masyarakat Islam '),
('70232', 'C', 'Bimbingan dan Penyuluhan Islam'),
('70233', 'C', 'Komunikasi dan Penyiaran Islam'),
('70302', 'D', 'JURNALISTIK'),
('70401', 'E', 'HUBUNGAN MASYARAKAT'),
('70402', 'E', 'JURNALISTIK'),
('70403', 'E', 'KOMUNIKASI MASSA'),
('70404', 'E', 'PERIKLANAN'),
('70405', 'E', 'PENYIARAN'),
('71101', 'B', 'ILMU PERPUSTAKAAN'),
('71201', 'C', 'ILMU PERPUSTAKAAN'),
('71302', 'D', 'KEARSIPAN'),
('71401', 'E', 'PERPUSTAKAAN'),
('71402', 'E', 'KEARSIPAN'),
('71501', 'F', 'PERPUSTAKAAN'),
('72001', 'A', 'ILMU KESEJAHTERAAN SOSIAL'),
('72101', 'B', 'ILMU KESEJAHTERAAN SOSIAL'),
('72201', 'C', 'ILMU KESEJAHTERAAN SOSIAL'),
('72401', 'E', 'PEKERJA SOSIAL'),
('73001', 'A', 'ILMU PSIKOLOGI'),
('73101', 'B', 'PSIKOLOGI'),
('73201', 'C', 'PSIKOLOGI'),
('74001', 'A', 'ILMU HUKUM'),
('74101', 'B', 'ILMU HUKUM'),
('74102', 'B', 'KENOTARIATAN'),
('74130', 'B', 'Hukum Keluarga (Akhwal Syaksiyah) '),
('74134', 'B', 'Hukum Ekonomi Syariah (Muamalah)'),
('74201', 'C', 'ILMU HUKUM'),
('74230', 'C', 'Hukum Keluarga (Akhwal Syaksiyah)'),
('74231', 'C', 'Hukum Pidana Islam (Jinayah)'),
('74233', 'C', 'Perbandingan Mazhab '),
('74234', 'C', 'Hukum Ekonomi Syariah (Muamalah)'),
('74235', 'C', 'Hukum Tatanegara (Siyasah)'),
('74401', 'E', 'ADMINISTRASI PERADILAN'),
('75001', 'A', 'ILMU FILSAFAT'),
('75101', 'B', 'ILMU FILSAFAT'),
('75201', 'C', 'ILMU FILSAFAT'),
('75401', 'E', 'FILSAFAT TEOLOGI'),
('76001', 'A', 'ILMU RELIGI'),
('76034', 'A', 'Perbandingan Agama (Ilmu Religi)'),
('76037', 'A', 'Filsafat Agama'),
('76101', 'B', 'ILMU RELIGI'),
('76131', 'B', 'Ilmu Al-Qur''an dan Tafsir'),
('76134', 'B', 'Perbandingan Agama'),
('76135', 'B', 'Ilmu Hadits'),
('76201', 'C', 'ILMU RELIGI'),
('76231', 'C', 'Ilmu Alquran dan tafsir '),
('76232', 'C', 'Ilmu Aqidah'),
('76234', 'C', 'Perbandingan Agama (Ilmu Religi)'),
('76236', 'C', 'Akhlak dan Tasawuf'),
('77001', 'A', 'ILMU TEOLOGI'),
('77101', 'B', 'ILMU TEOLOGI'),
('77201', 'C', 'ILMU TEOLOGI'),
('79001', 'A', 'ILMU SUSASTRA'),
('79002', 'A', 'ILMU LINGUISTIK'),
('79101', 'B', 'ILMU SUSASTRA'),
('79102', 'B', 'ILMU LINGUISTIK'),
('79103', 'B', 'BAHASA INGGRIS'),
('79201', 'C', 'SASTRA INDONESIA'),
('79202', 'C', 'SASTRA INGGRIS'),
('79203', 'C', 'SASTRA ARAB'),
('79204', 'C', 'SASTRA JEPANG'),
('79205', 'C', 'SASTRA PERANCIS'),
('79206', 'C', 'SASTRA JERMAN'),
('79207', 'C', 'SASTRA RUSIA'),
('79208', 'C', 'SASTRA BELANDA'),
('79209', 'C', 'SASTRA CINA'),
('79210', 'C', 'SASTRA KOREA'),
('79211', 'C', 'SASTRA DAERAH'),
('79401', 'E', 'BAHASA INDONESIA'),
('79402', 'E', 'BAHASA INGGRIS'),
('79403', 'E', 'BAHASA ARAB'),
('79404', 'E', 'BAHASA JEPANG'),
('79405', 'E', 'BAHASA PERANCIS'),
('79406', 'E', 'BAHASA JERMAN'),
('79407', 'E', 'BAHASA RUSIA'),
('79408', 'E', 'BAHASA BELANDA'),
('79409', 'E', 'BAHASA MANDARIN'),
('79410', 'E', 'BAHASA KOREA'),
('79502', 'F', 'BAHASA INGGRIS'),
('79602', 'G', 'BAHASA INGGRIS'),
('79604', 'G', 'BAHASA JEPANG'),
('79608', 'G', 'BAHASA BELANDA'),
('80001', 'A', 'ILMU SEJARAH'),
('80101', 'B', 'ILMU SEJARAH'),
('80130', 'B', 'Sejarah dan Kebudayaan Islam'),
('80201', 'C', 'ILMU SEJARAH'),
('80230', 'C', 'Sejarah dan Kebudayaan Islam'),
('81001', 'A', 'ILMU ARKEOLOGI'),
('81101', 'B', 'ILMU ARKEOLOGI'),
('81201', 'C', 'ILMU ARKEOLOGI'),
('82001', 'A', 'ILMU ANTROPOLOGI'),
('82101', 'B', 'ANTROPOLOGI'),
('82201', 'C', 'ANTROPOLOGI SOSIAL'),
('83001', 'A', 'PENDIDIKAN TEKNOLOGI DAN KEJURUAN'),
('83101', 'B', 'PENDIDIKAN TEKNOLOGI DAN KEJURUAN'),
('83201', 'C', 'PENDIDIKAN TEKNIK ELEKTRO'),
('83202', 'C', 'PENDIDIKAN TEKNIK ELEKTRONIKA'),
('83203', 'C', 'PENDIDIKAN TEKNIK MESIN'),
('83204', 'C', 'PENDIDIKAN TEKNIK OTOMOTIF'),
('83205', 'C', 'PENDIDIKAN TEKNIK BANGUNAN'),
('83206', 'C', 'PENDIDIKAN KESEJAHTERAAN KELUARGA'),
('83207', 'C', 'PENDIDIKAN TEKNIK INFORMATIKA'),
('83211', 'C', 'PENDIDIKAN TATA BOGA'),
('83212', 'C', 'PENDIDIKAN TATA BUSANA'),
('83213', 'C', 'PENDIDIKAN TATA RIAS'),
('83313', 'D', 'PENDIDIKAN TATA RIAS'),
('84001', 'A', 'PENDIDIKAN MIPA'),
('84002', 'A', 'PENDIDIKAN MATEMATIKA'),
('84005', 'A', 'PENDIDIKAN BIOLOGI'),
('84101', 'B', 'PENDIDIKAN IPA'),
('84102', 'B', 'PENDIDIKAN MATEMATIKA'),
('84103', 'B', 'PENDIDIKAN FISIKA'),
('84104', 'B', 'PENDIDIKAN KIMIA'),
('84105', 'B', 'PENDIDIKAN BIOLOGI'),
('84201', 'C', 'PENDIDIKAN IPA'),
('84202', 'C', 'PENDIDIKAN MATEMATIKA'),
('84203', 'C', 'PENDIDIKAN FISIKA'),
('84204', 'C', 'PENDIDIKAN KIMIA'),
('84205', 'C', 'PENDIDIKAN BIOLOGI'),
('84402', 'E', 'PENDIDIKAN MATEMATIKA'),
('84403', 'E', 'PENDIDIKAN FISIKA'),
('84405', 'E', 'PENDIDIKAN BIOLOGI'),
('85001', 'A', 'PENDIDIKAN OLAHRAGA'),
('85101', 'B', 'PENDIDIKAN OLAHRAGA'),
('85201', 'C', 'PENDIDIKAN JASMANI, KESEHATAN DAN REKREASI'),
('85202', 'C', 'PENDIDIKAN KEPELATIHAN OLAHRAGA'),
('85401', 'E', 'PENDIDIKAN JASMANI, KESEHATAN DAN REKREASI'),
('85501', 'F', 'PENDIDIKAN GURU PENJASKESREK'),
('86001', 'A', 'ILMU PENDIDIKAN'),
('86003', 'A', 'TEKNOLOGI PENDIDIKAN'),
('86004', 'A', 'ADMINISTRASI PENDIDIKAN'),
('86005', 'A', 'PENDIDIKAN LUAR SEKOLAH'),
('86011', 'A', 'PSIKOLOGI PENDIDIKAN'),
('86020', 'A', 'PENELITAN DAN EVALUASI PENDIDIKAN'),
('86021', 'A', 'PENGEMBANGAN KURIKULUM'),
('86030', 'A', 'Pendidikan Islam'),
('86101', 'B', 'BIMBINGAN KONSELING'),
('86102', 'B', 'PENDIDIKAN LUAR BIASA'),
('86103', 'B', 'TEKNOLOGI PENDIDIKAN'),
('86104', 'B', 'ADMINISTRASI PENDIDIKAN'),
('86105', 'B', 'PENDIDIKAN LUAR SEKOLAH'),
('86106', 'B', 'PENDIDIKAN GURU SEKOLAH DASAR'),
('86107', 'B', 'PENDIDIKAN GURU PENDIDIKAN ANAK USIA DINI'),
('86108', 'B', 'PENDIDIKAN GURU AGAMA'),
('86120', 'B', 'PENELITIAN DAN EVALUASI PENDIDIKAN'),
('86121', 'B', 'PENGEMBANGAN KURIKULUM'),
('86122', 'B', 'PENDIDIKAN DASAR'),
('86131', 'B', 'Manajemen Pendidikan Islam'),
('86201', 'C', 'BIMBINGAN KONSELING'),
('86202', 'C', 'PENDIDIKAN LUAR BIASA'),
('86203', 'C', 'TEKNOLOGI PENDIDIKAN'),
('86204', 'C', 'ADMINISTRASI PENDIDIKAN'),
('86205', 'C', 'PENDIDIKAN LUAR SEKOLAH'),
('86206', 'C', 'PENDIDIKAN GURU SEKOLAH DASAR'),
('86207', 'C', 'PENDIDIKAN GURU PENDIDIKAN ANAK USIA DINI'),
('86208', 'C', 'PENDIDIKAN GURU AGAMA'),
('86209', 'C', 'PJJ PENDIDIKAN GURU SEKOLAH DASAR'),
('86216', 'C', 'DMS Pendidikan Agama islam'),
('86231', 'C', 'Manajemen Pendidikan Islam'),
('86232', 'C', 'Pendidikan Guru Madrasah Ibtidaiyah '),
('86235', 'C', 'DMS Pendidikan Guru Madrasah Ibtidaiyah'),
('86408', 'E', 'PENDIDIKAN GURU AGAMA'),
('86506', 'F', 'PENDIDIKAN GURU SEKOLAH DASAR'),
('86507', 'F', 'PENDIDIKAN GURU TAMAN KANAK-KANAK'),
('87001', 'A', 'PENDIDIKAN IPS'),
('87003', 'A', 'PENDIDIKAN EKONOMI'),
('87101', 'B', 'PENDIDIKAN SEJARAH'),
('87102', 'B', 'PENDIDIKAN GEOGRAFI'),
('87103', 'B', 'PENDIDIKAN EKONOMI'),
('87104', 'B', 'PENDIDIKAN SOSIOLOGI'),
('87120', 'B', 'PENDIDIKAN IPS'),
('87201', 'C', 'PENDIDIKAN SEJARAH'),
('87202', 'C', 'PENDIDIKAN GEOGRAFI'),
('87203', 'C', 'PENDIDIKAN EKONOMI'),
('87204', 'C', 'PENDIDIKAN SOSIOLOGI'),
('87205', 'C', 'PENDIDIKAN PANCASILA DAN KEWARGANEGARAAN'),
('87220', 'C', 'PENDIDIKAN IPS'),
('87402', 'E', 'PENDIDIKAN GEOGRAFI'),
('87403', 'E', 'PENDIDIKAN EKONOMI'),
('88001', 'A', 'ILMU PENDIDIKAN BAHASA'),
('88003', 'A', 'PENDIDIKAN BAHASA INGGRIS'),
('88101', 'B', 'PENDIDIKAN BAHASA DAN SASTRA INDONESIA'),
('88102', 'B', 'PENDIDIKAN BAHASA DAN SASTRA DAERAH'),
('88103', 'B', 'PENDIDIKAN BAHASA INGGRIS'),
('88104', 'B', 'PENDIDIKAN BAHASA ARAB'),
('88105', 'B', 'PENDIDIKAN BAHASA JEPANG'),
('88106', 'B', 'PENDIDIKAN BAHASA PERANCIS'),
('88107', 'B', 'PENDIDIKAN BAHASA JERMAN'),
('88108', 'B', 'PENDIDIKAN BAHASA MANDARIN'),
('88109', 'B', 'PENDIDIKAN SENI DRAMA, TARI DAN MUSIK'),
('88110', 'B', 'PENDIDIKAN SENI RUPA'),
('88111', 'B', 'PENDIDIKAN BAHASA'),
('88201', 'C', 'PENDIDIKAN BAHASA DAN SASTRA INDONESIA'),
('88202', 'C', 'PENDIDIKAN BAHASA DAN SASTRA DAERAH'),
('88203', 'C', 'PENDIDIKAN BAHASA INGGRIS'),
('88204', 'C', 'PENDIDIKAN BAHASA ARAB'),
('88205', 'C', 'PENDIDIKAN BAHASA JEPANG'),
('88206', 'C', 'PENDIDIKAN BAHASA PERANCIS'),
('88207', 'C', 'PENDIDIKAN BAHASA JERMAN'),
('88208', 'C', 'PENDIDIKAN BAHASA MANDARIN'),
('88209', 'C', 'PENDIDIKAN SENI DRAMA, TARI DAN MUSIK'),
('88210', 'C', 'PENDIDIKAN SENI RUPA'),
('88401', 'E', 'PENDIDIKAN BAHASA DAN SASTRA INDONESIA'),
('88403', 'E', 'PENDIDIKAN BAHASA INGGRIS'),
('88405', 'E', 'PENDIDIKAN BAHASA JEPANG'),
('88501', 'F', 'PENDIDIKAN BAHASA DAN SASTRA INDONESIA'),
('89001', 'A', 'ILMU KEOLAHRAGAAN'),
('89101', 'B', 'ILMU KEOLAHRAGAAN'),
('89201', 'C', 'ILMU KEOLAHRAGAAN'),
('90001', 'A', 'SENI RUPA'),
('90101', 'B', 'SENI RUPA'),
('90102', 'B', 'DESAIN'),
('90131', 'B', 'DESAIN PRODUK'),
('90201', 'C', 'SENI RUPA MURNI'),
('90211', 'C', 'KRIYA SENI'),
('90221', 'C', 'DESAIN INTERIOR'),
('90231', 'C', 'DESAIN PRODUK'),
('90241', 'C', 'DESAIN KOMUNIKASI VISUAL'),
('90242', 'C', 'DESAIN GRAFIS'),
('90331', 'D', 'DESAIN PRODUK'),
('90342', 'D', 'DESAIN GRAFIS'),
('90343', 'D', 'KOMPUTER MULTIMEDIA'),
('90344', 'D', 'TEKNIK GRAFIKA'),
('90401', 'E', 'SENI RUPA'),
('90411', 'E', 'KRIYA KAIN'),
('90412', 'E', 'KRIYA KAYU'),
('90413', 'E', 'KRIYA KERAMIK'),
('90414', 'E', 'KRIYA LOGAM'),
('90415', 'E', 'KRIYA KULIT'),
('90416', 'E', 'KRIYA PERHIASAN'),
('90417', 'E', 'KRIYA SENI'),
('90421', 'E', 'DESAIN INTERIOR'),
('90431', 'E', 'DESAIN PRODUK'),
('90441', 'E', 'DESAIN KOMUNIKASI VISUAL'),
('90442', 'E', 'DESAIN GRAFIS'),
('90443', 'E', 'KOMPUTER MULTIMEDIA'),
('90444', 'E', 'TEKNIK GRAFIKA'),
('90501', 'F', 'SENI RUPA'),
('90541', 'F', 'DESAIN KOMUNIKASI VISUAL'),
('90621', 'G', 'DESAIN INTERIOR'),
('90641', 'G', 'DESAIN KOMUNIKASI VISUAL'),
('91001', 'A', 'PENCIPTAAN DAN PENGKAJIAN SENI'),
('91101', 'B', 'PENCIPTAAN DAN PENGKAJIAN SENI'),
('91201', 'C', 'ETNOMUSIKOLOGI'),
('91202', 'C', 'ANTROPOLOGI TARI'),
('91211', 'C', 'SENI KARAWITAN'),
('91221', 'C', 'SENI MUSIK'),
('91231', 'C', 'SENI TARI'),
('91241', 'C', 'SENI PEDALANGAN'),
('91251', 'C', 'SENI TEATER'),
('91261', 'C', 'TELEVISI DAN FILM'),
('91271', 'C', 'FOTOGRAFI'),
('91281', 'C', 'RADIO'),
('91411', 'E', 'SENI KARAWITAN'),
('91421', 'E', 'SENI MUSIK'),
('91431', 'E', 'SENI TARI'),
('91441', 'E', 'SENI PEDALANGAN'),
('91451', 'E', 'SENI TEATER'),
('91461', 'E', 'TELEVISI'),
('91462', 'E', 'FILM'),
('91471', 'E', 'FOTOGRAFI'),
('91481', 'E', 'RADIO'),
('91511', 'F', 'SENI KARAWITAN'),
('91531', 'F', 'PENATA TARI'),
('91661', 'G', 'FILM DAN TELEVISI'),
('92201', 'C', 'KETATALAKSANAAN PELAYARAN NIAGA DAN KEPELABUHAN'),
('92301', 'D', 'KETATALAKSANAAN PELAYARAN NIAGA DAN KEPELABUHAN'),
('92401', 'E', 'KETATALAKSANAAN PELAYARAN NIAGA DAN KEPELABUHAN'),
('92402', 'E', 'TEKNIKA'),
('92403', 'E', 'NAUTIKA'),
('93201', 'C', 'USAHA PERJALANAN WISATA'),
('93202', 'C', 'PERHOTELAN DAN PARIWISATA'),
('93301', 'D', 'USAHA PERJALANAN WISATA'),
('93302', 'D', 'PERHOTELAN'),
('93303', 'D', 'PARIWISATA'),
('93401', 'E', 'USAHA PERJALANAN WISATA'),
('93402', 'E', 'PERHOTELAN'),
('93403', 'E', 'PARIWISATA'),
('93501', 'F', 'PEMANDU WISATA'),
('93502', 'F', 'PERHOTELAN'),
('93503', 'F', 'DIVISI KAMAR'),
('93601', 'G', 'PEMANDU WISATA'),
('93602', 'G', 'PERHOTELAN'),
('93603', 'G', 'DIVISI KAMAR'),
('94101', 'B', 'AKTUARIA'),
('94401', 'E', 'ASURANSI JIWA'),
('94402', 'E', 'ASURANSI KESEHATAN'),
('94403', 'E', 'ASURANSI KERUGIAN'),
('94404', 'E', 'TERAPI WICARA'),
('94405', 'E', 'TATA BUSANA'),
('94406', 'E', 'TATA BOGA'),
('94407', 'E', 'TATA GRIYA'),
('94408', 'E', 'TATA RIAS'),
('94409', 'E', 'ADMINISTRASI ASURANSI DAN AKTUARIA'),
('94505', 'F', 'TATA BUSANA'),
('94506', 'F', 'TATA HIDANGAN'),
('94507', 'F', 'TATA BOGA'),
('94508', 'F', 'TATA RIAS'),
('94605', 'G', 'TATA BUSANA'),
('94606', 'G', 'TATA HIDANGAN'),
('94607', 'G', 'TATA BOGA'),
('94608', 'G', 'TATA RIAS'),
('94609', 'G', 'GROUND HANDLING'),
('94610', 'G', 'PRAMUGARI-PRAMUGARA'),
('94611', 'G', 'CARGO UDARA'),
('95001', 'A', 'ILMU PENGELOLAAN SUMBER DAYA ALAM DAN LINGKUNGA'),
('95002', 'A', 'KAJIAN KEPENDUDUKAN DAN KETENAGAKERJAAN'),
('95003', 'A', 'ILMU PERENC PEMBANGUNAN WILAYAH DAN PEDESAAN'),
('95027', 'A', 'KAJIAN BUDAYA'),
('95029', 'A', 'KAJIAN ILMU LINGKUNGAN'),
('95031', 'A', 'ILMU-ILMU HUMANIORA'),
('95101', 'B', 'ILMU PENGELOLAAN SUMBER DAYA ALAM DAN LINGKUNGA'),
('95102', 'B', 'KAJIAN KEPENDUDUKAN DAN KETENAGAKERJAAN'),
('95103', 'B', 'ILMU PERENC PEMBANGUNAN WILAYAH DAN PEDESAAN'),
('95104', 'B', 'KAJIAN PARIWISATA'),
('95105', 'B', 'ADMINISTRASI PEMBANGUNAN'),
('95106', 'B', 'PENGEMBANGAN SUMBER DAYA MANUSIA'),
('95107', 'B', 'STUDI KEBIJAKAN'),
('95120', 'B', 'KAJIAN ILMU KEPOLISIAN'),
('95121', 'B', 'KAJIAN WILAYAH AMERIKA'),
('95122', 'B', 'KAJIAN WILAYAH JEPANG'),
('95123', 'B', 'KAJIAN WILAYAH EROPA'),
('95124', 'B', 'KAJIAN TIMUR TENGAH DAN ISLAM'),
('95125', 'B', 'KAJIAN PENGEMBANGAN PERKOTAAN'),
('95126', 'B', 'KAJIAN WANITA'),
('95127', 'B', 'KAJIAN BUDAYA'),
('95128', 'B', 'KAJIAN KETAHANAN NASIONAL'),
('95129', 'B', 'KAJIAN ILMU LINGKUNGAN'),
('95130', 'B', 'JENDER DAN PEMBANGUNAN'),
('95203', 'C', 'PEMBANGUNAN WILAYAH'),
('95403', 'E', 'PERENCANAAN DAN MONITORING PEMBANGUNAN');

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
(21, 'kurikulum_feeder', 'kurikulum feeder', 'kurikulum-feeder', 'kurikulum', '', 1, 20, 'Y', 'Y', 'page'),
(24, 'hapus_kelas', 'hapus kelas feeder', 'hapus-kelas', 'kelas_kuliah', '', 1, 20, 'Y', 'Y', 'page'),
(26, 'config_akun_feeder', 'config akun feeder', 'config-akun-feeder', 'config_user', '', 1, 17, 'Y', 'Y', 'page'),
(27, 'hapus_akm_feeder', 'hapus akm feeder', 'hapus-akm-feeder', 'config_user', '', 3, 20, 'Y', 'Y', 'page'),
(28, 'about', 'about', 'about', 'agama', '', 8, 0, 'Y', 'Y', 'page'),
(29, 'kelulusan', 'kelulusan', 'kelulusan', 'kelulusan', '', 9, 1, 'Y', 'Y', 'page');

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
(43, 21, 1, 'N', 'N', 'N', 'N', 'N'),
(44, 21, 2, 'N', 'N', 'N', 'N', 'Y'),
(49, 24, 1, 'Y', 'Y', 'Y', 'Y', 'Y'),
(50, 24, 2, 'Y', 'Y', 'Y', 'Y', 'Y'),
(53, 26, 1, 'Y', 'Y', 'Y', 'Y', 'Y'),
(54, 26, 2, 'N', 'N', 'N', 'N', 'Y'),
(55, 27, 1, 'Y', 'Y', 'Y', 'Y', 'Y'),
(56, 27, 2, 'N', 'N', 'N', 'N', 'Y'),
(57, 28, 1, 'Y', 'Y', 'Y', 'Y', 'Y'),
(58, 28, 2, 'Y', 'N', 'N', 'N', 'Y'),
(60, 29, 1, 'Y', 'Y', 'Y', 'Y', NULL),
(61, 29, 2, 'N', 'N', 'N', 'N', NULL);

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
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id_pd`);

--
-- Indexes for table `mat_kurikulum`
--
ALTER TABLE `mat_kurikulum`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_mat_kurikulum_kurikulum` (`id_kurikulum`);

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
-- Indexes for table `program_studi_dikti`
--
ALTER TABLE `program_studi_dikti`
  ADD PRIMARY KEY (`prodidiktiKode`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `mat_kurikulum`
--
ALTER TABLE `mat_kurikulum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `sys_menu_role`
--
ALTER TABLE `sys_menu_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
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
