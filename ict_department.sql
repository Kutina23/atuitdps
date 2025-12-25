-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 25, 2025 at 10:23 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ict_department`
--

-- --------------------------------------------------------

--
-- Table structure for table `dues`
--

CREATE TABLE `dues` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `level` varchar(255) NOT NULL,
  `academic_year` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dues`
--

INSERT INTO `dues` (`id`, `title`, `amount`, `level`, `academic_year`, `description`, `createdAt`, `updatedAt`) VALUES
(2, 'Lab Fees', 150.00, 'ICT 300', '2024/2025', 'Laboratory usage fees', '0000-00-00 00:00:00', '2025-12-02 00:16:08'),
(3, 'ATUIT DUES ', 105.00, 'ICT 300', '2026/2027', 'This dues is applied to all students in the ICT 300 (HND)', '2025-12-02 00:25:11', '2025-12-02 00:25:11');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `type` enum('image','xml') NOT NULL,
  `content_url` varchar(255) DEFAULT NULL,
  `content_text` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `type`, `content_url`, `content_text`, `createdAt`, `updatedAt`) VALUES
(1, 'xml', NULL, 'Department first genral meeting on the 02/01/2026 at 10:30am', '2025-12-02 00:22:36', '2025-12-02 00:22:36');

-- --------------------------------------------------------

--
-- Table structure for table `faculties`
--

CREATE TABLE `faculties` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `specialization` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `office` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT '/default-avatar.svg',
  `bio` text NOT NULL,
  `qualifications` text NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faculties`
--

INSERT INTO `faculties` (`id`, `name`, `position`, `specialization`, `email`, `phone`, `office`, `image`, `bio`, `qualifications`, `isActive`, `createdAt`, `updatedAt`) VALUES
(1, 'Dr. Sarah Johnson', 'Head of Department', 'Artificial Intelligence & Machine Learning', 'sarah.johnson@ict.edu', '+1 (555) 123-4567', 'ICT Building, Room 301', '👩‍💼', 'Dr. Johnson has over 15 years of experience in AI research and industry applications. She holds a Ph.D. in Computer Science from MIT and has published extensively in top-tier conferences.', '[\"Ph.D. Computer Science, MIT\",\"M.S. Software Engineering, Stanford\",\"B.S. Computer Science, Berkeley\"]', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Prof. Michael Chen', 'Professor of Software Engineering', 'Full-Stack Development & Cloud Computing', 'michael.chen@ict.edu', '+1 (555) 123-4568', 'ICT Building, Room 302', '👨‍💼', 'Prof. Chen brings 20 years of industry experience from leading tech companies. He specializes in scalable software architecture and has led development teams at Microsoft and Google.', '[\"Ph.D. Software Engineering, Carnegie Mellon\",\"M.S. Computer Science, UC Berkeley\",\"B.S. Software Engineering, Waterloo\"]', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Dr. Emily Rodriguez', 'Associate Professor', 'Cybersecurity & Network Administration', 'emily.rodriguez@ict.edu', '+1 (555) 123-4569', 'ICT Building, Room 303', '/uploads/faculty/faculty-1765232666367-115816685.jpg', 'Dr. Rodriguez is a cybersecurity expert with extensive experience in government and private sector security implementations. She holds multiple security certifications and has authored several books on network security.', '\"[\\\"Ph.D. Cybersecurity, Purdue\\\",\\\"M.S. Information Security, NYU\\\",\\\"CISSP, CEH, GSEC Certifications\\\"]\"', 1, '0000-00-00 00:00:00', '2025-12-08 22:24:26'),
(4, 'Prof. David Kim', 'Assistant Professor', 'Data Science & Analytics', 'david.kim@ict.edu', '+1 (555) 123-4570', 'ICT Building, Room 304', '👨‍💼', 'Prof. Kim combines academic research with practical data science applications. His work in predictive analytics and machine learning has been applied in healthcare, finance, and smart city projects.', '[\"Ph.D. Data Science, Northwestern\",\"M.S. Statistics, University of Chicago\",\"B.S. Mathematics, Harvard\"]', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'Dr. Lisa Thompson', 'Senior Lecturer', 'Web Development & User Experience', 'lisa.thompson@ict.edu', '+1 (555) 123-4571', 'ICT Building, Room 305', '/uploads/faculty/faculty-1765232707148-214120326.jpg', 'Dr. Thompson is an expert in modern web technologies and user experience design. She has worked with numerous startups and established companies to create user-centered digital products.', '\"[\\\"Ph.D. Human-Computer Interaction, Georgia Tech\\\",\\\"M.S. Web Development, Full Sail University\\\",\\\"B.S. Graphic Design, RISD\\\"]\"', 1, '0000-00-00 00:00:00', '2025-12-08 22:25:07'),
(6, 'Prof. James Wilson', 'Lecturer', 'Mobile App Development & IoT', 'james.wilson@ict.edu', '+1 (555) 123-4572', 'ICT Building, Room 306', '👨‍💼', 'Prof. Wilson specializes in mobile application development and Internet of Things technologies. He has developed apps with millions of downloads and leads IoT research initiatives.', '[\"M.S. Mobile Computing, KTH Stockholm\",\"B.S. Computer Engineering, ETH Zurich\",\"Google Developer Expert, Apple Certified Developer\"]', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE `partners` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT 'Company/Organization name',
  `logo_url` varchar(500) NOT NULL COMMENT 'URL to partner logo image',
  `website_url` varchar(500) DEFAULT NULL COMMENT 'Partner website URL',
  `description` text DEFAULT NULL COMMENT 'Brief description of the partnership',
  `isActive` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Whether partner should be displayed',
  `sort_order` int(11) NOT NULL DEFAULT 0 COMMENT 'Display order for partners',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `partners`
--

INSERT INTO `partners` (`id`, `name`, `logo_url`, `website_url`, `description`, `isActive`, `sort_order`, `createdAt`, `updatedAt`) VALUES
(1, 'Microsoft', 'https://img-prod-cms-rt-microsoft-com.akamaized.net/cms/api/am/imageFileData/RE1Mu3b', 'https://microsoft.com', 'Technology partner providing software and cloud services', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Google', 'https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png', 'https://google.com', 'Technology partner specializing in search, cloud, and AI technologies', 1, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Amazon', 'https://www.amazon.com/images/I/11Y5er+qnOL._SX331_BO1,204,203,200_.png', 'https://amazon.com', 'E-commerce and cloud computing partner', 1, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Apple', 'https://www.apple.com/ac/globalnav/7/en_US/images/be150f95-20a5-44fb-868e-6ee0c4da53a0/globalnav_link_image___bkcwn7y7zyeq.png', 'https://apple.com', 'Technology partner specializing in mobile devices and software', 1, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'IBM', 'https://www.ibm.com/images/ct-logo-2500x1036-blue-2.png', 'https://ibm.com', 'Technology partner in enterprise solutions and AI', 1, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'Oracle', 'https://www.oracle.com/asset/web/digital-asset/oracle-logo-2.png', 'https://oracle.com', 'Enterprise software and database partner', 1, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `due_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_reference` varchar(255) NOT NULL,
  `payment_method` varchar(255) DEFAULT 'Paystack',
  `date` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `programs`
--

CREATE TABLE `programs` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `duration` varchar(255) NOT NULL,
  `focus` text NOT NULL,
  `highlights` text NOT NULL,
  `isActive` tinyint(1) DEFAULT 1,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `programs`
--

INSERT INTO `programs` (`id`, `name`, `duration`, `focus`, `highlights`, `isActive`, `createdAt`, `updatedAt`) VALUES
(1, 'Higher National Diploma in Information Technology', '3 Years', 'Comprehensive tech education with practical hands-on experience', '\"[\\\"Web Development\\\",\\\"Hardware and Software\\\",\\\"Networking\\\",\\\"Database Management\\\"]\"', 1, '0000-00-00 00:00:00', '2025-12-02 05:13:56'),
(2, 'Advanced Diploma in Information Technology', '2 Years', 'Practical skill development', '\"[\\\"Hands-on Projects\\\",\\\"Industry Mentorship\\\",\\\"Internships\\\"]\"', 1, '0000-00-00 00:00:00', '2025-12-02 05:14:37'),
(3, 'Certification Program in Information Technology', '6-12 Months', 'Specialized skills', '\"[\\\"Quick Upskilling\\\",\\\"Job Ready\\\",\\\"Flexible Schedule\\\"]\"', 1, '0000-00-00 00:00:00', '2025-12-02 05:15:32'),
(4, 'BSc Information Technology', '4 years', 'An advance studies in Bachelor of Science in Inforamtion and Communication Technology.', '\"[\\\"Advance Web Development\\\",\\\"Mobile Apps Development\\\"]\"', 1, '2025-12-02 05:19:57', '2025-12-08 22:13:55'),
(5, 'BSc  Cybersecurity', '2 years Top-Up', 'Top up program for postgradautes', '\"[\\\"Ethical Hacking\\\",\\\"Artificial Intenligence\\\",\\\"Foreisics\\\"]\"', 1, '2025-12-02 05:23:48', '2025-12-02 05:23:48');

-- --------------------------------------------------------

--
-- Table structure for table `student_dues`
--

CREATE TABLE `student_dues` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `due_id` int(11) NOT NULL,
  `amount_paid` decimal(10,2) DEFAULT 0.00,
  `balance` decimal(10,2) NOT NULL,
  `status` enum('Not Paid','Partial','Paid') DEFAULT 'Not Paid',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_dues`
--

INSERT INTO `student_dues` (`id`, `student_id`, `due_id`, `amount_paid`, `balance`, `status`, `createdAt`, `updatedAt`) VALUES
(2, 3, 2, 0.00, 150.00, 'Not Paid', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 4, 3, 0.00, 105.00, 'Not Paid', '2025-12-02 00:25:11', '2025-12-02 00:25:11');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','student','hod') NOT NULL,
  `index_number` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'active',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `index_number`, `level`, `phone`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 'Admin User', 'admin@ict.edu', '$2b$10$amMC4tHp27nuW52NRJFNsuE2y55afDyGllpiOXrm51UTVopc68npG', 'admin', NULL, NULL, NULL, 'active', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Head of Department', 'hod@ict.edu', '$2b$10$HGgq3PWtenOsTnVxOw5eve4gX65ahTVshr9L2RgtQiyiHGJ3LB382', 'hod', NULL, NULL, NULL, 'active', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'John Doe', 'student@ict.edu', '$2b$10$5E.WmOGZdM5iZWUJPjLW1Oxy25DuhHOJkOrh08jBbjgSNhoqAt5cm', 'student', 'ICT/2024/001', 'ICT 200', '0244123456', 'active', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Mathew Kutina', 'mk33274@email.vccs.edu', '$2b$10$syUgmMXooAb9v3yq.Q5GvelYMsdn7cp66OZBwL95RPG3snUqFY0A.', 'student', '1021070029', 'ICT 300', '7036560884', 'active', '2025-12-02 00:15:14', '2025-12-02 00:15:14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dues`
--
ALTER TABLE `dues`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faculties`
--
ALTER TABLE `faculties`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `partners_is_active_sort_order` (`isActive`,`sort_order`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payment_reference` (`payment_reference`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `due_id` (`due_id`);

--
-- Indexes for table `programs`
--
ALTER TABLE `programs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_dues`
--
ALTER TABLE `student_dues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `due_id` (`due_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dues`
--
ALTER TABLE `dues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `faculties`
--
ALTER TABLE `faculties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `programs`
--
ALTER TABLE `programs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `student_dues`
--
ALTER TABLE `student_dues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`due_id`) REFERENCES `dues` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_dues`
--
ALTER TABLE `student_dues`
  ADD CONSTRAINT `student_dues_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_dues_ibfk_2` FOREIGN KEY (`due_id`) REFERENCES `dues` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
