-- phpMyAdmin SQL Dump
-- version 3.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 24, 2013 at 01:10 AM
-- Server version: 5.5.25a
-- PHP Version: 5.4.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_ewsd`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE IF NOT EXISTS `course` (
  `course_id` int(11) NOT NULL,
  `course_code` varchar(8) COLLATE utf8_bin NOT NULL,
  `course_title` varchar(256) COLLATE utf8_bin NOT NULL,
  `course_desc` text COLLATE utf8_bin,
  `course_active` int(11) NOT NULL DEFAULT '1',
  `course_value` int(11) NOT NULL,
  `course_coord` int(11) NOT NULL,
  `course_mod` int(11) NOT NULL,
  PRIMARY KEY (`course_id`),
  UNIQUE KEY `course_code_UNIQUE` (`course_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `courseupload`
--

CREATE TABLE IF NOT EXISTS `courseupload` (
  `courseupload_id` int(11) NOT NULL AUTO_INCREMENT,
  `courseupload_user_id` int(11) DEFAULT NULL,
  `courseupload_coursework_id` int(11) DEFAULT NULL,
  `courseupload_timedate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `courseupload_value` int(11) DEFAULT NULL,
  `courseupload_coord_comment` text COLLATE utf8_bin NOT NULL,
  `courseupload_mod_comment` text COLLATE utf8_bin NOT NULL,
  `courseupload_status` int(11) DEFAULT NULL,
  `courseupload_file` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `courseupload_title` varchar(512) COLLATE utf8_bin NOT NULL,
  `courseupload_desc` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`courseupload_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `coursework`
--

CREATE TABLE IF NOT EXISTS `coursework` (
  `coursework_id` int(11) NOT NULL AUTO_INCREMENT,
  `coursework_title` varchar(256) COLLATE utf8_bin NOT NULL,
  `coursework_value` int(11) NOT NULL,
  `coursework_duedate` date NOT NULL,
  `coursework_releasedate` date NOT NULL,
  `coursework_specupload` int(11) DEFAULT NULL,
  `coursework_status` int(11) NOT NULL,
  `coursework_comment` text COLLATE utf8_bin,
  PRIMARY KEY (`coursework_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `course_coursework_assoc`
--

CREATE TABLE IF NOT EXISTS `course_coursework_assoc` (
  `course_id` int(11) NOT NULL,
  `coursework_id` int(11) NOT NULL,
  PRIMARY KEY (`course_id`,`coursework_id`),
  KEY `coursework_id` (`coursework_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_title` varchar(256) COLLATE utf8_bin NOT NULL,
  `department_manager` int(11) NOT NULL,
  `department_admin` int(11) NOT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `prefix_user`
--

CREATE TABLE IF NOT EXISTS `prefix_user` (
  `prefix_user_id` varchar(2) COLLATE utf8_bin NOT NULL,
  `count` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`prefix_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `staffupload`
--

CREATE TABLE IF NOT EXISTS `staffupload` (
  `staffupload_id` int(11) NOT NULL AUTO_INCREMENT,
  `staffupload_user_id` int(11) NOT NULL,
  `staffupload_coursework_id` int(11) DEFAULT NULL,
  `staffupload_file` varchar(512) COLLATE utf8_bin NOT NULL,
  `staffupload_title` varchar(512) COLLATE utf8_bin NOT NULL,
  `staffupload_desc` text COLLATE utf8_bin,
  PRIMARY KEY (`staffupload_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(32) COLLATE utf8_bin NOT NULL,
  `user_pass` varchar(64) COLLATE utf8_bin NOT NULL,
  `user_fname` varchar(128) COLLATE utf8_bin NOT NULL,
  `user_oname` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `user_lname` varchar(128) COLLATE utf8_bin NOT NULL,
  `user_permission` int(11) NOT NULL DEFAULT '0' COMMENT '0 = Disabled account\n1 -> * = Different account levels',
  `user_year_enrolled` date NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name_UNIQUE` (`user_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=402 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `user_pass`, `user_fname`, `user_oname`, `user_lname`, `user_permission`, `user_year_enrolled`) VALUES
(1, 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'david', NULL, 'smith', 9001, '2013-02-15'),
(202, 'demry', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'deborah', 'm', 'ryan', 1, '0000-00-00'),
(203, 'elsgo', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'elizabeth', 's', 'gonzalez', 1, '0000-00-00'),
(204, 'aladi', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'albert', 'a', 'diaz', 1, '0000-00-00'),
(205, 'jaabu', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'james', 'a', 'bush', 1, '0000-00-00'),
(206, 'capfa', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'carlos', 'p', 'farmer', 1, '0000-00-00'),
(207, 'jarsk', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'james', 'r', 'skeen', 1, '0000-00-00'),
(208, 'frlne', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'frank', 'l', 'newland', 1, '0000-00-00'),
(209, 'labba', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'lawrence', 'b', 'battaglia', 1, '0000-00-00'),
(210, 'nagbe', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'natasha', 'g', 'benson', 1, '0000-00-00'),
(211, 'wisra', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'willie', 's', 'ramirez', 1, '0000-00-00'),
(212, 'jospr', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'john', 's', 'prince', 1, '0000-00-00'),
(213, 'lycpr', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'lynn', 'c', 'price', 1, '0000-00-00'),
(214, 'lirro', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'linda', 'r', 'roper', 1, '0000-00-00'),
(215, 'gimdu', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'gina', 'm', 'durham', 1, '0000-00-00'),
(216, 'eamch', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'earl', 'm', 'chaffins', 1, '0000-00-00'),
(217, 'frbda', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'francisco', 'b', 'daily', 1, '0000-00-00'),
(218, 'jijmo', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'jimmy', 'j', 'montgomery', 1, '0000-00-00'),
(219, 'lidro', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'linda', 'd', 'rogers', 1, '0000-00-00'),
(220, 'nawmo', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'nancy', 'w', 'morin', 1, '0000-00-00'),
(221, 'josha', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'john', 's', 'harris', 1, '0000-00-00'),
(222, 'mejwh', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'melissa', 'j', 'white', 1, '0000-00-00'),
(223, 'raepe', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'randy', 'e', 'peach', 1, '0000-00-00'),
(224, 'clljo', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'clarence', 'l', 'johnson', 1, '0000-00-00'),
(225, 'odmra', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'oda', 'm', 'randazzo', 1, '0000-00-00'),
(226, 'jagpo', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'jacqueline', 'g', 'potter', 1, '0000-00-00'),
(227, 'padta', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'patricia', 'd', 'taber', 1, '0000-00-00'),
(228, 'dotra', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'donald', 't', 'ramos', 1, '0000-00-00'),
(229, 'masbu', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'martha', 's', 'burdine', 1, '0000-00-00'),
(230, 'paeri', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'pamela', 'e', 'rincon', 1, '0000-00-00'),
(231, 'endpr', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'enola', 'd', 'preston', 1, '0000-00-00'),
(232, 'emsgr', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'emmett', 's', 'gray', 1, '0000-00-00'),
(233, 'bijfi', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'bill', 'j', 'fields', 1, '0000-00-00'),
(234, 'degjo', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'denis', 'g', 'jones', 1, '0000-00-00'),
(235, 'lavpe', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'laurel', 'v', 'pearson', 1, '0000-00-00'),
(236, 'arjpe', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'arthur', 'j', 'peterson', 1, '0000-00-00'),
(237, 'jojsa', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'joseph', 'j', 'sapp', 1, '0000-00-00'),
(238, 'wirlo', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'winnie', 'r', 'lorenz', 1, '0000-00-00'),
(239, 'amdro', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'amanda', 'd', 'roberson', 1, '0000-00-00'),
(240, 'kagda', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'katherine', 'g', 'dalton', 1, '0000-00-00'),
(241, 'rysbu', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'ryan', 's', 'burns', 1, '0000-00-00'),
(242, 'rajme', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'raymond', 'j', 'medlin', 1, '0000-00-00'),
(243, 'dajdi', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'darlene', 'j', 'dillon', 1, '0000-00-00'),
(244, 'kidlu', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'kirk', 'd', 'luther', 1, '0000-00-00'),
(245, 'robbl', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'ronnie', 'b', 'bliss', 1, '0000-00-00'),
(246, 'jorja', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'joseph', 'r', 'jackson', 1, '0000-00-00'),
(247, 'jamwe', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'james', 'm', 'westfall', 1, '0000-00-00'),
(248, 'tivgo', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'timothy', 'v', 'goris', 1, '0000-00-00'),
(249, 'dodki', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'don', 'd', 'king', 1, '0000-00-00'),
(250, 'krape', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'kristie', 'a', 'perez', 1, '0000-00-00'),
(251, 'jomjo', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'john', 'm', 'johnson', 1, '0000-00-00'),
(252, 'mimmo', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'michael', 'm', 'montgomery', 1, '0000-00-00'),
(253, 'wiibu', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'william', 'i', 'butler', 1, '0000-00-00'),
(254, 'brpea', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'brandon', 'p', 'earle', 1, '0000-00-00'),
(255, 'phach', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'philip', 'a', 'chapman', 1, '0000-00-00'),
(256, 'megmo', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'mercy', 'g', 'moore', 1, '0000-00-00'),
(257, 'dochu', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'donald', 'c', 'humphrey', 1, '0000-00-00'),
(258, 'kicla', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'kim', 'c', 'layton', 1, '0000-00-00'),
(259, 'rospe', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'robert', 's', 'perez', 1, '0000-00-00'),
(260, 'kedsm', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'kelly', 'd', 'smith', 1, '0000-00-00'),
(261, 'douga', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'douglas', 'u', 'gant', 1, '0000-00-00'),
(262, 'gabwa', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'gary', 'b', 'watson', 1, '0000-00-00'),
(263, 'namfu', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'napoleon', 'm', 'fullilove', 1, '0000-00-00'),
(264, 'lajwi', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'lashanda', 'j', 'williamson', 1, '0000-00-00'),
(265, 'arhma', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'arturo', 'h', 'may', 1, '0000-00-00'),
(266, 'jaspa', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'janette', 's', 'parmelee', 1, '0000-00-00'),
(267, 'vimtr', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'vincent', 'm', 'tremaine', 1, '0000-00-00'),
(268, 'lutgu', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'luis', 't', 'guzman', 1, '0000-00-00'),
(269, 'becha', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'beverly', 'c', 'harris', 1, '0000-00-00'),
(270, 'kaero', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'kathleen', 'e', 'romero', 1, '0000-00-00'),
(271, 'roesh', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'rocco', 'e', 'sheaffer', 1, '0000-00-00'),
(272, 'clfiv', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'clifton', 'f', 'ivory', 1, '0000-00-00'),
(273, 'frdfr', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'frieda', 'd', 'frates', 1, '0000-00-00'),
(274, 'bodha', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'bonnie', 'd', 'haywood', 1, '0000-00-00'),
(275, 'macgo', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'mary', 'c', 'gottschalk', 1, '0000-00-00'),
(276, 'wilca', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'willard', 'l', 'carter', 1, '0000-00-00'),
(277, 'karga', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'kathleen', 'r', 'gaines', 1, '0000-00-00'),
(278, 'andke', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'anna', 'd', 'kessler', 1, '0000-00-00'),
(279, 'auvch', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'aubrey', 'v', 'cheeks', 1, '0000-00-00'),
(280, 'mascl', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'mamie', 's', 'clark', 1, '0000-00-00'),
(281, 'wijmi', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'willie', 'j', 'miller', 1, '0000-00-00'),
(282, 'maebr', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'marlene', 'e', 'brown', 1, '0000-00-00'),
(283, 'iscpo', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'isreal', 'c', 'ponds', 1, '0000-00-00'),
(284, 'befma', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'becky', 'f', 'magee', 1, '0000-00-00'),
(285, 'vablo', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'vanessa', 'b', 'lord', 1, '0000-00-00'),
(286, 'ankzi', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'anthony', 'k', 'ziegler', 1, '0000-00-00'),
(287, 'ropca', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'robert', 'p', 'carter', 1, '0000-00-00'),
(288, 'anrba', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'anastasia', 'r', 'bales', 1, '0000-00-00'),
(289, 'jemmu', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'jean', 'm', 'murphy', 1, '0000-00-00'),
(290, 'nocpr', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'norberto', 'c', 'price', 1, '0000-00-00'),
(291, 'nigcr', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'nicolas', 'g', 'creighton', 1, '0000-00-00'),
(292, 'thcro', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'thomas', 'c', 'romine', 1, '0000-00-00'),
(293, 'heero', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'helen', 'e', 'robertson', 1, '0000-00-00'),
(294, 'tobhe', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'todd', 'b', 'herrera', 1, '0000-00-00'),
(295, 'grrco', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'gregory', 'r', 'coleman', 1, '0000-00-00'),
(296, 'krjla', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'kristine', 'j', 'lamm', 1, '0000-00-00'),
(297, 'yujru', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'yulanda', 'j', 'russell', 1, '0000-00-00'),
(298, 'sehal', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'sean', 'h', 'alvarez', 1, '0000-00-00'),
(299, 'minne', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'michele', 'n', 'newson', 1, '0000-00-00'),
(300, 'gemke', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'gerald', 'm', 'kennedy', 1, '0000-00-00'),
(301, 'anklu', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'andrew', 'k', 'luce', 1, '0000-00-00'),
(302, 'brlba', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'brittney', 'l', 'baker', 1, '0000-00-00'),
(303, 'maalu', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'mac', 'a', 'lukasik', 1, '0000-00-00'),
(304, 'baswo', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'barbara', 's', 'woodley', 1, '0000-00-00'),
(305, 'mirro', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'minnie', 'r', 'rosenthal', 1, '0000-00-00'),
(306, 'edbcu', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'edmond', 'b', 'curry', 1, '0000-00-00'),
(307, 'jocla', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'john', 'c', 'lash', 1, '0000-00-00'),
(308, 'diehe', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'diane', 'e', 'hernandez', 1, '0000-00-00'),
(309, 'kalbe', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'karen', 'l', 'bernhardt', 1, '0000-00-00'),
(310, 'racla', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'raymond', 'c', 'lancaster', 1, '0000-00-00'),
(311, 'kijro', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'kimberly', 'j', 'robison', 1, '0000-00-00'),
(312, 'jubwh', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'julie', 'b', 'whitt', 1, '0000-00-00'),
(313, 'shsli', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'shawn', 's', 'linden', 1, '0000-00-00'),
(314, 'sthpe', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'stephen', 'h', 'pearson', 1, '0000-00-00'),
(315, 'joehe', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'john', 'e', 'heaton', 1, '0000-00-00'),
(316, 'kapmc', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'kathy', 'p', 'mccaskill', 1, '0000-00-00'),
(317, 'eaedo', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'earnest', 'e', 'douglas', 1, '0000-00-00'),
(318, 'dajea', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'darin', 'j', 'earl', 1, '0000-00-00'),
(319, 'derha', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'desiree', 'r', 'harris', 1, '0000-00-00'),
(320, 'rawro', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'rachel', 'w', 'roque', 1, '0000-00-00'),
(321, 'lanst', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'larry', 'n', 'stokes', 1, '0000-00-00'),
(322, 'maeth', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'marvin', 'e', 'thompson', 1, '0000-00-00'),
(323, 'bejpr', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'betty', 'j', 'prochaska', 1, '0000-00-00'),
(324, 'alrcu', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'alberto', 'r', 'cummings', 1, '0000-00-00'),
(325, 'cathu', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'cathrine', 't', 'hunt', 1, '0000-00-00'),
(326, 'tobke', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'tona', 'b', 'kennedy', 1, '0000-00-00'),
(327, 'doojo', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'dortha', 'o', 'jones', 1, '0000-00-00'),
(328, 'pajmc', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'paul', 'j', 'mcmahon', 1, '0000-00-00'),
(329, 'behch', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'bert', 'h', 'charleston', 1, '0000-00-00'),
(330, 'stmpa', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'steve', 'm', 'patterson', 1, '0000-00-00'),
(331, 'medel', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'megan', 'd', 'elzey', 1, '0000-00-00'),
(332, 'chwmc', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'christine', 'w', 'mccoy', 1, '0000-00-00'),
(333, 'saosh', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'sandra', 'o', 'shadwick', 1, '0000-00-00'),
(334, 'joaro', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'joel', 'a', 'rogers', 1, '0000-00-00'),
(335, 'torgr', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'todd', 'r', 'graham', 1, '0000-00-00'),
(336, 'lahve', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'laura', 'h', 'veliz', 1, '0000-00-00'),
(337, 'anrra', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'ann', 'r', 'raynor', 1, '0000-00-00'),
(338, 'raamo', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'raymond', 'a', 'mosby', 1, '0000-00-00'),
(339, 'scaca', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'scott', 'a', 'cardella', 1, '0000-00-00'),
(340, 'gwmmu', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'gwendolyn', 'm', 'muniz', 1, '0000-00-00'),
(341, 'josre', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'john', 's', 'reed', 1, '0000-00-00'),
(342, 'ryelo', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'ryan', 'e', 'lowe', 1, '0000-00-00'),
(343, 'majri', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'maria', 'j', 'ringer', 1, '0000-00-00'),
(344, 'altmo', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'allie', 't', 'monroe', 1, '0000-00-00'),
(345, 'gramo', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'gregory', 'a', 'morrill', 1, '0000-00-00'),
(346, 'jodku', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'joseph', 'd', 'kucera', 1, '0000-00-00'),
(347, 'ligsa', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'liza', 'g', 'sabo', 1, '0000-00-00'),
(348, 'locel', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'lori', 'c', 'ellis', 1, '0000-00-00'),
(349, 'wasli', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'wayne', 's', 'lindsey', 1, '0000-00-00'),
(350, 'jaasm', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'janice', 'a', 'smith', 1, '0000-00-00'),
(351, 'cuehu', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'curtis', 'e', 'hudgins', 1, '0000-00-00'),
(352, 'jerde', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'jessie', 'r', 'deal', 1, '0000-00-00'),
(353, 'beksc', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'bernard', 'k', 'schrimsher', 1, '0000-00-00'),
(354, 'jogba', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'joann', 'g', 'baumgartner', 1, '0000-00-00'),
(355, 'cajby', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'cassandra', 'j', 'byrd', 1, '0000-00-00'),
(356, 'vilcu', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'victor', 'l', 'cullison', 1, '0000-00-00'),
(357, 'lijco', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'lisa', 'j', 'cook', 1, '0000-00-00'),
(358, 'vajsa', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'valerie', 'j', 'sanders', 1, '0000-00-00'),
(359, 'yocsy', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'yolanda', 'c', 'sylvester', 1, '0000-00-00'),
(360, 'hovpr', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'howard', 'v', 'prince', 1, '0000-00-00'),
(361, 'jumha', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'juana', 'm', 'hawkins', 1, '0000-00-00'),
(362, 'natdu', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'nathan', 't', 'dufresne', 1, '0000-00-00'),
(363, 'lacpa', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'laura', 'c', 'patten', 1, '0000-00-00'),
(364, 'maebu', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'malcolm', 'e', 'burns', 1, '0000-00-00'),
(365, 'macma', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'manuel', 'c', 'mann', 1, '0000-00-00'),
(366, 'grsto', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'greg', 's', 'torres', 1, '0000-00-00'),
(367, 'lotwa', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'lori', 't', 'washington', 1, '0000-00-00'),
(368, 'majva', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'margaret', 'j', 'vanderhoff', 1, '0000-00-00'),
(369, 'gldma', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'glenda', 'd', 'marra', 1, '0000-00-00'),
(370, 'eraka', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'erica', 'a', 'katz', 1, '0000-00-00'),
(371, 'wisgu', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'william', 's', 'gumm', 1, '0000-00-00'),
(372, 'mocsw', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'monica', 'c', 'switzer', 1, '0000-00-00'),
(373, 'stegr', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'stanley', 'e', 'granda', 1, '0000-00-00'),
(374, 'esmsm', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'estella', 'm', 'smith', 1, '0000-00-00'),
(375, 'dodcu', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'donald', 'd', 'cummings', 1, '0000-00-00'),
(376, 'jowly', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'jose', 'w', 'lyle', 1, '0000-00-00'),
(377, 'majsh', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'marion', 'j', 'shields', 1, '0000-00-00'),
(378, 'rufwo', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'ruth', 'f', 'wood', 1, '0000-00-00'),
(379, 'chdri', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'charlotte', 'd', 'rivera', 1, '0000-00-00'),
(380, 'jactu', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'james', 'c', 'tucker', 1, '0000-00-00'),
(381, 'kajlo', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'karen', 'j', 'lopez', 1, '0000-00-00'),
(382, 'midam', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'millard', 'd', 'ames', 1, '0000-00-00'),
(383, 'stjal', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'steven', 'j', 'allen', 1, '0000-00-00'),
(384, 'ancgo', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'anthony', 'c', 'gorsuch', 1, '0000-00-00'),
(385, 'trmco', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'troy', 'm', 'corbitt', 1, '0000-00-00'),
(386, 'cunpe', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'curtis', 'n', 'persons', 1, '0000-00-00'),
(387, 'difdy', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'dianna', 'f', 'dyer', 1, '0000-00-00'),
(388, 'ditfu', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'dixie', 't', 'fulford', 1, '0000-00-00'),
(389, 'witmc', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'willie', 't', 'mckee', 1, '0000-00-00'),
(390, 'krjcr', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'krista', 'j', 'cruz', 1, '0000-00-00'),
(391, 'wirsa', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'william', 'r', 'salem', 1, '0000-00-00'),
(392, 'fecth', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'felix', 'c', 'thompson', 1, '0000-00-00'),
(393, 'wicha', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'william', 'c', 'hanlon', 1, '0000-00-00'),
(394, 'jecga', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'jerry', 'c', 'garrett', 1, '0000-00-00'),
(395, 'jacfo', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'james', 'c', 'foster', 1, '0000-00-00'),
(396, 'luikn', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'lucia', 'i', 'knott', 1, '0000-00-00'),
(397, 'lorho', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'lou', 'r', 'hoffman', 1, '0000-00-00'),
(398, 'caaso', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'catherine', 'a', 'soliz', 1, '0000-00-00'),
(399, 'hepha', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'henry', 'p', 'harding', 1, '0000-00-00'),
(400, 'alfgo', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'alan', 'f', 'gonzalez', 1, '0000-00-00'),
(401, 'lojbu', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'lorraine', 'j', 'butler', 1, '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `user_course_assoc`
--

CREATE TABLE IF NOT EXISTS `user_course_assoc` (
  `user_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`course_id`),
  KEY `course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course_coursework_assoc`
--
ALTER TABLE `course_coursework_assoc`
  ADD CONSTRAINT `course_coursework_assoc_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  ADD CONSTRAINT `course_coursework_assoc_ibfk_2` FOREIGN KEY (`coursework_id`) REFERENCES `coursework` (`coursework_id`);

--
-- Constraints for table `user_course_assoc`
--
ALTER TABLE `user_course_assoc`
  ADD CONSTRAINT `user_course_assoc_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `user_course_assoc_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
