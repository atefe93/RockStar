-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 15, 2021 at 03:36 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.2.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `star`
--

-- --------------------------------------------------------

--
-- Table structure for table `kinds`
--

CREATE TABLE `kinds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kinds`
--

INSERT INTO `kinds` (`id`, `product_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 6, 'chocolate chip', '2021-01-09 15:16:32', '2021-01-09 15:16:32'),
(2, 6, 'ginger', '2021-01-09 15:16:32', '2021-01-09 15:16:32'),
(6, 14, 'cho', '2021-01-15 16:03:00', '2021-01-15 16:03:00');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'take away', NULL, NULL),
(2, 'in shop', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2021_01_03_062411_create_products_table', 1),
(9, '2021_01_03_062859_create_orders_table', 1),
(10, '2021_01_03_063037_create_order_details_table', 1),
(11, '2021_01_03_071354_create_option_details_table', 1),
(12, '2021_01_03_071646_create_statuses_table', 1),
(13, '2021_01_06_123004_create_options_table', 2),
(14, '2021_01_06_130951_create_types_table', 2),
(15, '2021_01_06_131051_create_locations_table', 2),
(16, '2021_01_13_060712_create_roles_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('2a3ffff44be5894ce301909fa93b3b74298411ceb9552f57f459eaa6ce275c57a819533a7c4d86f9', 3, 1, 'Football', '[]', 0, '2021-01-14 20:11:23', '2021-01-14 20:11:23', '2022-01-14 12:11:23'),
('5e48186f01a77d1594b031cfeff20dfffd8acfc008c1a4bb771ce5a2832df02d9fb3fcaa780804b7', 2, 1, 'Football', '[]', 0, '2021-01-09 00:03:29', '2021-01-09 00:03:29', '2022-01-08 16:03:29'),
('9d7b302887094bc017071ecea6fd64e1d1431672c089b08a411f04b1327fd577cd89325c1940fbab', 2, 1, 'Football', '[]', 0, '2021-01-06 18:13:10', '2021-01-06 18:13:10', '2022-01-06 10:13:10'),
('9fdd03972c24175bc6bc653c1d0dd7fa2b4d83c7076337b5124a6e3ebcbb86357b31e86a7fa62a38', 6, 1, 'star', '[]', 0, '2021-01-14 21:14:17', '2021-01-14 21:14:17', '2022-01-14 13:14:17'),
('a1e05911684762f79e8397132879d0d755d44f7c9561a560aac5a6576e8e1625e854459e20b7bcaf', 5, 1, 'star', '[]', 0, '2021-01-14 21:04:06', '2021-01-14 21:04:06', '2022-01-14 13:04:06'),
('a4537fda63337803af721276bbfd74dd350400161f46a62bb22debbd916f9cebd166621db3c0b8ca', 4, 1, 'star', '[]', 0, '2021-01-14 20:13:19', '2021-01-14 20:13:19', '2022-01-14 12:13:19'),
('ab220fba903429588db6350aa4b844287eadec08d3995c65890f505f544987b111fb2e67533f1bb2', 7, 1, 'authToken', '[]', 0, '2021-01-14 21:52:56', '2021-01-14 21:52:56', '2022-01-14 13:52:56'),
('ade0c4566634a34f994ba212978a8f92618ef99d51133cdd452f0a4e6ddf0a735d14228cabc15ade', 1, 1, NULL, '[]', 0, '2021-01-06 17:54:29', '2021-01-06 17:54:29', '2022-01-06 09:54:29'),
('f008b5fe2f57a749b7da94f3f90659c2199839ebaab69b7b4af07dae9b61b26abf5b31cae07238c5', 8, 1, 'star', '[]', 0, '2021-01-15 17:06:34', '2021-01-15 17:06:34', '2022-01-15 09:06:34');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', '5S6iwnuWpICm3WVSm3asuF4V0GPubchCL4G2JpM3', 'http://localhost', 1, 0, 0, '2021-01-04 16:19:48', '2021-01-04 16:19:48'),
(2, NULL, 'Laravel Password Grant Client', '0pEMDfwGeBY5sN0JPGhUzaSBGJvHU7FB96MCrGRA', 'http://localhost', 0, 1, 0, '2021-01-04 16:19:48', '2021-01-04 16:19:48');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-01-04 16:19:48', '2021-01-04 16:19:48');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `user_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Milk', NULL, NULL),
(2, 1, 'Size', NULL, NULL),
(3, 1, 'Shots', NULL, NULL),
(4, 1, 'Kind', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `option_details`
--

CREATE TABLE `option_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `option_id` bigint(20) NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `option_details`
--

INSERT INTO `option_details` (`id`, `option_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'skim', NULL, NULL),
(2, 1, 'semi', NULL, NULL),
(3, 1, 'whole', NULL, NULL),
(4, 2, 'small', NULL, NULL),
(5, 2, 'medium', NULL, NULL),
(6, 2, 'large', NULL, NULL),
(7, 3, 'single', NULL, NULL),
(8, 3, 'double', NULL, NULL),
(9, 3, 'triple', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `status_id` bigint(20) NOT NULL,
  `totalPrice` bigint(20) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `status_id`, `totalPrice`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 11000, '2021-01-13 19:16:08', '2021-01-13 19:16:08'),
(2, 2, 1, 17000, '2021-01-13 19:16:48', '2021-01-13 19:16:48'),
(3, 2, 1, 17000, '2021-01-13 19:17:14', '2021-01-13 19:17:14'),
(4, 2, 1, 17000, '2021-01-15 19:40:20', '2021-01-15 19:40:21');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `location_id` bigint(20) NOT NULL,
  `kindOrdetail_id` bigint(20) NOT NULL,
  `count` int(11) NOT NULL,
  `price` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `product_id`, `order_id`, `location_id`, `kindOrdetail_id`, `count`, `price`, `created_at`, `updated_at`) VALUES
(1, 4, 1, 1, 2, 2, 1000, '2021-01-13 19:16:08', '2021-01-13 19:16:08'),
(2, 6, 1, 2, 2, 2, 10000, '2021-01-13 19:16:08', '2021-01-13 19:16:08'),
(3, 3, 2, 1, 2, 2, 7000, '2021-01-13 19:16:48', '2021-01-13 19:16:48'),
(4, 6, 2, 2, 2, 2, 10000, '2021-01-13 19:16:48', '2021-01-13 19:16:48'),
(5, 3, 3, 1, 1, 2, 7000, '2021-01-13 19:17:14', '2021-01-13 19:17:14'),
(6, 6, 3, 2, 2, 2, 10000, '2021-01-13 19:17:14', '2021-01-13 19:17:14'),
(7, 3, 4, 1, 1, 2, 7000, '2021-01-15 19:40:20', '2021-01-15 19:40:20'),
(8, 6, 4, 2, 2, 2, 10000, '2021-01-15 19:40:21', '2021-01-15 19:40:21');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` bigint(20) NOT NULL,
  `option_id` bigint(20) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `user_id`, `name`, `price`, `option_id`, `created_at`, `updated_at`) VALUES
(1, 2, 'Latte', 2000, 1, '2021-01-09 15:11:27', '2021-01-09 15:11:27'),
(2, 2, 'Cappuccino', 3000, 2, '2021-01-09 15:13:07', '2021-01-09 15:13:07'),
(3, 2, 'Espresso', 3500, 3, '2021-01-09 15:13:21', '2021-01-09 15:13:21'),
(4, 2, 'Tea', 500, 0, '2021-01-09 15:13:35', '2021-01-09 15:13:35'),
(5, 2, 'Hot chocolate', 500, 2, '2021-01-09 15:13:45', '2021-01-09 15:13:45'),
(6, 2, 'Kooki', 5000, 4, '2021-01-09 15:16:32', '2021-01-09 15:16:32'),
(14, 2, 'Kollpp', 50000, 4, '2021-01-15 16:03:00', '2021-01-15 16:03:00');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'user', NULL, NULL),
(2, 'Admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'waiting', NULL, NULL),
(2, 'preparation', NULL, NULL),
(3, 'ready', NULL, NULL),
(4, 'delivered', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` tinyint(4) NOT NULL DEFAULT 1,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'atefe', 'nlta.bl@yahoo.com', NULL, '$2y$10$krb/BM5zQi2BbaxV0QaLyujQTWxVpUIZwfzat6zktklPBIhBA206G', NULL, '2021-01-06 17:54:28', '2021-01-06 17:54:28'),
(2, 2, 'atefe', 'a.bl@yahoo.com', NULL, '$2y$10$2LxZnTab7lYmUGhL6ZaSTOcH1ZeRSwLn9UzU38BZw1aN2wB1Chuye', NULL, '2021-01-06 18:13:10', '2021-01-06 18:13:10'),
(3, 1, 'atefe', 'a.bll@yahoo.com', NULL, '$2y$10$YJwO.6CK4QOSD31Mv7BEF.xgxIaQgD33fMByrS8GAUmCyd8QiZsTG', NULL, '2021-01-14 20:11:22', '2021-01-14 20:11:22'),
(4, 1, 'atefe', 'a.bddll@yahoo.com', NULL, '$2y$10$8DAB2UtwfGE.M9IrlE.xYeTd2w38WeMkvs/Vv.Q3Y24ytXWv7exg2', NULL, '2021-01-14 20:13:19', '2021-01-14 20:13:19'),
(5, 1, 'atefe', 'a.bllddll@yahoo.com', NULL, '$2y$10$zeftIQVHNrq1Zz.aN/YZ8eZOYtii6EhrZ/02tGZW0TsLsSs4.fcse', NULL, '2021-01-14 21:04:06', '2021-01-14 21:04:06'),
(6, 1, 'John Doe', 'doe@example.com', NULL, '$2y$10$0O8VPjBnEHUi1TwBXY3Hi.Lzht/qFyYCcpwA0rvZJbHAiYN/bSnT2', NULL, '2021-01-14 21:14:16', '2021-01-14 21:14:16'),
(7, 1, 'John Doe', 'oe@example.com', NULL, '$2y$10$c.n23LCvjonBGAYc8wvyI.ohRoVsuP0NlWBQvmNd4I4oOkxUqF1PC', NULL, '2021-01-14 21:52:56', '2021-01-14 21:52:56'),
(8, 1, 'John Doe', 'kll@example.com', NULL, '$2y$10$HnZdUx/L6bR.c9y4g9NHYuJ4/y5bLX6qdqcA1PHyeTZ2u8KjMOdE2', NULL, '2021-01-15 17:06:34', '2021-01-15 17:06:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kinds`
--
ALTER TABLE `kinds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `types_product_id_index` (`product_id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `option_details`
--
ALTER TABLE `option_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `option_details_product_id_index` (`option_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_index` (`user_id`),
  ADD KEY `orders_status_id_index` (`status_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_product_id_index` (`product_id`),
  ADD KEY `order_details_order_id_index` (`order_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_user_id_index` (`user_id`),
  ADD KEY `option_id` (`option_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kinds`
--
ALTER TABLE `kinds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `option_details`
--
ALTER TABLE `option_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
