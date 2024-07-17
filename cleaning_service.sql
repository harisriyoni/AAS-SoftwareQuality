-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for cleaning_service
CREATE DATABASE IF NOT EXISTS `cleaning_service` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cleaning_service`;

-- Dumping structure for table cleaning_service.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cleaning_service.migrations: ~5 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(2, '2023_01_04_132237_create_roles_table', 1),
	(3, '2023_01_10_141905_create_users_table', 1),
	(4, '2023_01_11_034554_create_produk_table', 1),
	(5, '2023_01_25_074729_create_order_table', 1);

-- Dumping structure for table cleaning_service.order
CREATE TABLE IF NOT EXISTS `order` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `paket` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat_tujuan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pilih_pembayaran` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi_order` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `users_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_users_id_foreign` (`users_id`),
  CONSTRAINT `order_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cleaning_service.order: ~1 rows (approximately)
INSERT INTO `order` (`id`, `paket`, `alamat_tujuan`, `tanggal`, `harga`, `pilih_pembayaran`, `deskripsi_order`, `status`, `image`, `users_id`) VALUES
	(1, 'Rumah Bersih Total', 'babakan redo kec bongas indramayu', '2024-06-12', 'RP.100000', 'Tranfer', 'Pembersihan Mulai dari Halaman Depan,Belakang tengah, Dan Keseluruhan Rumah Mulai dari Kamar dan sebagainya', 'Diterima', 'XAqiuESLXgrL0wGMoukuydDG9wRaBuYgNN6Wwdfs.jpg', 1);

-- Dumping structure for table cleaning_service.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cleaning_service.personal_access_tokens: ~0 rows (approximately)

-- Dumping structure for table cleaning_service.produk
CREATE TABLE IF NOT EXISTS `produk` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `image_produk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga_produk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_produk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produk_user_id_foreign` (`user_id`),
  CONSTRAINT `produk_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cleaning_service.produk: ~1 rows (approximately)
INSERT INTO `produk` (`id`, `image_produk`, `harga_produk`, `nama_produk`, `deskripsi`, `user_id`) VALUES
	(1, 'b8qhjCAy9NeMvfmO47sVTlmz4GaupDqRTVDhA1SM.png', 'RP.100000', 'Rumah Bersih Total', 'Pembersihan Mulai dari Halaman Depan,Belakang tengah, Dan Keseluruhan Rumah Mulai dari Kamar dan sebagainya', 1);

-- Dumping structure for table cleaning_service.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cleaning_service.roles: ~2 rows (approximately)
INSERT INTO `roles` (`id`, `role_name`) VALUES
	(1, 'admin'),
	(2, 'users');

-- Dumping structure for table cleaning_service.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama_lengkap` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_hp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_ktp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_lahir` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cleaning_service.users: ~1 rows (approximately)
INSERT INTO `users` (`id`, `nama_lengkap`, `username`, `password`, `no_hp`, `no_ktp`, `alamat`, `tanggal_lahir`, `email`, `role_id`, `created_at`, `updated_at`) VALUES
	(1, 'Admin Ganteng', 'Admin', '$2y$10$2.6BtJ2MxUE0oSruJfgHmOI5SkHY/8UNvnZtoW1yOtd/GXm97n6je', '085860149271', '3212222804030001', 'Jawa Barat,Indramayu,Kec.Bongas,Desa.Kertajaya,Jl.Babakan Redo', '28-04-2003', 'admin@gmail.com', 1, '2024-06-05 13:47:04', '2024-06-05 13:47:04');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
