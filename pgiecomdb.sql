-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2020 at 09:49 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.3.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pgiecomdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `audit_log`
--

CREATE TABLE `audit_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `log_date` datetime NOT NULL,
  `log_type` text DEFAULT NULL,
  `log_file` text DEFAULT NULL,
  `fr_table` text DEFAULT NULL,
  `fr_mod` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `country_id` int(11) NOT NULL,
  `iso` text DEFAULT NULL,
  `country_name` text NOT NULL,
  `iso3` text DEFAULT NULL,
  `phonecode` int(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` int(11) NOT NULL,
  `module_group` text DEFAULT NULL,
  `module` text DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `fr_mod` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` text DEFAULT NULL,
  `password` text DEFAULT NULL,
  `fullname` text DEFAULT NULL,
  `user_type_id` int(11) NOT NULL,
  `is_active` tinyint(1) DEFAULT 0,
  `user_id` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `fr_mod` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `fullname`, `user_type_id`, `is_active`, `user_id`, `created_at`, `updated_at`, `fr_mod`) VALUES
(1, 'user1', '$2y$10$RdmlOAPf.LPNqb8AvqE9leqPnasEOAmAERZtYXpNEdH4jUdcptemG', NULL, 0, 0, 0, NULL, NULL, NULL),
(5, 'user2', '$2y$10$GetAQ4qm7q8.d0YSYLWteeG1E3bFu7m0u94oENHugwmnOrGk060ja', NULL, 0, 0, 0, NULL, NULL, NULL),
(6, 'user3', '$2y$10$FYDYA..42Ex6w0xKy1NK0Ow2gCkCxxwZ2TEiXRdoC.rdKO6oYASwO', NULL, 0, 0, 0, NULL, NULL, NULL),
(7, 'user4', '$2y$10$6373IZTPGcWskK/pY3gBWOrW7C5SCzxURVc7XjIWjpc5icQv.ZDqy', NULL, 0, 0, 0, NULL, NULL, NULL),
(8, 'peteAdmin', '$2y$10$D/gp043WINZDAHrdSQOryu8gUfGbYBlv/fDMdkthgmJs3BoTAyKM6', NULL, 0, 0, 0, NULL, NULL, NULL),
(9, 'pentavia6', '$2y$10$j73kucFVhisbDyQRW2llheGpPTo9I/J23Q6V.wMF6WqN/q14YRtRW', NULL, 0, 0, 0, NULL, NULL, NULL),
(10, 'nonie', '$2y$10$msYIPfXgbQz7y/MtlQ9FOeOJMYCZxHfgMzMlMra17w8nK1fz9/GxG', NULL, 0, 0, 0, NULL, NULL, NULL),
(11, 'bino', '$2y$10$bG7FiVoA2FgUTPw.OkPOD.Ki.rWfh6xLnaRaEr0kHvq5pMh18esXO', NULL, 0, 0, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_access_level`
--

CREATE TABLE `user_access_level` (
  `id` int(11) NOT NULL,
  `user_type_id` int(11) DEFAULT NULL,
  `module_id` int(11) DEFAULT NULL,
  `access_read` int(11) DEFAULT NULL,
  `access_write` int(11) DEFAULT NULL,
  `no_access` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `fr_mod` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_types`
--

CREATE TABLE `user_types` (
  `id` int(11) NOT NULL,
  `user_type` text DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `fr_mod` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audit_log`
--
ALTER TABLE `audit_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_users_id` (`user_type_id`);

--
-- Indexes for table `user_access_level`
--
ALTER TABLE `user_access_level`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_ua_user_type_id` (`user_type_id`),
  ADD KEY `FK_ua_modules_id` (`module_id`);

--
-- Indexes for table `user_types`
--
ALTER TABLE `user_types`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audit_log`
--
ALTER TABLE `audit_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user_access_level`
--
ALTER TABLE `user_access_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_types`
--
ALTER TABLE `user_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FK_users_id` FOREIGN KEY (`user_type_id`) REFERENCES `user_types` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `user_access_level`
--
ALTER TABLE `user_access_level`
  ADD CONSTRAINT `FK_ua_modules_id` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ua_user_type_id` FOREIGN KEY (`user_type_id`) REFERENCES `user_types` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
