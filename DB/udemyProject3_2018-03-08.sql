# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.6.35)
# Database: udemyProject3
# Generation Time: 2018-03-08 15:28:53 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table channels
# ------------------------------------------------------------

DROP TABLE IF EXISTS `channels`;

CREATE TABLE `channels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `channels` WRITE;
/*!40000 ALTER TABLE `channels` DISABLE KEYS */;

INSERT INTO `channels` (`id`, `title`, `slug`, `created_at`, `updated_at`)
VALUES
	(1,'Wordpress','wordpress','2018-03-06 15:41:55','2018-03-06 15:41:55'),
	(2,'OOP','oop','2018-03-06 15:41:55','2018-03-06 15:41:55'),
	(3,'MVC','mvc','2018-03-06 15:41:55','2018-03-06 15:41:55'),
	(4,'PHP','php','2018-03-06 15:41:55','2018-03-06 15:41:55'),
	(5,'laravel','laravel','2018-03-06 15:41:55','2018-03-06 15:41:55'),
	(6,'Lumen','lumen','2018-03-06 15:41:55','2018-03-06 15:41:55'),
	(7,'Forge','forge','2018-03-06 15:41:55','2018-03-06 15:41:55'),
	(8,'PHP testing','php-testing','2018-03-06 15:41:55','2018-03-08 09:08:13');

/*!40000 ALTER TABLE `channels` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table discussions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `discussions`;

CREATE TABLE `discussions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `discussions` WRITE;
/*!40000 ALTER TABLE `discussions` DISABLE KEYS */;

INSERT INTO `discussions` (`id`, `user_id`, `channel_id`, `title`, `slug`, `content`, `created_at`, `updated_at`)
VALUES
	(1,2,1,'By increasing the scope you will be asking the user to grant access to additional information','by-increasing-the-scope-you-will-be-asking-the-user-to-grant-access-to-additional-information','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,1','2018-03-06 15:41:55','2018-03-06 15:41:55'),
	(2,1,2,'One of the goals of the Eloquent OAuth package is to normalize the data received across all supported providers','one-of-the-goals-of-the-eloquent-oauth-package-is-to-normalize-the-data-received-across-all-supported-providers','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled','2018-03-06 15:41:55','2018-03-08 08:54:13'),
	(3,1,2,'each provider offers its own sets of additional data','each-provider-offers-its-own-sets-of-additional-data','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,3','2018-03-06 15:41:55','2018-03-06 15:41:55'),
	(4,1,5,'Say for example we want to collect the user\'s gender when they login using Facebook.','say-for-example-we-want-to-collect-the-users-gender-when-they-login-using-facebook','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,4','2018-03-06 15:41:55','2018-03-06 15:41:55'),
	(5,1,1,'Installing new plugins into worepress','installing-new-plugins-into-worepress','the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s ..','2018-03-06 15:42:52','2018-03-08 08:40:21');

/*!40000 ALTER TABLE `discussions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table likes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `likes`;

CREATE TABLE `likes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reply_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(80,'2014_10_12_000000_create_users_table',1),
	(81,'2014_10_12_100000_create_password_resets_table',1),
	(82,'2018_03_06_083500_create_oauth_identities_table',1),
	(83,'2018_03_06_091616_create_channels_table',1),
	(84,'2018_03_06_091634_create_discussions_table',1),
	(85,'2018_03_06_091642_create_replies_table',1),
	(86,'2018_03_06_121647_create_likes_table',1),
	(87,'2018_03_06_132708_create_watchers_table',1);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_identities
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_identities`;

CREATE TABLE `oauth_identities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `provider_user_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `oauth_identities` WRITE;
/*!40000 ALTER TABLE `oauth_identities` DISABLE KEYS */;

INSERT INTO `oauth_identities` (`id`, `user_id`, `provider_user_id`, `provider`, `access_token`, `created_at`, `updated_at`)
VALUES
	(1,3,'33952692','github','9b3be62f03a31ba15176e40dd0f7d5f84ea6fd1d','2018-03-07 13:45:35','2018-03-07 13:45:35');

/*!40000 ALTER TABLE `oauth_identities` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table replies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `replies`;

CREATE TABLE `replies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `discussion_id` int(10) unsigned NOT NULL,
  `best_answer` tinyint(1) NOT NULL DEFAULT '0',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `replies` WRITE;
/*!40000 ALTER TABLE `replies` DISABLE KEYS */;

INSERT INTO `replies` (`id`, `user_id`, `discussion_id`, `best_answer`, `content`, `created_at`, `updated_at`)
VALUES
	(1,1,1,0,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,','2018-03-06 15:41:55','2018-03-06 15:41:55'),
	(2,1,2,1,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,','2018-03-06 15:41:55','2018-03-06 15:42:22'),
	(3,2,3,0,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,','2018-03-06 15:41:55','2018-03-06 15:41:55'),
	(4,2,4,1,'. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and m','2018-03-06 15:41:55','2018-03-06 15:41:55'),
	(5,1,5,1,'the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and m','2018-03-06 15:42:55','2018-03-06 15:42:59'),
	(6,1,2,0,'I  say the best answer','2018-03-08 08:52:19','2018-03-08 08:52:48');

/*!40000 ALTER TABLE `replies` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `points` bigint(20) NOT NULL DEFAULT '50',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `avatar`, `admin`, `email`, `points`, `password`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'admin','http://localhost:8000/avatars/avatar.jpg',1,'ahmad@gmail.com',300,'$2y$10$uBTmQXFv60spQEG0mlwHP.Xw2AAtNHaBIi4CfH6KHXUdvjKF6AgcG','L7ED9FgkPVO8RN66p4cAy3Li1zbbBdB43FtGF0L5JHFXDXmoSxw6Z2DRyMhe','2018-03-06 15:41:55','2018-03-08 08:52:19'),
	(2,'Ahmad Haleem','http://localhost:8000/avatars/avatar.jpg',0,'haleem@gmail.com',50,'$2y$10$/s0LDBvTYtS7GL15dBHq.OXIxcR7/zmmcCVzwe.DtBG2H3eSSK1Va','j66WxH97nxwdzR00rIinhyzzwUgG5GmvpdtQwBRFQjd3edeAkZJZBa85mVNp','2018-03-06 15:41:55','2018-03-06 15:41:55'),
	(3,'Ahmad','https://avatars3.githubusercontent.com/u/33952692?v=4',0,'coldman2099@gmail.com',50,NULL,'tpxKmcUZQoZwSH8UF5DBmMiV1aIhZYcds9XA9Ew4SU6n7f3ecKiO4bc5QmoA','2018-03-07 13:45:35','2018-03-07 13:45:35');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table watchers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `watchers`;

CREATE TABLE `watchers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `discussion_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
