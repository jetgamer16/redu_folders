-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 08.05.2023 klo 09:22
-- Palvelimen versio: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `redu`
--

-- --------------------------------------------------------

--
-- Rakenne taululle `failed_jobs`
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
-- Rakenne taululle `groups`
--

CREATE TABLE `groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `acronym` varchar(10) NOT NULL,
  `user_teacher_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Vedos taulusta `groups`
--

INSERT INTO `groups` (`id`, `name`, `acronym`, `user_teacher_id`, `created_at`, `updated_at`) VALUES
(1, 'Informatics', 'IT', 2, '2023-04-06 04:11:28', '2023-04-06 04:11:28'),
(2, 'Biology2', 'BY', 2, '2023-04-06 04:41:30', '2023-04-11 07:06:28'),
(3, 'Cooking', 'CK', 2, '2023-04-17 07:51:42', '2023-04-17 07:51:42'),
(4, 'Lengua', 'LG', 2, '2023-04-17 07:52:30', '2023-04-17 07:52:30'),
(5, 'Informatica', 'IT', 2, '2023-04-17 07:53:09', '2023-04-17 07:53:09');

-- --------------------------------------------------------

--
-- Rakenne taululle `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Vedos taulusta `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_02_06_145451_esquemaInicial', 1);

-- --------------------------------------------------------

--
-- Rakenne taululle `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Rakenne taululle `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Rakenne taululle `student_tasks`
--

CREATE TABLE `student_tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `img` varchar(1000) DEFAULT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `task_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `mark` int(11) NOT NULL DEFAULT 0,
  `feedback` varchar(1000) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Vedos taulusta `student_tasks`
--

INSERT INTO `student_tasks` (`id`, `name`, `description`, `img`, `student_id`, `task_id`, `mark`, `feedback`, `created_at`, `updated_at`) VALUES
(20, 'hola29', 'ldkasndfsaldjkfnaskljdfaskljdfn', '/data/user/0/com.example.users_login_db/cache/20-task.jpg', 6, 1, 5, 'fghjfghj fgh jgjfgjhfghjdghjfgd jfgh jfgh jfg h', '2023-04-11 05:52:28', '2023-04-11 04:07:23'),
(21, 'dfgsd', 'fgsdfgsdfgsdfg', '/data/user/0/com.example.users_login_db/cache/c80d627c-c2c5-4d24-a963-5093d3ec8c77692885291244241819.jpg', 6, 2, 0, NULL, '2023-04-11 04:03:40', '2023-04-11 04:03:40'),
(22, 'fgh', 'sdfgh', '/data/user/0/com.example.users_login_db/cache/c80d627c-c2c5-4d24-a963-5093d3ec8c77692885291244241819.jpg', 8, 3, 0, NULL, '2023-04-11 07:29:31', '2023-04-11 07:29:31'),
(23, 'noniii', 'falafel', '/data/user/0/com.example.users_login_db/cache/c88a53fd-6e79-445a-9992-0fe77b93acf47065652527601385822.jpg', 9, 3, 5, 'Hoalfölamdasdfs sa,f sdf lkndf aslfasdf asdfj nafHoalfölamdasdfs sa,f sdf lkndf aslfasdf asdfj nafHoalfölamdasdfs sa,f sdf lkndf aslfasdf asdfj nafHoalfölamdasdfs sa,f sdf lkndf aslfasdf asdfj nafHoalfölamdasdfs sa,f sdf lkndf aslfasdf asdfj nafHoalfölamdasdfs sa,f sdf lkndf aslfasdf asdfj naf', '2023-04-13 06:37:53', '2023-04-13 06:37:53'),
(24, 'holaaa', 'asdfsdg', '/data/user/0/com.example.users_login_db/cache/950c8778-ed32-4633-9080-216b610111233658712043851117278.jpg', 9, 5, 0, '', '2023-04-12 09:25:31', '2023-04-14 06:43:44'),
(25, 'zfg', 'zdfgzsdg', '/data/user/0/com.example.users_login_db/cache/d02580af-f066-435d-bb88-502b48a80ee03110766446731857474.jpg', 9, 5, 0, '', '2023-04-12 09:25:39', '2023-04-12 09:25:39'),
(26, 'dsfg', 'afgdfg', '/data/user/0/com.example.users_login_db/cache/a40395c2-d036-4050-8641-b1cd848e22a37580782140432008255.jpg', 9, 7, 0, '', '2023-04-13 06:43:05', '2023-04-17 10:27:50'),
(27, 'cvfvdfv', 'xvvfvfv', '/data/user/0/com.example.users_login_db/cache/c80d627c-c2c5-4d24-a963-5093d3ec8c77692885291244241819.jpg', 9, 2, 0, '', '2023-04-14 05:09:44', '2023-04-14 05:09:44'),
(28, 'Ya he cocinado cosas', 'Siuuu vivaaa lalalalalalal', '/data/user/0/com.example.users_login_db/cache/c80d627c-c2c5-4d24-a963-5093d3ec8c77692885291244241819.jpg', 7, 8, 0, NULL, '2023-04-18 06:20:40', '2023-04-18 06:20:40'),
(29, 'Ya he cocinado cosas', 'Para hacer esta tarea he tenido que hacer muchas cosas como cocinara y esas vainas jejeje.', '/data/user/0/com.example.users_login_db/cache/c80d627c-c2c5-4d24-a963-5093d3ec8c77692885291244241819.jpg', 9, 8, 5, 'Muy bien hecho!!', '2023-04-19 03:55:26', '2023-04-19 04:18:59'),
(31, 'fghjfghj', 'fghjfghj', '/data/user/0/com.example.users_login_db/cache/-task.jpg', 9, 11, 0, NULL, '2023-04-25 07:30:58', '2023-04-25 07:30:58');

-- --------------------------------------------------------

--
-- Rakenne taululle `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `date_end` date NOT NULL,
  `user_teacher_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `group_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Vedos taulusta `tasks`
--

INSERT INTO `tasks` (`id`, `title`, `description`, `date_end`, `user_teacher_id`, `group_id`, `created_at`, `updated_at`) VALUES
(1, 'Create html2', 'ölfaösd fjasödf jsadfj sadgjkasdhglasjkd fjkas ldkfj askjdgkjsdg asdf', '2023-04-13', 2, 1, '2023-04-06 04:19:52', '2023-04-06 04:20:17'),
(2, 'fdgjdfg', 'jdfgjdfghj', '2023-04-21', 2, 1, '2023-04-06 04:35:37', '2023-04-06 04:35:37'),
(3, 'lkasndflnsad2', 'klsadnölskadnfskladfnöskla d', '2023-04-13', 2, 2, '2023-04-06 04:42:14', '2023-04-06 04:42:28'),
(4, 'fhsuiafhsiaudh', 'iosjdgöoifjd gösdjf gölskd fgjskld fö df gsdfg', '2023-04-15', 2, 1, '2023-04-11 04:04:25', '2023-04-11 04:04:25'),
(5, 'ghjfghj', 'gdhjfghjfgh', '2023-04-14', 2, 2, '2023-04-12 06:30:33', '2023-04-12 06:30:33'),
(6, 'jhlghjkl', 'ghjlghjlg', '2023-04-05', 2, 2, '2023-04-12 06:30:40', '2023-04-12 06:30:40'),
(7, 'yeyeyeyyeyeyee', 'fkjasd fjasd fjasdlk jöaskld öfakl jöskld jölaskdfjsklödfjasö lkjfdökl jas ghu dfj nkg', '2023-04-28', 2, 2, '2023-04-13 04:40:16', '2023-04-13 04:40:16'),
(8, 'Cocinar', 'Hay que cocinar cosas', '2023-04-23', 2, 3, '2023-04-18 03:49:00', '2023-04-18 03:49:00'),
(9, 'Hornear', 'Hay que hornear cosas', '2023-05-05', 2, 3, '2023-04-18 03:49:19', '2023-04-25 07:18:25'),
(10, 'Precalentar', 'Hay que precalentar cosas', '2023-04-13', 2, 3, '2023-04-18 03:49:46', '2023-04-18 07:02:47'),
(11, 'hjkgh', 'jkghjkghjk', '2023-05-04', 2, 3, '2023-04-25 07:30:37', '2023-04-25 07:30:37');

-- --------------------------------------------------------

--
-- Rakenne taululle `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `rol` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Vedos taulusta `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `rol`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'Pepe', 'pepe@gmail.com', NULL, '$2y$10$MbEM5/aelYW/adDAdnn5wuTTVo9zrK7oaiUJzBwH0H2MMbOCvPsiC', 'teacher', NULL, '2023-04-06 04:09:18', '2023-04-06 04:09:18'),
(4, 'tetetete', 'hi@gmail.com', NULL, '$2y$10$c5jkJUJJ1DITPJrL8BAxNevulERHTPtgAzVn574WDLgg8e5Jin/hO', 'alumn', NULL, '2023-04-11 03:13:02', '2023-04-11 03:13:02'),
(6, 'caca', 'caca@gmail.com', NULL, '$2y$10$6Gtt02XuUEnPS0ZShSAoe.6TGsYgUZpXHkgQyAWVAhPKKmNWn7rba', 'alumn', NULL, '2023-04-11 05:41:41', '2023-04-11 05:41:41'),
(7, 'joselu', 'joselu@gmail.com', NULL, '$2y$10$Ul/FeybkckPv8LkjR0wm5umYwu07cTs3NSMVvc00I.PS4tdBUL5h2', 'alumn', NULL, '2023-04-11 09:14:38', '2023-04-11 09:14:38'),
(8, 'Paco', 'paco@gmail.com', NULL, '$2y$10$YEEez.HhaxcY.c1YjudP/eaoT5EIypQ2xXsCRFrTrpmfCxTuBTzNq', 'alumn', NULL, '2023-04-11 07:15:47', '2023-04-11 07:15:47'),
(9, 'Pau', 'pau@gmail.com', NULL, '$2y$10$OoHl..dImU1/995FBfe3xe0uuS9yi33Ch0hC/UEUajMaETDeaO7Gq', 'alumn', NULL, '2023-04-12 06:52:00', '2023-04-12 06:52:00'),
(10, 'hola', 'hola@gmail.com', NULL, '$2y$10$t0Xnmg/DYXb3fQrtWD6MAeJJmVTC6JzAyOms1HwidN2TB0mmbFFp.', 'alumn', NULL, '2023-04-20 06:50:05', '2023-04-20 06:50:05'),
(11, 'siu', 'siu@gmail.com', NULL, '$2y$10$1/1SDWDSZLrTYiUKA51FjeOMW7EYkN9YpdMd7jOtNI9hMl7Cd9Yf.', 'alumn', NULL, '2023-04-20 06:56:03', '2023-04-20 06:56:03'),
(12, 'hi', 'hii@gmail.com', NULL, '$2y$10$HjeqW9VpXW0dmDpWu0cM2uXM0d5S2Yeu9QcDkgQm6aTD/hAb3pzl2', 'alumn', NULL, '2023-04-20 06:58:26', '2023-04-20 06:58:26'),
(13, 'patata', 'patata@gmail.com', NULL, '$2y$10$zvAFA3snJAyco3MWmS5l8O3aP4tYzQaBRs2Tuj0IfnOnQXAlt0qbe', 'alumn', NULL, '2023-04-20 08:59:05', '2023-04-20 08:59:05'),
(14, 'saca', 'saca@gmail.com', NULL, '$2y$10$yD5Uqhwmq4a4LjtKh1jePu85znft2ukxsiHfA.9H06hJQFjo/4H2q', 'alumn', NULL, '2023-04-21 05:07:39', '2023-04-21 05:07:39'),
(15, '1', '1@gmail.com', NULL, '$2y$10$gb8ZhCMF37aNmrW2et3ck.wneb6UUvTEIS9.E/98wPgDXBVlizX3.', 'alumn', NULL, '2023-04-21 05:08:56', '2023-04-21 05:08:56'),
(16, '22', '22@gmail.com', NULL, '$2y$10$4TR8lgECJ4sLmUC9Dk5sGOqw0YCLsXI6UuMRnCh1ArdaAMM9UbEQe', 'alumn', NULL, '2023-04-21 05:09:32', '2023-04-21 05:09:32'),
(17, '3', '3@gmail.com', NULL, '$2y$10$vJIkejQf2koKphv.TLjpGOgIZd30oHP0Q54fI2GKd2eD68Fy23N82', 'alumn', NULL, '2023-04-21 05:29:57', '2023-04-21 05:29:57'),
(18, '4', '4@gmail.com', NULL, '$2y$10$vgwlq54UhNiETRlW44KZKe1Uu1kuV9eGGwu7FqeMpD8GpaeSaA.fe', 'alumn', NULL, '2023-04-21 05:32:58', '2023-04-21 05:32:58'),
(19, '5', '5@gmail.com', NULL, '$2y$10$WbT5x2T9SHYMldtRqdt11.CAqE4jJqkWTnEr8BXWL4ShLJ1mgSpG6', 'alumn', NULL, '2023-04-21 05:44:45', '2023-04-21 05:44:45'),
(20, '6', '6@gmail.com', NULL, '$2y$10$Vts5r7LK47D87JuuO/nn6urWEqgDMCSdXqHJKds4U5aRN/xY9r9um', 'alumn', NULL, '2023-04-21 05:46:37', '2023-04-21 05:46:37'),
(21, '7', '7@gmail.com', NULL, '$2y$10$0VY7u2hDz/lwRUBfVQakxOKd/27xOId4QfZQd5NYS1tcSjzrBrANq', 'alumn', NULL, '2023-04-21 05:47:04', '2023-04-21 05:47:04'),
(22, '8', '8@gmail.com', NULL, '$2y$10$wsbmGWfunSDj5SCIhs297OiIeN1LxJIGPlViVcaV3slJutwjnROTm', 'alumn', NULL, '2023-04-21 05:49:01', '2023-04-21 05:49:01'),
(23, '9', '9@gmail.com', NULL, '$2y$10$V/dMyefr26ZuoheBk8UhU.hySL27Q1/Cs0tWnoRZuWjKLn3d7HAsW', 'alumn', NULL, '2023-04-21 05:49:50', '2023-04-21 05:49:50'),
(24, '10', '10@gmail.com', NULL, '$2y$10$0nQeWbtKRVhah1B4GAdGy.Yps1wFAC20X2JIFWAqZYnlU7hcO.GLS', 'alumn', NULL, '2023-04-21 05:50:37', '2023-04-21 05:50:37'),
(25, '11', '11@gmail.com', NULL, '$2y$10$P0QbtsYJDeZE1ptK1xy1Y.lCsAfbA1F96k3z6s57BHUS4GetmrCDW', 'alumn', NULL, '2023-04-21 05:51:03', '2023-04-21 05:51:03'),
(26, '12', '12@gmail.com', NULL, '$2y$10$z4oQD.51wZqtMFT70yY8iuyU1SQlFN4yCDHb6CdtQq2ZNlYwrAvam', 'alumn', NULL, '2023-04-21 05:53:34', '2023-04-21 05:53:34'),
(27, '13', '13@gmail.com', NULL, '$2y$10$5E74OIhp1tBQB.wMAxJFf.PXXEoCofvXjCTgq96TUWAgYM5coDD9a', 'alumn', NULL, '2023-04-21 05:55:16', '2023-04-21 05:55:16'),
(28, '20', '20@gmail.com', NULL, '$2y$10$IhZ8Q10QZxji.CnQfxM6jOdpynmWqg95kBGiiZbO./Yi8W8yb5f0m', 'alumn', NULL, '2023-04-21 05:59:06', '2023-04-21 05:59:06'),
(29, '23', '23@gmail.com', NULL, '$2y$10$JZ0g65PCC4j8QwU81JNRZ.MtcPrjTyTKURdo0nb7JBb01H9J12UVe', 'alumn', NULL, '2023-04-21 06:01:10', '2023-04-21 06:01:10'),
(30, '24', '24@gmail.com', NULL, '$2y$10$tlXtpIEPgVLBFGjzCPmA4O3RaBTzUIouBJIs0GxuvYoAdCUKmnwJG', 'alumn', NULL, '2023-04-21 06:02:08', '2023-04-21 06:02:08'),
(31, 'Jose Enrique', 'josepe@gmail.com', NULL, '$2y$10$SVwG9r7.04ZR9EaINvvamuubPbmC9/PU3oHgMaup9YH/4Xf8za7Ty', 'alumn', NULL, '2023-04-21 06:10:28', '2023-04-21 06:10:28');

-- --------------------------------------------------------

--
-- Rakenne taululle `user_group`
--

CREATE TABLE `user_group` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `groups_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Vedos taulusta `user_group`
--

INSERT INTO `user_group` (`user_id`, `groups_id`) VALUES
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(4, 1),
(4, 2),
(4, 3),
(6, 2),
(6, 3),
(7, 3),
(8, 2),
(9, 1),
(9, 2),
(9, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `groups_user_teacher_id_foreign` (`user_teacher_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `student_tasks`
--
ALTER TABLE `student_tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_tasks_student_id_foreign` (`student_id`),
  ADD KEY `student_tasks_task_id_foreign` (`task_id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_user_teacher_id_foreign` (`user_teacher_id`),
  ADD KEY `tasks_group_id_foreign` (`group_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_group`
--
ALTER TABLE `user_group`
  ADD PRIMARY KEY (`user_id`,`groups_id`),
  ADD KEY `user_group_groups_id_foreign` (`groups_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_tasks`
--
ALTER TABLE `student_tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Rajoitteet vedostauluille
--

--
-- Rajoitteet taululle `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `groups_user_teacher_id_foreign` FOREIGN KEY (`user_teacher_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Rajoitteet taululle `student_tasks`
--
ALTER TABLE `student_tasks`
  ADD CONSTRAINT `student_tasks_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_tasks_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Rajoitteet taululle `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_user_teacher_id_foreign` FOREIGN KEY (`user_teacher_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Rajoitteet taululle `user_group`
--
ALTER TABLE `user_group`
  ADD CONSTRAINT `user_group_groups_id_foreign` FOREIGN KEY (`groups_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_group_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
