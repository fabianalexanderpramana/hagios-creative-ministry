-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 25, 2025 at 09:01 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hagioscreativeministry`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ibadahs`
--

CREATE TABLE `ibadahs` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_ibadah` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `waktu` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ibadahs`
--

INSERT INTO `ibadahs` (`id`, `nama_ibadah`, `waktu`, `created_at`, `updated_at`) VALUES
(1, 'Ibadah Raya 1', 'Setiap Hari Minggu, 05.45 WIB', '2025-09-12 09:09:24', '2025-09-24 21:37:03'),
(2, 'Ibadah Raya 2', 'Setiap Hari Minggu, 07.45 WIB', '2025-09-16 09:26:19', '2025-09-24 21:37:14'),
(3, 'Ibadah Raya 3', 'Setiap Hari Minggu, 09.45 WIB', '2025-09-24 21:37:30', '2025-09-24 21:37:30'),
(4, 'Ibadah Pria', 'Selasa 1 dan 3, 18.30 WIB', '2025-09-24 21:38:33', '2025-09-24 21:38:33'),
(5, 'Ibadah Wanita', 'Rabu 1 dan 3, 16.30 WIB', '2025-09-24 21:38:52', '2025-09-24 21:38:52'),
(6, 'Ibadah Lansia', 'Selasa 2, 16.30 WIB', '2025-09-24 21:39:19', '2025-09-24 21:39:19'),
(7, 'Ibadah HCC', 'Jumat 3, 18.00 WIB', '2025-09-24 21:39:39', '2025-09-24 21:39:39'),
(8, 'Hagios Berdoa', 'Kamis 1 atau 4, 17.30 WIB', '2025-09-24 21:40:12', '2025-09-24 21:40:12');

-- --------------------------------------------------------

--
-- Table structure for table `jadwals`
--

CREATE TABLE `jadwals` (
  `id` bigint UNSIGNED NOT NULL,
  `id_ibadah` bigint UNSIGNED NOT NULL,
  `tanggal` date DEFAULT NULL,
  `id_videotron` bigint UNSIGNED DEFAULT NULL,
  `id_live_op` bigint UNSIGNED DEFAULT NULL,
  `id_live_cam_1` bigint UNSIGNED DEFAULT NULL,
  `id_live_cam_2` bigint UNSIGNED DEFAULT NULL,
  `id_live_cam_3` bigint UNSIGNED DEFAULT NULL,
  `id_live_cam_4` bigint UNSIGNED DEFAULT NULL,
  `id_live_cam_5` bigint UNSIGNED DEFAULT NULL,
  `id_foto` bigint UNSIGNED DEFAULT NULL,
  `keterangan` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jadwals`
--

INSERT INTO `jadwals` (`id`, `id_ibadah`, `tanggal`, `id_videotron`, `id_live_op`, `id_live_cam_1`, `id_live_cam_2`, `id_live_cam_3`, `id_live_cam_4`, `id_live_cam_5`, `id_foto`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 1, '2025-09-27', 6, 5, NULL, 5, 6, 6, 5, 6, NULL, '2025-09-24 20:05:53', '2025-09-24 20:21:03'),
(2, 2, '2025-09-28', 5, 5, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2025-09-24 20:59:30', '2025-09-24 20:59:30');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_09_12_154524_create_pelayans_table', 1),
(5, '2025_09_12_154529_create_pelayanans_table', 1),
(6, '2025_09_12_154535_create_ibadahs_table', 1),
(7, '2025_09_12_154539_create_jadwals_table', 1),
(8, '2025_09_12_154546_create_pelayan_to_pelayanans_table', 1),
(9, '2025_09_12_154551_create_pelayan_to_ibadahs_table', 1),
(10, '2025_09_16_143727_add_pelayan_id_to_users_table', 2),
(11, '2025_09_16_144439_add_username_to_users_table', 2),
(12, '2025_09_16_144628_remove_name_from_users_table', 3),
(13, '2025_09_25_031020_add_tanggal_to_jadwals_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pelayanans`
--

CREATE TABLE `pelayanans` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_pelayanan` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pelayanans`
--

INSERT INTO `pelayanans` (`id`, `nama_pelayanan`, `created_at`, `updated_at`) VALUES
(1, 'Videotron', '2025-09-12 09:09:43', '2025-09-12 09:09:43'),
(2, 'Live Operator', '2025-09-16 08:53:53', '2025-09-24 21:40:44'),
(3, 'Live Camera', '2025-09-16 09:20:58', '2025-09-24 21:40:39'),
(4, 'Foto', '2025-09-24 21:40:56', '2025-09-24 21:40:56');

-- --------------------------------------------------------

--
-- Table structure for table `pelayans`
--

CREATE TABLE `pelayans` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_pelayan` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pelayans`
--

INSERT INTO `pelayans` (`id`, `nama_pelayan`, `tgl_lahir`, `created_at`, `updated_at`) VALUES
(1, 'ADMIN', '2000-01-01', '2025-09-16 07:43:26', '2025-09-16 07:43:26'),
(4, 'Fabian', '2025-09-16', '2025-09-16 08:17:15', '2025-09-16 09:17:34'),
(5, 'Caca', '2025-09-07', '2025-09-16 08:53:42', '2025-09-16 08:53:42'),
(6, 'Fanuel', '2025-09-02', '2025-09-16 09:09:15', '2025-09-16 09:09:15');

-- --------------------------------------------------------

--
-- Table structure for table `pelayan_to_ibadahs`
--

CREATE TABLE `pelayan_to_ibadahs` (
  `id` bigint UNSIGNED NOT NULL,
  `id_pelayan` bigint UNSIGNED NOT NULL,
  `id_ibadah` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pelayan_to_ibadahs`
--

INSERT INTO `pelayan_to_ibadahs` (`id`, `id_pelayan`, `id_ibadah`, `created_at`, `updated_at`) VALUES
(1, 5, 1, NULL, NULL),
(2, 6, 1, NULL, NULL),
(3, 5, 2, NULL, NULL),
(4, 4, 1, NULL, NULL),
(5, 4, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pelayan_to_pelayanans`
--

CREATE TABLE `pelayan_to_pelayanans` (
  `id` bigint UNSIGNED NOT NULL,
  `id_pelayan` bigint UNSIGNED NOT NULL,
  `id_pelayanan` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pelayan_to_pelayanans`
--

INSERT INTO `pelayan_to_pelayanans` (`id`, `id_pelayan`, `id_pelayanan`, `created_at`, `updated_at`) VALUES
(1, 4, 1, NULL, NULL),
(2, 5, 1, NULL, NULL),
(3, 6, 1, NULL, NULL),
(4, 6, 2, NULL, NULL),
(5, 4, 2, NULL, NULL),
(6, 4, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('AxrW2SGydCgUOejIIblV98XJ2Ik0ezmWHxbEJgOo', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiekt3Smg3c0xwMXBGNEw4d1VHOFA2eVRNU3lFMVdWZHNxQmFZNEtBciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wZWxheWFucyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1758783901),
('C5mJuNAyPtaUGj0JuHNgRxqHHOqwpYOoOqaMer40', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiaVlVa2tNTEtiVDRGdkhxd0pDMFVJSnpDbGVDM3o1UXY4dWp2WVJlcyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9mb3Jnb3QtcGFzc3dvcmQiO31zOjM6InVybCI7YToxOntzOjg6ImludGVuZGVkIjtzOjI5OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvamFkd2FscyI7fX0=', 1758783644),
('X6YfssA4D8rHco4iCfJYsV1qPGRjxF7pr73KZ6hv', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiMXVtdXhsSVlQOFpkYlhOaWdVaE9iRnlIZEhVaGh3ZjBYR3kzRTZ2ZyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9qYWR3YWxzIjt9czozOiJ1cmwiO2E6MDp7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1758782460);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `pelayan_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `pelayan_id`) VALUES
(1, 'adminhcm', NULL, '$2y$12$Jdb3fsS0QG3nxWcS/hzgwuKFRhcaYkeEsdlaeKJc4vpvc1WM0.b8K', NULL, '2025-09-16 07:47:19', '2025-09-16 07:47:19', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `ibadahs`
--
ALTER TABLE `ibadahs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jadwals`
--
ALTER TABLE `jadwals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jadwals_id_ibadah_foreign` (`id_ibadah`),
  ADD KEY `jadwals_id_videotron_foreign` (`id_videotron`),
  ADD KEY `jadwals_id_live_op_foreign` (`id_live_op`),
  ADD KEY `jadwals_id_live_cam_1_foreign` (`id_live_cam_1`),
  ADD KEY `jadwals_id_live_cam_2_foreign` (`id_live_cam_2`),
  ADD KEY `jadwals_id_live_cam_3_foreign` (`id_live_cam_3`),
  ADD KEY `jadwals_id_live_cam_4_foreign` (`id_live_cam_4`),
  ADD KEY `jadwals_id_live_cam_5_foreign` (`id_live_cam_5`),
  ADD KEY `jadwals_id_foto_foreign` (`id_foto`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `pelayanans`
--
ALTER TABLE `pelayanans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pelayans`
--
ALTER TABLE `pelayans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pelayan_to_ibadahs`
--
ALTER TABLE `pelayan_to_ibadahs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pelayan_to_ibadahs_id_pelayan_foreign` (`id_pelayan`),
  ADD KEY `pelayan_to_ibadahs_id_ibadah_foreign` (`id_ibadah`);

--
-- Indexes for table `pelayan_to_pelayanans`
--
ALTER TABLE `pelayan_to_pelayanans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pelayan_to_pelayanans_id_pelayan_foreign` (`id_pelayan`),
  ADD KEY `pelayan_to_pelayanans_id_pelayanan_foreign` (`id_pelayanan`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD KEY `users_pelayan_id_foreign` (`pelayan_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ibadahs`
--
ALTER TABLE `ibadahs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `jadwals`
--
ALTER TABLE `jadwals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `pelayanans`
--
ALTER TABLE `pelayanans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pelayans`
--
ALTER TABLE `pelayans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pelayan_to_ibadahs`
--
ALTER TABLE `pelayan_to_ibadahs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pelayan_to_pelayanans`
--
ALTER TABLE `pelayan_to_pelayanans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jadwals`
--
ALTER TABLE `jadwals`
  ADD CONSTRAINT `jadwals_id_foto_foreign` FOREIGN KEY (`id_foto`) REFERENCES `pelayans` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `jadwals_id_ibadah_foreign` FOREIGN KEY (`id_ibadah`) REFERENCES `ibadahs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jadwals_id_live_cam_1_foreign` FOREIGN KEY (`id_live_cam_1`) REFERENCES `pelayans` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `jadwals_id_live_cam_2_foreign` FOREIGN KEY (`id_live_cam_2`) REFERENCES `pelayans` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `jadwals_id_live_cam_3_foreign` FOREIGN KEY (`id_live_cam_3`) REFERENCES `pelayans` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `jadwals_id_live_cam_4_foreign` FOREIGN KEY (`id_live_cam_4`) REFERENCES `pelayans` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `jadwals_id_live_cam_5_foreign` FOREIGN KEY (`id_live_cam_5`) REFERENCES `pelayans` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `jadwals_id_live_op_foreign` FOREIGN KEY (`id_live_op`) REFERENCES `pelayans` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `jadwals_id_videotron_foreign` FOREIGN KEY (`id_videotron`) REFERENCES `pelayans` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `pelayan_to_ibadahs`
--
ALTER TABLE `pelayan_to_ibadahs`
  ADD CONSTRAINT `pelayan_to_ibadahs_id_ibadah_foreign` FOREIGN KEY (`id_ibadah`) REFERENCES `ibadahs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pelayan_to_ibadahs_id_pelayan_foreign` FOREIGN KEY (`id_pelayan`) REFERENCES `pelayans` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pelayan_to_pelayanans`
--
ALTER TABLE `pelayan_to_pelayanans`
  ADD CONSTRAINT `pelayan_to_pelayanans_id_pelayan_foreign` FOREIGN KEY (`id_pelayan`) REFERENCES `pelayans` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pelayan_to_pelayanans_id_pelayanan_foreign` FOREIGN KEY (`id_pelayanan`) REFERENCES `pelayanans` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_pelayan_id_foreign` FOREIGN KEY (`pelayan_id`) REFERENCES `pelayans` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
