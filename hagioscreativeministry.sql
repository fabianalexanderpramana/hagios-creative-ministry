-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 17, 2025 at 03:39 AM
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
-- Table structure for table `hcm_cache`
--

CREATE TABLE `hcm_cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hcm_cache_locks`
--

CREATE TABLE `hcm_cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hcm_failed_jobs`
--

CREATE TABLE `hcm_failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hcm_ibadahs`
--

CREATE TABLE `hcm_ibadahs` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_ibadah` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `waktu` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hcm_ibadahs`
--

INSERT INTO `hcm_ibadahs` (`id`, `nama_ibadah`, `waktu`, `created_at`, `updated_at`) VALUES
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
-- Table structure for table `hcm_jadwals`
--

CREATE TABLE `hcm_jadwals` (
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
  `keterangan` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_tim` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hcm_jadwals`
--

INSERT INTO `hcm_jadwals` (`id`, `id_ibadah`, `tanggal`, `id_videotron`, `id_live_op`, `id_live_cam_1`, `id_live_cam_2`, `id_live_cam_3`, `id_live_cam_4`, `id_live_cam_5`, `id_foto`, `keterangan`, `created_at`, `updated_at`, `id_tim`) VALUES
(1, 1, '2025-10-05', 11, 14, NULL, NULL, NULL, NULL, NULL, 28, NULL, '2025-09-24 20:05:53', '2025-09-30 10:56:44', NULL),
(2, 2, '2025-10-05', 5, 22, NULL, 16, 20, 9, 12, 18, NULL, '2025-09-24 20:59:30', '2025-09-30 10:57:43', NULL),
(3, 3, '2025-10-05', 26, 13, NULL, NULL, NULL, NULL, NULL, 28, NULL, '2025-09-30 10:58:59', '2025-09-30 10:58:59', NULL),
(4, 5, '2025-10-01', 28, 9, NULL, NULL, NULL, NULL, NULL, 21, NULL, '2025-09-30 11:00:25', '2025-09-30 11:00:25', NULL),
(5, 8, '2025-10-02', 11, 6, NULL, NULL, NULL, NULL, NULL, 18, NULL, '2025-09-30 11:00:43', '2025-09-30 11:00:43', NULL),
(6, 4, '2025-10-07', 8, 12, NULL, NULL, NULL, NULL, NULL, 16, NULL, '2025-10-01 23:32:30', '2025-10-01 23:32:30', NULL),
(7, 6, '2025-10-14', 11, 9, NULL, NULL, NULL, NULL, NULL, 21, NULL, '2025-10-01 23:33:07', '2025-10-01 23:33:07', NULL),
(8, 5, '2025-10-15', 28, 9, NULL, NULL, NULL, NULL, NULL, 21, NULL, '2025-10-01 23:33:48', '2025-10-01 23:33:48', NULL),
(9, 7, '2025-10-17', 28, 14, NULL, NULL, NULL, NULL, NULL, 21, NULL, '2025-10-01 23:34:27', '2025-10-01 23:34:27', NULL),
(10, 4, '2025-10-21', 11, 9, NULL, NULL, NULL, NULL, NULL, 28, NULL, '2025-10-01 23:34:57', '2025-10-01 23:34:57', NULL),
(11, 5, '2025-10-29', 28, 9, NULL, NULL, NULL, NULL, NULL, 21, NULL, '2025-10-01 23:35:18', '2025-10-01 23:35:18', NULL),
(15, 1, '2025-10-12', 26, 5, NULL, NULL, NULL, NULL, NULL, 23, NULL, '2025-10-02 20:07:19', '2025-10-02 20:07:19', NULL),
(16, 2, '2025-10-12', 8, 10, NULL, 19, 15, 27, 24, 17, NULL, '2025-10-02 20:08:21', '2025-10-02 20:08:21', NULL),
(17, 3, '2025-10-12', 25, 28, NULL, NULL, NULL, NULL, NULL, 6, NULL, '2025-10-02 20:09:11', '2025-10-02 20:09:11', NULL),
(18, 1, '2025-10-19', 25, 12, NULL, NULL, NULL, NULL, NULL, 21, NULL, '2025-10-02 20:09:59', '2025-10-02 20:09:59', NULL),
(19, 2, '2025-10-19', 20, 22, NULL, 16, 25, 9, 18, 28, NULL, '2025-10-02 20:12:51', '2025-10-02 20:12:51', NULL),
(20, 3, '2025-10-19', 29, 13, NULL, NULL, NULL, NULL, NULL, 26, NULL, '2025-10-02 20:17:43', '2025-10-02 20:17:43', NULL),
(21, 1, '2025-10-26', 11, 9, NULL, NULL, NULL, NULL, NULL, 28, NULL, '2025-10-02 20:18:10', '2025-10-02 20:18:10', NULL),
(22, 2, '2025-10-26', 10, 14, NULL, 19, 15, 20, 12, 17, NULL, '2025-10-02 20:19:04', '2025-10-02 20:19:04', NULL),
(23, 3, '2025-10-26', 25, 6, NULL, NULL, NULL, NULL, NULL, 28, NULL, '2025-10-02 20:19:43', '2025-10-02 20:19:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hcm_jobs`
--

CREATE TABLE `hcm_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hcm_job_batches`
--

CREATE TABLE `hcm_job_batches` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hcm_migrations`
--

CREATE TABLE `hcm_migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hcm_migrations`
--

INSERT INTO `hcm_migrations` (`id`, `migration`, `batch`) VALUES
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
(13, '2025_09_25_031020_add_tanggal_to_jadwals_table', 4),
(15, '2025_10_02_064832_add_pelayan_id_to_users_table', 5),
(16, '2025_10_02_070222_add_role_to_users_table', 5),
(17, '2025_10_02_073923_add_email_to_users_table', 6),
(18, '2025_10_05_033519_create_tims_table', 7),
(19, '2025_10_05_103711_add_id_tim_to_jadwals_table', 8),
(20, '2025_10_05_120000_create_presensis_table', 9),
(21, '2025_11_17_032541_rename_tables_with_hcm_prefix', 10),
(23, '2025_11_17_033051_rename_migrations_table_to_hcm_migrations', 11);

-- --------------------------------------------------------

--
-- Table structure for table `hcm_password_reset_tokens`
--

CREATE TABLE `hcm_password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hcm_password_reset_tokens`
--

INSERT INTO `hcm_password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('fabian.alexander.pramana@gmail.com', '$2y$12$rJpNX2O7u4FavcJxmJD21OchX4rBdty8c9dU3YgmgIHpmcOn6C4Cu', '2025-10-02 02:42:25');

-- --------------------------------------------------------

--
-- Table structure for table `hcm_pelayanans`
--

CREATE TABLE `hcm_pelayanans` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_pelayanan` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hcm_pelayanans`
--

INSERT INTO `hcm_pelayanans` (`id`, `nama_pelayanan`, `created_at`, `updated_at`) VALUES
(1, 'Videotron', '2025-09-12 09:09:43', '2025-09-12 09:09:43'),
(2, 'Live Operator', '2025-09-16 08:53:53', '2025-09-24 21:40:44'),
(3, 'Live Camera', '2025-09-16 09:20:58', '2025-09-24 21:40:39'),
(4, 'Foto', '2025-09-24 21:40:56', '2025-09-30 04:57:15');

-- --------------------------------------------------------

--
-- Table structure for table `hcm_pelayans`
--

CREATE TABLE `hcm_pelayans` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_pelayan` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hcm_pelayans`
--

INSERT INTO `hcm_pelayans` (`id`, `nama_pelayan`, `tgl_lahir`, `created_at`, `updated_at`) VALUES
(1, 'ADMIN', '2000-01-01', '2025-09-16 07:43:26', '2025-09-16 07:43:26'),
(4, 'Fabian', '2004-06-17', '2025-09-16 08:17:15', '2025-09-30 10:53:57'),
(5, 'Caca', '2006-03-18', '2025-09-16 08:53:42', '2025-09-30 10:54:19'),
(6, 'Fanuel', '2009-09-21', '2025-09-16 09:09:15', '2025-09-30 10:39:01'),
(8, 'Aidit', '2003-08-05', '2025-09-30 10:30:13', '2025-09-30 10:30:13'),
(9, 'Ano', '2007-02-18', '2025-09-30 10:31:57', '2025-09-30 10:31:57'),
(10, 'Dian', '2002-04-15', '2025-09-30 10:33:07', '2025-09-30 10:33:30'),
(11, 'Dika', '2004-05-08', '2025-09-30 10:34:51', '2025-09-30 10:34:51'),
(12, 'Endy', '2005-07-27', '2025-09-30 10:35:38', '2025-09-30 10:36:08'),
(13, 'Evelyne', '2006-05-10', '2025-09-30 10:36:54', '2025-09-30 10:37:16'),
(14, 'Iwan', '1982-12-24', '2025-09-30 10:40:11', '2025-09-30 10:40:11'),
(15, 'Jestheo', NULL, '2025-09-30 10:41:05', '2025-09-30 10:41:05'),
(16, 'Joshua G', '2009-01-12', '2025-09-30 10:41:57', '2025-09-30 10:41:57'),
(17, 'Joyce', '2004-05-11', '2025-09-30 10:42:44', '2025-09-30 10:42:44'),
(18, 'M Theo', '2002-02-21', '2025-09-30 10:43:43', '2025-09-30 10:43:43'),
(19, 'Okta', '2008-10-28', '2025-09-30 10:44:13', '2025-09-30 10:44:40'),
(20, 'Raffa', NULL, '2025-09-30 10:45:27', '2025-09-30 10:45:27'),
(21, 'Ryan', '1992-08-11', '2025-09-30 10:47:12', '2025-09-30 10:47:12'),
(22, 'Reren', '2009-04-25', '2025-09-30 10:47:52', '2025-09-30 10:47:52'),
(23, 'Thoms', '1995-11-26', '2025-09-30 10:48:12', '2025-09-30 10:48:54'),
(24, 'Verdy', '2005-05-28', '2025-09-30 10:48:33', '2025-09-30 10:49:18'),
(25, 'Ezra', NULL, '2025-09-30 10:49:48', '2025-09-30 10:49:48'),
(26, 'Yona', '1991-04-20', '2025-09-30 10:52:05', '2025-09-30 10:52:05'),
(27, 'Yusuf P', '2002-03-10', '2025-09-30 10:52:50', '2025-09-30 10:52:50'),
(28, 'Yusuf S', NULL, '2025-09-30 10:53:30', '2025-09-30 10:53:30'),
(29, 'Joshua S', '2004-11-04', '2025-10-02 20:16:35', '2025-10-02 20:16:35');

-- --------------------------------------------------------

--
-- Table structure for table `hcm_pelayan_to_ibadahs`
--

CREATE TABLE `hcm_pelayan_to_ibadahs` (
  `id` bigint UNSIGNED NOT NULL,
  `id_pelayan` bigint UNSIGNED NOT NULL,
  `id_ibadah` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hcm_pelayan_to_ibadahs`
--

INSERT INTO `hcm_pelayan_to_ibadahs` (`id`, `id_pelayan`, `id_ibadah`) VALUES
(1, 5, 1),
(2, 6, 1),
(3, 5, 2),
(4, 4, 1),
(5, 4, 2),
(6, 4, 3),
(11, 4, 8),
(20, 8, 2),
(21, 8, 3),
(22, 8, 4),
(23, 8, 6),
(24, 8, 8),
(25, 9, 1),
(26, 9, 2),
(27, 9, 3),
(28, 9, 4),
(29, 9, 5),
(30, 9, 6),
(31, 9, 8),
(32, 10, 2),
(33, 10, 8),
(34, 11, 1),
(35, 11, 2),
(36, 11, 4),
(37, 11, 6),
(38, 11, 7),
(39, 11, 8),
(40, 12, 1),
(41, 12, 2),
(42, 12, 3),
(43, 12, 4),
(44, 12, 8),
(45, 13, 1),
(46, 13, 2),
(47, 13, 3),
(48, 13, 8),
(49, 6, 2),
(50, 6, 3),
(51, 6, 8),
(52, 14, 1),
(53, 14, 2),
(54, 14, 3),
(55, 14, 7),
(56, 15, 2),
(57, 16, 2),
(58, 16, 3),
(59, 16, 4),
(60, 16, 7),
(61, 17, 2),
(62, 17, 3),
(63, 17, 8),
(64, 18, 2),
(65, 18, 8),
(66, 19, 1),
(67, 19, 2),
(68, 19, 3),
(69, 19, 4),
(70, 19, 5),
(71, 19, 8),
(72, 20, 2),
(73, 20, 3),
(74, 20, 4),
(75, 20, 7),
(76, 20, 8),
(77, 21, 1),
(78, 21, 2),
(79, 21, 3),
(80, 21, 4),
(81, 21, 5),
(82, 21, 6),
(83, 21, 7),
(84, 21, 8),
(85, 22, 2),
(86, 22, 3),
(87, 22, 8),
(88, 23, 1),
(89, 24, 2),
(90, 25, 1),
(91, 25, 3),
(92, 26, 1),
(93, 26, 2),
(94, 26, 3),
(95, 26, 8),
(96, 27, 2),
(97, 27, 8),
(98, 28, 1),
(99, 28, 2),
(100, 28, 3),
(101, 28, 4),
(102, 28, 5),
(103, 28, 6),
(104, 28, 7),
(105, 28, 8),
(106, 25, 2),
(107, 29, 3),
(108, 29, 8);

-- --------------------------------------------------------

--
-- Table structure for table `hcm_pelayan_to_pelayanans`
--

CREATE TABLE `hcm_pelayan_to_pelayanans` (
  `id` bigint UNSIGNED NOT NULL,
  `id_pelayan` bigint UNSIGNED NOT NULL,
  `id_pelayanan` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hcm_pelayan_to_pelayanans`
--

INSERT INTO `hcm_pelayan_to_pelayanans` (`id`, `id_pelayan`, `id_pelayanan`) VALUES
(1, 4, 1),
(2, 5, 1),
(3, 6, 1),
(4, 6, 2),
(5, 4, 2),
(6, 4, 3),
(12, 8, 1),
(13, 9, 2),
(14, 9, 3),
(15, 9, 4),
(16, 10, 1),
(17, 10, 2),
(18, 10, 4),
(19, 11, 1),
(20, 12, 1),
(21, 12, 2),
(22, 12, 3),
(23, 12, 4),
(24, 13, 1),
(25, 13, 2),
(26, 13, 3),
(27, 13, 4),
(28, 6, 3),
(29, 14, 1),
(30, 14, 2),
(31, 14, 3),
(32, 14, 4),
(33, 15, 3),
(34, 16, 3),
(35, 16, 4),
(36, 17, 4),
(37, 18, 3),
(38, 18, 4),
(39, 19, 3),
(40, 20, 1),
(41, 20, 3),
(42, 20, 4),
(43, 21, 4),
(44, 22, 1),
(45, 22, 2),
(46, 23, 4),
(47, 24, 3),
(48, 25, 1),
(49, 25, 3),
(50, 26, 1),
(51, 26, 3),
(52, 26, 4),
(53, 27, 3),
(54, 28, 1),
(55, 28, 2),
(56, 28, 4),
(57, 5, 2),
(58, 29, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hcm_presensis`
--

CREATE TABLE `hcm_presensis` (
  `id` bigint UNSIGNED NOT NULL,
  `id_pelayan` bigint UNSIGNED NOT NULL,
  `id_jadwal` bigint UNSIGNED NOT NULL,
  `status_kehadiran` enum('hadir','terlambat','izin','tidak hadir') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hcm_presensis`
--

INSERT INTO `hcm_presensis` (`id`, `id_pelayan`, `id_jadwal`, `status_kehadiran`, `created_at`, `updated_at`) VALUES
(1, 11, 1, 'hadir', '2025-10-05 09:00:32', '2025-10-05 09:11:08'),
(2, 14, 1, 'hadir', '2025-10-05 09:00:32', '2025-10-05 19:27:33'),
(3, 28, 1, 'hadir', '2025-10-05 09:00:32', '2025-10-05 19:27:34'),
(4, 5, 2, 'hadir', '2025-10-05 09:15:17', '2025-10-05 09:15:17'),
(5, 22, 2, 'terlambat', '2025-10-05 09:15:17', '2025-10-05 19:27:47'),
(6, 16, 2, 'izin', '2025-10-05 09:15:17', '2025-10-05 19:27:47'),
(7, 20, 2, 'tidak hadir', '2025-10-05 09:15:17', '2025-10-05 19:27:47'),
(8, 9, 2, 'hadir', '2025-10-05 09:15:17', '2025-10-05 09:15:17'),
(9, 12, 2, 'hadir', '2025-10-05 09:15:17', '2025-10-05 09:15:17'),
(10, 18, 2, 'hadir', '2025-10-05 09:15:17', '2025-10-05 09:15:17');

-- --------------------------------------------------------

--
-- Table structure for table `hcm_sessions`
--

CREATE TABLE `hcm_sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hcm_sessions`
--

INSERT INTO `hcm_sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('rJBoMizAPF9f2jpNs2AbQ4WyDgEErOLAXhFxGk63', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidmJVNnRraXVsVjRjUGN2Sm14alBXSEYzMDVtc3o2OXJvMWpLRjR5QyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9qYWR3YWxzIjt9fQ==', 1763350430);

-- --------------------------------------------------------

--
-- Table structure for table `hcm_tims`
--

CREATE TABLE `hcm_tims` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_tim` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_ibadah` bigint UNSIGNED NOT NULL,
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
-- Dumping data for table `hcm_tims`
--

INSERT INTO `hcm_tims` (`id`, `nama_tim`, `id_ibadah`, `id_videotron`, `id_live_op`, `id_live_cam_1`, `id_live_cam_2`, `id_live_cam_3`, `id_live_cam_4`, `id_live_cam_5`, `id_foto`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, '1-1A', 1, 11, 6, NULL, NULL, NULL, NULL, NULL, 28, NULL, '2025-10-05 03:09:55', '2025-10-05 03:14:01'),
(2, '1-2A', 2, 5, 22, NULL, 16, 20, 9, 12, 18, NULL, '2025-10-05 03:13:03', '2025-10-05 03:13:03'),
(3, '1-3A', 3, 26, 13, NULL, NULL, NULL, NULL, NULL, 28, NULL, '2025-10-05 03:13:50', '2025-10-05 03:13:50');

-- --------------------------------------------------------

--
-- Table structure for table `hcm_users`
--

CREATE TABLE `hcm_users` (
  `id` bigint UNSIGNED NOT NULL,
  `pelayan_id` bigint UNSIGNED DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` enum('ADMIN','PELAYAN') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PELAYAN',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hcm_users`
--

INSERT INTO `hcm_users` (`id`, `pelayan_id`, `username`, `password`, `remember_token`, `created_at`, `updated_at`, `role`, `email`) VALUES
(1, 1, 'adminhcm', '$2y$12$Jdb3fsS0QG3nxWcS/hzgwuKFRhcaYkeEsdlaeKJc4vpvc1WM0.b8K', NULL, '2025-09-16 07:47:19', '2025-10-02 19:46:38', 'ADMIN', 'hagioscreativeministry@gmail.com'),
(2, 4, 'fabianalexanderrr', '$2y$12$uUNPnlWt/9nWtefjANw24OaNQwSwjaA4uZFWkQ8YlHWtMWBhuNoeK', NULL, '2025-10-02 00:45:12', '2025-10-05 19:03:56', 'PELAYAN', 'fabian.alexander.pramana@gmail.com'),
(3, 5, 'rahelasnk', '$2y$12$a3G.QfxKDo5O.6blBtt07OMkXANxwhoFsEbcPlsLwL.s9HgWnmwP2', 'Thm8B1TV0mMXamqtqlkJ33Bi0avcy5znZ1iAdAO57L5XnmbGFbSlCb2XRnFs', '2025-10-02 19:54:07', '2025-10-02 20:01:33', 'ADMIN', 'rahelasenka@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hcm_cache`
--
ALTER TABLE `hcm_cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `hcm_cache_locks`
--
ALTER TABLE `hcm_cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `hcm_failed_jobs`
--
ALTER TABLE `hcm_failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `hcm_ibadahs`
--
ALTER TABLE `hcm_ibadahs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hcm_jadwals`
--
ALTER TABLE `hcm_jadwals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jadwals_id_ibadah_foreign` (`id_ibadah`),
  ADD KEY `jadwals_id_videotron_foreign` (`id_videotron`),
  ADD KEY `jadwals_id_live_op_foreign` (`id_live_op`),
  ADD KEY `jadwals_id_live_cam_1_foreign` (`id_live_cam_1`),
  ADD KEY `jadwals_id_live_cam_2_foreign` (`id_live_cam_2`),
  ADD KEY `jadwals_id_live_cam_3_foreign` (`id_live_cam_3`),
  ADD KEY `jadwals_id_live_cam_4_foreign` (`id_live_cam_4`),
  ADD KEY `jadwals_id_live_cam_5_foreign` (`id_live_cam_5`),
  ADD KEY `jadwals_id_foto_foreign` (`id_foto`),
  ADD KEY `jadwals_id_tim_foreign` (`id_tim`);

--
-- Indexes for table `hcm_jobs`
--
ALTER TABLE `hcm_jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `hcm_job_batches`
--
ALTER TABLE `hcm_job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hcm_migrations`
--
ALTER TABLE `hcm_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hcm_password_reset_tokens`
--
ALTER TABLE `hcm_password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `hcm_pelayanans`
--
ALTER TABLE `hcm_pelayanans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hcm_pelayans`
--
ALTER TABLE `hcm_pelayans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hcm_pelayan_to_ibadahs`
--
ALTER TABLE `hcm_pelayan_to_ibadahs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pelayan_to_ibadahs_id_pelayan_foreign` (`id_pelayan`),
  ADD KEY `pelayan_to_ibadahs_id_ibadah_foreign` (`id_ibadah`);

--
-- Indexes for table `hcm_pelayan_to_pelayanans`
--
ALTER TABLE `hcm_pelayan_to_pelayanans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pelayan_to_pelayanans_id_pelayan_foreign` (`id_pelayan`),
  ADD KEY `pelayan_to_pelayanans_id_pelayanan_foreign` (`id_pelayanan`);

--
-- Indexes for table `hcm_presensis`
--
ALTER TABLE `hcm_presensis`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `presensis_id_pelayan_id_jadwal_unique` (`id_pelayan`,`id_jadwal`),
  ADD KEY `presensis_id_jadwal_foreign` (`id_jadwal`);

--
-- Indexes for table `hcm_sessions`
--
ALTER TABLE `hcm_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `hcm_tims`
--
ALTER TABLE `hcm_tims`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tims_id_ibadah_foreign` (`id_ibadah`),
  ADD KEY `tims_id_videotron_foreign` (`id_videotron`),
  ADD KEY `tims_id_live_op_foreign` (`id_live_op`),
  ADD KEY `tims_id_live_cam_1_foreign` (`id_live_cam_1`),
  ADD KEY `tims_id_live_cam_2_foreign` (`id_live_cam_2`),
  ADD KEY `tims_id_live_cam_3_foreign` (`id_live_cam_3`),
  ADD KEY `tims_id_live_cam_4_foreign` (`id_live_cam_4`),
  ADD KEY `tims_id_live_cam_5_foreign` (`id_live_cam_5`),
  ADD KEY `tims_id_foto_foreign` (`id_foto`);

--
-- Indexes for table `hcm_users`
--
ALTER TABLE `hcm_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_pelayan_id_foreign` (`pelayan_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hcm_failed_jobs`
--
ALTER TABLE `hcm_failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hcm_ibadahs`
--
ALTER TABLE `hcm_ibadahs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `hcm_jadwals`
--
ALTER TABLE `hcm_jadwals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `hcm_jobs`
--
ALTER TABLE `hcm_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hcm_migrations`
--
ALTER TABLE `hcm_migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `hcm_pelayanans`
--
ALTER TABLE `hcm_pelayanans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `hcm_pelayans`
--
ALTER TABLE `hcm_pelayans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `hcm_pelayan_to_ibadahs`
--
ALTER TABLE `hcm_pelayan_to_ibadahs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `hcm_pelayan_to_pelayanans`
--
ALTER TABLE `hcm_pelayan_to_pelayanans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `hcm_presensis`
--
ALTER TABLE `hcm_presensis`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `hcm_tims`
--
ALTER TABLE `hcm_tims`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `hcm_users`
--
ALTER TABLE `hcm_users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hcm_jadwals`
--
ALTER TABLE `hcm_jadwals`
  ADD CONSTRAINT `jadwals_id_foto_foreign` FOREIGN KEY (`id_foto`) REFERENCES `hcm_pelayans` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `jadwals_id_ibadah_foreign` FOREIGN KEY (`id_ibadah`) REFERENCES `hcm_ibadahs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jadwals_id_live_cam_1_foreign` FOREIGN KEY (`id_live_cam_1`) REFERENCES `hcm_pelayans` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `jadwals_id_live_cam_2_foreign` FOREIGN KEY (`id_live_cam_2`) REFERENCES `hcm_pelayans` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `jadwals_id_live_cam_3_foreign` FOREIGN KEY (`id_live_cam_3`) REFERENCES `hcm_pelayans` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `jadwals_id_live_cam_4_foreign` FOREIGN KEY (`id_live_cam_4`) REFERENCES `hcm_pelayans` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `jadwals_id_live_cam_5_foreign` FOREIGN KEY (`id_live_cam_5`) REFERENCES `hcm_pelayans` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `jadwals_id_live_op_foreign` FOREIGN KEY (`id_live_op`) REFERENCES `hcm_pelayans` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `jadwals_id_tim_foreign` FOREIGN KEY (`id_tim`) REFERENCES `hcm_tims` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `jadwals_id_videotron_foreign` FOREIGN KEY (`id_videotron`) REFERENCES `hcm_pelayans` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `hcm_pelayan_to_ibadahs`
--
ALTER TABLE `hcm_pelayan_to_ibadahs`
  ADD CONSTRAINT `pelayan_to_ibadahs_id_ibadah_foreign` FOREIGN KEY (`id_ibadah`) REFERENCES `hcm_ibadahs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pelayan_to_ibadahs_id_pelayan_foreign` FOREIGN KEY (`id_pelayan`) REFERENCES `hcm_pelayans` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hcm_pelayan_to_pelayanans`
--
ALTER TABLE `hcm_pelayan_to_pelayanans`
  ADD CONSTRAINT `pelayan_to_pelayanans_id_pelayan_foreign` FOREIGN KEY (`id_pelayan`) REFERENCES `hcm_pelayans` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pelayan_to_pelayanans_id_pelayanan_foreign` FOREIGN KEY (`id_pelayanan`) REFERENCES `hcm_pelayanans` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hcm_presensis`
--
ALTER TABLE `hcm_presensis`
  ADD CONSTRAINT `presensis_id_jadwal_foreign` FOREIGN KEY (`id_jadwal`) REFERENCES `hcm_jadwals` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `presensis_id_pelayan_foreign` FOREIGN KEY (`id_pelayan`) REFERENCES `hcm_pelayans` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hcm_tims`
--
ALTER TABLE `hcm_tims`
  ADD CONSTRAINT `tims_id_foto_foreign` FOREIGN KEY (`id_foto`) REFERENCES `hcm_pelayans` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tims_id_ibadah_foreign` FOREIGN KEY (`id_ibadah`) REFERENCES `hcm_ibadahs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tims_id_live_cam_1_foreign` FOREIGN KEY (`id_live_cam_1`) REFERENCES `hcm_pelayans` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tims_id_live_cam_2_foreign` FOREIGN KEY (`id_live_cam_2`) REFERENCES `hcm_pelayans` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tims_id_live_cam_3_foreign` FOREIGN KEY (`id_live_cam_3`) REFERENCES `hcm_pelayans` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tims_id_live_cam_4_foreign` FOREIGN KEY (`id_live_cam_4`) REFERENCES `hcm_pelayans` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tims_id_live_cam_5_foreign` FOREIGN KEY (`id_live_cam_5`) REFERENCES `hcm_pelayans` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tims_id_live_op_foreign` FOREIGN KEY (`id_live_op`) REFERENCES `hcm_pelayans` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tims_id_videotron_foreign` FOREIGN KEY (`id_videotron`) REFERENCES `hcm_pelayans` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `hcm_users`
--
ALTER TABLE `hcm_users`
  ADD CONSTRAINT `users_pelayan_id_foreign` FOREIGN KEY (`pelayan_id`) REFERENCES `hcm_pelayans` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
