-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 16, 2013 at 09:48 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `rolesystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `tab_diag`
--

CREATE TABLE IF NOT EXISTS `tab_diag` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `diag_id` varchar(6) NOT NULL,
  `diag_hasil` varchar(100) NOT NULL,
  `diag_saran` varchar(100) NOT NULL,
  `kasus_id` varchar(6) NOT NULL,
  `diag_tgl` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tab_diag`
--

INSERT INTO `tab_diag` (`id`, `diag_id`, `diag_hasil`, `diag_saran`, `kasus_id`, `diag_tgl`) VALUES
(1, 'D1', 'Demam Berdarah Akut', 'Segera ke dokter. Pertolongan pertama minum obat.', 'K1', '2013-08-26 00:00:00'),
(2, 'D2', 'Demam berdarah tidak akut', 'Tidur dengan cukup.', 'K1', '2013-08-26 08:47:19');

-- --------------------------------------------------------

--
-- Table structure for table `tab_gejala`
--

CREATE TABLE IF NOT EXISTS `tab_gejala` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `gjl_id` varchar(6) NOT NULL,
  `gjl_tanya` varchar(100) NOT NULL,
  `gjl_desk` text NOT NULL,
  `kasus_id` varchar(6) NOT NULL,
  `gjl_tgl` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tab_gejala`
--

INSERT INTO `tab_gejala` (`id`, `gjl_id`, `gjl_tanya`, `gjl_desk`, `kasus_id`, `gjl_tgl`) VALUES
(1, 'G1', 'Apakah terdapat bintik-bintik merah di sekitar kulit?', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', 'K1', '2013-08-26 00:00:00'),
(2, 'G2', 'Apakah demam terjadi secara mendadak?', '39-40 derajat celcius.', 'K1', '2013-08-26 09:03:53');

-- --------------------------------------------------------

--
-- Table structure for table `tab_kasus`
--

CREATE TABLE IF NOT EXISTS `tab_kasus` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `kasus_id` varchar(11) NOT NULL,
  `kasus_judul` varchar(100) NOT NULL,
  `kasus_desk` text NOT NULL,
  `kasus_tgl` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tab_kasus`
--

INSERT INTO `tab_kasus` (`id`, `kasus_id`, `kasus_judul`, `kasus_desk`, `kasus_tgl`) VALUES
(1, 'K1', 'Demam Berdarah', 'Penyakit demam akut yang disebabkan oleh virus dengue, yang masuk ke peredaran darah manusia melalui gigitan nyamuk dari genus Aedes, misalnya Aedes aegypti atau Aedes albopictus.', '2013-06-20 00:00:00'),
(4, 'K2', 'Batuk Berdahak', 'Batuk Berdahak', '2013-08-26 08:40:15');

-- --------------------------------------------------------

--
-- Table structure for table `tab_role`
--

CREATE TABLE IF NOT EXISTS `tab_role` (
  `role_id` int(6) NOT NULL AUTO_INCREMENT,
  `role_kasus` varchar(11) NOT NULL,
  `role_type` varchar(11) NOT NULL,
  `role_start` tinyint(1) NOT NULL,
  `role_ident` varchar(11) NOT NULL,
  `answer_ident` varchar(2) NOT NULL,
  `role_identnext` varchar(11) NOT NULL,
  `answer_identnext` tinyint(1) NOT NULL,
  `role_tgl` datetime NOT NULL,
  PRIMARY KEY (`role_id`),
  KEY `role_tgl` (`role_tgl`),
  KEY `role_tgl_2` (`role_tgl`),
  KEY `role_tgl_3` (`role_tgl`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tab_role`
--

INSERT INTO `tab_role` (`role_id`, `role_kasus`, `role_type`, `role_start`, `role_ident`, `answer_ident`, `role_identnext`, `answer_identnext`, `role_tgl`) VALUES
(1, 'K1', 'R1A', 1, 'G1', 'A', 'G2', 0, '2013-08-27 00:00:00'),
(2, 'K1', 'R1B', 0, 'G1', 'B', 'D1', 1, '2013-08-27 09:29:19'),
(3, 'K1', 'R3A', 0, 'G2', 'A', 'D1', 1, '2013-08-27 09:31:01');

-- --------------------------------------------------------

--
-- Table structure for table `tab_user`
--

CREATE TABLE IF NOT EXISTS `tab_user` (
  `admin_id` int(5) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(50) NOT NULL,
  `admin_username` varchar(50) NOT NULL,
  `admin_password` varchar(50) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tab_user`
--

INSERT INTO `tab_user` (`admin_id`, `admin_name`, `admin_username`, `admin_password`) VALUES
(1, 'Admin', 'admin', 'admin123');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
