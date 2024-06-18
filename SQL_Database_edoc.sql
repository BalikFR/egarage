-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 19, 2022 at 01:39 PM
-- Server version: 5.7.26
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `egarage`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `aemail` varchar(255) NOT NULL,
  `apassword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`aemail`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`aemail`, `apassword`) VALUES
('admin@egarage.com', '123');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
CREATE TABLE IF NOT EXISTS `appointment` (
  `appoid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(10) DEFAULT NULL,
  `apponum` int(3) DEFAULT NULL,
  `scheduleid` int(10) DEFAULT NULL,
  `appodate` date DEFAULT NULL,
  PRIMARY KEY (`appoid`),
  KEY `pid` (`pid`),
  KEY `scheduleid` (`scheduleid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appoid`, `pid`, `apponum`, `scheduleid`, `appodate`) VALUES
(1, 1, 1, 1, '2022-06-03');

-- --------------------------------------------------------

--
-- Table structure for table `mechanical`
--

DROP TABLE IF EXISTS `mechanical`;
CREATE TABLE IF NOT EXISTS `mechanical` (
  `docid` int(11) NOT NULL AUTO_INCREMENT,
  `docemail` varchar(255) DEFAULT NULL,
  `docname` varchar(255) DEFAULT NULL,
  `docpassword` varchar(255) DEFAULT NULL,
  `docnic` varchar(15) DEFAULT NULL,
  `doctel` varchar(15) DEFAULT NULL,
  `specialties` int(2) DEFAULT NULL,
  PRIMARY KEY (`docid`),
  KEY `specialties` (`specialties`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mechanical`
--

INSERT INTO `mechanical` (`docid`, `docemail`, `docname`, `docpassword`, `docnic`, `doctel`, `specialties`) VALUES
(1, 'mechanical@egarage.com', 'Test Mechanical', '123', '000000000', '0110000000', 1),
(2, 'balikmech@egarage.com', 'Balik Mech', '123', '000000000', '0220000000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pemail` varchar(255) DEFAULT NULL,
  `pname` varchar(255) DEFAULT NULL,
  `ppassword` varchar(255) DEFAULT NULL,
  `paddress` varchar(255) DEFAULT NULL,
  `pnic` varchar(15) DEFAULT NULL,
  `pdob` date DEFAULT NULL,
  `ptel` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`pid`, `pemail`, `pname`, `ppassword`, `paddress`, `pnic`, `pdob`, `ptel`) VALUES
(1, 'client@egarage.com', 'Test Client', '123', 'Sri Lanka', '0000000000', '2000-01-01', '0120000000'),
(2, 'balik@egarage.com', 'Balik Likbv', '123', 'Paname', '0910000000', '2022-06-03', '0700000000'),
(3, 'massey@egarage.com', 'Massey Bonk', '123', 'Labas', '0510000000', '2022-06-03', '0500000000');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
CREATE TABLE IF NOT EXISTS `schedule` (
  `scheduleid` int(11) NOT NULL AUTO_INCREMENT,
  `docid` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `scheduledate` date DEFAULT NULL,
  `scheduletime` time DEFAULT NULL,
  `nop` int(4) DEFAULT NULL,
  PRIMARY KEY (`scheduleid`),
  KEY `docid` (`docid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`scheduleid`, `docid`, `title`, `scheduledate`, `scheduletime`, `nop`) VALUES
(1, '1', 'Test Session', '2050-01-01', '18:00:00', 50),
(2, '1', '1', '2024-06-10', '20:36:00', 1),
(3, '1', '12', '2024-06-10', '20:33:00', 1),
(4, '1', '1', '2024-06-10', '12:32:00', 1),
(5, '1', '1', '2024-06-10', '20:35:00', 1),
(6, '1', '12', '2024-06-10', '20:35:00', 1),
(7, '1', '1', '2024-06-24', '20:36:00', 1),
(8, '1', '12', '2024-06-10', '13:33:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `specialties`
--

DROP TABLE IF EXISTS `specialties`;
CREATE TABLE IF NOT EXISTS `specialties` (
  `id` int(2) NOT NULL,
  `sname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `specialties`
--

INSERT INTO `specialties` (`id`, `sname`) VALUES
(1, 'Oil Change'),
(2, 'Tire Repair'),
(3, 'Brake Inspection'),
(4, 'Battery Replacement'),
(5, 'Engine Diagnostics'),
(6, 'Transmission Repair'),
(7, 'Wheel Alignment'),
(8, 'Air Conditioning Service'),
(9, 'Suspension Repair'),
(10, 'Exhaust System Repair'),
(11, 'Full Vehicle Inspection'),
(12, 'Scheduled Maintenance'),
(13, 'Electrical System Repair'),
(14, 'Cooling System Service'),
(15, 'Fuel System Repair'),
(16, 'Emissions Testing'),
(17, 'Windshield Repair'),
(18, 'Headlight Restoration'),
(19, 'Detailing Service'),
(20, 'Paint Repair'),
(21, 'Bodywork Repair'),
(22, 'Tire Rotation'),
(23, 'Tire Balancing'),
(24, 'Spark Plug Replacement'),
(25, 'Filter Replacement'),
(26, 'Belt and Hose Replacement'),
(27, 'Clutch Repair'),
(28, 'Differential Repair'),
(29, 'Four-Wheel Drive Service'),
(30, 'Hybrid Vehicle Service'),
(31, 'Electric Vehicle Service'),
(32, 'Power Steering Repair'),
(33, 'Fluid Check and Replacement'),
(34, 'Transmission Flush'),
(35, 'Radiator Repair'),
(36, 'Muffler Repair'),
(37, 'Alignment Check'),
(38, 'Pre-Purchase Inspection'),
(39, 'Winter Tire Installation'),
(40, 'Summer Tire Installation'),
(41, 'Roadside Assistance'),
(42, 'Tow Service'),
(43, 'Battery Jump Start'),
(44, 'Locksmith Service'),
(45, 'Flat Tire Change'),
(46, 'Emergency Repair Service'),
(47, 'Diagnostic Test'),
(48, 'Tune-Up'),
(49, 'Shock and Strut Replacement'),
(50, 'Check Engine Light Service'),
(51, 'Drive Belt Inspection'),
(52, 'Timing Belt Replacement'),
(53, 'CV Joint Replacement'),
(54, 'Brake Fluid Flush'),
(55, 'Transmission Fluid Replacement'),
(56, 'Cabin Air Filter Replacement');

-- --------------------------------------------------------

--
-- Table structure for table `webuser`
--

DROP TABLE IF EXISTS `webuser`;
CREATE TABLE IF NOT EXISTS `webuser` (
  `email` varchar(255) NOT NULL,
  `usertype` char(1) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `webuser`
--

INSERT INTO `webuser` (`email`, `usertype`) VALUES
('admin@egarage.com', 'a'),
('mechanical@egarage.com', 'd'),
('client@egarage.com', 'p'),
('balik@egarage.com', 'p'),
('massey@egarage.com', 'p');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
