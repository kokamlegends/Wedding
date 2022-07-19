-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 19, 2022 at 10:02 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbmasjid`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `id_assignment` int(11) NOT NULL,
  `id_aunt` int(11) NOT NULL,
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_assignment`
--

INSERT INTO `auth_assignment` (`id_assignment`, `id_aunt`, `item_name`, `user_id`, `created_at`) VALUES
(1, 1, 'Admin', '1', '0000-00-00 00:00:00'),
(2, 3, 'User', '2', NULL),
(3, 3, 'User', '3', NULL),
(12, 3, 'User', '4', '2021-11-28 23:03:22'),
(13, 3, 'User', '5', '2021-12-02 19:25:15'),
(14, 3, 'User', '6', '2022-05-20 15:09:05');

-- --------------------------------------------------------

--
-- Table structure for table `auth_item`
--

CREATE TABLE `auth_item` (
  `id_aunt` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `tipe` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_item`
--

INSERT INTO `auth_item` (`id_aunt`, `name`, `tipe`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 1, 'hak akses admin', NULL, NULL),
(2, 'Kasir', 1, 'hak akses kasir', NULL, NULL),
(3, 'User', 1, 'Hak akses diatas admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `idc` int(11) NOT NULL,
  `id_aunt` int(11) NOT NULL,
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_item_child`
--

INSERT INTO `auth_item_child` (`idc`, `id_aunt`, `parent`, `child`) VALUES
(1, 1, 'Admin', '15'),
(2, 1, 'Admin', '22'),
(3, 1, 'Admin', '33'),
(4, 1, 'Admin', '13'),
(16, 1, 'Admin', '48'),
(28, 1, 'Admin', '40'),
(42, 1, 'Admin', '41'),
(43, 2, 'Kasir', '12'),
(45, 1, 'Admin', '49'),
(46, 1, 'Admin', '50'),
(47, 1, 'Admin', '51'),
(48, 1, 'Admin', '52'),
(50, 1, 'Admin', '54'),
(51, 1, 'Admin', '56'),
(52, 1, 'Admin', '55'),
(53, 1, 'Admin', '57'),
(58, 1, 'Admin', '70'),
(68, 2, 'Kasir', '61'),
(69, 2, 'Kasir', '62'),
(70, 2, 'Kasir', '63'),
(77, 1, 'Admin', '78'),
(79, 1, 'Admin', '79'),
(80, 6, 'siswa', '12'),
(88, 1, 'Admin', '47'),
(90, 3, 'User', '61'),
(91, 3, 'User', '62'),
(92, 3, 'User', '63'),
(93, 1, 'Admin', '74'),
(98, 1, 'Admin', '63'),
(109, 1, 'Admin', '89'),
(110, 1, 'Admin', '73'),
(111, 1, 'Admin', '88'),
(112, 1, 'Admin', '90'),
(113, 1, 'Admin', '91'),
(114, 1, 'Admin', '92'),
(115, 1, 'Admin', '93'),
(116, 1, 'Admin', '94'),
(117, 1, 'Admin', '86'),
(118, 3, 'User', '12'),
(119, 3, 'User', '40'),
(120, 3, 'User', '89'),
(121, 3, 'User', '92'),
(122, 3, 'User', '95'),
(123, 3, 'User', '96'),
(124, 1, 'Admin', '97'),
(125, 1, 'Admin', '98');

-- --------------------------------------------------------

--
-- Table structure for table `info`
--

CREATE TABLE `info` (
  `id_info` int(11) NOT NULL,
  `nama_web` varchar(100) NOT NULL,
  `nama_singkat` varchar(100) NOT NULL,
  `tentang` text NOT NULL,
  `slogan` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `wa` varchar(18) NOT NULL,
  `logo_web` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `info`
--

INSERT INTO `info` (`id_info`, `nama_web`, `nama_singkat`, `tentang`, `slogan`, `alamat`, `email`, `wa`, `logo_web`) VALUES
(1, 'Test', 'BAITUL MUKMININ', 'Test Web Wedding', '4 2 Heart Being One', 'Rahasia', 'Test@gmail.com', '0813-3378-2544', '1file_13112021091121.png');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `link` varchar(50) NOT NULL,
  `deskrip` text NOT NULL,
  `icon` varchar(30) NOT NULL,
  `is_active` int(1) NOT NULL,
  `is_parent` int(1) NOT NULL,
  `tipe` enum('menu','link','pager') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `name`, `link`, `deskrip`, `icon`, `is_active`, `is_parent`, `tipe`) VALUES
(12, 'Dashboard', 'admin/dashboard', 'hak akses info desa', 'fa fa-laptop', 1, 0, 'link'),
(13, 'Admin', '#', '', 'fa fa-laptop', 1, 0, 'menu'),
(15, 'menu management', 'admin/menu', 'hak akses penuh Controler menu/*', 'fa fa-list-alt', 1, 13, 'menu'),
(22, 'GENERATOR', 'harviacode', 'hak akses penuh Controler harviacode/*', 'fa fa-laptop', 1, 13, 'menu'),
(40, 'data', '#', '', 'fa fa-laptop', 1, 0, 'menu'),
(41, 'Setting', '#', '', 'fa fa-laptop', 1, 0, 'menu'),
(47, 'Auth item', 'admin/auth_item', 'hak akses penuh Controler Auth_item/*', 'fa fa-laptop', 1, 13, 'menu'),
(48, 'Auth detail', 'admin/auth_item_child', 'hak akses penuh Controler Auth_item_child/*', 'fa fa-laptop', 1, 13, 'menu'),
(52, 'Info Web', 'admin/info', 'hak akses Info', 'fa fa-circle', 1, 41, 'menu'),
(61, 'users/update', 'admin/users/update', 'hak akses aksi users/update/', 'fa fa-laptop', 1, 0, 'pager'),
(62, 'users/update_pass', 'admin/users/update_pass', 'hak akses aksi users/read/', 'fa fa-laptop', 1, 0, 'pager'),
(63, 'users/read', 'admin/users/read', 'hak akses aksi users/read/', 'fa fa-laptop', 1, 0, 'pager'),
(70, 'user', 'admin/users', 'Data users', 'fa fa-circle', 1, 40, 'menu'),
(73, 'admin', 'admin', 'routing', '1', 1, 0, 'pager'),
(74, 'Dashboard', 'admin/dashboard', 'hak akses info desa', 'fa fa-laptop', 1, 0, 'link'),
(78, 'tema', 'admin/tema', 'hak akses', 'fa fa-circle', 1, 41, 'link'),
(81, 'Produk', 'admin/listmenu', 'hak akses', 'fa fa-laptop', 1, 40, 'link'),
(82, 'checkout', 'web/checkout', 'hak akses', 'fa fa-laptop', 1, 0, 'link'),
(83, 'Pesanan', 'admin/pesanantamu', 'fungsi data Pesanan Tamu', 'fa fa-laptop', 1, 0, 'menu'),
(86, 'slider', 'admin/slider', 'hak akses', 'fa fa-circle', 1, 40, 'link'),
(87, 'logorder', 'web/logorder', 'hak akses', 'fa fa-laptop', 1, 0, 'link'),
(88, 'artikel web', 'admin/page', 'hak akses', 'fa fa-circle', 1, 40, 'menu'),
(89, 'keuangan', 'admin/t_keuangan', 'hak akses', 'fa fa-circle', 1, 40, 'link'),
(90, 'Kegiatan Masjid', 'admin/t_jadwal', 'hak akses', 'fa fa-circle', 1, 40, 'link'),
(91, 'jadwal sholat', 'admin/t_sholat', 'hak akses', 'fa fa-circle', 1, 40, 'link'),
(92, 'donasi', 'admin/t_donasi', 'hak akses', 'fa fa-circle', 1, 40, 'link'),
(93, 'buletin', 'admin/t_buletin', 'hak akses', 'fa fa-circle', 1, 40, 'link'),
(94, 'kategori buletin', 'admin/t_kategori', 'hak akses', 'fa fa-circle', 1, 40, 'link'),
(95, 'web donasi', 'web/t_donasi', 'hak akses', 'fa fa-laptop', 1, 0, 'link'),
(96, 'web laporan keuangan', 'web/t_keuangan', 'hak akses', 'fa fa-laptop', 1, 0, 'link'),
(97, 't_pernikahan', 'admin/t_pernikahan', 'hak akses', 'fa fa-laptop', 1, 0, 'link'),
(98, 't_galeri', 'admin/t_galeri', 'hak akses', 'fa fa-laptop', 1, 0, 'link');

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE `page` (
  `id_page` int(11) NOT NULL,
  `link` varchar(100) DEFAULT NULL,
  `judul` varchar(1000) NOT NULL,
  `deskripsi` text NOT NULL,
  `foto` varchar(100) NOT NULL,
  `enum` enum('y','n') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `page`
--

INSERT INTO `page` (`id_page`, `link`, `judul`, `deskripsi`, `foto`, `enum`) VALUES
(1, 'Sejarah', 'Sejarah', 'Ide Pendirian\r\nPengertian mendasar tentang masjid menurut ajaran Islam adalah “tempat sujud umat yang tidak terikat dengan waktu dan ruang”. Maka aspek fungsional lebih menonjol ketimbang sosok bangunannya. Sabda Rasulullah SAW (ketika ditanya tentang masjid mana yang pertama di dunia ini) : “Dimanapun engkau mendapatkan waktu sholat, tunaikanlah sholatmu sebab disitu juga masjid.”\r\n\r\nSejak zaman Rasulullah masjid bukan hanya tempat ibadah tapi juga merupakan pusat kegiatan berdimensi luas. Masjid adalah tempat untuk memakmurkan umat dalam arti menigkatkan kualitas umat serta kesejahteraan umat lahir dan batin. Di masjid orang bermusyawarah, mengurus jenazah, melaksanakan manasik haji, menyelenggarakan wisata religi dan bahkan mengatur strategi perang. Maka tidak mengherankan bahwa di zaman modern ini banyak masjid dilengkapi dengan perpustakaan, sarana olah raga, fasilitas penyelenggaraan akad nikah dan sebagainya.\r\n\r\nPropinsi Jawa Timur yang berpenduduk sekitar 35 juta jiwa dan 90% diantaranya beragama Islam, memiliki sekitar kurang lebih 6.000 masjid terdiri dari masjid jami’, masjid sekolah, masjid warga, masjid pesantren dan masjid instansi pemerintah dan swasta. Angka ini belum termasuk sejumlah musholla dan langgar yang tersebar di seluruh kotamadya dan kabupaten.\r\n\r\nWalau telah memiliki cukup banyak masjid, keinginan masyarakat Surabaya untuk memiliki masjid berkala nasiona baik dalam konsep arsitektur, skala fisik maupun fungsi ibadahnya, telah terpendam cukup lama sebelum beranjak ke permukaan untuk diwujudkan menjadi kenyataan.\r\n\r\nSurabaya ibukota Jawa Timur dan kota terbesar nomor dua di Indonesia, dengan jumlah penduduk lebih dari 4 juta jiwa memiliki populasi Muslim sekitar 90%. Tidaklah berlebihan jika dikatakan disini bahwa perjuangan rakyat Surabaya di tahun 1945 adalah perjuangan umat Islam, sebagai tercermin dalam takbir “Allahu Akbar” yang dipekikkan para pejuang kemerdekaan waktu itu.\r\n\r\nTak kalah dinamisnya, perjuangan rakyat Surabaya untuk menegakkan syi’ar Islam dan mendirikan masjid, terbukti dengan hadirnya 2000-an masjid yang tersebar di seluruh pelosok kota. Sejalan dengan perkembangan agama Islam di Surabaya, tuntutan umat akan sarana ibadah pun menigkat, yang bermuara pada munculnya gagasan-gagasan untuk mendirikan masjid yang lebih besar dalam skala, dimensi dan kualitas.\r\n\r\nMasjid Al-Akbar Surabaya adalah wujud sebuah impian yang telah lama terpendam. Impian umat Islam di kota ini yang jumlahnya mendekati 5 juta jiwa, sekaligus menampung aspirasi 35 juta warga Jawa Timur pada umumnya. Didirikan di atas tanah seluas 11,2 hektar. Masjid Al-Akbar memiliki luas bangunan 28.509 m2 dengan kapasitas 36.000 jamaah, berlokasi di kawasan Pagesangan Surabaya Selatan, tepatnya di tepi jalan tol Surabaya-Malang.\r\n\r\nMasjid Al-Akbar Surabaya diproyeksikan untuk mewujudkan konsep masjid dalam arti luas, sebagai Islamic Center dengan peran multidimensi dengan misi religius, kutural dan edukatif termasuk wisata religi, membangun dunia Islam yang rahmatan al amien. secara lahiriahnya Masjid Al-Akbar akan menjadi landmark kota Surabaya, dan secara simbolik memperkaya peta dunia Islam, yang tentunya mengangkat citra kota ini di mancanegara.\r\n\r\nMasjid Al Akbar dibangun pada tanggal 4 Agustus 1995 atas gagasan Mantan Walikota Surabaya Soenarto Soemoprawiro. Sedang peletakan batu pertama oleh Wapres Try Sutrisno dan diresmikan Presiden KH Abdurrahman Wahid, 10 November 2000.\r\n\r\nSejak peletakan batu pertama, proses kehadiran masjid ini mengalami proses pergulatan panjang untuk bisa hadir ditengah masyarakat metro bernuansa jawa ini. Padahal, dalam konsep pembangunan awalnya, masjid ini ingin dihadirkan dalam tempo sesingkat mungkin. Bahkan, untuk menjawab keinginan percepatan itu, pelaksana proyek berani melakukan pembangunan dengan sistem fast track. Yaitu sebuah sistem dimana perencana diselesaikan bersamaan dengan pelaksanaan di lapangan.\r\n\r\nTapi, sekali lagi, itulah kemampuan kita sebagai manusia. Keinginan seperti apapun, kalau memang harus melalui proses panjang, maka proses itu tak bisa dihilangkan. Pun demikian nampaknya dengan proses kehadiran Masjid Al-Akbar Surabaya. Perencanaan itu, percepatan itu, strategi itu, keinginan itu, semua harus tunduk pada perjalanan yang telah ditentukan.\r\n\r\nKubah\r\nSalah satu daya tarik Masjid Al-Akbar Surabaya, adalah keberadaan kubah masjid yang nampak berbeda dari bentuk dan warna kubah masjid umum yang ada di Indonesia. Perbedaan warna dan sistem rancangan kubah itu dikarenakan memang dalam proses pembangunan Masjid Al-Akbar Surabaya dipergunakan sebuah teknologi baru yang jarang dipergunakan dalam proses pembangunan masjid di Indonesia.\r\n\r\nSebagai langkah awal pembangunan kubah, panitia pelaksana pembangunan menjalin kerjasama dengan PT. Binatama Akrindo yang memiliki spesialisasi produk Tridome Space Structure sebagai suatu struktur atap untuk kubah utama, dengan bentuk yang sangat unik.\r\n\r\nKeunikan bentuk kubah ini ditunjang dengan bentuk kubah yang hampir menyerupai setengah telur dengan 1,5 layer memiliki tinggi sekitar 27 meter. Bentuk ini menumpu pada bentuk piramida terpancung dalam 2 layer setinggi kurang lebih 11 meter dengan bentang tumpuan atau diameter 54 m x 54 m.\r\n\r\nPertemuan antara bentuk lengkung dan bidang datar ini menyebabkan tingkat kesulitan yang lebih rumit antara lain karena kemungkinan penutunan struktur yang lebih besar. Walaupun demikian, persoalan itu bisa diatasi karena ditanganni oleh tim profesional yang disertai dengan program-program CAD/CAE/CAM dan FABRIC yang menghasilkan analisa struktur dan hasil produksi dengan ketelitian dan ketepatan yang dapat dipertanggungjawabkan.\r\n\r\nKetepatan perhitungan dimensi-dimensi simpul dari bola baja padat dalam penyebaran gaya-gaya batangnya menunjang penampilan yang khas dan memberikan hasil yang sangat indah.\r\n\r\nKetepatan waktu untuk merangkai dan memasang komponen-komponen struktur di lapangan dimungkinkan oleh adanya disiplin kerja dan pengalaman dari tim pelaksana di lapangan. Pelaksanaan ini ditunjang oleh peralatan-peralatan canggih, menara-menara bantu khusus dan dengan bantuan mesin-mesin khusus serta tower crane.\r\n\r\nDari keseluruhan sistem kerja itu, akhirnya didapat sebuah hasil kerja yang sangat kokoh, unik dan indah. Sebuah space frame yang anggun, yang bisa membuat bangunan Masjid Al-Akbar Surabaya nampak teduh, luas dan nyaman. Sebuah teknologi yang menjawab keinginan banyak kalangan, agar masjid bisa tampil utuh, tidak terlalu diganggu tiang-tiang yang seringkali merusak pemandangan.\r\n\r\nSetelah persoalan penyangga bangunan kubah telah terjawab, muncul kemudian sebuah pertanyaan tentang teknologi apa yang akan dipergunakan sebagai penutup bangunan kubah yang besar dan agung.\r\n\r\nDari berbagai diskusi dan pencarian literatur, ditemukanlah sebuah produk yang sempat dipergunakan oleh beberapa masjid raya seperti Masjid Raya Selangor di Syah Alam. Secara spesifik, produk yang dipergunakan itu ialah berupa suatu sistem penutup atap yang terdiri dari dua lapisan penutup atap. Yang pertama adalah suaru Atap Kedap Air (AKA) dalam bentuk segmen-segmen yang menumpu pada konstruksi space frame yang ada dibawahnya. Sedangkan lapisan kedua adalah berupa panel dari bahan baja yang bersifat sangat kuat dan tahan lama yang disebut dengan Enamel Steel Panel (ESP).\r\n\r\nSetelah kebutuhan penutup kubah terjawab, maka sebagai produk yang tergolong baru dilakukanlah kemudian suatu proses desain dan perencanaan yang matang, pra produksi, produksi secara utuh serta penentuan metode pemasangan yang tepat. Semua itu harus terencana secara baik sejak awal hingga akhir. Pekerjaan lain yang dibutuhkan untuk melengkapi pekerjaan kubah ini ialah dengan memasang plafon dibawah struktur baja space frame untuk menambah kualitas peredaman suara serta memberi nilai tambah pada segi estetis atau keindahan.\r\n\r\nUntuk proses pengerjaan penutup kubah ini, panitia pelaksana mempercayakan pengerjaaannya kepada PT. Tridome Indonesia Engineering, yang bekerja sama dengan PT. Sangasri Candraditya sebagai pemasuk Enamel Steel Panel (ESP). Sedangkan bahan-bahan yang lain seperti profil baja, plat tekuk, bahan-bahan chemical seperti resin, gel-coat, polyuretahane, mat, woven roofing, epoxy, dan pigmen warna, yang kebanyakan merupakan bahan-bahan import diperoleh dari berbagai pemasok wilayah lokal serta pabrikan langsung.\r\n\r\nUkiran dan Kaligrafi\r\nSalah satu keunggulan corak Masjid Al-Akbar Surabaya, yang hampir memiliki kesamaan dengan corak masjid lain di Indonesia, ialah menonjolnya corak ukiran dan kaligrafi yang menghiasi berbagai elemen di Masjid Al-Akbar Surabaya. Hanya saja, mungkin yang agak berbeda adalah dari segi jumlah. Karena memang dalam pembangunan Masjid Al-Akbar Surabaya, banyak sekali dimunculkan ornamen ukir dan kaligrafi sebagai pelengkap struktur utama masjid.\r\n\r\nSecara umum, kondisi ini hampir sama dengan bentuk ornamen interior masjid jaman dahulu. Dimana bentuk ukiran dan kaligrafi banyak sekali menjadi penghias masjid-masjid besar di tanah air. Beberapa bagian yang umumnya dihiasi dengan ukiran dan kaligrafi adalah pintu, hiasan dinding di atas yang sering di ukir dengan kaligrafi, podium, dan beberapa elemen yang sering kali menghiasi masjid-masjid tempo dulu.\r\n\r\nDi Masjid Al-Akbar Surabaya sendiri, ada beragam bentuk ukiran dan kaligrafi yang dengan mudah bisa disaksikan. Begitu hendak memasuki masjid saja, pengunjung telah disambut oleh 45 pintu ukir dari kayu jati. Di serambi ada pula bedug besar yang memiliko ciri khas karena diukir khusus. Begitu pula dengan kentongan yang juga diletakkan di serambi depan masjid.\r\n\r\nBegitu memasuki masjid, pengunjung akan disuguhi oleh ornamen ukir dan kaligrafi yang sangat dominan menguasai dinding-dinding masjid. Di mihrab, di relung imam, dan di dinding-dinding utama, di tempat-tempat rak Al-Qur’an yang tersebar di seluruh penjuru masjid, ukiran-ukiran bernuansa khas indonesia menghiasi dengan cantik dan anggun. Pun di ornamen atas yang penuh dengan kaligrafi Al-Qur’an sepanjang 180 meter dengan lebar 1 meter. Semua elemen ukir dan kaligrafi itu menambah keagungan dan keteduhan Masjid Al-Akbar Surabaya.\r\n\r\nListrik dan Elemen Arsitektur\r\nKeindahan masjid, adalah salah satu sentuhan yang menjadi perhatian penting dalam proses pembangunan Masjid Al-Akbar Surabaya. Karena itu, pemilihan produk pendukung masjid menjadi perhatian yang tak kalah penting dibanding dengan proses pengadaan atau pembangunan dalam bidang yang lain. Dukungan keindahan dalam hal penerangan Masjid Al-Akbar Surabaya, dipenuhi panitia pembangunan masjid bekerjasama dengan PT. Philips Ralin Electronics. Perusahaan ini, dengan membawa bendera besar Philips menata seluruh kebutuhan penerangan, dari kebutuhan penerangan dalam gedung, halaman, taman, hingga lampu yang menerangi kubah dan menara.\r\n\r\nKarena kelengkapan dan kemutakhiran teknologi yang dipergunakan dalam hal penerangan itulah, maka sebenarnya yang menjadi salah satu titik keindahan Masjid Al-Akbar Surabaya, adalah ketika malam hari jika seluruh tata lampu yang dimiliki dinyalakan secara menyeluruh. Hal ini karena penerangan Masjid Al-Akbar Surabaya, secara teknis memang telah ditata untuk bisa menjadi pemandangan yang indah dan menyejukkan ketika malam hari.\r\n\r\nElemen penunjang keindahan yang lain, adalah adanya berbagai elemen interior seperti hiasan kaca patri, yang telah lama tidak dipergunakan oleh masyarakat secara umum. Padahal, kaca ukir seni ini menjadi suatu kekuatan dan keindahan tersendiri di bidang eksterior dan interior.\r\n\r\nHiasan kaca patri yang dipergunakan untuk elemen penunjang pembangunan Masjid Al-Akbar Surabaya, dibuat dengan sistem Triple Glazed Unit. Yaitu pelapisan panel kaca patri atau panel bevel dengan kaca tempered dengan menggunakan bahan dan mesin-mesin buatan Amerika. Triple Glazed Unit ini selain bermanfaat menghemat energi, juga sangat baik untuk keperluan peredam suara bising.\r\n\r\nPada jaman dahulu, dalam pembangunan masjid-masjid kuno, hiasan sejenis ini memang telah dipergunakan. Hanya saja, mungkin dari segi teknologi dan kualitas jauh dibawah dari kualitas produk saat ini. Hanya saja, dari segi corak, motif dan keindahan, kadang memiliki kekuatan yang sama. Bahkan bisa jadi, kualitas produk jaman dahulu lebih bagus dari produk jaman sekarang.\r\n\r\nPewarnaan\r\nUntuk mengakhiri proses pembangunan Masjid Al-Akbar Surabaya, kontraktor bersama panitia menghadirkan sentuhan terakhir dengan melakukan pengecatan dan finishing bekerjasama dengan PT. Suryadhipa Chemicont.\r\n\r\nDalam menjalankan proses finishing ini, dipergunakan sentuhan warna elegan yang bisa memberikan aroma kesejukan bagi Masjid Al-Akbar Surabaya. Semua titik diberi warna yang serasi, dengan dominasi warna cerah. Hasilnya, dari segala sudut, Masjid Al-Akbar Surabaya nampak anggun, tenang dan nyaman. Sebuah kondisi yang dibutuhkan untuk menemukan titik konsentrasi ketika menghadap ke Illahi Robbi.\r\nWarna-warna cerah yang anggun ini, secara umum sama dengan kondisi pewarnaan pada masjid-masjid jaman dahulu. Kalu toh ada perbedaan, mungkin hanya sekedar pada tataran selera dan kemajuan teknologi.\r\n\r\nTapi yang jelas, walaupun perbedaan yang ada hanya beberapa, namun dengan sentuhan teknologi mutakhir dan dengan penggarapan finishing yang sempurnanya, Masjid Al-Akbar Surabaya nampak lebih agung, tenang dan membuat orang betah untuk tinggal berlama-lama menjalankan aktifitas perjalanan rohani didalamnya.\r\n\r\nLantai\r\nLantai sebagai salah media yang berhubungan langsung dengan jamaah yang sholat di Masjid Al-Akbar Surabaya, perlu dikondisikan untuk bisa memiliki kualitas yang bagus dan bisa bertahan lama. Karena itu, pemilihan bahan untuk lantai, baik dari segi warna, kualitas dan harga, perlu dilakukan dengan cermat dan matang.\r\n\r\nDan karenanya, mungkin tidak banyak oerang yang mengira, bahwa untuk memenuhi pengadaan lantai Masjid Al-Akbar Surabaya, panitia pembangunan proyek masjid harus mendatangakan langsung marmer dengan kualitas pilihan dari perbukitan di propinsi Lampung.\r\n\r\nMemang ada beberapa alasan mengapa dipilih marmer yang berasal dari Lampung, yang notabene lokasi pengambilannya lebih jauh dan mungkin membutuhkan biaya tranportasi yang lebih mahal. Dan menentukan itu, panitia pembangunan menyempatkan diri meninjau langsung ke pusat penggalian dan pengolahan marmer di Lampung sana. Dari serangkaian kajian yang dalam, akhirnya tim pembangunan memutuskan menggunakan marmer lampung karena ternyata kualitas lebih bagus dan harga sangat murah. Kalau di total, seluruh pengeluaran yang dibutuhkan untuk mendatangkan marmer Lampung tersebut jauh lebih rendah dibanding dengan jika kita mengambil produk lokal yang memiliki kualitas setara.\r\n\r\nSelain faktor harga dan kualitas, sentuhan pemilihan warna marmer juga menjadi salah satu landasan mengapa memilih marmer Lampung. Marmer dari perbukitan Lampung memiliki jumlah yang relatih banyak untuk bisa memenuhi selera warna sesuai kebutuhan untuk membangun Masjid Al-Akbar Surabaya. Karena itu, dengan memilih marmer yang memiliki lokasi asal dari pertambangan di Lampung, maka panitia pembangungan bisa leluasa menentukan titik-titik warna sesuai dengan kebutuhan. Dan keinginan untuk bisa menghadirkan warna-warna yang sejuk, damai, tenang dan nyaman di Masjid Al-Akbar Surabaya bisa dengan mudah direalisasikan.', '', 'y'),
(2, 'Tentang-Masjid', 'Tentang Masjid', 'Masjid adalah rumah ibadah umat muslim. Masjid bermakna tempat sujud, sebuah ekspresi pengakuan manusia terhadap kebesaran Allah SWT sekaligus pengakuan betapa kecil manusia dihadapan-Nya.\r\n\r\nIbadah yang di masjid tidak hanya shalat. Maknanya juga menembus pendidikan dan ibadah sosial lain. Tidak heran bangunan masjid bukan sekedar ruang utama shalat dan tempat wudhu, tetapi juga tempat pendidikan Islam, perpustakaan, dan ruang pertemuan multifungsi. Tak pelak, dalam sejarah dan perkembangan Islam, masjid berperan penting dalam aktivitas sosial kemasyarakatan.\r\n\r\nMasjid Al Akbar Surabaya (MAS) menjadi salah satu potret sosok masjid yang menjadi pilar aktivitas sosial. Masjid itu menjadi masjid terbesar di Indonesia, yang mendampingi sekaligus melengkapi masjid yang dimiliki Indonesia sebelumnya, Masjid Istiqlal Jakarta. Masjid Al Akbar berdiri di atas lahan seluas 11.2 hektar dan mulai dibangun pada 4 Agustus 1995-ditandai peletakan batu pertama oleh wakil presiden Try Sutrisno. Pada 20 November 2000 masjid itu diresmikan Presiden KH Abdurrahman Wahid dan mampu menampung 30.000 jama’ah. Pemilihan 10 November sebagai hari peresmian karena merupakan identitas hari jadi Kota Surabaya sekaligus Hari Pahlawan. Selain itu, pemilihan waktuperesmian tersebut juga dibarengkan dengan hari jadi Institut Teknologi Sepuluh Nopember (ITS) Surabaya. Tim dari ITS merancang bangunan masjid tersebut.\r\n\r\nBagian khas masjid itu adalah atap yang terdiri dari sebuah kubah besar yang didukung empat kubah kecil berbentuk limasan. Kelima kubah ini menandakan angka lima yang identik dengan rukun Islam. Selain kubah, masjid itu juga dilengkapi sebuah menara setinggi 99 meter. Angka ini merepresentasikan 99 nama dari Allah SWT ( Asmaul Husna). Awalnya masjid itu akan dilengkapi tujuh menara. Namun karena terbentur krisis ekonomi pada 1997, hanya satu menara yang kini berdiri kokoh di sudut utara MAS.[/vc_column_text][vc_empty_space][/vc_column_inner][/vc_row_inner][vc_row_inner css=”.vc_custom_1487071596504{margin-top: -150px !important;}”][vc_column_inner width=”1/2″][vc_tta_tabs color=”green” active_section=”1″ layout=”modern” stretch=”1″][vc_tta_section title=”Pintu” tab_id=”1487055219444-01c184fa-3b74″][vc_column_text]Masjid memiliki 45 pintu. Tiap pintu terdiri dari dua daun pintu. Praktis masjid ini memiliki 90 daun pintu. Setiap pintu diukir dan dibuat dari kayu jati, masing-masing memiliki lebar 1.5 meter dan tinggi 4.5 meter dengan berat mencapai 250 kilogram. Kusen terbuat dari rangka besi lapis kayu yang dihubungkan ke engsel maupun slot yang telah diselaraskan dengan struktur dan estetika masjid.[/vc_column_text][/vc_tta_section][vc_tta_section title=”Bedug” tab_id=”1487055219525-9d45b167-8d31″][vc_column_text]Di serambi masjid terdapat sebuah bedug dan kentongan yang diukir secara khusus.[/vc_column_text][/vc_tta_section][vc_tta_section title=”Kolom” tab_id=”1487055946025-744c25a3-f05a”][vc_column_text]Kolom masjid berbentuk sentrifugal (bulat) berdiameter 110 cm, 70 cm, dan 60 cm.[/vc_column_text][/vc_tta_section][vc_tta_section title=”Mimbar” tab_id=”1487055972780-a9e25796-90d7″][vc_column_text]Mimbar masjid setinggi 3 meter untuk mendukung kemantapan khutbah dengan sentuhan etnis dan hiasan ornamen Madura. Mimbar ini khusus dipesan dan dikerjakan perajin Madura.[/vc_column_text][/vc_tta_section][vc_tta_section title=”Dinding” tab_id=”1487057010472-3511ab8f-a5f8″][vc_column_text]Ornamen ukir dan kaligrafi sangat dominan menghiasi dinding masjid.[/vc_column_text][/vc_tta_section][vc_tta_section title=”Kaligrafi” tab_id=”1487057010581-9f82cca6-8260″][vc_column_text]Di bagian atas masjid, tepatnya di bagian dalam kubah masjid, terdapat ornamen kaligrafi Alqur’an dengan panjang 180 meter dan lebar 1 meter.[/vc_column_text][/vc_tta_section][/vc_tta_tabs][vc_tta_tabs color=”green” active_section=”1″ layout=”modern” stretch=”1″][vc_tta_section title=”Rak Al-Qur’an” tab_id=”1487057010701-47601a8f-450e”][vc_column_text]Di mihrab, relung imam, dan dinding utama ditempatkan rak Alqur’an berukiran anggung dan indah di semua penjuru masjid.[/vc_column_text][/vc_tta_section][vc_tta_section title=”Menara” tab_id=”1487057010827-37856ae5-4056″][vc_column_text]Di mihrab, relung imam, dan dinding utama ditempatkan rak Alqur’an berukiran anggung dan indah di semua penjuru masjid.[/vc_column_text][/vc_tta_section][vc_tta_section title=”Kubah” tab_id=”1487068817711-868912d9-be4a”][vc_column_text]Bentuk kubah mirip setengah telur dengan 1.5 pelapis yang memiliki ketinggian 27 meter yang menumpu pada bentuk piramida terpancung dalam 2 lapisan setinggi 11 meter dengan bentang tumpuan atau diameter 54 meterx54 meter. Penutup kubah memakai pelat baja yang diwarnai lalu dipanaskan hingga 800 derajat celcius (“enamel sheet panel”) yang diharapkan mampu berfungsi 50 tahun lebih. Pelat baja yang sama juga dipakai di beberapa masjid raya, seperti Masjid raya Selangor di Syah Alam, Malaysia.[/vc_column_text][/vc_tta_section][vc_tta_section title=”Lantai” tab_id=”1487068817831-c7109089-806c”][vc_column_text]Lantai masjid berupa marmer dengan kualitas pilihan dari perbukitan di Provinsi Lampung. Lantai dirancang dengan ketinggian 3 meter dari permukaan laut.[/vc_column_text][/vc_tta_section][vc_tta_section title=”Halaman” tab_id=”1487068817953-670a385e-5a13″][vc_column_text]Plaza dibangun dengan konsep kesatuan antara estetika lingkungan dan fungsi plaza sebagai lapangan ibadah tertentu, seperti Shalat Ied. Luas Plaza lebih dari 520 meter persegi dengan bahan lantai “paving stone”[/vc_column_text][/vc_tta_section][/vc_tta_tabs][/vc_column_inner][vc_column_inner width=”1/2″][vc_tta_accordion style=”modern” color=”green” active_section=”1″ toggle=”1″][vc_tta_section title=”MAS sebagai Benteng Moral Agama” tab_id=”1487052874855-0f681bc5-4b34″][vc_column_text]\r\n\r\nUmat Islam sebagai komponen bangsa terbesar dalam bangsa yang puralistik ini memikul tanggung jawab besar dalam membangun Sumber Daya Manusia berkualitas, karena penguasaan teknologi tanpa akhlak bisa justru membahayakan kehidupan manusia.\r\n\r\nKeprihatinan bangsa Indonesia yang paling mendalam akhir ini adalah kemerosotan akhlak remaja dalam aneka bentuknya seperti kekerasan, minum minuman keras, tawuran, seks bebas, dan tidak jarang kriminal. Keadaan ini diperparah dengan semakin maraknya penggunaan narkoba.\r\n\r\nAgama dalam kondisi seperti ini bisa menawarkan jalan alternative atau setidaknya membendung kebobrokan akhlak yang melanda remaja. Maka pendidikan agama menjadi kebutuhan yang teramat mendesak.\r\n\r\n[/vc_column_text][/vc_tta_section][vc_tta_section title=”MAS sebagai Pusat Pendidikan Islami” tab_id=”1487052874925-42f62254-4bf5″][vc_column_text]\r\n\r\nPesantren dan madrasah yang bertebaran di seluruh Jawa Timur saat ini, diharapkan untuk tidak sekedar mengajarkan ritual dan formalitas agama, tapi pengalaman moralitas agama. Setiap perbuatan baik sekecil apa pun seperti senyum, ramah kepada tetangga adalah ibadah menurut Islam. Maka pendidikan agama bukanlah sekedar menutupi wajah dengan jilbab. Berhasilnya pendidikan agama perlu didukung oleh banyak factor, seperti :fasilitas pendidikan yang lebih proposional, system pendidikan yang efektif serta kualitas dan keteladanan guru agama.\r\n\r\nMasalah penting yang dihadapi sekolah-sekolah agama dewasa ini ádalah bagaimana mengantisipasi perkembangan teknologi. Berhasilnya modernisasi pendidikan perlu didukung oleh banyak factor, seperti fasilitas pendidikan yang lebih proporsional, sistem pendidikan efektif, serta kualitas dan keteladanan guru agama.\r\nOleh karena itu unsur sistem pendidikan, perlengkapan pendidikan seperti ruang relajar, perangkat keras dan lunak, laboratorium, perpustakaan, sarana olah raga dan sebagainya menjadi kebutuhan yang teramat mendesak. Dalam hal ini masjid-masjid agung sebagai sentra Islami (Islamic Center), bersama organisasi keagamaan yang lain dapat memberikan kontribusi penting bagi pendidikan agama.\r\n\r\n[/vc_column_text][/vc_tta_section][vc_tta_section title=”MAS sebagai Pusat Kajian Syi’ar Islam” tab_id=”1487053376436-ffce7edd-f3f5″][vc_column_text]\r\n\r\nMeski mengemban misi yang sama, setiap masjid besar memiliki ciri khas tertentu yang menyebabkannya menonjol dalam hal berbeda. Masjid Salman Bandung misalnya dikenal luas karena keberhasilan lembaganya dalam pembinaan ummat.\r\n\r\nWalau secara fisik bangunan masjid cukup besar, dunia Islam lebih mengenalnya sebagai pusat syi’ar Islam. Masjid Salman Bandung memiliki program kaderisasi santri yang mengutamakan pengembangan bakat kepemimpinan (leadership) untuk tujuan dakwah maupun organisasi. Program ini telah banyak menghasilkan santri intelektual yang memberikan konstribusi penting bagi upaya syi’ar baik di Masjid Salman maupun lingkungan ummat lainnya.\r\n\r\nKeberhasilan Masjid Salman telah menjadi acuan dan sumber inspirasi bagi masjid-masjid lain dalam meningkatkan syi’ar agama.\r\n\r\n[/vc_column_text][/vc_tta_section][vc_tta_section title=”MAS sebagai Pusat Kebudayaan Islami” tab_id=”1487053405450-be8d33f2-57f0″][vc_column_text]\r\n\r\nDengan kreativitas takmir Masjid, usaha memakmurkan masjid menjadi sangat beragam dan kaya dengan sentuhan warna lokal, salah satu faktor penyebab keragaman itu adalah budaya lokal. Kegiatan memakmurkan masjid di Masjid Agung Demak, Masjid Amper atau Masjid Kembang Kuning Surabaya misalnya, berbeda latar sosial budanya dengan Masjid Salman Bandung atau Masjid Al Azhar Yakarta.\r\n\r\nAneka bentuk kesenian bernafaskan Islam seperti qasidahan, terbangan, samrah dan lain-lain tentunya tak lepas dari pesan masjid sebagai pusat syi’ar agama. Demikian pula tradisi Sekaten memperingati kelahiran Nabi Muhammad SAW yang dikenal di Yogjakarta dan Surakarta, meski berbasis di Keraton juga bagian dari budaya lokal yang dimotori semangat Islami. Beberapa masjid yang dibangun oleh Muslim Tionghoa dengan sentuhan arsitektur Tiongkoknya, merupakan bentuk akulturisasi Arab, Cina dan Melayu yang memperkaya wajah budaya masjid di Indonesia. Namur di masjid tertentu lanilla seperti Masjid Al Azhar dan Asyafi’ah Jakarta, warna kulturnya lebih mengandalkan pada kekayaan literatur sebagai khasanah Islam di Indonesia.\r\n\r\n[/vc_column_text][/vc_tta_section][vc_tta_section title=”MAS sebagai Pusat Wisata Religi” tab_id=”1487053426452-a8d9096f-fc53″][vc_column_text]\r\n\r\nBeberapa masjid penting di dunia, seperti Masjid Aqsha di Yerusalem, Masjid Nabawi di Madinah karena latar historisnya, menampilkan dimensi lain dalam kehadirannya Wisata Religi.\r\n\r\nDi Indonesia beberapa masjid menjadi pusat perhatian jamaah bahkan dari tempat-tempat jauh karena keunikannya baik yang menyangkut aspek historis maupun cultural, seperti misalnya Masjid Demak yang didirikan oleh Wali Songo pada tahun 887 H (bertepatan dengan tahun 1338 saka atau 1466 Masehi) merupakan monumen penyebaran Islam di Jawa abad 14 Masehi. Jamaah berdatangan dari tempat jauh khusus untuk menelusuri jejak-jejak Sembilan Wali dalam kiprahnya menyebarkan agama Islam waktu itu.\r\n\r\nMasjid Ampel yang didirikan oleh Sunan Amper di Surabaya dan Masjid Sunan Gunung Jati di Cirebon, lepas dari aspek arahnya (yang dikecam sebagai perbuatan syirik) merupakan magnet wisata yang tak kalah kuatnya bagi pengunjung yang melakukan wisata religi.\r\n\r\n[/vc_column_text][/vc_tta_section][vc_tta_section title=”MAS sebagai Pusat Layanan Kesehatan Masyarakat” tab_id=”1487053457482-a18b7aab-4e88″][vc_column_text]\r\n\r\nMensejahterakan ummat dengan cara memfungsikan Masjid sebagai Pusat Kesehatan, bukanlah merupakan gagasan baru. Kegiatan seperti ini dapat kita jumpai misalnya di Masjid Al Kamal Jakarta. Di Al Kamal rumah sakit, masjid dan Istitut Teknologi berada dalam satu kompleks, bahkan berdampingan dengan kompleks itu terdapat tempat pemakaman umum. Sebaliknya di komplek Rumah Sakit Islam Cempaka Putih Jakarta, fasilitas pelayanan kesehatan tidak menjadi bagian dari masjid namun hadir sebagai unit mandiri yang berdekatan dengan masjid.\r\n\r\nDemikian besarnya skala sebuah rumah sakit menurut stándar abad modern ini, sehingga keberadaannya membutuhkan bidang tanah sendiri yang amat luas, fasilitas pelayanan kesehatan seperti rumah sakit, poliklinik, puskesmas dan lain-lain merupakan kebutuhan vital ummat walau tidak selalu harus dikaitkan dengan fungsi masjid.\r\n\r\nYang masih mungkin untuk dipertimbangkan adalah mengoperasikan sentra pelayanan kesehatan di masjid pada tingkat pukesmas atau poliklinik khususnya di pedesaan.\r\n\r\n[/vc_column_text][/vc_tta_section][vc_tta_section title=”MAS sebagai Pusat Dakwah Muslimah” tab_id=”1487053491178-f491cfdc-9e7b”][vc_column_text]\r\n\r\nWalau Islam tidak menganjurkan wanita untuk sholat di masjid, kehadiran wanita di masjid seringkali tidak bisa dihindari karena berbagai alasan seperti wanita sedang musafir atau menemani suami dalam perjalanan. Kontroversi tentang boleh tidaknya perempuan sholat di masjid telah berlangsung sejak masa Rasulullah SAW ketika Sayidian Ali berbeda pendapat dengan Aisyah yang berbuntut Perang Onta antara keduanya hingga menewaskan 6.000 prajurit.\r\n\r\nDi Indonesia, karena sebagian besar ummat adalah dari mazhab Syafiie, sholat Jum’at umummya hanya di hadiri muslim. Di dunia Islam yang modern dan dinamis di Jawa Timur, muslimah yang berstatus mahasiswi atau karyawati bergerak dengan mobilitas tinggi hingga tidak selalu bisa sholat di rumah.\r\n\r\nMadrasah atau pesantren yang sebagian siswanya adalah perempuan membutuhkan tempat beribadat secara kolektif bagi muslimah, walau harus dipisahkan dari lawan jenis dengan tabir. Saat Ibadan haji, Masjidil Haram di Meca terbuka bagi muslimin maupun muslimah', '526art_17112021111444.png', 'y'),
(3, 'Struktur-Organisasi', 'Struktur Organisasi', 'Struktur Organisasi', '241art_12062022101552.png', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `id_slider` int(11) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL,
  `images` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`id_slider`, `judul`, `deskripsi`, `images`) VALUES
(1, 'MASJID BAITUL MUKMININ', 'Jombang - Jawa Timur', '615file_23112021173740.jpeg'),
(2, 'MASJID BAITUL MUKMININ', 'Jombang - Jawa Timur', '509file_23112021173648.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `tema`
--

CREATE TABLE `tema` (
  `id_tema` int(11) NOT NULL,
  `navbar_bg_color` varchar(100) NOT NULL,
  `navbar_font_color` varchar(100) NOT NULL,
  `sidebar_bg_color` varchar(50) NOT NULL,
  `sidebar_font_color` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tema`
--

INSERT INTO `tema` (`id_tema`, `navbar_bg_color`, `navbar_font_color`, `sidebar_bg_color`, `sidebar_font_color`) VALUES
(1, 'green', 'dark', 'light', 'green');

-- --------------------------------------------------------

--
-- Table structure for table `t_buletin`
--

CREATE TABLE `t_buletin` (
  `id_buletin` int(11) NOT NULL,
  `judul_b` varchar(1000) NOT NULL,
  `id_user` int(11) NOT NULL,
  `artikel` text NOT NULL,
  `cover_gambar` varchar(1000) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `id_kate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_buletin`
--

INSERT INTO `t_buletin` (`id_buletin`, `judul_b`, `id_user`, `artikel`, `cover_gambar`, `date`, `time`, `id_kate`) VALUES
(1, 'ahlak', 1, 'd adafasf asfasfas fa', '286bulet_17112021110826.jpeg', '2021-11-17', '11:08:19', 1),
(2, 'ahlak', 1, 'cacas', 'default.png', '2021-11-17', '11:09:00', 1),
(3, 'mama', 1, 'csac', '503bulet_17112021110411.png', '2021-11-17', '11:03:07', 1),
(4, 'Cu Pita Kaset, Kini Lewat Youtube dan IG', 1, 'Sejak Tahun 2001, Masjid Al Akbar merekam aktifitas dakwah menggunakan pita kaset untuk arsip dan diputar ulang sesuai kebutuhan.\r\n\r\n10 tahun kemudian, Masjid Al Akbar mulai memanfaatkan teknologi visual dan SMS Centre untuk media dakwah.\r\n\r\n“Alhamdulillah, 1 Oktober 2010 kami membeli mesin aplikasi SMS Center untuk info-info kegiatan kepada para jemaah. Saat itu, lagi booming teknologi SMS blast. Alhamdulillah mesin itu sekarang sudah nggak terpakai,” ungkap Sekretaris Badan Pelaksana Pengelola (BPP) Masjid Nasional Al Akbar Surabaya, H. M Helmy M Noor dalam webinar ‘Tips Dakwah Digital Berbasis Masjid’, Sabtu (2/10/2021).\r\n\r\nSepuluh tahun berselang, 2010 masuk pada era Android. Media komunikasi masjid Al Akbar beralih ke WhatsApp (WA) grup yang ternyata lebih interaktif dan murah. “Proses terus berjalan mulai tahun 2001 itu sampai sekarang terus berbenah,” kata Helmy.\r\n\r\nKini masjid terbesar di Surabaya itu telah sukses merambah ke website dan kanal media sosial seperti Facebook, Instagram, dan Youtube. “Al-akbar sekarang sudah membiasakan siaran langsung salat Jumat. Jadi langsung disiarkan lewat Youtube,” ujarnya.\r\n\r\nBegitu jemaah pulang ke rumah, lanjut Helmy, dan masih penasaran dengan pesan khutbah tadi tinggal buka gawainya dan memutar ulang ceramah tadi. “Bagi jemaah mereka bisa ikut mendalami bagaimana materi khutbah Jumat. Bagi khotib manfaatnya adalah review ulang dan persiapan yang lebih matang,” paparnya.\r\n\r\nLebih dari itu materi dakwah digital juga dapat dimanfaatkan untuk berbagai macam keperluan, seperti menjadi sarana untuk mengajak masyarakat berinfaq, zakat, atau sedekah. Apalagi sekarang sudah ada QR code-nya. Orang nggak perlu repot-repot, tinggal tempel,”\r\n\r\nDengan begitu berbagai macam program, contohnya bersama dengan Baznas atau sinergitas dengan masjid lain atau lembaga apapun dapat dilakukan lewat dakwah digital ini.\r\n\r\nInteraksi Jamaah Tetap Diperlukan\r\nSementara itu Pakar Komunikasi Universitas Airlangga Surabaya, Dr Suko Widodo, M.Si yang menjadi pemateri dalam webinar kali ini menyampaikan sejumlah catatannya.\r\n“Pertama, semaju-majunya digital jangan sampai menghadirkan perjumpaan saja. Masjid ini harus menjadi tempat pertemuan. Perjumpaan bisa dilakukan di mana saja sementara pertemuan harus secara langsung,” kata Suko.\r\n\r\nArtinya, dakwah digital tidak meninggalkan ‘The Power of Community’. Bagaimana membangun komunikasi, silaturahmi antara komunikator (pengurus masjid) dengan komunikan (jemaahnya).\r\n\r\n“Bagaimanapun dakwah digital merupakan suatu kemajuan. Tapi saya kira interaksi itu tetap penting. Kalau digital itu bersifat perjumpaan, tapi interaksi itu bersifat pertemuan. Interaksi itulah relasi komunikator-komunikan,” jelasnya.\r\n\r\n“Dakwah digital itu agar viral, meracik yang bermanfaat, bukan justru virologi atau meracuni yang berujung pada kemaksiatan atau dosa,” imbuhnya.\r\n\r\nMaka dari itu, lanjut Suko, perlu adanya Dewan Kurasi yang memahami metode dakwah. Tujuannya agar dakwah digital yang dibuat memiliki nilai-nilai sosial dan tidak menimbulkan masalah atau kontroversial.\r\n\r\n“Saya melihat Dewan Kurasi itu justru penting agar nilai-nilai sosial juga menjadi rujukan, karena dakwah itu juga perlu mengetahui apa yang akan disampaikan, dakwah itu bukan sekadar menyampaikan semua yang kita tahu,” tuturnya.\r\n\r\nUntuk itu webinar ini juga akan ditindaklanjuti dengan pelatihan teknis dan magang di Masjid Nasional Al Akbar Surabaya agar para pengurus masjid mendapatkan pemahaman yang utuh mengenai dakwah digital. (*)', '36bulet_22112021231916.jpeg', '2021-11-23', '00:04:00', 2),
(5, 'Cikal Bakal Dakwah Digital Masjid Al Akbar, Dulu', 1, 'Cikal Bakal Dakwah Digital Masjid Al Akbar, Dulu Pita Kaset, Kini Lewat Youtube dan IG Cikal Bakal Dakwah Digital Masjid Al Akbar, Dulu Pita Kaset, Kini Lewat Youtube dan IG', 'default.png', '2021-11-23', '00:03:51', 2),
(6, 'wah Digital Masjat Youtube dan IG', 1, 'Our Foundation is dedicated to transforming quality education so that all students can acquire and effectively apply the knOur Foundation is dedicated to transforming quality education so that all students can acquire and effectively apply the knowledge, attitudes, and skills.owledge, attitudes, and skills.Every day we bring hope to millions of children in the world’s hardest.', 'default.png', '2021-11-23', '00:26:34', 2);

-- --------------------------------------------------------

--
-- Table structure for table `t_donasi`
--

CREATE TABLE `t_donasi` (
  `id_donasi` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `donatur` varchar(100) NOT NULL,
  `telepon` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `uang` varchar(100) NOT NULL,
  `barang` varchar(100) NOT NULL,
  `ket` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_donasi`
--

INSERT INTO `t_donasi` (`id_donasi`, `id_user`, `donatur`, `telepon`, `alamat`, `uang`, `barang`, `ket`) VALUES
(1, 1, 'pak adi', '5435345', 'jombang', '1000000', '-', 'donasi sukarli'),
(2, 1, 'hamba Alloh', '089676776', 'dsadas', '9000000', 'alat sholat', 'dsadasd'),
(3, 1, 'hamba Alloh', '0437435785', 'dwdw', '9000000', 'alat sholat', 'dscdsc'),
(4, 2, 'hamba Alloh', '5435345', 'xasxasx', '9000000', 'alat sholat', 'xsax'),
(5, 2, 'hamba Alloh', '5435345', 'cdscds', '', 'alat sholat', ''),
(6, 5, 'abdulloh', '08978978', 'Malang', '900000', '', 'untuk perbaikan masjid'),
(8, 6, 'hamba Alloh', '34242', 'fdsfdsfs', '0', 'alat sholat', 'vdsvs');

-- --------------------------------------------------------

--
-- Table structure for table `t_galeri`
--

CREATE TABLE `t_galeri` (
  `id` int(11) NOT NULL,
  `id_pernikahan` int(11) NOT NULL,
  `nama_foto` varchar(128) NOT NULL,
  `judul` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_galeri`
--

INSERT INTO `t_galeri` (`id`, `id_pernikahan`, `nama_foto`, `judul`) VALUES
(1, 1, 'gallery-6.jpg', 'Tempat'),
(2, 1, 'gallery-8.jpg', 'Acara'),
(3, 2, 'gallery-9.jpg', 'Makan Makan');

-- --------------------------------------------------------

--
-- Table structure for table `t_jadwal`
--

CREATE TABLE `t_jadwal` (
  `id_jadwal` int(11) NOT NULL,
  `tgl` date NOT NULL,
  `jam` time NOT NULL,
  `nama_kegiatan` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_jadwal`
--

INSERT INTO `t_jadwal` (`id_jadwal`, `tgl`, `jam`, `nama_kegiatan`, `deskripsi`) VALUES
(1, '2021-11-13', '10:16:00', 'kajian ustadz', 'dasdasdasd');

-- --------------------------------------------------------

--
-- Table structure for table `t_kategori`
--

CREATE TABLE `t_kategori` (
  `id_kate` int(11) NOT NULL,
  `nama_kate` varchar(1000) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_kategori`
--

INSERT INTO `t_kategori` (`id_kate`, `nama_kate`, `status`) VALUES
(1, 'berita', 1),
(2, 'ceramah', 1);

-- --------------------------------------------------------

--
-- Table structure for table `t_keuangan`
--

CREATE TABLE `t_keuangan` (
  `id_keuangan` int(11) NOT NULL,
  `tgl` date NOT NULL,
  `deskprisi` text NOT NULL,
  `jenis` enum('pengeluaran','pemasukan') NOT NULL,
  `total` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_keuangan`
--

INSERT INTO `t_keuangan` (`id_keuangan`, `tgl`, `deskprisi`, `jenis`, `total`) VALUES
(1, '2021-11-13', 'listrik', 'pengeluaran', '900000'),
(2, '2021-11-27', 'ddsf', 'pemasukan', '423432'),
(3, '2021-11-30', 'dasdasdasdasd', 'pemasukan', '42343233');

-- --------------------------------------------------------

--
-- Table structure for table `t_pernikahan`
--

CREATE TABLE `t_pernikahan` (
  `id` int(11) NOT NULL,
  `nama_lengkap_p` varchar(128) NOT NULL,
  `nama_panggilan_p` varchar(128) NOT NULL,
  `nama_lengkap_w` varchar(128) NOT NULL,
  `nama_panggilan_w` varchar(128) NOT NULL,
  `tanggal_pernikahan` date NOT NULL,
  `alamat_pernikahan` text NOT NULL,
  `waktu_mulai` time NOT NULL,
  `waktu_selesai` time NOT NULL,
  `id_user` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_pernikahan`
--

INSERT INTO `t_pernikahan` (`id`, `nama_lengkap_p`, `nama_panggilan_p`, `nama_lengkap_w`, `nama_panggilan_w`, `tanggal_pernikahan`, `alamat_pernikahan`, `waktu_mulai`, `waktu_selesai`, `id_user`, `status`) VALUES
(1, 'Kaqa Zidane Sahri', 'Kokam', 'Siyapah Akuh', 'Gweh', '2022-07-10', 'Jl. Terusan Larwotherhood No.237 Kota Olympus, Kayangan', '19:00:00', '19:00:00', 12, 0),
(2, 'Faisal Ahmad Dani', 'Faisal', 'Siapa tuhh', 'Hayu', '2022-09-12', 'Jl.Ngaglik No. Berapa aja boleh', '00:00:19', '00:00:23', 10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_sholat`
--

CREATE TABLE `t_sholat` (
  `id_sholat` int(11) NOT NULL,
  `waktu_sholat` varchar(100) NOT NULL,
  `hari` varchar(100) NOT NULL,
  `imam` varchar(100) NOT NULL,
  `muadzin` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_sholat`
--

INSERT INTO `t_sholat` (`id_sholat`, `waktu_sholat`, `hari`, `imam`, `muadzin`) VALUES
(1, 'subuh', 'senin', 'ustad', 'tes'),
(2, 'dhuhur', 'selasa', 'ustad', 'tes');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `nokartuidentitas` varchar(30) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `foto` varchar(100) NOT NULL,
  `active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `nokartuidentitas`, `first_name`, `last_name`, `alamat`, `phone`, `foto`, `active`) VALUES
(1, 'admin1', 'e10adc3949ba59abbe56e057f20f883e', 'admin@gmail.com', '', 'Masjid Baitul Mukminin', NULL, '', '083834558876', '1file_17112021111532.png', 1),
(2, 'joni3', 'e10adc3949ba59abbe56e057f20f883e', 'joni@gmail.com', NULL, 'joni', NULL, '', '082139121467', 'default.png', 1),
(3, 'tes1', 'e10adc3949ba59abbe56e057f20f883e', 'tes@gmail.com', NULL, 'tes', NULL, '', '082138483289', 'default.png', 1),
(4, 'ahmed1', 'e10adc3949ba59abbe56e057f20f883e', 'demo@demo.com', NULL, 'ahmed', NULL, NULL, '0822133123123', 'default.png', 1),
(5, 'tes123', 'e10adc3949ba59abbe56e057f20f883e', 'abdullah.m.y.alghamdi@gmail.com', NULL, 'tes', NULL, NULL, '0897763276', 'default.png', 1),
(6, 'rangga123', 'e10adc3949ba59abbe56e057f20f883e', 'vio1@getnada.com', NULL, 'rangga', NULL, NULL, '82139121467', 'default.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_detail`
--

CREATE TABLE `users_detail` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(15) DEFAULT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` datetime DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_detail`
--

INSERT INTO `users_detail` (`id`, `ip_address`, `activation_code`, `forgotten_password_time`, `created_on`, `last_login`) VALUES
(1, '109.109.109.109', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(2, '::1', NULL, NULL, '2021-04-27 12:51:34', NULL),
(3, '::1', NULL, NULL, '2021-06-19 13:40:01', NULL),
(4, '::1', NULL, NULL, '2021-11-28 23:03:22', NULL),
(5, '::1', NULL, NULL, '2021-12-02 19:25:15', NULL),
(6, '::1', NULL, NULL, '2022-05-20 15:09:05', NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_akses`
-- (See below for the actual view)
--
CREATE TABLE `view_akses` (
`id` int(11) unsigned
,`username` varchar(100)
,`first_name` varchar(50)
,`name_level` varchar(64)
,`id_aunt` int(11)
,`id_child` int(11)
,`name` varchar(50)
,`link` varchar(50)
,`deskrip` text
,`icon` varchar(30)
,`is_active` int(1)
,`is_parent` int(1)
,`tipe` enum('menu','link','pager')
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_auth_child`
-- (See below for the actual view)
--
CREATE TABLE `view_auth_child` (
`idc` int(11)
,`parent` varchar(64)
,`child` varchar(64)
,`name` varchar(50)
,`link` varchar(50)
,`deskrip` text
,`icon` varchar(30)
,`is_parent` int(1)
,`is_active` int(1)
,`tipe` enum('menu','link','pager')
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_hk`
-- (See below for the actual view)
--
CREATE TABLE `view_hk` (
`id` int(11) unsigned
,`username` varchar(100)
,`id_assignment` int(11)
,`id_aunt` int(11)
,`item_name` varchar(64)
,`created_at` datetime
,`idc` int(11)
,`child` varchar(64)
);

-- --------------------------------------------------------

--
-- Structure for view `view_akses`
--
DROP TABLE IF EXISTS `view_akses`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_akses`  AS SELECT `users`.`id` AS `id`, `users`.`username` AS `username`, `users`.`first_name` AS `first_name`, `auth_item`.`name` AS `name_level`, `auth_item`.`id_aunt` AS `id_aunt`, `menu`.`id` AS `id_child`, `menu`.`name` AS `name`, `menu`.`link` AS `link`, `menu`.`deskrip` AS `deskrip`, `menu`.`icon` AS `icon`, `menu`.`is_active` AS `is_active`, `menu`.`is_parent` AS `is_parent`, `menu`.`tipe` AS `tipe` FROM ((((`users` join `auth_assignment` on(`users`.`id` = `auth_assignment`.`user_id`)) join `auth_item` on(`auth_item`.`id_aunt` = `auth_assignment`.`id_aunt`)) join `auth_item_child` on(`auth_item`.`id_aunt` = `auth_item_child`.`id_aunt`)) join `menu` on(`menu`.`id` = `auth_item_child`.`child`))  ;

-- --------------------------------------------------------

--
-- Structure for view `view_auth_child`
--
DROP TABLE IF EXISTS `view_auth_child`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_auth_child`  AS SELECT `auth_item_child`.`idc` AS `idc`, `auth_item_child`.`parent` AS `parent`, `auth_item_child`.`child` AS `child`, `menu`.`name` AS `name`, `menu`.`link` AS `link`, `menu`.`deskrip` AS `deskrip`, `menu`.`icon` AS `icon`, `menu`.`is_parent` AS `is_parent`, `menu`.`is_active` AS `is_active`, `menu`.`tipe` AS `tipe` FROM (`auth_item_child` join `menu` on(`menu`.`id` = `auth_item_child`.`child`))  ;

-- --------------------------------------------------------

--
-- Structure for view `view_hk`
--
DROP TABLE IF EXISTS `view_hk`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_hk`  AS SELECT `users`.`id` AS `id`, `users`.`username` AS `username`, `auth_assignment`.`id_assignment` AS `id_assignment`, `auth_assignment`.`id_aunt` AS `id_aunt`, `auth_assignment`.`item_name` AS `item_name`, `auth_assignment`.`created_at` AS `created_at`, `auth_item_child`.`idc` AS `idc`, `auth_item_child`.`child` AS `child` FROM ((`auth_assignment` join `users` on(`users`.`id` = `auth_assignment`.`user_id`)) join `auth_item_child` on(`auth_item_child`.`id_aunt` = `auth_assignment`.`id_aunt`))  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`id_assignment`);

--
-- Indexes for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`id_aunt`);

--
-- Indexes for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`idc`);

--
-- Indexes for table `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`id_info`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`id_page`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id_slider`);

--
-- Indexes for table `tema`
--
ALTER TABLE `tema`
  ADD PRIMARY KEY (`id_tema`);

--
-- Indexes for table `t_buletin`
--
ALTER TABLE `t_buletin`
  ADD PRIMARY KEY (`id_buletin`);

--
-- Indexes for table `t_donasi`
--
ALTER TABLE `t_donasi`
  ADD PRIMARY KEY (`id_donasi`);

--
-- Indexes for table `t_galeri`
--
ALTER TABLE `t_galeri`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_jadwal`
--
ALTER TABLE `t_jadwal`
  ADD PRIMARY KEY (`id_jadwal`);

--
-- Indexes for table `t_kategori`
--
ALTER TABLE `t_kategori`
  ADD PRIMARY KEY (`id_kate`);

--
-- Indexes for table `t_keuangan`
--
ALTER TABLE `t_keuangan`
  ADD PRIMARY KEY (`id_keuangan`);

--
-- Indexes for table `t_pernikahan`
--
ALTER TABLE `t_pernikahan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_sholat`
--
ALTER TABLE `t_sholat`
  ADD PRIMARY KEY (`id_sholat`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_detail`
--
ALTER TABLE `users_detail`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  MODIFY `id_assignment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `auth_item`
--
ALTER TABLE `auth_item`
  MODIFY `id_aunt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  MODIFY `idc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `info`
--
ALTER TABLE `info`
  MODIFY `id_info` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `page`
--
ALTER TABLE `page`
  MODIFY `id_page` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `id_slider` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tema`
--
ALTER TABLE `tema`
  MODIFY `id_tema` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `t_buletin`
--
ALTER TABLE `t_buletin`
  MODIFY `id_buletin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `t_donasi`
--
ALTER TABLE `t_donasi`
  MODIFY `id_donasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `t_galeri`
--
ALTER TABLE `t_galeri`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `t_jadwal`
--
ALTER TABLE `t_jadwal`
  MODIFY `id_jadwal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `t_kategori`
--
ALTER TABLE `t_kategori`
  MODIFY `id_kate` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t_keuangan`
--
ALTER TABLE `t_keuangan`
  MODIFY `id_keuangan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `t_pernikahan`
--
ALTER TABLE `t_pernikahan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t_sholat`
--
ALTER TABLE `t_sholat`
  MODIFY `id_sholat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
