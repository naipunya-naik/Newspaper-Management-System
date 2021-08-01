-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2019 at 03:51 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nms`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `updpass` (IN `pass` VARCHAR(255), IN `uid` VARCHAR(255))  NO SQL
Update login set login.pass=pass WHERE login.uid=uid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_details`
--

CREATE TABLE `customer_details` (
  `name` varchar(30) NOT NULL,
  `phonenumber` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `psw` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_details`
--

INSERT INTO `customer_details` (`name`, `phonenumber`, `address`, `email`, `psw`) VALUES
('akshat', '9001167176', 'rajasthan', 'akshat@gmail.com', '123'),
('babu', '525525552', ' babuescobar', 'babu@hotmail.com', 'babu'),
('jjs', '1234567890', 'navsari', 'jjs@gmail.com', '12345'),
('akshat', '8523697413', 'bojlnmk,.', 'kkkk@gmail.com', '2'),
('dhruvil', '8989654321', 'gujarat', 'shahdhruv@gmail.com', 'Sinchana'),
('yuioy', '4567890343', 'jamnagar', 'yuioy@gmail.com', '3');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `uid` varchar(20) NOT NULL,
  `pass` varchar(50) DEFAULT NULL,
  `type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`uid`, `pass`, `type`) VALUES
('admin-001', 'admin', 'admin'),
('akshat@gmail.com', '12345', 'customer'),
('jjs@gmail.com', '123', 'customer'),
('kkkk@gmail.com', '2', 'customer'),
('yuioy@gmail.com', '3', 'customer');

-- --------------------------------------------------------

--
-- Table structure for table `publisher_details`
--

CREATE TABLE `publisher_details` (
  `name` varchar(20) NOT NULL,
  `phone number` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  `p/d` varchar(20) NOT NULL,
  `ediname` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `publisher_details`
--

INSERT INTO `publisher_details` (`name`, `phone number`, `address`, `p/d`, `ediname`) VALUES
('Dainik Bhaskar', '9567894332', 'Udaipur', '50', 'Mr. Shyam Sundar'),
('Divya Bhaskar', '6785904365', 'Jaipur', '60', 'Mr. Ram Anand'),
('Hindustan Times', '9876543210', 'Jasalmer', '100', 'Mr. Bhanu Singh'),
('Indian Express', '9783970065', 'Jodhpur', '75', 'Ms. Gayatri'),
('Sandesh', '9008763452', 'Suratgarh', '40', 'Ms. Shalini'),
('Times of India', '9110678546', 'Sikkar', '75', 'Mr. Rajkumar');

-- --------------------------------------------------------

--
-- Table structure for table `requirements`
--

CREATE TABLE `requirements` (
  `pid` varchar(10) NOT NULL,
  `papername` varchar(30) NOT NULL,
  `costperday` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `requirements`
--

INSERT INTO `requirements` (`pid`, `papername`, `costperday`) VALUES
('1', 'The Hindustan Times', 'Rs.4'),
('2', 'Times of India', 'Rs.4'),
('3', 'Dainik Bhaskar', 'Rs.3'),
('4', 'Sandesh', 'Rs.2'),
('5', 'Divya Bhaskar', 'Rs.2'),
('6', 'Indian Express', 'Rs.3');

-- --------------------------------------------------------

--
-- Table structure for table `subs`
--

CREATE TABLE `subs` (
  `email` varchar(20) NOT NULL,
  `pid` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subs`
--

INSERT INTO `subs` (`email`, `pid`) VALUES
('akshat@gmail.com', '1'),
('akshat@gmail.com', '2'),
('akshat@gmail.com', '3'),
('akshat@gmail.com', '5');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `email` varchar(20) NOT NULL,
  `pid` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`email`, `pid`) VALUES
('akshat@gmail.com', '1'),
('akshat@gmail.com', '3'),
('akshat@gmail.com', '5');

--
-- Triggers `subscribers`
--
DELIMITER $$
CREATE TRIGGER `subs` AFTER INSERT ON `subscribers` FOR EACH ROW INSERT into subs VALUES(NEW.email,NEW.pid)
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer_details`
--
ALTER TABLE `customer_details`
  ADD PRIMARY KEY (`email`),
  ADD UNIQUE KEY `phone number` (`phonenumber`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `publisher_details`
--
ALTER TABLE `publisher_details`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `requirements`
--
ALTER TABLE `requirements`
  ADD PRIMARY KEY (`pid`),
  ADD UNIQUE KEY `papername` (`papername`);

--
-- Indexes for table `subs`
--
ALTER TABLE `subs`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`pid`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD CONSTRAINT `subscribers_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `requirements` (`pid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
