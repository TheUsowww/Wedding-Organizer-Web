-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 17, 2024 at 04:26 PM
-- Server version: 8.0.30
-- PHP Version: 7.4.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_wedding_jwp`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_catalogues`
--

CREATE TABLE `tb_catalogues` (
  `catalogue_id` int NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `package_name` varchar(256) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci NOT NULL,
  `price` int NOT NULL,
  `status_publish` enum('Y','N') COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_catalogues`
--

INSERT INTO `tb_catalogues` (`catalogue_id`, `image`, `package_name`, `description`, `price`, `status_publish`, `user_id`, `created_at`, `updated_at`) VALUES
(3, 'dekorasi pernikahan.jpg', 'PAKET PERNIKAHAN GEDUNG SALAKS 500 TAMU', '<p>Rias dan Busana Pengantin Pria dan Wanita 2 Dekorasi :</p><ol><li>Meja akad</li><li>Kursi akad 6 pcs</li><li>Backdrop akad nikah</li><li>1 Meja Tamu</li><li>1 Buku Tamu 3 Dokumentasi</li></ol><p><span style=\"font-size: 0.875rem; font-weight: initial;\">- Foto </span></p><p><span style=\"font-size: 0.875rem; font-weight: initial;\">- Album Kolase </span></p><p><span style=\"font-size: 0.875rem; font-weight: initial;\">- Flashdisk isi Foto Editing</span><br></p>', 30000000, 'Y', 1, '2024-06-16 16:43:54', '2024-06-16 17:28:24'),
(5, '1.png', 'PAKET PERNIKAHAN GEDUNG KEMBAR 250 TAMU', '<p>Rias dan Busana Pengantin Pria dan Wanita 2 Dekorasi :</p><ol><li>Meja akad</li><li>Kursi akad 6 pcs</li><li>Backdrop akad nikah</li><li>1 Meja Tamu</li><li>1 Buku Tamu 3 Dokumentasi</li></ol><p><span style=\"font-size: 0.875rem; font-weight: initial;\">- Foto</span></p><p><span style=\"font-size: 0.875rem; font-weight: initial;\">- Album Kolase</span></p><p><span style=\"font-size: 0.875rem; font-weight: initial;\">- Flashdisk isi Foto Editing</span></p>', 80000000, 'Y', 1, '2024-06-16 17:30:14', '2024-06-17 13:19:49'),
(7, 'Dekorasi Semarang 123 (11).jpg', 'PAKET PERNIKAHAN GEDUNG KEMBAR 250 TAMU', '<p>Rias dan Busana Pengantin Pria dan Wanita 2 Dekorasi :</p><ol><li>Meja akad</li><li>Kursi akad 6 pcs</li><li>Backdrop akad nikah</li><li>1 Meja Tamu</li><li>1 Buku Tamu 3 Dokumentasi</li></ol><p><span style=\"font-size: 0.875rem; font-weight: initial;\">- Foto</span></p><p><span style=\"font-size: 0.875rem; font-weight: initial;\">- Album Kolase</span></p><p><span style=\"font-size: 0.875rem; font-weight: initial;\">- Flashdisk isi Foto Editing</span></p>', 60000000, 'Y', 1, '2024-06-16 17:30:14', '2024-06-17 16:15:53');

-- --------------------------------------------------------

--
-- Table structure for table `tb_order`
--

CREATE TABLE `tb_order` (
  `order_id` int NOT NULL,
  `catalogue_id` int NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(256) COLLATE utf8mb4_general_ci NOT NULL,
  `phone_number` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `wedding_date` date NOT NULL,
  `status` enum('requested','approved') COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_order`
--

INSERT INTO `tb_order` (`order_id`, `catalogue_id`, `name`, `email`, `phone_number`, `wedding_date`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(5, 7, 'adi', 'adi@gmail.com', '25350535', '2024-06-25', 'approved', 1, '2024-06-17 15:15:46', '2024-06-17 16:01:12'),
(6, 3, 'iya', 'iya@gmail.com', '05154135431', '2024-06-24', 'requested', 0, '2024-06-17 16:18:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_settings`
--

CREATE TABLE `tb_settings` (
  `id` int NOT NULL,
  `website_name` varchar(256) COLLATE utf8mb4_general_ci NOT NULL,
  `phone_number1` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `phone_number2` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `email1` varchar(80) COLLATE utf8mb4_general_ci NOT NULL,
  `email2` varchar(80) COLLATE utf8mb4_general_ci NOT NULL,
  `address` text COLLATE utf8mb4_general_ci NOT NULL,
  `maps` text COLLATE utf8mb4_general_ci NOT NULL,
  `logo` varchar(80) COLLATE utf8mb4_general_ci NOT NULL,
  `facebook_url` varchar(256) COLLATE utf8mb4_general_ci NOT NULL,
  `instagram_url` varchar(256) COLLATE utf8mb4_general_ci NOT NULL,
  `youtube_url` varchar(256) COLLATE utf8mb4_general_ci NOT NULL,
  `header_bussines_hour` varchar(160) COLLATE utf8mb4_general_ci NOT NULL,
  `time_bussines_hour` text COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_settings`
--

INSERT INTO `tb_settings` (`id`, `website_name`, `phone_number1`, `phone_number2`, `email1`, `email2`, `address`, `maps`, `logo`, `facebook_url`, `instagram_url`, `youtube_url`, `header_bussines_hour`, `time_bussines_hour`, `created_at`, `updated_at`) VALUES
(1, 'JeWePe Wedding Organizer', '081112222222', '08211328', 'jwpwo@gmail.com', 'jwpwo2@gmail.com', 'test', '<iframe class=\"w-100 rounded\"\r\n                        src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3001156.4288297426!2d-78.01371936852176!3d42.72876761954724!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4ccc4bf0f123a5a9%3A0xddcfc6c1de189567!2sNew%20York%2C%20USA!5e0!3m2!1sen!2sbd!4v1603794290143!5m2!1sen!2sbd\"\r\n                        frameborder=\"0\" style=\"height: 100%; min-height: 300px; border:0;\" allowfullscreen=\"\" aria-hidden=\"false\"\r\n                        tabindex=\"0\"></iframe>', '20240615_1619510345.png', 'test', 'test', 'test', 'test', 'test', '2024-06-16 08:33:36', '2024-06-16 12:14:20');

-- --------------------------------------------------------

--
-- Table structure for table `tb_users`
--

CREATE TABLE `tb_users` (
  `user_id` int NOT NULL,
  `name` varchar(80) COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(80) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(256) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_users`
--

INSERT INTO `tb_users` (`user_id`, `name`, `username`, `password`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', '$2y$10$RaPhvmFWKNckvdZzx4ajm.xpM2ACudjhuCKy7Rr2GYOVESqy/td9O', '2024-06-14 15:46:31', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_catalogues`
--
ALTER TABLE `tb_catalogues`
  ADD PRIMARY KEY (`catalogue_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tb_order`
--
ALTER TABLE `tb_order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `catalogue_id` (`catalogue_id`);

--
-- Indexes for table `tb_settings`
--
ALTER TABLE `tb_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_users`
--
ALTER TABLE `tb_users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_catalogues`
--
ALTER TABLE `tb_catalogues`
  MODIFY `catalogue_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_order`
--
ALTER TABLE `tb_order`
  MODIFY `order_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_settings`
--
ALTER TABLE `tb_settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_users`
--
ALTER TABLE `tb_users`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_catalogues`
--
ALTER TABLE `tb_catalogues`
  ADD CONSTRAINT `user_id_catalogue_idx` FOREIGN KEY (`user_id`) REFERENCES `tb_users` (`user_id`) ON UPDATE CASCADE;

--
-- Constraints for table `tb_order`
--
ALTER TABLE `tb_order`
  ADD CONSTRAINT `catalogue_id_order_idx` FOREIGN KEY (`catalogue_id`) REFERENCES `tb_catalogues` (`catalogue_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
