-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2020 at 07:09 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_pulau_indonesia`
--

-- --------------------------------------------------------

--
-- Table structure for table `islands`
--

CREATE TABLE `islands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `island` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `islands`
--

INSERT INTO `islands` (`id`, `island`, `img`, `slug`, `description`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 'Kalimantan', '1589819053.png', 'kalimantan', 'Kalimantan (toponim: Kalamantan,[1] Calémantan[2][3], Kalémantan[4], Kelamantan, Kilamantan, Klamantan, Klémantan, K\'lemantan, Quallamontan[5]) atau juga disebut Borneo pada zaman kolonial, adalah pulau terbesar ketiga di dunia yang terletak di sebelah utara Pulau Jawa dan di sebelah barat Pulau Sulawesi. Pulau Kalimantan dibagi menjadi wilayah Indonesia (73%), Malaysia (26%), dan Brunei (1%). Pulau Kalimantan terkenal dengan julukan \"Pulau Seribu Sungai\" karena banyaknya sungai yang mengalir di pulau ini.\r\n\r\nLetak Geografi\r\n\r\nLokasi	Asia Tenggara\r\nKoordinat	1°00′N 114°00′E\r\nKepulauan	Kepulauan Sunda Besar\r\nLuas	743.330 km2\r\nPeringkat luas	3\r\nTitik tertinggi	Kinabalu (4.095 m)', 1, '2020-05-18 08:24:13', '2020-05-18 08:24:13'),
(3, 'Papua', '1589819753.png', 'papua', 'Pulau Papua atau Guinea Baru (bahasa Inggris: New Guinea, bahasa Indonesia: Nugini) atau yang dulu disebut dengan Pulau Irian, adalah pulau terbesar kedua (setelah Tanah Hijau) di dunia yang terletak di sebelah utara Australia. Pulau ini dibagi menjadi dua wilayah yang bagian baratnya dikuasai oleh Indonesia dan bagian timurnya merupakan negara Papua Nugini. Di pulau yang bentuknya menyerupai burung cendrawasih ini terletak gunung tertinggi di Indonesia, yaitu Puncak Jaya (4.884 m).\r\n\r\nLetak Geografi\r\n\r\nLokasi	Melanesia\r\nKoordinat	5°20′S 141°36′E\r\nKepulauan	Kepulauan Melayu\r\nLuas	785,753 km2\r\nPeringkat luas	ke-2\r\nTitik tertinggi	Puncak Jaya (4.884 m)', 1, '2020-05-18 08:35:53', '2020-05-18 09:03:56');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2020_05_18_151041_create_islands_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` tinyint(4) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Aswar', 'aswar@aswar.com', NULL, '$2y$10$Z9yOvteEIUC0EbktWTvBOeRobXciwTUjYT7qv24XiJrCV.c3Ro1ay', 1, NULL, '2020-05-18 07:22:40', '2020-05-18 09:03:56');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `islands`
--
ALTER TABLE `islands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `islands_island_unique` (`island`),
  ADD KEY `islands_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `islands`
--
ALTER TABLE `islands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `islands`
--
ALTER TABLE `islands`
  ADD CONSTRAINT `islands_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
