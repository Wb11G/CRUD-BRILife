-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 21, 2023 at 04:36 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `DBINVENTORI`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int(10) UNSIGNED NOT NULL,
  `kd_brg` varchar(5) NOT NULL,
  `nama_brg` varchar(255) NOT NULL,
  `satuan` varchar(255) NOT NULL,
  `qty` int(11) DEFAULT 0,
  `harga` int(11) DEFAULT 0,
  `stok_min` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `kd_brg`, `nama_brg`, `satuan`, `qty`, `harga`, `stok_min`, `created_at`, `updated_at`) VALUES
(2, 'OK123', 'Nantangin JRG', 'PCS', 123, 120000, 1, '2023-02-20 06:15:43', '2023-02-20 06:15:43'),
(4, 'A0001', 'KOMPUTER', 'PCS', 4, 4000000, 2, '2023-02-20 16:43:08', '2023-02-20 16:43:08'),
(5, 'A0002', 'HUB', 'PCS', 4, 4000000, 2, '2023-02-20 16:43:27', '2023-02-20 16:43:27'),
(6, 'B0001', 'MODEM', 'PCS', 5, 1400000, 3, '2023-02-20 16:44:10', '2023-02-20 16:44:10');

-- --------------------------------------------------------

--
-- Table structure for table `barang_suplier`
--

CREATE TABLE `barang_suplier` (
  `id` int(10) UNSIGNED NOT NULL,
  `kd_sup` varchar(255) NOT NULL,
  `kd_brg` varchar(255) NOT NULL,
  `harga` int(11) DEFAULT 0,
  `discount` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang_suplier`
--

INSERT INTO `barang_suplier` (`id`, `kd_sup`, `kd_brg`, `harga`, `discount`, `created_at`, `updated_at`) VALUES
(1, 'SIP13', 'OK123', 13000, 80, '2023-02-20 06:18:57', '2023-02-20 06:18:57'),
(2, 'S0001', 'A0001', 4000000, 5, '2023-02-21 03:29:05', '2023-02-21 03:29:05'),
(3, 'S0001', 'A0002', 2300000, 0, '2023-02-21 03:31:11', '2023-02-21 03:31:11'),
(4, 'S0002', 'B0001', 1400000, 0, '2023-02-21 03:31:11', '2023-02-21 03:31:11'),
(5, 'S0004', 'A0001', 4000000, 2, '2023-02-21 03:34:34', '2023-02-21 03:34:34');

-- --------------------------------------------------------

--
-- Table structure for table `knex_migrations`
--

CREATE TABLE `knex_migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `batch` int(11) DEFAULT NULL,
  `migration_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `knex_migrations`
--

INSERT INTO `knex_migrations` (`id`, `name`, `batch`, `migration_time`) VALUES
(1, '20230220044340_barang.js', 1, '2023-02-20 05:08:20'),
(2, '20230220044407_supplier.js', 2, '2023-02-20 05:08:23'),
(3, '20230220044417_barang_supplier.js', 3, '2023-02-20 05:09:21'),
(4, '20230220044424_po.js', 4, '2023-02-20 05:10:48'),
(5, '20230220044428_po_detail.js', 5, '2023-02-20 05:11:02'),
(6, '20230220074013_users.js', 6, '2023-02-20 07:43:43');

-- --------------------------------------------------------

--
-- Table structure for table `knex_migrations_lock`
--

CREATE TABLE `knex_migrations_lock` (
  `index` int(10) UNSIGNED NOT NULL,
  `is_locked` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `knex_migrations_lock`
--

INSERT INTO `knex_migrations_lock` (`index`, `is_locked`) VALUES
(1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `po`
--

CREATE TABLE `po` (
  `id` int(10) UNSIGNED NOT NULL,
  `kt_trans` varchar(5) NOT NULL,
  `tgl_trans` date DEFAULT current_timestamp(),
  `kd_sup` varchar(255) NOT NULL,
  `userid` varchar(255) NOT NULL,
  `total_item` int(11) DEFAULT 0,
  `total_harga` int(11) DEFAULT 0,
  `discount` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `po`
--

INSERT INTO `po` (`id`, `kt_trans`, `tgl_trans`, `kd_sup`, `userid`, `total_item`, `total_harga`, `discount`, `created_at`, `updated_at`) VALUES
(1, 'TRX12', '2023-02-20', 'SIP13', 'user01', 123, 666000, 45000, '2023-02-20 06:25:32', '2023-02-20 06:25:32'),
(2, 'TRX13', '2023-02-20', 'SIP13', 'user11', 123, 666000, 45000, '2023-02-20 16:16:35', '2023-02-20 16:16:35');

-- --------------------------------------------------------

--
-- Table structure for table `po_detail`
--

CREATE TABLE `po_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `kt_trans` varchar(255) NOT NULL,
  `kd_brg` varchar(255) NOT NULL,
  `qty` int(11) DEFAULT 0,
  `harga` int(11) DEFAULT 0,
  `discount` int(11) DEFAULT 0,
  `total_discount` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `po_detail`
--

INSERT INTO `po_detail` (`id`, `kt_trans`, `kd_brg`, `qty`, `harga`, `discount`, `total_discount`, `created_at`, `updated_at`) VALUES
(1, 'TRX12', 'OK123', 123, 666000, 12, 333000, '2023-02-20 06:30:30', '2023-02-20 06:30:30');

-- --------------------------------------------------------

--
-- Table structure for table `suplier`
--

CREATE TABLE `suplier` (
  `id` int(10) UNSIGNED NOT NULL,
  `kd_sup` varchar(5) NOT NULL,
  `nama_sup` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `kota` varchar(255) NOT NULL,
  `telp` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pic` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suplier`
--

INSERT INTO `suplier` (`id`, `kd_sup`, `nama_sup`, `alamat`, `kota`, `telp`, `email`, `pic`, `created_at`, `updated_at`) VALUES
(2, 'SIP13', 'Azek Anjay', 'di alam sana', 'akhirat', '080022132423', 'azek.ajah@ngimel.com', 'paijo ajah', '2023-02-20 06:16:00', '2023-02-20 06:16:00'),
(3, 'S0001', 'PT.ANDARA MAKMUR SEJATI', 'JL.BILANGAN TIMURO 10', 'JAKARTA', '021827383', 'HRD@AMS.CO.ID', 'BAKRI', '2023-02-20 16:46:47', '2023-02-20 16:46:47'),
(4, 'S0002', 'CV.MAJU BRSAMA', 'CV.MAJU BRSAMA', 'BEKASI', '021.44353', '-', 'AHMAD', '2023-02-20 17:17:34', '2023-02-20 17:17:34'),
(5, 'S0004', 'PT.KUMARA JAYA', 'JL.ISKANDAR ', 'JAKARTA', '021783384', ' MAP@KUMARAJAYA.CO.ID', 'KUMARA', '2023-02-21 03:33:49', '2023-02-21 03:33:49');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` enum('Y','N') NOT NULL DEFAULT 'Y',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_id`, `password`, `status`, `created_at`, `updated_at`) VALUES
(2, 'BRILife1', '3digit', 'Y', '2023-02-20 16:42:09', '2023-02-20 16:42:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `barang_kd_brg_unique` (`kd_brg`),
  ADD KEY `kd_brg_idx` (`kd_brg`);

--
-- Indexes for table `barang_suplier`
--
ALTER TABLE `barang_suplier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barang_suplier_kd_sup_foreign` (`kd_sup`),
  ADD KEY `barang_suplier_kd_brg_foreign` (`kd_brg`);

--
-- Indexes for table `knex_migrations`
--
ALTER TABLE `knex_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `knex_migrations_lock`
--
ALTER TABLE `knex_migrations_lock`
  ADD PRIMARY KEY (`index`);

--
-- Indexes for table `po`
--
ALTER TABLE `po`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `po_kt_trans_unique` (`kt_trans`),
  ADD KEY `po_kd_sup_foreign` (`kd_sup`),
  ADD KEY `kt_trans_idx` (`kt_trans`);

--
-- Indexes for table `po_detail`
--
ALTER TABLE `po_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `po_detail_kt_trans_foreign` (`kt_trans`),
  ADD KEY `po_detail_kd_brg_foreign` (`kd_brg`);

--
-- Indexes for table `suplier`
--
ALTER TABLE `suplier`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `suplier_kd_sup_unique` (`kd_sup`),
  ADD KEY `kd_sup_idx` (`kd_sup`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_user_id_unique` (`user_id`),
  ADD KEY `credential_auth_idx` (`user_id`,`password`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `barang_suplier`
--
ALTER TABLE `barang_suplier`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `knex_migrations`
--
ALTER TABLE `knex_migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `knex_migrations_lock`
--
ALTER TABLE `knex_migrations_lock`
  MODIFY `index` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `po`
--
ALTER TABLE `po`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `po_detail`
--
ALTER TABLE `po_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `suplier`
--
ALTER TABLE `suplier`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang_suplier`
--
ALTER TABLE `barang_suplier`
  ADD CONSTRAINT `barang_suplier_kd_brg_foreign` FOREIGN KEY (`kd_brg`) REFERENCES `barang` (`kd_brg`),
  ADD CONSTRAINT `barang_suplier_kd_sup_foreign` FOREIGN KEY (`kd_sup`) REFERENCES `suplier` (`kd_sup`);

--
-- Constraints for table `po`
--
ALTER TABLE `po`
  ADD CONSTRAINT `po_kd_sup_foreign` FOREIGN KEY (`kd_sup`) REFERENCES `suplier` (`kd_sup`);

--
-- Constraints for table `po_detail`
--
ALTER TABLE `po_detail`
  ADD CONSTRAINT `po_detail_kd_brg_foreign` FOREIGN KEY (`kd_brg`) REFERENCES `barang` (`kd_brg`),
  ADD CONSTRAINT `po_detail_kt_trans_foreign` FOREIGN KEY (`kt_trans`) REFERENCES `po` (`kt_trans`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
