-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2025 at 05:17 PM
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
-- Database: `ctechlit_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `type` enum('info','success','warning','error') NOT NULL DEFAULT 'info',
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `link` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `read_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `title`, `message`, `type`, `is_read`, `link`, `created_at`, `read_at`) VALUES
(3, NULL, 'mamaam', 'ammemm', 'info', 1, NULL, '2025-12-01 22:45:40', '2025-12-02 06:45:49');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `duration` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `features` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`features`)),
  `requirements` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`requirements`)),
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `description`, `price`, `duration`, `category`, `features`, `requirements`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Web Development', 'Custom web application development using modern technologies. We build responsive, scalable, and secure web applications tailored to your business needs.', 5000.00, '4-8 weeks', 'Development', '[\"Responsive Design\", \"Modern Framework\", \"Database Integration\", \"API Development\", \"Testing & Deployment\", \"3 Months Support\"]', '[\"Business requirements document\", \"Content and branding materials\", \"Target audience analysis\"]', 'active', '2025-11-30 07:23:38', '2025-11-30 07:23:38'),
(2, 'Mobile App Development', 'Native and cross-platform mobile application development for iOS and Android. We create user-friendly mobile apps that drive engagement and business growth.', 8000.00, '6-12 weeks', 'Development', '[\"iOS & Android Support\", \"Cross-platform Development\", \"UI/UX Design\", \"Backend Integration\", \"App Store Deployment\", \"6 Months Support\"]', '[\"App concept and features\", \"Target platform specification\", \"Design preferences\"]', 'active', '2025-11-30 07:23:38', '2025-11-30 07:23:38'),
(3, 'Cloud Migration', 'Comprehensive cloud migration services to help your business leverage the power of cloud computing for improved scalability and cost efficiency.', 12000.00, '8-12 weeks', 'Infrastructure', '[\"Assessment & Planning\", \"Data Migration\", \"Security Setup\", \"Performance Optimization\", \"Training & Documentation\", \"12 Months Support\"]', '[\"Current infrastructure assessment\", \"Security requirements\", \"Compliance needs\"]', 'active', '2025-11-30 07:23:38', '2025-11-30 07:23:38');

-- --------------------------------------------------------

--
-- Table structure for table `service_requests`
--

CREATE TABLE `service_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `budget` decimal(10,2) DEFAULT NULL,
  `timeline` varchar(100) DEFAULT NULL,
  `requirements` text DEFAULT NULL,
  `status` enum('pending','in_progress','completed','cancelled') NOT NULL DEFAULT 'pending',
  `admin_notes` text DEFAULT NULL,
  `estimated_completion` date DEFAULT NULL,
  `actual_completion` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_requests`
--

INSERT INTO `service_requests` (`id`, `user_id`, `service_id`, `title`, `description`, `budget`, `timeline`, `requirements`, `status`, `admin_notes`, `estimated_completion`, `actual_completion`, `created_at`, `updated_at`) VALUES
(1, 3, 2, 'mmmrrt', 'aaaqqww eee nnmm tthh ..llo9900  yyiii vvvcxx eeee xxzz bvff uuk', 120.00, '3', NULL, 'in_progress', NULL, '2025-12-01', NULL, '2025-12-01 18:49:54', '2025-12-01 23:05:53');

-- --------------------------------------------------------

--
-- Table structure for table `site_content`
--

CREATE TABLE `site_content` (
  `id` int(11) NOT NULL,
  `page` varchar(100) NOT NULL,
  `section` varchar(100) NOT NULL,
  `content_type` enum('text','html','json') NOT NULL DEFAULT 'text',
  `content` text NOT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `media_path` varchar(500) DEFAULT NULL,
  `media_type` enum('image','video','audio','document','other') DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `mime_type` varchar(100) DEFAULT NULL,
  `alt_text` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_content`
--

INSERT INTO `site_content` (`id`, `page`, `section`, `content_type`, `content`, `metadata`, `media_path`, `media_type`, `file_size`, `mime_type`, `alt_text`, `is_active`, `created_at`, `updated_at`) VALUES
(3, 'home', 'hero', 'json', '{\"title\":\"IT SOLUTIONS\",\"subtitle\":\"CONSULTANCY\",\"description\":\"Leading experts in cybersecurity consulting, robotics & AI development, programming education, and IT infrastructure solutions for businesses and educational institutions.\",\"cta_text\":\"GET IT CONSULTATION\"}', '{\"featured\":true,\"background_image\":\"/images/hero-bg.jpg\",\"animation\":\"fade-in-up\"}', NULL, NULL, NULL, NULL, NULL, 1, '2025-12-01 19:13:53', '2025-12-01 19:13:53'),
(4, 'home', 'about', 'json', '{\"title\":\"About CTechLit\",\"description\":\"CTechLit is a leading technology consultancy firm dedicated to helping businesses harness the power of technology to achieve their goals. With over a decade of experience, we provide comprehensive solutions tailored to your unique needs.\",\"features\":[\"Cybersecurity Consulting\",\"Robotics & AI Development\",\"Programming Education\",\"IT Infrastructure Solutions\"]}', '{\"image\":\"/images/about.jpg\",\"stats\":[{\"number\":\"500+\",\"label\":\"Projects Completed\"},{\"number\":\"50+\",\"label\":\"Enterprise Clients\"},{\"number\":\"95%\",\"label\":\"Success Rate\"},{\"number\":\"24/7\",\"label\":\"Technical Support\"}]}', NULL, NULL, NULL, NULL, NULL, 1, '2025-12-01 19:13:53', '2025-12-01 19:13:53'),
(5, 'home', 'stats', 'json', '{\"stats\":[{\"number\":\"500+\",\"label\":\"Projects Completed\"},{\"number\":\"50+\",\"label\":\"Enterprise Clients\"},{\"number\":\"95%\",\"label\":\"Success Rate\"},{\"number\":\"24/7\",\"label\":\"Technical Support\"}]}', '{\"layout\":\"grid\",\"columns\":4}', NULL, NULL, NULL, NULL, NULL, 1, '2025-12-01 19:13:53', '2025-12-01 19:13:53'),
(6, 'home', 'services_intro', 'json', '{\"title\":\"SPECIALIZED\",\"subtitle\":\"SOLUTIONS\",\"description\":\"Comprehensive IT consultancy services tailored for modern businesses and educational institutions\"}', '{\"layout\":\"centered\",\"featured\":true}', NULL, NULL, NULL, NULL, NULL, 1, '2025-12-01 19:13:53', '2025-12-01 19:13:53'),
(12, 'media', 'uploads', 'json', '{\"title\":\"book1.jpeg\",\"description\":\"Books\",\"filename\":\"book1-1764626153555-506172195.jpeg\",\"originalName\":\"book1.jpeg\",\"path\":\"/uploads/book1-1764626153555-506172195.jpeg\"}', '{\"alt\":\"Books\",\"type\":\"image/jpeg\",\"size\":12950,\"filename\":\"book1.jpeg\",\"createdBy\":1,\"uploadedAt\":\"2025-12-01T21:55:53.595Z\",\"originalSize\":12950}', '/uploads/book1-1764626153555-506172195.jpeg', 'image', 12950, 'image/jpeg', 'Books', 1, '2025-12-01 21:55:53', '2025-12-01 21:55:53'),
(13, 'blog', 'featured', 'json', '{\"title\":\"4K.PNG\",\"description\":\"atesting featured image\",\"filename\":\"4K-1764627337527-906225922.PNG\",\"originalName\":\"4K.PNG\",\"path\":\"/uploads/4K-1764627337527-906225922.PNG\"}', '{\"alt\":\"atesting featured image\",\"type\":\"image/png\",\"size\":106874,\"filename\":\"4K.PNG\",\"createdBy\":1,\"isBlogFeatured\":true,\"blogTitle\":\"atesting\",\"uploadedAt\":\"2025-12-01T22:15:37.550Z\",\"originalSize\":106874}', '/uploads/4K-1764627337527-906225922.PNG', 'image', 106874, 'image/png', 'atesting featured image', 1, '2025-12-01 22:15:37', '2025-12-01 22:15:37'),
(14, 'blog', 'posts', 'json', '{\"title\":\"atesting\",\"description\":\"mma dnnd thhth eodo thhekew thhtkldk \",\"slug\":\"a\",\"category\":\"Technology\",\"tags\":[\"pendrive\"],\"excerpt\":\"mma dnnd thhth eodo thhekew thhtkldk \",\"featuredImage\":\"4K-1764627337527-906225922.PNG\",\"featuredImageUrl\":\"\"}', '{\"featured\":false,\"createdBy\":1,\"category\":\"Technology\",\"tags\":[\"pendrive\"],\"hasFeaturedImage\":true,\"featuredImageFilename\":\"4K.PNG\"}', NULL, NULL, NULL, NULL, NULL, 1, '2025-12-01 22:15:37', '2025-12-01 22:15:37');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `role` enum('client','admin') NOT NULL DEFAULT 'client',
  `status` enum('active','inactive','suspended') NOT NULL DEFAULT 'active',
  `failed_login_attempts` int(11) DEFAULT 0,
  `last_login_attempt` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `first_name`, `last_name`, `phone`, `company`, `role`, `status`, `failed_login_attempts`, `last_login_attempt`, `last_login`, `created_at`, `updated_at`) VALUES
(1, 'admin@ctechlit.com', '$2a$12$CMVcxYDYkRx2ukFkdEpsIukXDLYcIG5b72YrYXqHbHtvfSwpyncUK', 'Admin', 'User', NULL, NULL, 'admin', 'active', 0, '2025-12-01 22:58:02', '2025-12-01 22:58:02', '2025-11-30 07:23:38', '2025-12-01 22:58:02'),
(2, 'test@example.com', '$2a$12$3Bvnql/fntetAmEyIB9XEev7RGsNpt0pVKPyZhUTFkWd5ZsOmyMry', 'Test', 'User', NULL, NULL, 'client', 'suspended', 0, NULL, NULL, '2025-11-30 07:36:14', '2025-12-01 18:34:33'),
(3, 'mk33274@email.vccs.edu', '$2a$12$.LcICTc3JmnKTuR2KRSijOF1q6XnDfN1Z.ype8SZ9s3fWvwrByoiG', 'Mathew', 'Kutina', NULL, 'Dr. hilla Limann Technical University', 'client', 'active', 0, '2025-12-01 23:11:17', '2025-12-01 23:11:17', '2025-11-30 07:37:16', '2025-12-01 23:11:17'),
(4, 'CofieRK@state.gov', '$2a$12$m37q7qTBa4wFbOLI5lE0huTqH0iLMXpkJjWC/wRXgl5nvKVqsvBMu', 'Rukmini', 'COFIE', '0302741864', 'U.S. Department of State', 'client', 'active', 0, NULL, NULL, '2025-12-01 18:33:52', '2025-12-01 18:33:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `idx_is_read` (`is_read`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_category` (`category`);

--
-- Indexes for table `service_requests`
--
ALTER TABLE `service_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_service_id` (`service_id`);

--
-- Indexes for table `site_content`
--
ALTER TABLE `site_content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_page_section` (`page`,`section`),
  ADD KEY `idx_media_type` (`media_type`),
  ADD KEY `idx_file_size` (`file_size`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_email` (`email`),
  ADD KEY `idx_role` (`role`),
  ADD KEY `idx_status` (`status`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `service_requests`
--
ALTER TABLE `service_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `site_content`
--
ALTER TABLE `site_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `service_requests`
--
ALTER TABLE `service_requests`
  ADD CONSTRAINT `service_requests_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `service_requests_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
