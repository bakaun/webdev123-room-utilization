-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2024 at 03:05 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `room_utilization`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('student','teacher','admin') NOT NULL,
  `is_staff` tinyint(1) NOT NULL DEFAULT 1,
  `is_admin` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `first_name`, `last_name`, `username`, `password`, `role`, `is_staff`, `is_admin`) VALUES
(1, 'Rhamirl', 'Jaafar', 'rham', '$2y$10$42jGvgsU9zoKdFwm18wqQe0nzO78jZvk1m1vMvx8BJYsLTHPuBaCa', 'admin', 1, 1),
(2, 'aziz', 'amin', 'amin123', '$2y$10$snPP2mhvYzbHhLYvQNqtcODt/ISqzoVkxK/THlbFFn26SFZ9yOT7u', 'student', 1, 1),
(5, 'first', 'teacher', 'teacher1', '$2y$10$mvrv6cbnYmTAwXO.lK6UxevwEWqjCdk5bSMi1EJVt.8P2fD0BGMXO', 'teacher', 1, 0),
(6, 'second', 'teacher', 'teacher2', '$2y$10$cInqcsJW1Wh6mqDji3OO1eXC6nEtUE0AF6D3Ha1XPn0qdYbRD..S.', 'teacher', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Toys'),
(2, 'Gadget');

-- --------------------------------------------------------

--
-- Table structure for table `class_day`
--

CREATE TABLE `class_day` (
  `id` int(11) NOT NULL,
  `week_day` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday','') NOT NULL,
  `class_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `class_day`
--

INSERT INTO `class_day` (`id`, `week_day`, `class_id`) VALUES
(1, 'Monday', 5),
(2, 'Monday', 6);

-- --------------------------------------------------------

--
-- Table structure for table `class_details`
--

CREATE TABLE `class_details` (
  `id` int(11) NOT NULL,
  `class_name` varchar(255) NOT NULL,
  `room_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `teacher_assigned` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `class_details`
--

INSERT INTO `class_details` (`id`, `class_name`, `room_id`, `subject_id`, `teacher_assigned`) VALUES
(8, 'CS1A', 1, 1, 1),
(9, 'CS1A', 1, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `class_list`
--

CREATE TABLE `class_list` (
  `id` int(11) NOT NULL,
  `section_name` varchar(255) NOT NULL,
  `course` enum('BSCS','BSIT','ACT') NOT NULL,
  `year_level` enum('1','2','3','4','5') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `class_list`
--

INSERT INTO `class_list` (`id`, `section_name`, `course`, `year_level`) VALUES
(1, 'CS1A', 'BSCS', '1'),
(2, 'CS1B', 'BSCS', '1'),
(3, 'CS1C', 'BSCS', '1'),
(4, 'IT1A', 'BSIT', '1'),
(5, 'IT1B', 'BSIT', '1'),
(6, 'IT1C', 'BSIT', '1'),
(7, 'ACT1A', 'ACT', '1');

-- --------------------------------------------------------

--
-- Table structure for table `class_time`
--

CREATE TABLE `class_time` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `time_modified` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `class_time`
--

INSERT INTO `class_time` (`id`, `class_id`, `start_time`, `end_time`, `time_modified`) VALUES
(5, 8, '07:00:00', '09:00:00', '2024-11-26 10:32:46'),
(6, 9, '09:00:00', '12:00:00', '2024-11-26 10:32:46');

-- --------------------------------------------------------

--
-- Table structure for table `faculty_list`
--

CREATE TABLE `faculty_list` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faculty_list`
--

INSERT INTO `faculty_list` (`id`, `account_id`, `fname`, `lname`) VALUES
(1, 6, 'first', 'teacher'),
(2, 6, 'second', 'teacher');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_ai` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `code`, `name`, `category_id`, `price`, `created_at`, `updated_ai`) VALUES
(1, 'A001', 'Tree', 1, 1.00, '2024-11-14 01:25:30', '2024-11-14 01:25:30'),
(2, 'A002', 'Tree', 1, 1.00, '2024-11-14 03:44:45', '2024-11-14 03:44:45');

-- --------------------------------------------------------

--
-- Table structure for table `room_list`
--

CREATE TABLE `room_list` (
  `id` int(11) NOT NULL,
  `room_name` varchar(50) NOT NULL,
  `room_type` varchar(255) NOT NULL,
  `room_no` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room_list`
--

INSERT INTO `room_list` (`id`, `room_name`, `room_type`, `room_no`, `created_at`, `updated_at`) VALUES
(1, 'LR 1', 'LR', '1', '2024-11-17 14:09:21', '2024-11-17 14:09:21'),
(2, 'LR 2', 'LR', '2', '2024-11-17 14:09:56', '2024-11-17 14:09:56');

-- --------------------------------------------------------

--
-- Table structure for table `room_status`
--

CREATE TABLE `room_status` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `_status` varchar(255) NOT NULL,
  `time_modified` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room_status`
--

INSERT INTO `room_status` (`id`, `class_id`, `room_id`, `_status`, `time_modified`) VALUES
(2, 8, 1, 'OCCUPIED', '2024-11-26 11:54:39'),
(3, 9, 1, 'OCCUPIED', '2024-11-26 12:11:00');

-- --------------------------------------------------------

--
-- Table structure for table `room_type`
--

CREATE TABLE `room_type` (
  `id` int(11) NOT NULL,
  `room_description` varchar(255) NOT NULL,
  `room_code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room_type`
--

INSERT INTO `room_type` (`id`, `room_description`, `room_code`) VALUES
(1, 'Lecture Room', 'LR'),
(2, 'Laboratory Room', 'LAB');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` enum('0','1') NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `status`) VALUES
('1', 'AVAILABLE'),
('0', 'OCCUPIED');

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `status` varchar(100) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`id`, `product_id`, `quantity`, `status`, `reason`, `created_at`, `updated_at`) VALUES
(1, 1, 24, 'in', '', '2024-11-14 05:44:33', '2024-11-14 05:44:33'),
(2, 1, 24, 'out', 'Sold 24', '2024-11-14 05:57:57', '2024-11-14 05:57:57'),
(13, 1, 24, 'in', '', '2024-11-14 07:04:35', '2024-11-14 07:04:35');

-- --------------------------------------------------------

--
-- Table structure for table `subject_details`
--

CREATE TABLE `subject_details` (
  `id` int(11) NOT NULL,
  `subject_code` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `subject_type` enum('LEC','LAB') NOT NULL,
  `time_modified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subject_details`
--

INSERT INTO `subject_details` (`id`, `subject_code`, `description`, `subject_type`, `time_modified`) VALUES
(1, 'CC103', 'Data Structures and Algorithm', 'LEC', '2024-11-26 09:57:51'),
(2, 'CC103', 'Data Structures and Algorithm', 'LAB', '2024-11-26 09:57:51'),
(3, 'CC100', 'Introduction to Computing Studies', 'LEC', '2024-11-26 09:58:26'),
(4, 'CC100', 'Introduction to Computing Studies', 'LAB', '2024-11-26 09:58:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `first_name` (`first_name`,`last_name`) USING BTREE;

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `class_day`
--
ALTER TABLE `class_day`
  ADD PRIMARY KEY (`id`),
  ADD KEY `classtimeid_fk` (`class_id`);

--
-- Indexes for table `class_details`
--
ALTER TABLE `class_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subject_id` (`subject_id`),
  ADD KEY `facultyid_fk` (`teacher_assigned`),
  ADD KEY `classname_fk` (`class_name`),
  ADD KEY `classroomid_fk` (`room_id`);

--
-- Indexes for table `class_list`
--
ALTER TABLE `class_list`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `class_name` (`section_name`);

--
-- Indexes for table `class_time`
--
ALTER TABLE `class_time`
  ADD PRIMARY KEY (`id`),
  ADD KEY `classid_fk` (`class_id`);

--
-- Indexes for table `faculty_list`
--
ALTER TABLE `faculty_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accountid_fk` (`account_id`),
  ADD KEY `name` (`fname`,`lname`) USING BTREE;

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `cat_idfk` (`category_id`);

--
-- Indexes for table `room_list`
--
ALTER TABLE `room_list`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `room_no` (`room_no`),
  ADD UNIQUE KEY `room_name` (`room_name`),
  ADD KEY `roomtype_fk` (`room_type`);

--
-- Indexes for table `room_status`
--
ALTER TABLE `room_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `class_id` (`class_id`),
  ADD KEY `status_fk` (`_status`),
  ADD KEY `status_roomid_fk` (`room_id`);

--
-- Indexes for table `room_type`
--
ALTER TABLE `room_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `room_type` (`room_code`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `status` (`status`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productid_fk` (`product_id`);

--
-- Indexes for table `subject_details`
--
ALTER TABLE `subject_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_details` (`subject_code`,`subject_type`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `class_day`
--
ALTER TABLE `class_day`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `class_details`
--
ALTER TABLE `class_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `class_list`
--
ALTER TABLE `class_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `class_time`
--
ALTER TABLE `class_time`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `faculty_list`
--
ALTER TABLE `faculty_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `room_list`
--
ALTER TABLE `room_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `room_status`
--
ALTER TABLE `room_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `room_type`
--
ALTER TABLE `room_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `subject_details`
--
ALTER TABLE `subject_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `class_day`
--
ALTER TABLE `class_day`
  ADD CONSTRAINT `classtimeid_fk` FOREIGN KEY (`class_id`) REFERENCES `class_time` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `class_details`
--
ALTER TABLE `class_details`
  ADD CONSTRAINT `classname_fk` FOREIGN KEY (`class_name`) REFERENCES `class_list` (`section_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `classroomid_fk` FOREIGN KEY (`room_id`) REFERENCES `room_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `facultyid_fk` FOREIGN KEY (`teacher_assigned`) REFERENCES `faculty_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `subjectid_fk` FOREIGN KEY (`subject_id`) REFERENCES `subject_details` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `class_time`
--
ALTER TABLE `class_time`
  ADD CONSTRAINT `classid_fk` FOREIGN KEY (`class_id`) REFERENCES `class_details` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `faculty_list`
--
ALTER TABLE `faculty_list`
  ADD CONSTRAINT `accountid_fk` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `name_fk` FOREIGN KEY (`fname`,`lname`) REFERENCES `account` (`first_name`, `last_name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `cat_idfk` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `room_list`
--
ALTER TABLE `room_list`
  ADD CONSTRAINT `roomtype_fk` FOREIGN KEY (`room_type`) REFERENCES `room_type` (`room_code`) ON UPDATE CASCADE;

--
-- Constraints for table `room_status`
--
ALTER TABLE `room_status`
  ADD CONSTRAINT `status_classid_fk` FOREIGN KEY (`class_id`) REFERENCES `class_details` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `status_fk` FOREIGN KEY (`_status`) REFERENCES `status` (`status`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `status_roomid_fk` FOREIGN KEY (`room_id`) REFERENCES `class_details` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stocks`
--
ALTER TABLE `stocks`
  ADD CONSTRAINT `productid_fk` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
