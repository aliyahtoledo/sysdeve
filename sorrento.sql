-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 20, 2018 at 08:11 PM
-- Server version: 5.7.17-log
-- PHP Version: 7.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sorrento`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `announcement_id` int(11) NOT NULL,
  `announcement_user_id` int(11) NOT NULL,
  `announcement_dateAdded` datetime NOT NULL,
  `announcement_subject` varchar(128) NOT NULL,
  `announcement_details` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`announcement_id`, `announcement_user_id`, `announcement_dateAdded`, `announcement_subject`, `announcement_details`) VALUES
(12, 1, '2018-08-17 10:29:00', 'Vaccination ', 'Get your kids vaccinated now!'),
(13, 1, '2018-08-20 23:29:02', 'asdasd', 'yy'),
(14, 1, '2018-08-21 02:02:36', 'asdasd', 'asdasd');

-- --------------------------------------------------------

--
-- Table structure for table `balances`
--

CREATE TABLE `balances` (
  `balance_id` int(11) NOT NULL,
  `balance_user_id` int(11) NOT NULL,
  `balance_payment_id` int(11) NOT NULL,
  `balance_unpaidMonths` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `event_id` int(11) NOT NULL,
  `event_user_id` int(11) NOT NULL,
  `event_subject` varchar(128) NOT NULL,
  `event_details` varchar(256) NOT NULL,
  `event_dateFrom` datetime NOT NULL,
  `event_dateTo` datetime NOT NULL,
  `event_dateAdded` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`event_id`, `event_user_id`, `event_subject`, `event_details`, `event_dateFrom`, `event_dateTo`, `event_dateAdded`) VALUES
(1, 1, 'Sports Fest', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer arcu purus, porta dapibus tincidunt ac, maximus quis ex. Cras id tellus ut elit convallis vestibulum quis ut augue', '2018-08-15 00:00:00', '2018-08-17 00:00:00', '2018-08-15 00:00:00'),
(2, 3, 'Bingo!', 'Bingo bingo bingo time na!', '2018-08-17 00:00:00', '2018-08-19 00:00:00', '2018-08-17 00:00:00'),
(3, 3, 'Feeding Program', 'Help the communities in ABC Barangay today!', '2018-08-18 00:00:00', '2018-08-19 00:00:00', '2018-08-17 00:00:00'),
(4, 1, 'asdasd', 'asdasd', '2018-07-31 10:00:00', '2018-07-31 12:00:00', '2018-08-20 22:06:13');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL,
  `feedback_type` varchar(45) NOT NULL,
  `feedback_details` varchar(256) NOT NULL,
  `feedback_resolution` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `household_members`
--

CREATE TABLE `household_members` (
  `household_id` int(11) NOT NULL,
  `household_user_id` int(11) NOT NULL,
  `household_name` varchar(128) NOT NULL,
  `household_birthday` date NOT NULL,
  `household_profession` varchar(45) NOT NULL,
  `household_relation` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `household_members`
--

INSERT INTO `household_members` (`household_id`, `household_user_id`, `household_name`, `household_birthday`, `household_profession`, `household_relation`) VALUES
(1, 1, 'Adrianna Ysabel Jamora', '2001-08-21', 'Student', 'Sister'),
(2, 2, 'Andrea', '1993-10-30', 'Agent', 'Sister'),
(3, 2, 'Markus Martinez', '2018-08-25', 'Student', 'Brother'),
(4, 2, 'Shane Parker', '2018-08-18', 'Student', 'Cousin');

-- --------------------------------------------------------

--
-- Table structure for table `meeting_agenda`
--

CREATE TABLE `meeting_agenda` (
  `agenda_id` int(11) NOT NULL,
  `agenda_subject` varchar(128) NOT NULL,
  `agenda_details` varchar(128) NOT NULL,
  `agenda_location` varchar(128) NOT NULL,
  `agenda_date` date NOT NULL,
  `agenda_isActive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `meeting_confirmations`
--

CREATE TABLE `meeting_confirmations` (
  `confirmation_id` int(11) NOT NULL,
  `confirmation_agenda_id` int(11) NOT NULL,
  `confirmation_user_id` int(11) NOT NULL,
  `confirmation_going` varchar(45) NOT NULL,
  `confirmation_reschedule` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `move_out`
--

CREATE TABLE `move_out` (
  `move_out_id` int(11) NOT NULL,
  `move_out_user_id` int(11) NOT NULL,
  `move_out_date` date NOT NULL,
  `move_out_certificate` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `move_out`
--

INSERT INTO `move_out` (`move_out_id`, `move_out_user_id`, `move_out_date`, `move_out_certificate`) VALUES
(1, 1, '2018-08-18', 0),
(2, 1, '2018-08-18', 1),
(3, 1, '2018-08-31', 0);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `payment_user_id` int(11) NOT NULL,
  `payment_type` varchar(45) NOT NULL,
  `payment_amountPaid` double(6,2) NOT NULL,
  `payment_or` varchar(45) NOT NULL,
  `payment_datePaid` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `payment_user_id`, `payment_type`, `payment_amountPaid`, `payment_or`, `payment_datePaid`) VALUES
(1, 1, 'Membership Fee', 200.00, '1083628', '2018-08-15');

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `reserve_id` int(11) NOT NULL,
  `reserve_user_id` int(11) NOT NULL,
  `reserve_payment_id` int(11) NOT NULL,
  `reserve_type` varchar(45) NOT NULL,
  `reserve_date` date NOT NULL,
  `reserve_timeFrom` time NOT NULL,
  `reserve_timeTo` time NOT NULL,
  `reserve_confirmed` tinyint(1) NOT NULL,
  `reserve_purpose` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`reserve_id`, `reserve_user_id`, `reserve_payment_id`, `reserve_type`, `reserve_date`, `reserve_timeFrom`, `reserve_timeTo`, `reserve_confirmed`, `reserve_purpose`) VALUES
(1, 1, 0, 'Court', '2018-08-15', '13:30:00', '19:30:00', 0, ''),
(2, 1, 0, 'Court', '2018-08-19', '01:00:00', '01:00:00', 0, 'uitufghb'),
(5, 1, 0, 'Court', '2018-08-23', '09:15:00', '13:15:00', 0, 'jhihjb n'),
(6, 1, 0, 'Court', '2018-08-25', '16:00:00', '18:00:00', 0, 'ABCD'),
(7, 1, 0, 'Clubhouse', '2018-08-30', '08:00:00', '11:00:00', 0, 'SADFGHJWK'),
(8, 1, 0, 'Clubhouse', '2018-08-18', '09:30:00', '12:15:00', 0, 'Random');

-- --------------------------------------------------------

--
-- Table structure for table `stickers`
--

CREATE TABLE `stickers` (
  `sticker_id` int(11) NOT NULL,
  `sticker_user_id` int(11) NOT NULL,
  `sticker_payment_id` int(11) DEFAULT NULL,
  `sticker_driver` varchar(128) NOT NULL,
  `sticker_type` varchar(45) NOT NULL,
  `sticker_plateNo` varchar(45) NOT NULL,
  `sticker_number` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stickers`
--

INSERT INTO `stickers` (`sticker_id`, `sticker_user_id`, `sticker_payment_id`, `sticker_driver`, `sticker_type`, `sticker_plateNo`, `sticker_number`) VALUES
(1, 1, NULL, 'denise', '1', 'ABC123', ''),
(2, 1, NULL, 'Denise', '1', 'ABC 123', ''),
(3, 1, NULL, 'Clikus', '1', 'DBV 124', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_firstName` varchar(45) NOT NULL,
  `user_lastName` varchar(45) NOT NULL,
  `user_nationality` varchar(45) NOT NULL,
  `user_birthday` date NOT NULL,
  `user_profession` varchar(45) NOT NULL,
  `user_moveIn` date NOT NULL,
  `user_block` varchar(45) NOT NULL,
  `user_lot` varchar(45) NOT NULL,
  `user_street` varchar(45) NOT NULL,
  `user_type` varchar(45) NOT NULL,
  `user_prevAdd` varchar(256) NOT NULL,
  `user_telNo` varchar(45) NOT NULL,
  `user_mobileNo` varchar(45) NOT NULL,
  `user_email` varchar(45) NOT NULL,
  `user_accountType` varchar(45) NOT NULL,
  `user_username` varchar(45) NOT NULL,
  `user_password` varchar(45) NOT NULL,
  `user_isActive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_firstName`, `user_lastName`, `user_nationality`, `user_birthday`, `user_profession`, `user_moveIn`, `user_block`, `user_lot`, `user_street`, `user_type`, `user_prevAdd`, `user_telNo`, `user_mobileNo`, `user_email`, `user_accountType`, `user_username`, `user_password`, `user_isActive`) VALUES
(1, 'Ivanna Denise', 'Jamora', 'Filipino', '1999-10-30', 'Teacher', '2018-08-08', '1', '1', 'Cattleya', 'Owner', '4420 Montojo St. Brgy. Tejeros Makati City', '7507449', '09173040038', 'denise.jamora@gmail.com', '3', 'denisejamora', '*B52A8112B253BB188D2D9C86E3C85827B55BADDC', 1),
(2, 'Alex Shane', 'Parker', 'American', '1993-10-30', 'Agent', '2018-08-10', '2', '2', 'Corona', 'Tenant', '123 ABC Street, Chino California', '1748264', '09172364719', 'alexparker@gmail.com', '3', 'alexparker', 'alex', 1),
(3, 'Clifford', '0', 'clikus', '2018-08-17', 'IT Consultant', '2018-08-18', '4', '1', 'Apple', '2', '1234 ABC Street 567 Brgy', '0192765', '09173836472', 'clifford@gmail.com', '3', 'clikus', 'clikus', 1),
(4, 'Aliyah', 'Toledo', 'aliyah', '2018-08-19', 'Web Developer', '2018-08-17', '2', '9', 'Cattleya', '1', 'CDE Street 1245 Brgy', '1937462', '09172836451', 'aliyah@gmail.com', '3', 'aliyah', 'aliyah', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`announcement_id`),
  ADD KEY `user_id_idx` (`announcement_user_id`);

--
-- Indexes for table `balances`
--
ALTER TABLE `balances`
  ADD PRIMARY KEY (`balance_id`),
  ADD KEY `user_id_idx` (`balance_user_id`),
  ADD KEY `balance_payment_id_idx` (`balance_payment_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `event_user_id_idx` (`event_user_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`);

--
-- Indexes for table `household_members`
--
ALTER TABLE `household_members`
  ADD PRIMARY KEY (`household_id`),
  ADD KEY `user_id_idx` (`household_user_id`);

--
-- Indexes for table `meeting_agenda`
--
ALTER TABLE `meeting_agenda`
  ADD PRIMARY KEY (`agenda_id`);

--
-- Indexes for table `meeting_confirmations`
--
ALTER TABLE `meeting_confirmations`
  ADD PRIMARY KEY (`confirmation_id`),
  ADD KEY `agenda_id_idx` (`confirmation_agenda_id`),
  ADD KEY `user_id_idx` (`confirmation_user_id`);

--
-- Indexes for table `move_out`
--
ALTER TABLE `move_out`
  ADD PRIMARY KEY (`move_out_id`),
  ADD KEY `user_id_idx` (`move_out_user_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`reserve_id`),
  ADD KEY `user_id_idx` (`reserve_user_id`);

--
-- Indexes for table `stickers`
--
ALTER TABLE `stickers`
  ADD PRIMARY KEY (`sticker_id`),
  ADD KEY `user_id_idx` (`sticker_user_id`),
  ADD KEY `sticker_payment_id_idx` (`sticker_payment_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `announcement_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `balances`
--
ALTER TABLE `balances`
  MODIFY `balance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `household_members`
--
ALTER TABLE `household_members`
  MODIFY `household_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `meeting_agenda`
--
ALTER TABLE `meeting_agenda`
  MODIFY `agenda_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `meeting_confirmations`
--
ALTER TABLE `meeting_confirmations`
  MODIFY `confirmation_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `move_out`
--
ALTER TABLE `move_out`
  MODIFY `move_out_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `reserve_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `stickers`
--
ALTER TABLE `stickers`
  MODIFY `sticker_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `announcements`
--
ALTER TABLE `announcements`
  ADD CONSTRAINT `announcement_user_id` FOREIGN KEY (`announcement_user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `balances`
--
ALTER TABLE `balances`
  ADD CONSTRAINT `balance_payment_id` FOREIGN KEY (`balance_payment_id`) REFERENCES `payments` (`payment_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `balance_user_id` FOREIGN KEY (`balance_user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `event_user_id` FOREIGN KEY (`event_user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `household_members`
--
ALTER TABLE `household_members`
  ADD CONSTRAINT `household_user_id` FOREIGN KEY (`household_user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `meeting_confirmations`
--
ALTER TABLE `meeting_confirmations`
  ADD CONSTRAINT `confirmation_agenda_id` FOREIGN KEY (`confirmation_agenda_id`) REFERENCES `meeting_agenda` (`agenda_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `confirmation_user_id` FOREIGN KEY (`confirmation_user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `move_out`
--
ALTER TABLE `move_out`
  ADD CONSTRAINT `move_out_user_id` FOREIGN KEY (`move_out_user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reserve_user_id` FOREIGN KEY (`reserve_user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stickers`
--
ALTER TABLE `stickers`
  ADD CONSTRAINT `sticker_payment_id` FOREIGN KEY (`sticker_payment_id`) REFERENCES `payments` (`payment_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `sticker_user_id` FOREIGN KEY (`sticker_user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
