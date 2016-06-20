-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u1build0.15.04.1
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Jun 20, 2016 at 04:15 PM
-- Server version: 5.6.28-0ubuntu0.15.04.1
-- PHP Version: 5.6.4-4ubuntu6.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pharmadb`
--

-- --------------------------------------------------------

--
-- Table structure for table `ContentMapping`
--

CREATE TABLE IF NOT EXISTS `ContentMapping` (
`Cmappingid` bigint(20) NOT NULL,
  `Meetingid` bigint(20) NOT NULL,
  `Contentid` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Devision`
--

CREATE TABLE IF NOT EXISTS `Devision` (
`Devisionid` int(11) NOT NULL,
  `Pincode` varchar(50) NOT NULL,
  `City` varchar(50) NOT NULL,
  `State` varchar(50) NOT NULL,
  `Region` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Feeds`
--

CREATE TABLE IF NOT EXISTS `Feeds` (
`Feedid` bigint(20) NOT NULL,
  `Feedtitle` varchar(200) NOT NULL,
  `Feeddescription` varchar(1000) NOT NULL,
  `CreatedBy` bigint(20) NOT NULL,
  `UpdatedBy` bigint(20) NOT NULL,
  `Createddate` datetime NOT NULL,
  `Updateddate` datetime NOT NULL,
  `Isdeleted` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `MappingFeedandPills`
--

CREATE TABLE IF NOT EXISTS `MappingFeedandPills` (
`Mapfpid` bigint(20) NOT NULL,
  `Feedid` bigint(20) NOT NULL,
  `Pillid` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `MeetingAgenda`
--

CREATE TABLE IF NOT EXISTS `MeetingAgenda` (
`Agendaid` bigint(20) NOT NULL,
  `Submeetingid` bigint(20) NOT NULL,
  `Starttime` datetime NOT NULL,
  `Endtime` datetime NOT NULL,
  `Agendatitle` varchar(100) NOT NULL,
  `Description` text NOT NULL,
  `Contentid` bigint(20) NOT NULL,
  `Expert` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `MeetingChild`
--

CREATE TABLE IF NOT EXISTS `MeetingChild` (
`Submeetingid` bigint(20) NOT NULL,
  `Meetingid` bigint(20) NOT NULL,
  `Startdate` datetime NOT NULL,
  `Enddate` datetime NOT NULL,
  `Venueaddress` varchar(500) NOT NULL,
  `Personatvenue` bigint(20) NOT NULL,
  `Meetingincharge` bigint(20) NOT NULL,
  `Meetingtrainer` bigint(20) NOT NULL,
  `Createddate` datetime NOT NULL,
  `Updateddate` datetime NOT NULL,
  `Isdeleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `MeetingContent`
--

CREATE TABLE IF NOT EXISTS `MeetingContent` (
`Contentid` bigint(20) NOT NULL,
  `Contentname` varchar(255) NOT NULL,
  `Contentdescription` varchar(2000) NOT NULL,
  `Contentbody` varchar(10000) NOT NULL,
  `Type` varchar(50) NOT NULL,
  `Path` varchar(255) NOT NULL,
  `Createdby` bigint(20) NOT NULL,
  `Updatedby` bigint(20) NOT NULL,
  `Createddate` datetime NOT NULL,
  `Updateddate` datetime NOT NULL,
  `Isdeleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `MeetingMaster`
--

CREATE TABLE IF NOT EXISTS `MeetingMaster` (
`Meetingid` bigint(20) NOT NULL,
  `Meetingtitle` varchar(50) NOT NULL,
  `Days` int(11) NOT NULL,
  `Createdby` bigint(20) NOT NULL,
  `Updatedby` bigint(20) NOT NULL,
  `Createddate` datetime NOT NULL,
  `Updateddate` datetime NOT NULL,
  `Isdeleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Notes`
--

CREATE TABLE IF NOT EXISTS `Notes` (
`Noteid` bigint(20) NOT NULL,
  `Meetingid` bigint(20) NOT NULL,
  `Notetitle` varchar(200) NOT NULL,
  `Description` text NOT NULL,
  `Createddate` datetime NOT NULL,
  `Upadteddate` datetime NOT NULL,
  `Isdeleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Participant`
--

CREATE TABLE IF NOT EXISTS `Participant` (
`Participantid` bigint(20) NOT NULL,
  `Userid` bigint(20) NOT NULL,
  `Meetingid` bigint(20) NOT NULL,
  `AttendingStatus` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-no 1-yes',
  `ActualPresence` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-no 1-yes',
  `Createddate` datetime NOT NULL,
  `Updateddate` datetime NOT NULL,
  `Isdeleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Pills`
--

CREATE TABLE IF NOT EXISTS `Pills` (
`Pillid` bigint(20) NOT NULL,
  `Pillname` varchar(50) NOT NULL,
  `Description` varchar(500) NOT NULL,
  `Category` varchar(50) NOT NULL,
  `RealeseDate` date NOT NULL,
  `Drugdetails` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `QuestionBank`
--

CREATE TABLE IF NOT EXISTS `QuestionBank` (
  `Questionid` bigint(20) NOT NULL,
  `QuestionType` varchar(50) NOT NULL,
  `Answer` varchar(255) NOT NULL,
  `Path` varchar(500) DEFAULT NULL,
  `Fronthtml` text NOT NULL,
  `Edithtml` text NOT NULL,
  `Submeetingid` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Task`
--

CREATE TABLE IF NOT EXISTS `Task` (
`Taskid` bigint(20) NOT NULL,
  `Meetingid` bigint(20) DEFAULT NULL,
  `Description` varchar(100) NOT NULL,
  `AssignedTo` bigint(20) NOT NULL,
  `Assignedby` bigint(20) NOT NULL,
  `Targetdate` date NOT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1- Not started 2- In progress 3- Almost done  4-done',
  `Tasktype` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-indivisual 1-meeting related',
  `Isdeleted` tinyint(1) NOT NULL DEFAULT '0',
  `Updateddate` datetime NOT NULL,
  `Createddate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `UserInfo`
--

CREATE TABLE IF NOT EXISTS `UserInfo` (
`Userid` bigint(20) NOT NULL,
  `Roleid` int(11) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Firstname` varchar(30) NOT NULL,
  `Lastname` varchar(30) NOT NULL,
  `Middlename` varchar(30) NOT NULL,
  `Gender` varchar(20) NOT NULL,
  `Birthdate` date NOT NULL,
  `Phoneno` varchar(50) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Devisionid` int(11) NOT NULL,
  `Designation` varchar(30) NOT NULL,
  `Joiningdate` date NOT NULL,
  `Createddate` datetime NOT NULL,
  `Updateddate` datetime NOT NULL,
  `Isdeleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `UserRole`
--

CREATE TABLE IF NOT EXISTS `UserRole` (
`Roleid` int(11) NOT NULL,
  `Roletype` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Createddate` datetime NOT NULL,
  `Updateddate` datetime NOT NULL,
  `Isdeleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=not deleted  1=deleted'
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `UserRole`
--

INSERT INTO `UserRole` (`Roleid`, `Roletype`, `Description`, `Createddate`, `Updateddate`, `Isdeleted`) VALUES
(1, 'MR', '', '2016-06-18 00:00:00', '0000-00-00 00:00:00', 0),
(2, ' Field Manager', '', '2016-06-18 00:00:00', '0000-00-00 00:00:00', 0),
(3, ' Sales Head', '', '2016-06-18 00:00:00', '0000-00-00 00:00:00', 0),
(4, ' Product Manager', '', '2016-06-18 00:00:00', '0000-00-00 00:00:00', 0),
(5, 'Group Product Manager', '', '2016-06-18 00:00:00', '0000-00-00 00:00:00', 0),
(6, '  Marketing Head', '', '2016-06-18 00:00:00', '0000-00-00 00:00:00', 0),
(7, '  Medical', '', '2016-06-18 00:00:00', '0000-00-00 00:00:00', 0),
(8, '  External Trainer', '', '2016-06-18 00:00:00', '0000-00-00 00:00:00', 0),
(9, ' Training Manager', '', '2016-06-18 00:00:00', '0000-00-00 00:00:00', 0),
(10, '  Corporate Admin', '', '2016-06-18 00:00:00', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `Video`
--

CREATE TABLE IF NOT EXISTS `Video` (
`Videoid` bigint(20) NOT NULL,
  `Meetingid` bigint(20) NOT NULL,
  `Videotitle` varchar(100) NOT NULL,
  `Path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ContentMapping`
--
ALTER TABLE `ContentMapping`
 ADD PRIMARY KEY (`Cmappingid`), ADD KEY `Meetingid` (`Meetingid`), ADD KEY `Contentid` (`Contentid`);

--
-- Indexes for table `Devision`
--
ALTER TABLE `Devision`
 ADD PRIMARY KEY (`Devisionid`), ADD UNIQUE KEY `Pincode` (`Pincode`);

--
-- Indexes for table `Feeds`
--
ALTER TABLE `Feeds`
 ADD PRIMARY KEY (`Feedid`), ADD KEY `CreatedBy` (`CreatedBy`), ADD KEY `UpdatedBy` (`UpdatedBy`);

--
-- Indexes for table `MappingFeedandPills`
--
ALTER TABLE `MappingFeedandPills`
 ADD PRIMARY KEY (`Mapfpid`), ADD KEY `Feedid` (`Feedid`), ADD KEY `Pillid` (`Pillid`);

--
-- Indexes for table `MeetingAgenda`
--
ALTER TABLE `MeetingAgenda`
 ADD PRIMARY KEY (`Agendaid`), ADD KEY `Sub_meeting_id` (`Submeetingid`), ADD KEY `Submeetingid` (`Submeetingid`), ADD KEY `Submeetingid_2` (`Submeetingid`);

--
-- Indexes for table `MeetingChild`
--
ALTER TABLE `MeetingChild`
 ADD PRIMARY KEY (`Submeetingid`), ADD KEY `Meeting_id` (`Meetingid`), ADD KEY `Meetingid` (`Meetingid`), ADD KEY `Meetingincharge` (`Meetingincharge`), ADD KEY `Meetingtrainer` (`Meetingtrainer`);

--
-- Indexes for table `MeetingContent`
--
ALTER TABLE `MeetingContent`
 ADD PRIMARY KEY (`Contentid`), ADD KEY `Createdby` (`Createdby`), ADD KEY `Updatedby` (`Updatedby`);

--
-- Indexes for table `MeetingMaster`
--
ALTER TABLE `MeetingMaster`
 ADD PRIMARY KEY (`Meetingid`), ADD KEY `Createdby` (`Createdby`), ADD KEY `updatedby` (`Updatedby`), ADD KEY `updatedby_2` (`Updatedby`);

--
-- Indexes for table `Notes`
--
ALTER TABLE `Notes`
 ADD PRIMARY KEY (`Noteid`), ADD KEY `Meetingid` (`Meetingid`);

--
-- Indexes for table `Participant`
--
ALTER TABLE `Participant`
 ADD PRIMARY KEY (`Participantid`), ADD KEY `Meeting_id` (`Meetingid`), ADD KEY `Userid` (`Userid`);

--
-- Indexes for table `Pills`
--
ALTER TABLE `Pills`
 ADD PRIMARY KEY (`Pillid`);

--
-- Indexes for table `QuestionBank`
--
ALTER TABLE `QuestionBank`
 ADD PRIMARY KEY (`Questionid`), ADD KEY `Submeetingid` (`Submeetingid`);

--
-- Indexes for table `Task`
--
ALTER TABLE `Task`
 ADD PRIMARY KEY (`Taskid`), ADD KEY `Meeting_id` (`Meetingid`), ADD KEY `Assigned_To` (`AssignedTo`), ADD KEY `Assigned_by` (`Assignedby`), ADD KEY `Meetingid` (`Meetingid`), ADD KEY `AssignedTo` (`AssignedTo`), ADD KEY `Assignedby` (`Assignedby`);

--
-- Indexes for table `UserInfo`
--
ALTER TABLE `UserInfo`
 ADD PRIMARY KEY (`Userid`), ADD KEY `Role_id` (`Roleid`), ADD KEY `Roleid` (`Roleid`), ADD KEY `Devisionid` (`Devisionid`);

--
-- Indexes for table `UserRole`
--
ALTER TABLE `UserRole`
 ADD PRIMARY KEY (`Roleid`);

--
-- Indexes for table `Video`
--
ALTER TABLE `Video`
 ADD PRIMARY KEY (`Videoid`), ADD KEY `Meetingid` (`Meetingid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ContentMapping`
--
ALTER TABLE `ContentMapping`
MODIFY `Cmappingid` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Devision`
--
ALTER TABLE `Devision`
MODIFY `Devisionid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Feeds`
--
ALTER TABLE `Feeds`
MODIFY `Feedid` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `MappingFeedandPills`
--
ALTER TABLE `MappingFeedandPills`
MODIFY `Mapfpid` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `MeetingAgenda`
--
ALTER TABLE `MeetingAgenda`
MODIFY `Agendaid` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `MeetingChild`
--
ALTER TABLE `MeetingChild`
MODIFY `Submeetingid` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `MeetingContent`
--
ALTER TABLE `MeetingContent`
MODIFY `Contentid` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `MeetingMaster`
--
ALTER TABLE `MeetingMaster`
MODIFY `Meetingid` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Notes`
--
ALTER TABLE `Notes`
MODIFY `Noteid` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Participant`
--
ALTER TABLE `Participant`
MODIFY `Participantid` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Pills`
--
ALTER TABLE `Pills`
MODIFY `Pillid` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Task`
--
ALTER TABLE `Task`
MODIFY `Taskid` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `UserInfo`
--
ALTER TABLE `UserInfo`
MODIFY `Userid` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `UserRole`
--
ALTER TABLE `UserRole`
MODIFY `Roleid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `Video`
--
ALTER TABLE `Video`
MODIFY `Videoid` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `ContentMapping`
--
ALTER TABLE `ContentMapping`
ADD CONSTRAINT `ContentMapping_ibfk_1` FOREIGN KEY (`Meetingid`) REFERENCES `MeetingMaster` (`Meetingid`),
ADD CONSTRAINT `ContentMapping_ibfk_2` FOREIGN KEY (`Contentid`) REFERENCES `MeetingContent` (`Contentid`);

--
-- Constraints for table `Feeds`
--
ALTER TABLE `Feeds`
ADD CONSTRAINT `Feeds_ibfk_1` FOREIGN KEY (`CreatedBy`) REFERENCES `UserInfo` (`Userid`),
ADD CONSTRAINT `Feeds_ibfk_2` FOREIGN KEY (`UpdatedBy`) REFERENCES `UserInfo` (`Userid`);

--
-- Constraints for table `MappingFeedandPills`
--
ALTER TABLE `MappingFeedandPills`
ADD CONSTRAINT `MappingFeedandPills_ibfk_1` FOREIGN KEY (`Feedid`) REFERENCES `Feeds` (`Feedid`),
ADD CONSTRAINT `MappingFeedandPills_ibfk_2` FOREIGN KEY (`Pillid`) REFERENCES `Pills` (`Pillid`);

--
-- Constraints for table `MeetingAgenda`
--
ALTER TABLE `MeetingAgenda`
ADD CONSTRAINT `MeetingAgenda_ibfk_1` FOREIGN KEY (`Submeetingid`) REFERENCES `MeetingChild` (`Submeetingid`);

--
-- Constraints for table `MeetingChild`
--
ALTER TABLE `MeetingChild`
ADD CONSTRAINT `MeetingChild_ibfk_1` FOREIGN KEY (`Meetingid`) REFERENCES `MeetingMaster` (`Meetingid`),
ADD CONSTRAINT `MeetingChild_ibfk_2` FOREIGN KEY (`Meetingincharge`) REFERENCES `UserInfo` (`Userid`),
ADD CONSTRAINT `MeetingChild_ibfk_3` FOREIGN KEY (`Meetingtrainer`) REFERENCES `UserInfo` (`Userid`);

--
-- Constraints for table `MeetingContent`
--
ALTER TABLE `MeetingContent`
ADD CONSTRAINT `MeetingContent_ibfk_2` FOREIGN KEY (`Createdby`) REFERENCES `UserInfo` (`Userid`),
ADD CONSTRAINT `MeetingContent_ibfk_3` FOREIGN KEY (`Updatedby`) REFERENCES `UserInfo` (`Userid`);

--
-- Constraints for table `MeetingMaster`
--
ALTER TABLE `MeetingMaster`
ADD CONSTRAINT `MeetingMaster_ibfk_1` FOREIGN KEY (`Createdby`) REFERENCES `UserInfo` (`Userid`),
ADD CONSTRAINT `MeetingMaster_ibfk_2` FOREIGN KEY (`Updatedby`) REFERENCES `UserInfo` (`Userid`);

--
-- Constraints for table `Notes`
--
ALTER TABLE `Notes`
ADD CONSTRAINT `Notes_ibfk_1` FOREIGN KEY (`Meetingid`) REFERENCES `MeetingMaster` (`Meetingid`);

--
-- Constraints for table `Participant`
--
ALTER TABLE `Participant`
ADD CONSTRAINT `Participant_ibfk_1` FOREIGN KEY (`Userid`) REFERENCES `UserInfo` (`Userid`),
ADD CONSTRAINT `Participant_ibfk_2` FOREIGN KEY (`Meetingid`) REFERENCES `MeetingMaster` (`Meetingid`);

--
-- Constraints for table `QuestionBank`
--
ALTER TABLE `QuestionBank`
ADD CONSTRAINT `QuestionBank_ibfk_1` FOREIGN KEY (`Submeetingid`) REFERENCES `MeetingChild` (`Submeetingid`);

--
-- Constraints for table `Task`
--
ALTER TABLE `Task`
ADD CONSTRAINT `Task_ibfk_1` FOREIGN KEY (`Meetingid`) REFERENCES `MeetingMaster` (`Meetingid`),
ADD CONSTRAINT `Task_ibfk_2` FOREIGN KEY (`AssignedTo`) REFERENCES `UserInfo` (`Userid`),
ADD CONSTRAINT `Task_ibfk_3` FOREIGN KEY (`Assignedby`) REFERENCES `UserInfo` (`Userid`);

--
-- Constraints for table `UserInfo`
--
ALTER TABLE `UserInfo`
ADD CONSTRAINT `UserInfo_ibfk_1` FOREIGN KEY (`Roleid`) REFERENCES `UserRole` (`Roleid`),
ADD CONSTRAINT `UserInfo_ibfk_2` FOREIGN KEY (`Devisionid`) REFERENCES `Devision` (`Devisionid`);

--
-- Constraints for table `Video`
--
ALTER TABLE `Video`
ADD CONSTRAINT `Video_ibfk_1` FOREIGN KEY (`Meetingid`) REFERENCES `MeetingMaster` (`Meetingid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
