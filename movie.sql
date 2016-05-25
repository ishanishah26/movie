-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u1build0.15.04.1
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: May 25, 2016 at 07:26 PM
-- Server version: 5.6.28-0ubuntu0.15.04.1
-- PHP Version: 5.6.4-4ubuntu6.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `movie`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_login`
--

CREATE TABLE IF NOT EXISTS `admin_login` (
`aid` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_login`
--

INSERT INTO `admin_login` (`aid`, `username`, `password`) VALUES
(1, 'lanet_admin@gmail.com', 'admin123');

-- --------------------------------------------------------

--
-- Table structure for table `booking_details`
--

CREATE TABLE IF NOT EXISTS `booking_details` (
`transation_id` bigint(11) NOT NULL,
  `user_id` bigint(11) NOT NULL,
  `theatershow_time_id` bigint(11) NOT NULL,
  `seat_booked` varchar(500) NOT NULL,
  `total_payment` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `card_deatils`
--

CREATE TABLE IF NOT EXISTS `card_deatils` (
`carddetails_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `cardno` varchar(50) NOT NULL,
  `cardholdername` varchar(50) NOT NULL,
  `cvv` int(11) NOT NULL,
  `expirydate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE IF NOT EXISTS `city` (
`city_id` bigint(11) NOT NULL,
  `city_name` varchar(100) NOT NULL,
  `createddate` datetime NOT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isdeleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'default 0 if deleted 1'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`city_id`, `city_name`, `createddate`, `modifieddate`, `isdeleted`) VALUES
(1, 'surat', '2016-05-25 00:00:00', '0000-00-00 00:00:00', 0),
(2, 'ahmedabad', '2016-05-25 00:00:00', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE IF NOT EXISTS `movie` (
`movie_id` bigint(11) NOT NULL,
  `movie_name` varchar(100) NOT NULL,
  `r_date` date NOT NULL,
  `casting` varchar(100) NOT NULL,
  `director` varchar(50) NOT NULL,
  `duration` time NOT NULL,
  `image` varchar(1000) NOT NULL,
  `video` varchar(255) DEFAULT NULL,
  `createddate` datetime NOT NULL,
  `modifieddate` datetime NOT NULL,
  `isdeleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`movie_id`, `movie_name`, `r_date`, `casting`, `director`, `duration`, `image`, `video`, `createddate`, `modifieddate`, `isdeleted`) VALUES
(1, 'airlift', '2016-01-29', 'akshay', 'xyz', '00:00:00', '../images/al.jpg', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(3, 'mastizade', '2016-01-22', 'tushar', 'xyz', '00:00:02', '../images/masti.jpg', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(4, 'kya cool he hum', '2016-01-29', 'tushar', 'xyz', '00:00:00', '../images/kkh.jpg', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(5, 'love-shuda', '2016-02-05', 'priyanka', 'mr.agrawal', '00:00:02', '../images/love-sshuda.jpg', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(6, 'direct-ishq', '2016-02-05', 'aaliya bhatt', 'mr.patel', '00:00:00', '../images/di.jpg', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(7, 'concussion', '2016-02-19', 'johnsmith', 'smithbrothres', '00:00:02', '../images/concussion.jpg', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `screen_master`
--

CREATE TABLE IF NOT EXISTS `screen_master` (
`screen_id` bigint(11) NOT NULL,
  `theater_id` bigint(11) NOT NULL,
  `screen_name` varchar(255) NOT NULL,
  `totalrows` int(11) NOT NULL,
  `no_ofseat_eachrow` int(11) NOT NULL,
  `createddate` datetime NOT NULL,
  `mofifieddate` datetime NOT NULL,
  `isdeleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `showtime`
--

CREATE TABLE IF NOT EXISTS `showtime` (
`show_id` bigint(11) NOT NULL,
  `showtime` time NOT NULL,
  `createddate` datetime NOT NULL,
  `modifieddate` datetime NOT NULL,
  `isdeleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `theater`
--

CREATE TABLE IF NOT EXISTS `theater` (
`t_id` bigint(11) NOT NULL,
  `t_name` varchar(100) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phoneno` varchar(100) DEFAULT NULL,
  `city_id` bigint(11) NOT NULL,
  `createddate` datetime NOT NULL,
  `modifieddate` datetime NOT NULL,
  `isdeleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `theater_showtime`
--

CREATE TABLE IF NOT EXISTS `theater_showtime` (
`theatre_showtime_id` bigint(11) NOT NULL,
  `theater_id` bigint(11) NOT NULL,
  `movie_id` bigint(20) NOT NULL,
  `show_id` bigint(11) NOT NULL,
  `datestart_from` date NOT NULL,
  `date_end` date NOT NULL,
  `createddate` datetime NOT NULL,
  `modifieddate` datetime NOT NULL,
  `isdeleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_rate_master`
--

CREATE TABLE IF NOT EXISTS `ticket_rate_master` (
`screenclass_id` bigint(11) NOT NULL,
  `theater_id` bigint(11) NOT NULL,
  `booking_rate` int(11) NOT NULL,
  `screen_class_name` varchar(50) NOT NULL,
  `seat_in_each_row` int(11) NOT NULL,
  `total_row` int(11) NOT NULL,
  `createddate` datetime NOT NULL,
  `modifieddate` datetime NOT NULL,
  `isdeleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`userid` bigint(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(80) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phoneno` varchar(50) NOT NULL,
  `Dob` date NOT NULL,
  `createddate` datetime NOT NULL,
  `modifieddate` datetime NOT NULL,
  `isdeleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_login`
--
ALTER TABLE `admin_login`
 ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `booking_details`
--
ALTER TABLE `booking_details`
 ADD PRIMARY KEY (`transation_id`), ADD KEY `user_id` (`user_id`), ADD KEY `user_id_2` (`user_id`);

--
-- Indexes for table `card_deatils`
--
ALTER TABLE `card_deatils`
 ADD PRIMARY KEY (`carddetails_id`), ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
 ADD PRIMARY KEY (`city_id`);

--
-- Indexes for table `movie`
--
ALTER TABLE `movie`
 ADD PRIMARY KEY (`movie_id`);

--
-- Indexes for table `screen_master`
--
ALTER TABLE `screen_master`
 ADD PRIMARY KEY (`screen_id`), ADD KEY `theater_id` (`theater_id`), ADD KEY `theater_id_2` (`theater_id`);

--
-- Indexes for table `showtime`
--
ALTER TABLE `showtime`
 ADD PRIMARY KEY (`show_id`);

--
-- Indexes for table `theater`
--
ALTER TABLE `theater`
 ADD PRIMARY KEY (`t_id`), ADD KEY `city_id` (`city_id`), ADD KEY `city_id_2` (`city_id`), ADD KEY `city_id_3` (`city_id`), ADD KEY `city_id_4` (`city_id`);

--
-- Indexes for table `theater_showtime`
--
ALTER TABLE `theater_showtime`
 ADD PRIMARY KEY (`theatre_showtime_id`), ADD KEY `theater_id` (`theater_id`,`movie_id`,`show_id`), ADD KEY `theater_id_2` (`theater_id`), ADD KEY `movie_id` (`movie_id`), ADD KEY `show_id` (`show_id`);

--
-- Indexes for table `ticket_rate_master`
--
ALTER TABLE `ticket_rate_master`
 ADD PRIMARY KEY (`screenclass_id`), ADD KEY `theater_id` (`theater_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_login`
--
ALTER TABLE `admin_login`
MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `booking_details`
--
ALTER TABLE `booking_details`
MODIFY `transation_id` bigint(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `card_deatils`
--
ALTER TABLE `card_deatils`
MODIFY `carddetails_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
MODIFY `city_id` bigint(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `movie`
--
ALTER TABLE `movie`
MODIFY `movie_id` bigint(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `screen_master`
--
ALTER TABLE `screen_master`
MODIFY `screen_id` bigint(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `showtime`
--
ALTER TABLE `showtime`
MODIFY `show_id` bigint(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `theater`
--
ALTER TABLE `theater`
MODIFY `t_id` bigint(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `theater_showtime`
--
ALTER TABLE `theater_showtime`
MODIFY `theatre_showtime_id` bigint(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ticket_rate_master`
--
ALTER TABLE `ticket_rate_master`
MODIFY `screenclass_id` bigint(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `userid` bigint(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking_details`
--
ALTER TABLE `booking_details`
ADD CONSTRAINT `fkwithuser` FOREIGN KEY (`user_id`) REFERENCES `user` (`userid`);

--
-- Constraints for table `card_deatils`
--
ALTER TABLE `card_deatils`
ADD CONSTRAINT `fkuser` FOREIGN KEY (`user_id`) REFERENCES `user` (`userid`);

--
-- Constraints for table `screen_master`
--
ALTER TABLE `screen_master`
ADD CONSTRAINT `fk` FOREIGN KEY (`theater_id`) REFERENCES `theater` (`t_id`);

--
-- Constraints for table `theater`
--
ALTER TABLE `theater`
ADD CONSTRAINT `fkwithcity` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`);

--
-- Constraints for table `theater_showtime`
--
ALTER TABLE `theater_showtime`
ADD CONSTRAINT `fkwith_t` FOREIGN KEY (`theater_id`) REFERENCES `theater` (`t_id`),
ADD CONSTRAINT `fkwithm` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`),
ADD CONSTRAINT `fkwithshow` FOREIGN KEY (`show_id`) REFERENCES `showtime` (`show_id`);

--
-- Constraints for table `ticket_rate_master`
--
ALTER TABLE `ticket_rate_master`
ADD CONSTRAINT `fkwith_theater` FOREIGN KEY (`theater_id`) REFERENCES `theater` (`t_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
