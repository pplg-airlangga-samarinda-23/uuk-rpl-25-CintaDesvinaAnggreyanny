-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2025 at 01:30 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `posyandu`
--

-- --------------------------------------------------------

--
-- Table structure for table `bayi`
--

CREATE TABLE `bayi` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jenis_kelamin` enum('Perempuan','Laki-laki') NOT NULL,
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bayi`
--

INSERT INTO `bayi` (`id`, `nama`, `tgl_lahir`, `jenis_kelamin`, `created_by`) VALUES
(1, 'Shinobu Desu', '2025-06-06', 'Perempuan', 2),
(2, 'giyu', '2025-05-21', 'Laki-laki', 2);

-- --------------------------------------------------------

--
-- Table structure for table `kader`
--

CREATE TABLE `kader` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `wilayah` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kader`
--

INSERT INTO `kader` (`id`, `user_id`, `nama`, `wilayah`) VALUES
(1, 2, 'Ghani', 'Melati');

-- --------------------------------------------------------

--
-- Table structure for table `pertumbuhan`
--

CREATE TABLE `pertumbuhan` (
  `id` int(11) NOT NULL,
  `bayi_id` int(11) NOT NULL,
  `tanggal_catat` date NOT NULL,
  `berat` decimal(5,2) DEFAULT NULL,
  `tinggi` decimal(5,2) DEFAULT NULL,
  `pencatat_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','kader') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`) VALUES
(1, 'admin', '$2y$10$XK5tH7Pc7KMAcjSMMWPi.uQeU4xlpEf/HNfNRRNtXdI./yk7tmXJW', 'admin'),
(2, 'ghani', '$2y$10$F7XtfYcyHmduom3tQiLVHe7n5htKN.EtV0/WKDHaQyJQKrRQdk8vu', 'kader');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bayi`
--
ALTER TABLE `bayi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `kader`
--
ALTER TABLE `kader`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `pertumbuhan`
--
ALTER TABLE `pertumbuhan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bayi_id` (`bayi_id`),
  ADD KEY `pencatat_by` (`pencatat_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bayi`
--
ALTER TABLE `bayi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kader`
--
ALTER TABLE `kader`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pertumbuhan`
--
ALTER TABLE `pertumbuhan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bayi`
--
ALTER TABLE `bayi`
  ADD CONSTRAINT `bayi_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `kader`
--
ALTER TABLE `kader`
  ADD CONSTRAINT `kader_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pertumbuhan`
--
ALTER TABLE `pertumbuhan`
  ADD CONSTRAINT `pertumbuhan_ibfk_1` FOREIGN KEY (`bayi_id`) REFERENCES `bayi` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pertumbuhan_ibfk_2` FOREIGN KEY (`pencatat_by`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
