-- phpMyAdmin SQL Dump
-- version 3.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 15, 2013 at 07:16 PM
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
  `courseupload_date` date DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

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
  ADD CONSTRAINT `course_coursework_assoc_ibfk_2` FOREIGN KEY (`coursework_id`) REFERENCES `coursework` (`coursework_id`),
  ADD CONSTRAINT `course_coursework_assoc_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`);

--
-- Constraints for table `user_course_assoc`
--
ALTER TABLE `user_course_assoc`
  ADD CONSTRAINT `user_course_assoc_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  ADD CONSTRAINT `user_course_assoc_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
