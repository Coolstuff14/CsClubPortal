-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 16, 2015 at 05:55 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `csmain`
--

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE IF NOT EXISTS `job` (
`jobID` int(4) NOT NULL,
  `dateCreated` date DEFAULT NULL,
  `submitBy` int(4) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `progress` varchar(1000) NOT NULL,
  `memberName` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `urgency` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`jobID`, `dateCreated`, `submitBy`, `title`, `description`, `progress`, `memberName`, `status`, `urgency`) VALUES
(9, '2015-12-16', 14, 'Create 2016 Budget', 'We need a budget due by the end of January                   \r\n                ', 'Only a few ideas                  \r\n                ', 'Jake', 'In Progress', 'Urgent'),
(10, '2015-12-16', 14, 'Get stuff from SGA office', 'Our stuff it still there', 'IDK', 'All', 'New', 'Urgent');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE IF NOT EXISTS `member` (
`memberID` int(4) NOT NULL,
  `fName` varchar(20) NOT NULL,
  `lName` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `eboard` varchar(1) DEFAULT '0',
  `oneCard` varchar(25) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`memberID`, `fName`, `lName`, `email`, `phone`, `username`, `password`, `eboard`, `oneCard`) VALUES
(14, 'Jake', 'Lee', 'Jake@jakelee.info', '', 'coolstuff14', 'password', '1', ''),
(15, 'John', 'Smith', 'john@gmail.com', '978-827-9999', 'john1', 'password', '0', ''),
(16, 'Jim', 'Smith', 'jim@gmail.com', '978-827-5555', 'jim1', 'password', '0', ''),
(17, 'Kevin', 'Smith', 'kevin@kevin.com', '9788274455', 'kev1', 'password', '1', '');

-- --------------------------------------------------------

--
-- Table structure for table `signin`
--

CREATE TABLE IF NOT EXISTS `signin` (
`signID` int(6) NOT NULL,
  `memberID` int(4) NOT NULL,
  `timeIn` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `timeOut` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `job`
--
ALTER TABLE `job`
 ADD PRIMARY KEY (`jobID`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
 ADD PRIMARY KEY (`memberID`);

--
-- Indexes for table `signin`
--
ALTER TABLE `signin`
 ADD PRIMARY KEY (`signID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `job`
--
ALTER TABLE `job`
MODIFY `jobID` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
MODIFY `memberID` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `signin`
--
ALTER TABLE `signin`
MODIFY `signID` int(6) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
