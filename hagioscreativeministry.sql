-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 06, 2025 at 08:32 AM
-- Server version: 10.11.14-MariaDB-cll-lve
-- PHP Version: 8.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hage7191_hagioscreativeministry`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ibadahs`
--

CREATE TABLE `ibadahs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_ibadah` varchar(64) NOT NULL,
  `waktu` varchar(128) NOT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_ibadah` bigint(20) UNSIGNED NOT NULL,
  `tanggal` date DEFAULT NULL,
  `id_videotron` bigint(20) UNSIGNED DEFAULT NULL,
  `id_live_op` bigint(20) UNSIGNED DEFAULT NULL,
  `id_live_cam_1` bigint(20) UNSIGNED DEFAULT NULL,
  `id_live_cam_2` bigint(20) UNSIGNED DEFAULT NULL,
  `id_live_cam_3` bigint(20) UNSIGNED DEFAULT NULL,
  `id_live_cam_4` bigint(20) UNSIGNED DEFAULT NULL,
  `id_live_cam_5` bigint(20) UNSIGNED DEFAULT NULL,
  `id_foto` bigint(20) UNSIGNED DEFAULT NULL,
  `keterangan` varchar(256) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_tim` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jadwals`
--

INSERT INTO `jadwals` (`id`, `id_ibadah`, `tanggal`, `id_videotron`, `id_live_op`, `id_live_cam_1`, `id_live_cam_2`, `id_live_cam_3`, `id_live_cam_4`, `id_live_cam_5`, `id_foto`, `keterangan`, `created_at`, `updated_at`, `id_tim`) VALUES
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
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
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
(13, '2025_09_25_031020_add_tanggal_to_jadwals_table', 4),
(15, '2025_10_02_064832_add_pelayan_id_to_users_table', 5),
(16, '2025_10_02_070222_add_role_to_users_table', 5),
(17, '2025_10_02_073923_add_email_to_users_table', 6),
(18, '2025_10_05_033519_create_tims_table', 7),
(19, '2025_10_05_103711_add_id_tim_to_jadwals_table', 8);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('fabian.alexander.pramana@gmail.com', '$2y$12$rJpNX2O7u4FavcJxmJD21OchX4rBdty8c9dU3YgmgIHpmcOn6C4Cu', '2025-10-02 02:42:25');

-- --------------------------------------------------------

--
-- Table structure for table `pelayanans`
--

CREATE TABLE `pelayanans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_pelayanan` varchar(64) NOT NULL,
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
(4, 'Foto', '2025-09-24 21:40:56', '2025-09-30 04:57:15');

-- --------------------------------------------------------

--
-- Table structure for table `pelayans`
--

CREATE TABLE `pelayans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_pelayan` varchar(64) NOT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pelayans`
--

INSERT INTO `pelayans` (`id`, `nama_pelayan`, `tgl_lahir`, `created_at`, `updated_at`) VALUES
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
-- Table structure for table `pelayan_to_ibadahs`
--

CREATE TABLE `pelayan_to_ibadahs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_pelayan` bigint(20) UNSIGNED NOT NULL,
  `id_ibadah` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pelayan_to_ibadahs`
--

INSERT INTO `pelayan_to_ibadahs` (`id`, `id_pelayan`, `id_ibadah`) VALUES
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
-- Table structure for table `pelayan_to_pelayanans`
--

CREATE TABLE `pelayan_to_pelayanans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_pelayan` bigint(20) UNSIGNED NOT NULL,
  `id_pelayanan` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pelayan_to_pelayanans`
--

INSERT INTO `pelayan_to_pelayanans` (`id`, `id_pelayan`, `id_pelayanan`) VALUES
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
-- Table structure for table `presensis`
--

CREATE TABLE `presensis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_pelayan` bigint(20) UNSIGNED NOT NULL,
  `id_jadwal` bigint(20) UNSIGNED NOT NULL,
  `status_kehadiran` enum('hadir','terlambat','izin','tidak hadir') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `presensis`
--

INSERT INTO `presensis` (`id`, `id_pelayan`, `id_jadwal`, `status_kehadiran`, `created_at`, `updated_at`) VALUES
(1, 11, 1, 'hadir', '2025-10-05 09:00:32', '2025-10-05 09:11:08'),
(2, 14, 1, 'hadir', '2025-10-05 09:00:32', '2025-10-05 09:33:52'),
(3, 28, 1, 'hadir', '2025-10-05 09:00:32', '2025-10-05 09:00:32'),
(4, 5, 2, 'hadir', '2025-10-05 09:15:17', '2025-10-05 10:27:51'),
(5, 22, 2, 'hadir', '2025-10-05 09:15:17', '2025-10-05 09:15:17'),
(6, 16, 2, 'hadir', '2025-10-05 09:15:17', '2025-10-05 09:15:17'),
(7, 20, 2, 'terlambat', '2025-10-05 09:15:17', '2025-10-05 10:28:21'),
(8, 9, 2, 'hadir', '2025-10-05 09:15:17', '2025-10-05 09:15:17'),
(9, 12, 2, 'hadir', '2025-10-05 09:15:17', '2025-10-05 09:15:17'),
(10, 18, 2, 'hadir', '2025-10-05 09:15:17', '2025-10-05 09:15:17');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('5Q0cqFVx3gVgEqCa4AHbTqds3SfErOsIx0DHZrWl', NULL, '49.0.237.214', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5; iPhone) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.3628.24 Safari/537.36 HuaweiCrawler', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUVpPYVR1U0ExUjBwZTdoYWtWSW9ZcU00TXpEa1F6NHNZRjNiMGxSdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDc6Imh0dHBzOi8vbWFpbC5oYWdpb3NjcmVhdGl2ZW1pbmlzdHJ5Lm15LmlkL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1759686493),
('7P5kmgUlJmnac6XAvtkzCwRQOQ6FLe0SATKTB4Kd', NULL, '49.0.237.214', 'Java/1.8.0_322', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiOUZHOWxLMHg5bG1OZHp6TjdvMVdjVjJ5NHQzQkRyOURDR1J6S0gxUiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1759686493),
('8sUgTvQ9d6WEC8RZLiWXVsRZyrbl4uxitU2lmfC0', NULL, '2001:470:1:fb5:74e5:2055:3a7d:3758', 'Mozilla/5.0 (iPad; CPU OS 15_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6,2 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRkdEMHRrV05WWnQ2VWVSc1dZUFczU0t2RXpxSENUZU5JSmxRenUwaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vWzIwMDE6ZGYwOjI3YjoyOjo3OjQzZDddIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1759711194),
('b4StDXuwMqGWER5ZM51Tl1RBF2YdS5DQjLjmk2sV', 1, '182.253.55.67', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiYzBQcnMzdXlCOUo4QndmaHBsYUYyRzJBa0VCdlNiRVJaaWZuVlpqTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHBzOi8vaGFnaW9zY3JlYXRpdmVtaW5pc3RyeS5teS5pZC9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1759685104),
('bp9uQW9WDI8IsYMGzeNrxETNzsFsdQArZmzS2ESt', NULL, '49.0.237.214', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5; iPhone) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.3628.24 Safari/537.36 HuaweiCrawler', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiVmNZNzdidmFtNkdZb3RIR0xwRTZxekV1dUp6aFJubGdwYXYzdVUzUSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo1MToiaHR0cHM6Ly9tYWlsLmhhZ2lvc2NyZWF0aXZlbWluaXN0cnkubXkuaWQvZGFzaGJvYXJkIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vbWFpbC5oYWdpb3NjcmVhdGl2ZW1pbmlzdHJ5Lm15LmlkL2Rhc2hib2FyZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1759686493),
('CH4YawagFgX38qNNrjf3f2Y0iPzB4yjqEJb183JO', 1, '2404:c0:5c10::494:3990', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Mobile Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZzlZZHlyUTdQdjFKazFTem1hN1l5NlpoNmZzVEdkUlJwN2FPVFZSdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHBzOi8vaGFnaW9zY3JlYXRpdmVtaW5pc3RyeS5teS5pZC9qYWR3YWxzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1759714295),
('DY6UAXxwhWoKqyZX0lIxS5jIYKMNb0NPHaR8oxrD', NULL, '202.170.91.69', 'Java/1.8.0_322', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibm5nZ0FLdjdNZnRMZnMwWVExUXZEYW5jNDFMNGVsTDIwVmZWUTd4cyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0MToiaHR0cHM6Ly9tYWlsLmhhZ2lvc2NyZWF0aXZlbWluaXN0cnkubXkuaWQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1759686493),
('Dz245nu8JGp7uZoyt9hb0Go1ATuyCAij85Q1XbjO', NULL, '103.247.9.9', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieG5mN3dTVmtoOTlvZjdYVWV4elBod2h6dDJNYkUwVEg4VHA3QVlTMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9oYWdpb3NjcmVhdGl2ZW1pbmlzdHJ5Lm15LmlkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1759705581),
('ePax501rKAiHbQsXyoAW9QmMX6iTSt1SQIRuxMmH', NULL, '100.25.181.12', 'Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.1.5) Gecko/20091107 Firefox/3.5.5', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQVd2V0lhOGZycWg5UVA2ak5xRWFFaEpyOHZuR1JYREtIdjRGVWtRNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9oYWdpb3NjcmVhdGl2ZW1pbmlzdHJ5Lm15LmlkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1759696156),
('HDldNlGXWTbF9s2zB2DnhJiJvnjzYOW9hMCx8OFe', NULL, '2a06:4882:d000::e7', 'Mozilla/5.0 (compatible; InternetMeasurement/1.0; +https://internet-measurement.com/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUFQyOUFsQ1FhMGRnSlpFQnFiZHBmZnJiUk9BY2ptVEh3aWVacGNNWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vWzIwMDE6ZGYwOjI3YjoyOjo3OjQzZDddIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1759713437),
('HsgSGvN5bQCSa3vNTp6Rgj1WXAbRTTJ8NkZBsGad', 1, '2404:c0:5c10::484:c216', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiM0FqYXJ6RHBSSDQ2cWsyelhiV0lOMGdsUFRMS2tza2FNeGJOeW9CaiI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQxOiJodHRwczovL2hhZ2lvc2NyZWF0aXZlbWluaXN0cnkubXkuaWQvdGltcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1759714223),
('jRJo6mfBC7dkKZzsSL8UnrlibqcexKvZdFJa3mOb', NULL, '2a06:4882:d000::f6', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid3hYeERjRUVXWE5JY1FZd0dTVGdGaHdHdDRFQ2Fab21zUGtac1pSQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHBzOi8vaGFnaW9zY3JlYXRpdmVtaW5pc3RyeS5teS5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1759713453),
('jU7tAq0VPuZyZze1rfwyPyZchgubeZgEat7wGPY8', NULL, '100.25.181.12', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNzVLdFBjUmRmVjU5M0pOQmNyd3cySTNVaEdLRWtscjVNalZ0bkJlOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9oYWdpb3NjcmVhdGl2ZW1pbmlzdHJ5Lm15LmlkL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1759696156),
('K06RC9oZQb7pxkWerdR0LNxtHAjtQloKqwT7mUWt', NULL, '49.0.237.214', 'Java/1.8.0_322', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiY1R1OHpQb2tUNnU0ZG9kRUYydXFGSlVLcUhYQjZUbE56UlU5UW5PVSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1759686493),
('kH4ZuYMdTBZWXF83Gie437XPuSvaZSlJweb1IG5Q', NULL, '49.0.237.214', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5; iPhone) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.3628.24 Safari/537.36 HuaweiCrawler', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWTVFdWNxcGNiaGdDQ2kyeGxXbmlqdkpyS2ZQU0JUR3dKSEhHdGN6RyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHBzOi8vbWFpbC5oYWdpb3NjcmVhdGl2ZW1pbmlzdHJ5Lm15LmlkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1759686493),
('ocmrlHk482dj0KVunnuVaHrnLAgYIn0EjeHpR6M4', NULL, '100.25.181.12', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1664.3 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU1Jjcm1sRm9kUDFnRm5pY2FTYlpYOGJxRUFuUE03eU1qczd0eDk4MCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHBzOi8vaGFnaW9zY3JlYXRpdmVtaW5pc3RyeS5teS5pZC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1759696156),
('QUs15QCw8EcF8taJTUZfaayTp0s0qtF0ZRPctdux', NULL, '100.25.181.12', 'BlackBerry7520/4.0.0 Profile/MIDP-2.0 Configuration/CLDC-1.1 UP.Browser/5.0.3.3 UP.Link/5.1.2.12 (Google WAP Proxy/1.0)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSjBHbkw1Y2l1aGM4cG5YQzhIOVQ4VWw1RktYVFU0TVJhcmlRSm1SRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHBzOi8vaGFnaW9zY3JlYXRpdmVtaW5pc3RyeS5teS5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1759696156),
('r0BrpregB9xFyoUO3hOnWx13gcQxQdWs8NLCGTB4', NULL, '103.247.9.9', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiczdrSTdPaUFxNzdacDdEeFFuNkdyZnZlVlBLZmwyTUhRUUlSSHdFOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9oYWdpb3NjcmVhdGl2ZW1pbmlzdHJ5Lm15LmlkL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1759705581),
('soiBQHg3C7qp3YrEbj4ljug1GkCgOQzmOL4b2wNi', NULL, '103.247.9.9', '', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoialg1R3BCZ1pobm0zN0ZIenB1Zm11aWNjVkQ5SEd6d3RkTlVJNzBTViI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0NToiaHR0cDovL2hhZ2lvc2NyZWF0aXZlbWluaXN0cnkubXkuaWQvZGFzaGJvYXJkIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHA6Ly9oYWdpb3NjcmVhdGl2ZW1pbmlzdHJ5Lm15LmlkL2Rhc2hib2FyZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1759705581),
('sq0ODU6bdQgK5Tja3qDFEWai2cQkZwgHMxqw5fJj', NULL, '100.25.181.12', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_0) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1063.0 Safari/536.3', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoidTBPRFVEdWZTenNEZmh4aDljOWRrMXh0andnZzhka0dBallGQzhyMyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0NToiaHR0cDovL2hhZ2lvc2NyZWF0aXZlbWluaXN0cnkubXkuaWQvZGFzaGJvYXJkIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHA6Ly9oYWdpb3NjcmVhdGl2ZW1pbmlzdHJ5Lm15LmlkL2Rhc2hib2FyZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1759696156),
('VBD8mTVWKsQj0VsBSjGkwvcyrX2SDjhJUUWG9GVp', 3, '2a09:bac1:3480:628::3c2:22', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiczdnTjFNRUtCcTRja2FYY21ES3l2R0hQTGNndUoxRmVOQU11bDJPTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vaGFnaW9zY3JlYXRpdmVtaW5pc3RyeS5teS5pZC9qYWR3YWxzL2NyZWF0ZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjM7fQ==', 1759685468),
('xSNSI2WH2EJ74DrdxgMUvSTNwom6dcuojAmIWDDg', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0', 'YTo4OntzOjY6Il90b2tlbiI7czo0MDoieWdTdkhnVFNPc3dLYlJaOWQyZlI3ZVd2bVlXRVFkOUhFS1JWWjlFbCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI5OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvamFkd2FscyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxNjoiZmlsdGVyX2lkX2liYWRhaCI7TjtzOjEyOiJmaWx0ZXJfYnVsYW4iO3M6MjoiMTAiO3M6MTI6ImZpbHRlcl90YWh1biI7czo0OiIyMDI1Ijt9', 1759665950),
('yvMp0yQIya8gTv4aP1740BH9RHDQCAFhC7citzmQ', NULL, '210.64.24.100', 'Python/3.13 aiohttp/3.12.13', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiOHNQTHZtcWNsZjZiYWY3cGxIZXk5ejVBZVFvY2Myc1R6OUFxV0o3ZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHBzOi8vaGFnaW9zY3JlYXRpdmVtaW5pc3RyeS5teS5pZC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjE6e3M6ODoiaW50ZW5kZWQiO3M6NDY6Imh0dHBzOi8vaGFnaW9zY3JlYXRpdmVtaW5pc3RyeS5teS5pZC9kYXNoYm9hcmQiO319', 1759694877),
('Zk8Mmu0eE3A7eL4h9pxtyI2F30OHnS7g7idl133o', NULL, '100.25.181.12', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiT3lycTI5S2tHTTNnWWxRWDJ2cFlIYUNQVERXYVlNNk03bEhYSFh2RiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0NjoiaHR0cHM6Ly9oYWdpb3NjcmVhdGl2ZW1pbmlzdHJ5Lm15LmlkL2Rhc2hib2FyZCI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQ2OiJodHRwczovL2hhZ2lvc2NyZWF0aXZlbWluaXN0cnkubXkuaWQvZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1759696156);

-- --------------------------------------------------------

--
-- Table structure for table `tims`
--

CREATE TABLE `tims` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_tim` varchar(16) NOT NULL,
  `id_ibadah` bigint(20) UNSIGNED NOT NULL,
  `id_videotron` bigint(20) UNSIGNED DEFAULT NULL,
  `id_live_op` bigint(20) UNSIGNED DEFAULT NULL,
  `id_live_cam_1` bigint(20) UNSIGNED DEFAULT NULL,
  `id_live_cam_2` bigint(20) UNSIGNED DEFAULT NULL,
  `id_live_cam_3` bigint(20) UNSIGNED DEFAULT NULL,
  `id_live_cam_4` bigint(20) UNSIGNED DEFAULT NULL,
  `id_live_cam_5` bigint(20) UNSIGNED DEFAULT NULL,
  `id_foto` bigint(20) UNSIGNED DEFAULT NULL,
  `keterangan` varchar(256) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tims`
--

INSERT INTO `tims` (`id`, `nama_tim`, `id_ibadah`, `id_videotron`, `id_live_op`, `id_live_cam_1`, `id_live_cam_2`, `id_live_cam_3`, `id_live_cam_4`, `id_live_cam_5`, `id_foto`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, '1-1A', 1, 11, 6, NULL, NULL, NULL, NULL, NULL, 28, NULL, '2025-10-05 03:09:55', '2025-10-05 03:14:01'),
(2, '1-2A', 2, 5, 22, NULL, 16, 20, 9, 12, 18, NULL, '2025-10-05 03:13:03', '2025-10-05 03:13:03'),
(3, '1-3A', 3, 26, 13, NULL, NULL, NULL, NULL, NULL, 28, NULL, '2025-10-05 03:13:50', '2025-10-05 03:13:50');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pelayan_id` bigint(20) UNSIGNED DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` enum('ADMIN','PELAYAN') NOT NULL DEFAULT 'PELAYAN',
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `pelayan_id`, `username`, `password`, `remember_token`, `created_at`, `updated_at`, `role`, `email`) VALUES
(1, 1, 'adminhcm', '$2y$12$Jdb3fsS0QG3nxWcS/hzgwuKFRhcaYkeEsdlaeKJc4vpvc1WM0.b8K', NULL, '2025-09-16 07:47:19', '2025-10-02 19:46:38', 'ADMIN', 'hagioscreativeministry@gmail.com'),
(2, 4, 'fabianalexanderrr', '$2y$12$uUNPnlWt/9nWtefjANw24OaNQwSwjaA4uZFWkQ8YlHWtMWBhuNoeK', NULL, '2025-10-02 00:45:12', '2025-10-02 19:46:44', 'ADMIN', 'fabian.alexander.pramana@gmail.com'),
(3, 5, 'rahelasnk', '$2y$12$a3G.QfxKDo5O.6blBtt07OMkXANxwhoFsEbcPlsLwL.s9HgWnmwP2', 'Thm8B1TV0mMXamqtqlkJ33Bi0avcy5znZ1iAdAO57L5XnmbGFbSlCb2XRnFs', '2025-10-02 19:54:07', '2025-10-02 20:01:33', 'ADMIN', 'rahelasenka@gmail.com');

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
  ADD KEY `jadwals_id_foto_foreign` (`id_foto`),
  ADD KEY `jadwals_id_tim_foreign` (`id_tim`);

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
-- Indexes for table `presensis`
--
ALTER TABLE `presensis`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `presensis_id_pelayan_id_jadwal_unique` (`id_pelayan`,`id_jadwal`),
  ADD KEY `presensis_id_jadwal_foreign` (`id_jadwal`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `tims`
--
ALTER TABLE `tims`
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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_pelayan_id_foreign` (`pelayan_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ibadahs`
--
ALTER TABLE `ibadahs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `jadwals`
--
ALTER TABLE `jadwals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `pelayanans`
--
ALTER TABLE `pelayanans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pelayans`
--
ALTER TABLE `pelayans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `pelayan_to_ibadahs`
--
ALTER TABLE `pelayan_to_ibadahs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `pelayan_to_pelayanans`
--
ALTER TABLE `pelayan_to_pelayanans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `presensis`
--
ALTER TABLE `presensis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tims`
--
ALTER TABLE `tims`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  ADD CONSTRAINT `jadwals_id_tim_foreign` FOREIGN KEY (`id_tim`) REFERENCES `tims` (`id`) ON DELETE SET NULL,
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
-- Constraints for table `presensis`
--
ALTER TABLE `presensis`
  ADD CONSTRAINT `presensis_id_jadwal_foreign` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwals` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `presensis_id_pelayan_foreign` FOREIGN KEY (`id_pelayan`) REFERENCES `pelayans` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tims`
--
ALTER TABLE `tims`
  ADD CONSTRAINT `tims_id_foto_foreign` FOREIGN KEY (`id_foto`) REFERENCES `pelayans` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tims_id_ibadah_foreign` FOREIGN KEY (`id_ibadah`) REFERENCES `ibadahs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tims_id_live_cam_1_foreign` FOREIGN KEY (`id_live_cam_1`) REFERENCES `pelayans` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tims_id_live_cam_2_foreign` FOREIGN KEY (`id_live_cam_2`) REFERENCES `pelayans` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tims_id_live_cam_3_foreign` FOREIGN KEY (`id_live_cam_3`) REFERENCES `pelayans` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tims_id_live_cam_4_foreign` FOREIGN KEY (`id_live_cam_4`) REFERENCES `pelayans` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tims_id_live_cam_5_foreign` FOREIGN KEY (`id_live_cam_5`) REFERENCES `pelayans` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tims_id_live_op_foreign` FOREIGN KEY (`id_live_op`) REFERENCES `pelayans` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tims_id_videotron_foreign` FOREIGN KEY (`id_videotron`) REFERENCES `pelayans` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_pelayan_id_foreign` FOREIGN KEY (`pelayan_id`) REFERENCES `pelayans` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
