-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 22, 2022 at 03:08 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `feedback`
--

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `subject` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`id`, `name`, `subject`) VALUES
(1, 'pooja', 'science'),
(2, 'harish', 'maths');

-- --------------------------------------------------------

--
-- Table structure for table `finalexammarks`
--

CREATE TABLE `finalexammarks` (
  `student_id` int(11) NOT NULL,
  `user_id_fk` int(11) NOT NULL,
  `course_name` varchar(25) NOT NULL,
  `physics` int(10) NOT NULL,
  `maths` int(10) NOT NULL,
  `chemistry` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `lecturer`
--

CREATE TABLE `lecturer` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `subject` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lecturer`
--

INSERT INTO `lecturer` (`id`, `name`, `subject`) VALUES
(1, 'geeta iyer', 'maths'),
(2, 'harish', 'computer'),
(3, 'janiya', 'english'),
(4, 'ajay', 'social');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_id` int(11) NOT NULL,
  `user_id_fk` int(11) NOT NULL,
  `father_name` varchar(30) NOT NULL,
  `date_of_birth` date NOT NULL,
  `address` varchar(50) NOT NULL,
  `contact_number` bigint(20) NOT NULL,
  `admission_date` date NOT NULL,
  `course_name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `user_id_fk`, `father_name`, `date_of_birth`, `address`, `contact_number`, `admission_date`, `course_name`) VALUES
(109, 109, 'harish', '1977-08-20', 'hasssan', 9945678912, '2021-12-29', 'BCA'),
(110, 110, 'dinesh', '2000-03-03', 'Croog', 9945608912, '2021-12-28', 'BCA'),
(115, 115, 'Darshan', '2000-02-02', 'mysore', 9945698888, '2021-12-29', 'BCA');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `teacher_id` int(4) NOT NULL,
  `user_id_fk` int(11) NOT NULL,
  `education` text NOT NULL,
  `subject` text NOT NULL,
  `experience` int(30) NOT NULL,
  `date_of_birth` date NOT NULL,
  `date_of_join` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`teacher_id`, `user_id_fk`, `education`, `subject`, `experience`, `date_of_birth`, `date_of_join`) VALUES
(111, 111, 'MSc', 'Physics', 4, '2021-12-01', '2012-12-04'),
(112, 112, 'MSc', 'Physics', 4, '2021-12-08', '2021-12-01'),
(113, 113, 'MSc', 'Physics', 4, '0000-00-00', '0000-00-00'),
(114, 114, 'MSc', 'Maths', 4, '0000-00-00', '0000-00-00'),
(117, 117, 'MSc', 'Maths', 4, '0000-00-00', '0000-00-00'),
(119, 119, 'MSc', 'Physics', 4, '0000-00-00', '0000-00-00'),
(121, 121, 'MSc', 'Maths', 6, '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `teachersfeedback`
--

CREATE TABLE `teachersfeedback` (
  `feedback_id` int(11) NOT NULL,
  `understanding` varchar(30) NOT NULL,
  `explaination` varchar(30) NOT NULL,
  `knowledge` varchar(30) NOT NULL,
  `problem_solving` varchar(30) NOT NULL,
  `feedbackText` text NOT NULL,
  `feedback_provider_fk` int(11) NOT NULL,
  `feedback_to_id_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teachersfeedback`
--

INSERT INTO `teachersfeedback` (`feedback_id`, `understanding`, `explaination`, `knowledge`, `problem_solving`, `feedbackText`, `feedback_provider_fk`, `feedback_to_id_fk`) VALUES
(66, '3', '4', '5', '5', 'das', 109, 111),
(67, '4', '4', '6', '6', 'dsd', 109, 112);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `logging_userName` varchar(30) NOT NULL,
  `login_password` varchar(20) NOT NULL,
  `account_type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `logging_userName`, `login_password`, `account_type`) VALUES
(109, 'bindu', 'k', 'bindu', 'Bindu1', 'student'),
(110, 'kavya', 'n', 'kavya', 'Kavya1', 'student'),
(111, 'sapna', 'm', 'sapna', 'Sapna1', 'teacher'),
(112, 'vinod', 'kumar', 'vinod', 'Vinod1', 'teacher'),
(113, 'rekha', 'M G', 'rekha', 'Rekha1', 'teacher'),
(114, 'Rekha', 'M G', 'Rajesh', 'Rajesh1', 'teacher'),
(115, 'vinod', 'K', 'vinod', 'Vinod1', 'student'),
(116, 'Lola', 'D', 'lola', 'Lola11', 'student'),
(117, 'chaitra', 'raj', 'admin', 'Admin2', 'teacher'),
(119, 'Rekha', 'M G', 'rekha', 'Rekha3', 'teacher'),
(121, 'Gopi', 'K', 'gopi', 'Gopik3', 'teacher');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `finalexammarks`
--
ALTER TABLE `finalexammarks`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `user_id_fk` (`user_id_fk`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`teacher_id`),
  ADD KEY `user_id_fk` (`user_id_fk`);

--
-- Indexes for table `teachersfeedback`
--
ALTER TABLE `teachersfeedback`
  ADD PRIMARY KEY (`feedback_id`),
  ADD KEY `feedback_provider_fk` (`feedback_provider_fk`),
  ADD KEY `feedback_to_id_fk` (`feedback_to_id_fk`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `finalexammarks`
--
ALTER TABLE `finalexammarks`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `teachersfeedback`
--
ALTER TABLE `teachersfeedback`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`user_id_fk`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `teacher`
--
ALTER TABLE `teacher`
  ADD CONSTRAINT `teacher_ibfk_2` FOREIGN KEY (`user_id_fk`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `teachersfeedback`
--
ALTER TABLE `teachersfeedback`
  ADD CONSTRAINT `teachersfeedback_ibfk_1` FOREIGN KEY (`feedback_provider_fk`) REFERENCES `student` (`student_id`),
  ADD CONSTRAINT `teachersfeedback_ibfk_2` FOREIGN KEY (`feedback_to_id_fk`) REFERENCES `teacher` (`teacher_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
