-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: localhost    Database: wordpress
-- ------------------------------------------------------
-- Server version	8.0.26-0ubuntu0.20.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `wp_commentmeta`
--

DROP TABLE IF EXISTS `wp_commentmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_commentmeta`
--

LOCK TABLES `wp_commentmeta` WRITE;
/*!40000 ALTER TABLE `wp_commentmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_commentmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_comments`
--

DROP TABLE IF EXISTS `wp_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_comments` (
  `comment_ID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'comment',
  `comment_parent` bigint unsigned NOT NULL DEFAULT '0',
  `user_id` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_comments`
--

LOCK TABLES `wp_comments` WRITE;
/*!40000 ALTER TABLE `wp_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_email_log`
--

DROP TABLE IF EXISTS `wp_email_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_email_log` (
  `id` mediumint NOT NULL AUTO_INCREMENT,
  `to_email` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `subject` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `headers` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `attachments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `sent_date` timestamp NOT NULL,
  `attachment_name` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `ip_address` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `result` tinyint(1) DEFAULT NULL,
  `error_message` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_email_log`
--

LOCK TABLES `wp_email_log` WRITE;
/*!40000 ALTER TABLE `wp_email_log` DISABLE KEYS */;
INSERT INTO `wp_email_log` VALUES (79,'email@email.com','Connection Email','<div>\nYou\'re almost done! Click the link below to activate Dev Site 1.\n</div>\n<a href = \"http://3.129.13.214/wp-admin/tools.php?page=migrate-posts&migrate-posts-activation-nonce=bIptsaxEbbIvcF7AS90eyAv5uDm4Yc2e7sNFAipksFJWpIkNOJxun9M0ZwByUTsNM5stesq6Sk1PB0x11vjCdiOcKLmIAveIezBUtGdxd\">CLICK HERE</a>','Content-Type: text/html; charset=UTF-8','false','2021-06-18 13:15:42','','3.129.13.214',0,'Could not instantiate mail function.'),(80,'email@email.com','Connection Email','<div>\nYou\'re almost done! Click the link below to activate Dev Site 1.\n</div>\n<a href = \"http://3.129.13.214/wp-admin/tools.php?page=migrate-posts&migrate-posts-activation-nonce=eDeupor26FfcO8dHtyGkbniDdyFDM0eeEupY9jztsKgGZ2ssEWohD0zHrkrw94lbxN3ZYgg4gpLrrqUrZre3mJa6p4ilUkOrDBqTr1lN0\">CLICK HERE</a>','Content-Type: text/html; charset=UTF-8','false','2021-06-18 15:41:14','','3.129.13.214',0,'Could not instantiate mail function.'),(81,'email@email.com','Connection Email','<div>\nYou\'re almost done! Click the link below to activate Dev Site 1.\n</div>\n<a href = \"http://3.129.13.214/wp-admin/tools.php?page=migrate-posts&migrate-posts-activation-nonce=JQzxod6i3iihm8TDnI7xrBhTXG4jTSfA2P53FB1EYgtBFZd9UpqcW6pFbi4pVcBk3EFjerGooxy4CJXd1QxRJwMMcYkjdgFBDNZYbOEXB\">CLICK HERE</a>','Content-Type: text/html; charset=UTF-8','false','2021-06-18 15:44:28','','3.129.13.214',0,'Could not instantiate mail function.'),(82,'email@email.com','Connection Email','<div>\nYou\'re almost done! Click the link below to activate Dev Site 1.\n</div>\n<a href = \"http://3.129.13.214/wp-admin/tools.php?page=migrate-posts&migrate-posts-activation-nonce=OcgmziWPtbGQLBnOMofi4ClYT28bcjxyemE5ZPeTACwibuqzpVpQUXA4NoKEPFWPj5riTX9WsTc2wtdJolAq0eAUs6wvWCbd02G0u81t2\">CLICK HERE</a>','Content-Type: text/html; charset=UTF-8','false','2021-06-18 15:44:35','','3.129.13.214',0,'Could not instantiate mail function.'),(83,'email@email.com','Connection Email','<div>\nYou\'re almost done! Click the link below to activate Dev Site 1.\n</div>\n<a href = \"http://3.129.13.214/wp-admin/tools.php?page=migrate-posts&migrate-posts-activation-nonce=YJrdSIX5ehU26dmKHkqdStrbNTGcxsr6ytKvvKaLgOHGbdcYdTZ5SgiMS5KARZPWrFdVgtwv627UBVMgg6VYmCG9NIN63tEZ9ch4ZbYqV\">CLICK HERE</a>','Content-Type: text/html; charset=UTF-8','false','2021-06-18 15:59:41','','3.129.13.214',0,'Could not instantiate mail function.'),(84,'email@email.com','Connection Email','<div>\nYou\'re almost done! Click the link below to activate Dev Site 1.\n</div>\n<a href = \"http://3.129.13.214/wp-admin/tools.php?page=migrate-posts&migrate-posts-activation-nonce=SxPvfRLScrWOEwQwbMxXBA7VpcbG421Gf7GCBItgGEJDjWXoR67PmC5IU41hsNIbdXDBwvn76jzphVDtSjpsah52d6cdTBhKPLKO9jgOe\">CLICK HERE</a>','Content-Type: text/html; charset=UTF-8','false','2021-06-18 16:49:10','','3.129.13.214',0,'Could not instantiate mail function.'),(85,'johndeebdd@gmail.com','[Dev Site 1] Your Site is Experiencing a Technical Issue','Howdy!\n\nSince WordPress 5.2 there is a built-in feature that detects when a plugin or theme causes a fatal error on your site, and notifies you with this automated email.\n\nIn this case, WordPress caught an error with one of your plugins, Migrate Posts.\n\nFirst, visit your website (http://3.129.13.214/) and check for any visible issues. Next, visit the page where the error was caught (http://3.129.13.214/wp-admin/tools.php?page=migrate-posts) and check for any visible issues.\n\nPlease contact your host for assistance with investigating this issue further.\n\nIf your site appears broken and you can\'t access your dashboard normally, WordPress now has a special \"recovery mode\". This lets you safely login to your dashboard and investigate further.\n\nhttp://3.129.13.214/wp-login.php?action=enter_recovery_mode&rm_token=0dWMShDVotu1rB5u5El0Kt&rm_key=q8VH0BcvtHgwtazmlMttTv\n\nTo keep your site safe, this link will expire in 1 day. Don\'t worry about that, though: a new link will be emailed to you if the error occurs again after it expires.\n\nWhen seeking help with this issue, you may be asked for some of the following information:\nWordPress version 5.7.2\r\nCurrent theme: Twenty Twenty-One (version 1.3)\r\nCurrent plugin: Migrate Posts (version 1)\r\nPHP version 7.4.3\n\n\n\nError Details\n=============\nAn error of type E_ERROR was caused in line 176 of the file /var/www/html/wp-content/plugins/migrate-posts/src/MigratePosts/Page_Tools_MigratePosts.class.php. Error message: Uncaught Error: Call to undefined method MigratePosts\\Page_Tools_MigratePosts::returnNotConnectedViewHTML() in /var/www/html/wp-content/plugins/migrate-posts/src/MigratePosts/Page_Tools_MigratePosts.class.php:176\nStack trace:\n#0 /var/www/html/wp-content/plugins/migrate-posts/src/MigratePosts/Page_Tools_MigratePosts.class.php(94): MigratePosts\\Page_Tools_MigratePosts->returnContentView()\n#1 /var/www/html/wp-includes/class-wp-hook.php(292): MigratePosts\\Page_Tools_MigratePosts->renderPage()\n#2 /var/www/html/wp-includes/class-wp-hook.php(316): WP_Hook->apply_filters()\n#3 /var/www/html/wp-includes/plugin.php(484): WP_Hook->do_action()\n#4 /var/www/html/wp-admin/admin.php(259): do_action()\n#5 /var/www/html/wp-admin/tools.php(40): require_once(\'/var/www/html/w...\')\n#6 {main}\n  thrown','','false','2021-06-18 17:25:28','','24.253.35.100',1,NULL),(86,'johndeebdd@gmail.com','[Dev Site 1] Your Site is Experiencing a Technical Issue','Howdy!\n\nSince WordPress 5.2 there is a built-in feature that detects when a plugin or theme causes a fatal error on your site, and notifies you with this automated email.\n\nIn this case, WordPress caught an error with one of your plugins, First Come First Served.\n\nFirst, visit your website (http://3.129.13.214/) and check for any visible issues. Next, visit the page where the error was caught (http://3.129.13.214/wp-admin/admin.php?page=fcfs) and check for any visible issues.\n\nPlease contact your host for assistance with investigating this issue further.\n\nIf your site appears broken and you can\'t access your dashboard normally, WordPress now has a special \"recovery mode\". This lets you safely login to your dashboard and investigate further.\n\nhttp://3.129.13.214/wp-login.php?action=enter_recovery_mode&rm_token=1y4bXlQV8C1lVs1sPsUqsT&rm_key=ZIA1iWond1Rnaep83XlRvX\n\nTo keep your site safe, this link will expire in 1 day. Don\'t worry about that, though: a new link will be emailed to you if the error occurs again after it expires.\n\nWhen seeking help with this issue, you may be asked for some of the following information:\nWordPress version 5.7.2\r\nCurrent theme: Twenty Twenty-One (version 1.3)\r\nCurrent plugin: First Come First Served (version 1.0)\r\nPHP version 7.4.3\n\n\n\nError Details\n=============\nAn error of type E_COMPILE_ERROR was caused in line 3 of the file /var/www/html/wp-content/plugins/fcfs/src/FCFS/UserClickList.class.php. Error message: Namespace declaration statement has to be the very first statement or after any declare call in the script','','false','2021-07-17 18:37:14','','24.253.35.100',1,NULL),(87,'johndeebdd@gmail.com','[Dev Site 1] Your site has updated to WordPress 5.8','Howdy! Your site at http://3.129.13.214 has been updated automatically to WordPress 5.8.\n\nNo further action is needed on your part. For more on version 5.8, see the About WordPress screen:\nhttp://3.129.13.214/wp-admin/about.php\n\nIf you experience any issues or need support, the volunteers in the WordPress.org support forums may be able to help.\nhttps://wordpress.org/support/forums/\n\nYou also have some plugins or themes with updates available. Update them now:\nhttp://3.129.13.214/wp-admin/\n\nThe WordPress Team\n','','false','2021-07-21 03:45:40','','3.129.13.214',0,'Could not instantiate mail function.'),(88,'johndeebdd@gmail.com','Dev Site 1: New Message','You have received a new message in\r\nDev Site 1\r\nFrom: Codeception\r\nSubject: Testing\r\nPlease Click the following link to view full Message.\r\nhttp://3.129.13.214/front-end-pm/?fepaction=messagebox\r\n','From: Dev Site 1 <johndeebdd@gmail.com>\nContent-Type: text/plain','false','2021-07-22 18:30:41','','24.253.35.100',0,'Could not instantiate mail function.'),(89,'johndeebdd@gmail.com','[Dev Site 1] New User Registration','New user registration on your site Dev Site 1:\r\n\r\nUsername: User2\r\n\r\nEmail: user2@email.com\r\n','','false','2021-07-23 16:42:18','','24.253.35.100',0,'Could not instantiate mail function.'),(90,'johndeebdd@gmail.com','[Dev Site 1] New User Registration','New user registration on your site Dev Site 1:\r\n\r\nUsername: user5\r\n\r\nEmail: user5@email.com\r\n','','false','2021-07-23 16:42:40','','24.253.35.100',0,'Could not instantiate mail function.'),(91,'user5@email.com','[Dev Site 1] Login Details','Username: user5\r\n\r\nTo set your password, visit the following address:\r\n\r\nhttp://3.129.13.214/wp-login.php?action=rp&key=eAOF4x05KHDQJhI8c2Gw&login=user5\r\n\r\nhttp://3.129.13.214/wp-login.php\r\n','','false','2021-07-23 16:42:40','','24.253.35.100',0,'Could not instantiate mail function.'),(92,'johndeebdd@gmail.com','[Dev Site 1] New User Registration','New user registration on your site Dev Site 1:\r\n\r\nUsername: SubscriberMan\r\n\r\nEmail: subscriberman@email.com\r\n','','false','2021-07-26 14:05:26','','24.253.35.100',0,'Could not instantiate mail function.'),(93,'johndeebdd@gmail.com','[Dev Site 1] New User Registration','New user registration on your site Dev Site 1:\r\n\r\nUsername: ContributorMan\r\n\r\nEmail: contributorman@email.com\r\n','','false','2021-07-26 14:05:59','','24.253.35.100',0,'Could not instantiate mail function.'),(94,'johndeebdd@gmail.com','[Dev Site 1] New User Registration','New user registration on your site Dev Site 1:\r\n\r\nUsername: EditorMan\r\n\r\nEmail: editorman@email.com\r\n','','false','2021-07-26 14:06:28','','24.253.35.100',0,'Could not instantiate mail function.');
/*!40000 ALTER TABLE `wp_email_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_fep_attachments`
--

DROP TABLE IF EXISTS `wp_fep_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_fep_attachments` (
  `att_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `mgs_id` bigint unsigned NOT NULL DEFAULT '0',
  `att_mime` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `att_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `att_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`att_id`),
  KEY `mgs_id` (`mgs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_fep_attachments`
--

LOCK TABLES `wp_fep_attachments` WRITE;
/*!40000 ALTER TABLE `wp_fep_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_fep_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_fep_messagemeta`
--

DROP TABLE IF EXISTS `wp_fep_messagemeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_fep_messagemeta` (
  `meta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fep_message_id` bigint unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `fep_message_id` (`fep_message_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_fep_messagemeta`
--

LOCK TABLES `wp_fep_messagemeta` WRITE;
/*!40000 ALTER TABLE `wp_fep_messagemeta` DISABLE KEYS */;
INSERT INTO `wp_fep_messagemeta` VALUES (1,1,'_fep_email_sent','1626978641');
/*!40000 ALTER TABLE `wp_fep_messagemeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_fep_messages`
--

DROP TABLE IF EXISTS `wp_fep_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_fep_messages` (
  `mgs_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `mgs_parent` bigint unsigned NOT NULL DEFAULT '0',
  `mgs_author` bigint unsigned NOT NULL DEFAULT '0',
  `mgs_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `mgs_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `mgs_content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `mgs_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'message',
  `mgs_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'pending',
  `mgs_last_reply_by` bigint unsigned NOT NULL DEFAULT '0',
  `mgs_last_reply_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `mgs_last_reply_excerpt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`mgs_id`),
  KEY `mgs_parent_last_time` (`mgs_parent`,`mgs_last_reply_time`),
  KEY `mgs_type_created` (`mgs_type`,`mgs_created`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_fep_messages`
--

LOCK TABLES `wp_fep_messages` WRITE;
/*!40000 ALTER TABLE `wp_fep_messages` DISABLE KEYS */;
INSERT INTO `wp_fep_messages` VALUES (1,0,3,'2021-07-22 18:30:41','Testing','123jhgjhgjhgjhgjhgjhgjhg','message','publish',3,'2021-07-22 18:30:41',' ... ');
/*!40000 ALTER TABLE `wp_fep_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_fep_participants`
--

DROP TABLE IF EXISTS `wp_fep_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_fep_participants` (
  `per_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `mgs_id` bigint unsigned NOT NULL DEFAULT '0',
  `mgs_participant` bigint unsigned NOT NULL DEFAULT '0',
  `mgs_read` bigint unsigned NOT NULL DEFAULT '0',
  `mgs_parent_read` bigint unsigned NOT NULL DEFAULT '0',
  `mgs_deleted` bigint unsigned NOT NULL DEFAULT '0',
  `mgs_archived` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`per_id`),
  UNIQUE KEY `mgs_id_participant` (`mgs_id`,`mgs_participant`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_fep_participants`
--

LOCK TABLES `wp_fep_participants` WRITE;
/*!40000 ALTER TABLE `wp_fep_participants` DISABLE KEYS */;
INSERT INTO `wp_fep_participants` VALUES (1,1,1,0,0,0,0),(2,1,3,1626983188,1626978641,0,0);
/*!40000 ALTER TABLE `wp_fep_participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_links`
--

DROP TABLE IF EXISTS `wp_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_links` (
  `link_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint unsigned NOT NULL DEFAULT '1',
  `link_rating` int NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_links`
--

LOCK TABLES `wp_links` WRITE;
/*!40000 ALTER TABLE `wp_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_options`
--

DROP TABLE IF EXISTS `wp_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_options` (
  `option_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`),
  KEY `autoload` (`autoload`)
) ENGINE=InnoDB AUTO_INCREMENT=2935 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_options`
--

LOCK TABLES `wp_options` WRITE;
/*!40000 ALTER TABLE `wp_options` DISABLE KEYS */;
INSERT INTO `wp_options` VALUES (1,'siteurl','http://3.129.13.214','yes'),(2,'home','http://3.129.13.214','yes'),(3,'blogname','Dev Site 1','yes'),(4,'blogdescription','Just another WordPress site','yes'),(5,'users_can_register','0','yes'),(6,'admin_email','johndeebdd@gmail.com','yes'),(7,'start_of_week','1','yes'),(8,'use_balanceTags','0','yes'),(9,'use_smilies','1','yes'),(10,'require_name_email','1','yes'),(11,'comments_notify','1','yes'),(12,'posts_per_rss','10','yes'),(13,'rss_use_excerpt','0','yes'),(14,'mailserver_url','mail.example.com','yes'),(15,'mailserver_login','login@example.com','yes'),(16,'mailserver_pass','password','yes'),(17,'mailserver_port','110','yes'),(18,'default_category','1','yes'),(19,'default_comment_status','open','yes'),(20,'default_ping_status','open','yes'),(21,'default_pingback_flag','0','yes'),(22,'posts_per_page','10','yes'),(23,'date_format','F j, Y','yes'),(24,'time_format','g:i a','yes'),(25,'links_updated_date_format','F j, Y g:i a','yes'),(26,'comment_moderation','0','yes'),(27,'moderation_notify','1','yes'),(28,'permalink_structure','/%postname%/','yes'),(29,'rewrite_rules','a:133:{s:7:\"fcfs/?$\";s:24:\"index.php?post_type=fcfs\";s:37:\"fcfs/feed/(feed|rdf|rss|rss2|atom)/?$\";s:41:\"index.php?post_type=fcfs&feed=$matches[1]\";s:32:\"fcfs/(feed|rdf|rss|rss2|atom)/?$\";s:41:\"index.php?post_type=fcfs&feed=$matches[1]\";s:24:\"fcfs/page/([0-9]{1,})/?$\";s:42:\"index.php?post_type=fcfs&paged=$matches[1]\";s:11:\"manifest/?$\";s:28:\"index.php?post_type=manifest\";s:41:\"manifest/feed/(feed|rdf|rss|rss2|atom)/?$\";s:45:\"index.php?post_type=manifest&feed=$matches[1]\";s:36:\"manifest/(feed|rdf|rss|rss2|atom)/?$\";s:45:\"index.php?post_type=manifest&feed=$matches[1]\";s:28:\"manifest/page/([0-9]{1,})/?$\";s:46:\"index.php?post_type=manifest&paged=$matches[1]\";s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:17:\"^wp-sitemap\\.xml$\";s:23:\"index.php?sitemap=index\";s:17:\"^wp-sitemap\\.xsl$\";s:36:\"index.php?sitemap-stylesheet=sitemap\";s:23:\"^wp-sitemap-index\\.xsl$\";s:34:\"index.php?sitemap-stylesheet=index\";s:48:\"^wp-sitemap-([a-z]+?)-([a-z\\d_-]+?)-(\\d+?)\\.xml$\";s:75:\"index.php?sitemap=$matches[1]&sitemap-subtype=$matches[2]&paged=$matches[3]\";s:34:\"^wp-sitemap-([a-z]+?)-(\\d+?)\\.xml$\";s:47:\"index.php?sitemap=$matches[1]&paged=$matches[2]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:30:\"fcfs/.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:40:\"fcfs/.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:60:\"fcfs/.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:55:\"fcfs/.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:55:\"fcfs/.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:36:\"fcfs/.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:19:\"fcfs/(.+?)/embed/?$\";s:37:\"index.php?fcfs=$matches[1]&embed=true\";s:23:\"fcfs/(.+?)/trackback/?$\";s:31:\"index.php?fcfs=$matches[1]&tb=1\";s:43:\"fcfs/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?fcfs=$matches[1]&feed=$matches[2]\";s:38:\"fcfs/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?fcfs=$matches[1]&feed=$matches[2]\";s:31:\"fcfs/(.+?)/page/?([0-9]{1,})/?$\";s:44:\"index.php?fcfs=$matches[1]&paged=$matches[2]\";s:38:\"fcfs/(.+?)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?fcfs=$matches[1]&cpage=$matches[2]\";s:27:\"fcfs/(.+?)(?:/([0-9]+))?/?$\";s:43:\"index.php?fcfs=$matches[1]&page=$matches[2]\";s:36:\"manifest/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:46:\"manifest/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:66:\"manifest/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:61:\"manifest/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:61:\"manifest/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:42:\"manifest/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:25:\"manifest/([^/]+)/embed/?$\";s:41:\"index.php?manifest=$matches[1]&embed=true\";s:29:\"manifest/([^/]+)/trackback/?$\";s:35:\"index.php?manifest=$matches[1]&tb=1\";s:49:\"manifest/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?manifest=$matches[1]&feed=$matches[2]\";s:44:\"manifest/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?manifest=$matches[1]&feed=$matches[2]\";s:37:\"manifest/([^/]+)/page/?([0-9]{1,})/?$\";s:48:\"index.php?manifest=$matches[1]&paged=$matches[2]\";s:44:\"manifest/([^/]+)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?manifest=$matches[1]&cpage=$matches[2]\";s:33:\"manifest/([^/]+)(?:/([0-9]+))?/?$\";s:47:\"index.php?manifest=$matches[1]&page=$matches[2]\";s:25:\"manifest/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:35:\"manifest/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:55:\"manifest/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:50:\"manifest/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:50:\"manifest/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:31:\"manifest/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:13:\"favicon\\.ico$\";s:19:\"index.php?favicon=1\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"([^/]+)/embed/?$\";s:37:\"index.php?name=$matches[1]&embed=true\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:24:\"([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:22:\"[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";}','yes'),(30,'hack_file','0','yes'),(31,'blog_charset','UTF-8','yes'),(32,'moderation_keys','','no'),(33,'active_plugins','a:6:{i:0;s:29:\"FastRegister/FastRegister.php\";i:1;s:47:\"better-error-messages/better-error-messages.php\";i:2;s:33:\"classic-editor/classic-editor.php\";i:3;s:101:\"disable-administration-email-verification-prompt/disable-administration-email-verification-prompt.php\";i:4;s:23:\"email-log/email-log.php\";i:5;s:25:\"fcfs-block/fcfs-block.php\";}','yes'),(34,'category_base','','yes'),(35,'ping_sites','http://rpc.pingomatic.com/','yes'),(36,'comment_max_links','2','yes'),(37,'gmt_offset','0','yes'),(38,'default_email_category','1','yes'),(39,'recently_edited','a:3:{i:0;s:80:\"/var/www/html/wp-content/plugins/better-error-messages/better-error-messages.php\";i:1;s:57:\"/var/www/html/wp-content/themes/twentytwentyone/style.css\";i:2;s:0:\"\";}','no'),(40,'template','twentytwentyone','yes'),(41,'stylesheet','twentytwentyone','yes'),(42,'comment_registration','0','yes'),(43,'html_type','text/html','yes'),(44,'use_trackback','0','yes'),(45,'default_role','subscriber','yes'),(46,'db_version','49752','yes'),(47,'uploads_use_yearmonth_folders','1','yes'),(48,'upload_path','','yes'),(49,'blog_public','0','yes'),(50,'default_link_category','2','yes'),(51,'show_on_front','posts','yes'),(52,'tag_base','','yes'),(53,'show_avatars','1','yes'),(54,'avatar_rating','G','yes'),(55,'upload_url_path','','yes'),(56,'thumbnail_size_w','150','yes'),(57,'thumbnail_size_h','150','yes'),(58,'thumbnail_crop','1','yes'),(59,'medium_size_w','300','yes'),(60,'medium_size_h','300','yes'),(61,'avatar_default','mystery','yes'),(62,'large_size_w','1024','yes'),(63,'large_size_h','1024','yes'),(64,'image_default_link_type','none','yes'),(65,'image_default_size','','yes'),(66,'image_default_align','','yes'),(67,'close_comments_for_old_posts','0','yes'),(68,'close_comments_days_old','14','yes'),(69,'thread_comments','1','yes'),(70,'thread_comments_depth','5','yes'),(71,'page_comments','0','yes'),(72,'comments_per_page','50','yes'),(73,'default_comments_page','newest','yes'),(74,'comment_order','asc','yes'),(75,'sticky_posts','a:0:{}','yes'),(76,'widget_categories','a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),(77,'widget_text','a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}','yes'),(78,'widget_rss','a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}','yes'),(79,'uninstall_plugins','a:0:{}','no'),(80,'timezone_string','','yes'),(81,'page_for_posts','0','yes'),(82,'page_on_front','0','yes'),(83,'default_post_format','0','yes'),(84,'link_manager_enabled','0','yes'),(85,'finished_splitting_shared_terms','1','yes'),(86,'site_icon','0','yes'),(87,'medium_large_size_w','768','yes'),(88,'medium_large_size_h','0','yes'),(89,'wp_page_for_privacy_policy','3','yes'),(90,'show_comments_cookies_opt_in','1','yes'),(92,'disallowed_keys','','no'),(93,'comment_previously_approved','1','yes'),(94,'auto_plugin_theme_update_emails','a:0:{}','no'),(95,'auto_update_core_dev','enabled','yes'),(96,'auto_update_core_minor','enabled','yes'),(97,'auto_update_core_major','enabled','yes'),(98,'initial_db_version','49752','yes'),(99,'wp_user_roles','a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:62:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:17:\"manage_email_logs\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}','yes'),(100,'fresh_site','0','yes'),(101,'widget_search','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),(102,'widget_recent-posts','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),(103,'widget_recent-comments','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),(104,'widget_archives','a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),(105,'widget_meta','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),(106,'sidebars_widgets','a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";}s:9:\"sidebar-2\";a:3:{i:0;s:10:\"archives-2\";i:1;s:12:\"categories-2\";i:2;s:6:\"meta-2\";}s:13:\"array_version\";i:3;}','yes'),(107,'cron','a:6:{i:1629322634;a:1:{s:46:\"el_trigger_notify_email_when_log_threshold_met\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1629324677;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1629344414;a:5:{s:18:\"wp_https_detection\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1629344419;a:3:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1629776414;a:1:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}s:7:\"version\";i:2;}','yes'),(108,'widget_pages','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(109,'widget_calendar','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(110,'widget_media_audio','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(111,'widget_media_image','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(112,'widget_media_gallery','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(113,'widget_media_video','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(114,'widget_tag_cloud','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(115,'widget_nav_menu','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(116,'widget_custom_html','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(118,'recovery_keys','a:0:{}','yes'),(119,'https_detection_errors','a:1:{s:20:\"https_request_failed\";a:1:{i:0;s:21:\"HTTPS request failed.\";}}','yes'),(126,'theme_mods_twentytwentyone','a:1:{s:18:\"custom_css_post_id\";i:-1;}','yes'),(132,'can_compress_scripts','0','no'),(145,'recently_activated','a:0:{}','yes'),(148,'email-log-db','0.3','yes'),(149,'widget_my_widget','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(152,'finished_updating_comment_type','1','yes'),(179,'_transient_health-check-site-status-result','{\"good\":15,\"recommended\":3,\"critical\":1}','yes'),(200,'recovery_mode_email_last_sent','1627053964','yes'),(358,'category_children','a:0:{}','yes'),(518,'migrate-posts-manifest','O:21:\"MigratePosts\\Manifest\":4:{s:12:\"initiatorURL\";N;s:11:\"acceptorURL\";s:20:\"http://18.223.15.113\";s:6:\"status\";N;s:8:\"manifest\";a:1:{i:0;O:24:\"MigratePosts\\Transaction\":5:{s:6:\"status\";s:10:\"NOTSTARTED\";s:9:\"directive\";s:4:\"SEND\";s:6:\"postID\";s:2:\"55\";s:14:\"destinationURL\";s:20:\"http://18.223.15.113\";s:14:\"originationURL\";N;}}}','yes'),(2565,'widget_block','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(2566,'_site_transient_update_core','O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:57:\"https://downloads.wordpress.org/release/wordpress-5.8.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:57:\"https://downloads.wordpress.org/release/wordpress-5.8.zip\";s:10:\"no_content\";s:68:\"https://downloads.wordpress.org/release/wordpress-5.8-no-content.zip\";s:11:\"new_bundled\";s:69:\"https://downloads.wordpress.org/release/wordpress-5.8-new-bundled.zip\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:3:\"5.8\";s:7:\"version\";s:3:\"5.8\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.6\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1629321415;s:15:\"version_checked\";s:3:\"5.8\";s:12:\"translations\";a:0:{}}','no'),(2568,'auto_core_update_notified','a:4:{s:4:\"type\";s:7:\"success\";s:5:\"email\";s:20:\"johndeebdd@gmail.com\";s:7:\"version\";s:3:\"5.8\";s:9:\"timestamp\";i:1626839140;}','no'),(2585,'wp_force_deactivated_plugins','a:0:{}','yes'),(2680,'_site_transient_update_plugins','O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1629321415;s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:5:{s:83:\"change-admin-email-setting-without-outbound-email/change-admin-email-mothership.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:63:\"w.org/plugins/change-admin-email-setting-without-outbound-email\";s:4:\"slug\";s:49:\"change-admin-email-setting-without-outbound-email\";s:6:\"plugin\";s:83:\"change-admin-email-setting-without-outbound-email/change-admin-email-mothership.php\";s:11:\"new_version\";s:3:\"3.1\";s:3:\"url\";s:80:\"https://wordpress.org/plugins/change-admin-email-setting-without-outbound-email/\";s:7:\"package\";s:92:\"https://downloads.wordpress.org/plugin/change-admin-email-setting-without-outbound-email.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:102:\"https://ps.w.org/change-admin-email-setting-without-outbound-email/assets/icon-256x256.jpg?rev=2264324\";s:2:\"1x\";s:102:\"https://ps.w.org/change-admin-email-setting-without-outbound-email/assets/icon-128x128.jpg?rev=2264324\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:105:\"https://ps.w.org/change-admin-email-setting-without-outbound-email/assets/banner-1544x500.jpg?rev=2264324\";s:2:\"1x\";s:104:\"https://ps.w.org/change-admin-email-setting-without-outbound-email/assets/banner-772x250.jpg?rev=2264324\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"4.9\";}s:33:\"classic-editor/classic-editor.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:28:\"w.org/plugins/classic-editor\";s:4:\"slug\";s:14:\"classic-editor\";s:6:\"plugin\";s:33:\"classic-editor/classic-editor.php\";s:11:\"new_version\";s:5:\"1.6.2\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/classic-editor/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/plugin/classic-editor.1.6.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/classic-editor/assets/icon-256x256.png?rev=1998671\";s:2:\"1x\";s:67:\"https://ps.w.org/classic-editor/assets/icon-128x128.png?rev=1998671\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:70:\"https://ps.w.org/classic-editor/assets/banner-1544x500.png?rev=1998671\";s:2:\"1x\";s:69:\"https://ps.w.org/classic-editor/assets/banner-772x250.png?rev=1998676\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"4.9\";}s:101:\"disable-administration-email-verification-prompt/disable-administration-email-verification-prompt.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:62:\"w.org/plugins/disable-administration-email-verification-prompt\";s:4:\"slug\";s:48:\"disable-administration-email-verification-prompt\";s:6:\"plugin\";s:101:\"disable-administration-email-verification-prompt/disable-administration-email-verification-prompt.php\";s:11:\"new_version\";s:5:\"1.0.3\";s:3:\"url\";s:79:\"https://wordpress.org/plugins/disable-administration-email-verification-prompt/\";s:7:\"package\";s:97:\"https://downloads.wordpress.org/plugin/disable-administration-email-verification-prompt.1.0.3.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:101:\"https://ps.w.org/disable-administration-email-verification-prompt/assets/icon-256x256.png?rev=2197159\";s:2:\"1x\";s:101:\"https://ps.w.org/disable-administration-email-verification-prompt/assets/icon-128x128.png?rev=2197159\";}s:7:\"banners\";a:0:{}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"4.9\";}s:23:\"email-log/email-log.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:23:\"w.org/plugins/email-log\";s:4:\"slug\";s:9:\"email-log\";s:6:\"plugin\";s:23:\"email-log/email-log.php\";s:11:\"new_version\";s:5:\"2.4.5\";s:3:\"url\";s:40:\"https://wordpress.org/plugins/email-log/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/plugin/email-log.2.4.5.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:62:\"https://ps.w.org/email-log/assets/icon-256x256.png?rev=1710920\";s:2:\"1x\";s:62:\"https://ps.w.org/email-log/assets/icon-128x128.png?rev=1710920\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:65:\"https://ps.w.org/email-log/assets/banner-1544x500.png?rev=1708230\";s:2:\"1x\";s:64:\"https://ps.w.org/email-log/assets/banner-772x250.png?rev=1708230\";}s:11:\"banners_rtl\";a:2:{s:2:\"2x\";s:69:\"https://ps.w.org/email-log/assets/banner-1544x500-rtl.png?rev=1708230\";s:2:\"1x\";s:68:\"https://ps.w.org/email-log/assets/banner-772x250-rtl.png?rev=1708230\";}s:8:\"requires\";s:3:\"4.0\";}s:33:\"user-switching/user-switching.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:28:\"w.org/plugins/user-switching\";s:4:\"slug\";s:14:\"user-switching\";s:6:\"plugin\";s:33:\"user-switching/user-switching.php\";s:11:\"new_version\";s:5:\"1.5.7\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/user-switching/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/plugin/user-switching.1.5.7.zip\";s:5:\"icons\";a:3:{s:2:\"2x\";s:67:\"https://ps.w.org/user-switching/assets/icon-256x256.png?rev=2204931\";s:2:\"1x\";s:59:\"https://ps.w.org/user-switching/assets/icon.svg?rev=2032062\";s:3:\"svg\";s:59:\"https://ps.w.org/user-switching/assets/icon.svg?rev=2032062\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:70:\"https://ps.w.org/user-switching/assets/banner-1544x500.png?rev=2204929\";s:2:\"1x\";s:69:\"https://ps.w.org/user-switching/assets/banner-772x250.png?rev=2204929\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"3.7\";}}s:7:\"checked\";a:11:{s:47:\"better-error-messages/better-error-messages.php\";s:3:\"1.0\";s:83:\"change-admin-email-setting-without-outbound-email/change-admin-email-mothership.php\";s:2:\"99\";s:33:\"classic-editor/classic-editor.php\";s:5:\"1.6.2\";s:101:\"disable-administration-email-verification-prompt/disable-administration-email-verification-prompt.php\";s:5:\"1.0.3\";s:23:\"email-log/email-log.php\";s:5:\"2.4.5\";s:29:\"FastRegister/FastRegister.php\";s:3:\"1.2\";s:25:\"fcfs-block/fcfs-block.php\";s:1:\"1\";s:15:\"legit/legit.php\";s:1:\"1\";s:31:\"migrate-posts/migrate-posts.php\";s:1:\"1\";s:33:\"user-switching/user-switching.php\";s:5:\"1.5.7\";s:15:\"WPbdd/WPbdd.php\";s:3:\"0.3\";}}','no'),(2681,'fs_active_plugins','O:8:\"stdClass\":0:{}','yes'),(2682,'fs_debug_mode','','yes'),(2683,'fs_accounts','a:6:{s:21:\"id_slug_type_path_map\";a:1:{i:5809;a:2:{s:4:\"slug\";s:12:\"front-end-pm\";s:4:\"type\";s:6:\"plugin\";}}s:11:\"plugin_data\";a:1:{s:12:\"front-end-pm\";a:16:{s:16:\"plugin_main_file\";O:8:\"stdClass\":1:{s:9:\"prev_path\";s:29:\"front-end-pm/front-end-pm.php\";}s:20:\"is_network_activated\";b:0;s:17:\"install_timestamp\";i:1626978525;s:17:\"was_plugin_loaded\";b:1;s:21:\"is_plugin_new_install\";b:1;s:16:\"sdk_last_version\";N;s:11:\"sdk_version\";s:5:\"2.4.2\";s:16:\"sdk_upgrade_mode\";b:1;s:18:\"sdk_downgrade_mode\";b:0;s:19:\"plugin_last_version\";N;s:14:\"plugin_version\";s:6:\"11.3.3\";s:19:\"plugin_upgrade_mode\";b:1;s:21:\"plugin_downgrade_mode\";b:0;s:17:\"connectivity_test\";a:6:{s:12:\"is_connected\";b:1;s:4:\"host\";s:12:\"3.129.13.214\";s:9:\"server_ip\";s:13:\"24.253.35.100\";s:9:\"is_active\";b:1;s:9:\"timestamp\";i:1626978525;s:7:\"version\";s:6:\"11.3.3\";}s:15:\"prev_is_premium\";b:0;s:16:\"uninstall_reason\";O:8:\"stdClass\":3:{s:2:\"id\";s:1:\"7\";s:4:\"info\";s:2:\"xx\";s:12:\"is_anonymous\";b:1;}}}s:13:\"file_slug_map\";a:1:{s:29:\"front-end-pm/front-end-pm.php\";s:12:\"front-end-pm\";}s:7:\"plugins\";a:1:{s:12:\"front-end-pm\";O:9:\"FS_Plugin\":23:{s:16:\"parent_plugin_id\";N;s:5:\"title\";s:12:\"Front End PM\";s:4:\"slug\";s:12:\"front-end-pm\";s:12:\"premium_slug\";s:16:\"front-end-pm-pro\";s:4:\"type\";s:6:\"plugin\";s:20:\"affiliate_moderation\";b:0;s:19:\"is_wp_org_compliant\";b:1;s:22:\"premium_releases_count\";N;s:4:\"file\";s:29:\"front-end-pm/front-end-pm.php\";s:7:\"version\";s:6:\"11.3.3\";s:11:\"auto_update\";N;s:4:\"info\";N;s:10:\"is_premium\";b:0;s:14:\"premium_suffix\";s:3:\"PRO\";s:7:\"is_live\";b:1;s:9:\"bundle_id\";N;s:17:\"bundle_public_key\";N;s:10:\"public_key\";s:32:\"pk_c7329ca7019f17b830c22b8f3a729\";s:10:\"secret_key\";N;s:2:\"id\";s:4:\"5809\";s:7:\"updated\";N;s:7:\"created\";N;s:22:\"\0FS_Entity\0_is_updated\";b:0;}}s:9:\"unique_id\";s:32:\"28ec3db3953da39c236857d4c24654a7\";s:13:\"admin_notices\";a:1:{s:12:\"front-end-pm\";a:0:{}}}','yes'),(2684,'fs_gdpr','a:1:{s:2:\"u3\";a:1:{s:8:\"required\";b:0;}}','yes'),(2685,'fs_api_cache','a:0:{}','no'),(2686,'fep_db_version','1121','yes'),(2687,'FEP_admin_options','a:5:{s:15:\"userrole_access\";a:5:{i:0;s:13:\"administrator\";i:1;s:6:\"editor\";i:2;s:6:\"author\";i:3;s:11:\"contributor\";i:4;s:10:\"subscriber\";}s:20:\"userrole_new_message\";a:5:{i:0;s:13:\"administrator\";i:1;s:6:\"editor\";i:2;s:6:\"author\";i:3;s:11:\"contributor\";i:4;s:10:\"subscriber\";}s:14:\"userrole_reply\";a:5:{i:0;s:13:\"administrator\";i:1;s:6:\"editor\";i:2;s:6:\"author\";i:3;s:11:\"contributor\";i:4;s:10:\"subscriber\";}s:14:\"plugin_version\";s:6:\"11.3.3\";s:7:\"page_id\";i:1590;}','yes'),(2689,'widget_fep_menu_widget','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(2690,'widget_fep_text_widget','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(2691,'widget_fep_empty_widget','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(2742,'_site_transient_update_themes','O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1629321415;s:7:\"checked\";a:5:{s:12:\"experon-blog\";s:5:\"1.0.1\";s:7:\"experon\";s:5:\"1.4.2\";s:14:\"twentynineteen\";s:3:\"2.1\";s:12:\"twentytwenty\";s:3:\"1.8\";s:15:\"twentytwentyone\";s:3:\"1.4\";}s:8:\"response\";a:0:{}s:9:\"no_update\";a:5:{s:12:\"experon-blog\";a:6:{s:5:\"theme\";s:12:\"experon-blog\";s:11:\"new_version\";s:5:\"1.0.1\";s:3:\"url\";s:42:\"https://wordpress.org/themes/experon-blog/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/theme/experon-blog.1.0.1.zip\";s:8:\"requires\";s:3:\"5.0\";s:12:\"requires_php\";s:3:\"5.6\";}s:7:\"experon\";a:6:{s:5:\"theme\";s:7:\"experon\";s:11:\"new_version\";s:5:\"1.4.2\";s:3:\"url\";s:37:\"https://wordpress.org/themes/experon/\";s:7:\"package\";s:55:\"https://downloads.wordpress.org/theme/experon.1.4.2.zip\";s:8:\"requires\";s:3:\"5.0\";s:12:\"requires_php\";s:3:\"5.6\";}s:14:\"twentynineteen\";a:6:{s:5:\"theme\";s:14:\"twentynineteen\";s:11:\"new_version\";s:3:\"2.1\";s:3:\"url\";s:44:\"https://wordpress.org/themes/twentynineteen/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/theme/twentynineteen.2.1.zip\";s:8:\"requires\";s:5:\"4.9.6\";s:12:\"requires_php\";s:5:\"5.2.4\";}s:12:\"twentytwenty\";a:6:{s:5:\"theme\";s:12:\"twentytwenty\";s:11:\"new_version\";s:3:\"1.8\";s:3:\"url\";s:42:\"https://wordpress.org/themes/twentytwenty/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/theme/twentytwenty.1.8.zip\";s:8:\"requires\";s:3:\"4.7\";s:12:\"requires_php\";s:5:\"5.2.4\";}s:15:\"twentytwentyone\";a:6:{s:5:\"theme\";s:15:\"twentytwentyone\";s:11:\"new_version\";s:3:\"1.4\";s:3:\"url\";s:45:\"https://wordpress.org/themes/twentytwentyone/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/theme/twentytwentyone.1.4.zip\";s:8:\"requires\";s:3:\"5.3\";s:12:\"requires_php\";s:3:\"5.6\";}}s:12:\"translations\";a:0:{}}','no'),(2921,'_site_transient_timeout_theme_roots','1629323215','no'),(2922,'_site_transient_theme_roots','a:5:{s:12:\"experon-blog\";s:7:\"/themes\";s:7:\"experon\";s:7:\"/themes\";s:14:\"twentynineteen\";s:7:\"/themes\";s:12:\"twentytwenty\";s:7:\"/themes\";s:15:\"twentytwentyone\";s:7:\"/themes\";}','no'),(2923,'_transient_timeout_el_addon_data','1629364616','no'),(2924,'_transient_el_addon_data','a:2:{s:8:\"products\";a:5:{i:0;a:3:{s:4:\"info\";a:14:{s:2:\"id\";i:18;s:4:\"slug\";s:11:\"more-fields\";s:5:\"title\";s:11:\"More Fields\";s:11:\"create_date\";s:19:\"2017-03-07 11:50:43\";s:13:\"modified_date\";s:19:\"2020-07-05 11:31:48\";s:6:\"status\";s:7:\"publish\";s:4:\"link\";s:46:\"http://wpemaillog.com/?post_type=download&p=18\";s:7:\"content\";s:409:\"More Fields add-on shows additional fields about the email in the email log list page. The following are the additional fields that are added by this add-on.\r\n<ul>\r\n 	<li>From</li>\r\n 	<li>CC</li>\r\n 	<li>BCC</li>\r\n 	<li>Reply To</li>\r\n 	<li>Attachment</li>\r\n</ul>\r\nThese additional fields will allow you to see more information about the logged email.\r\n<h3>Screenshots</h3>\r\n[gallery columns=\"2\" ids=\"974,975\"]\";s:7:\"excerpt\";s:110:\"More Fields add-on shows additional fields in the email log page like From, CC, BCC, Reply To, Attachment etc.\";s:9:\"thumbnail\";s:75:\"https://wpemaillog.com/wp-content/uploads/edd/2016/11/more-fields-addon.png\";s:8:\"category\";a:1:{i:0;a:10:{s:7:\"term_id\";i:4;s:4:\"name\";s:5:\"Addon\";s:4:\"slug\";s:5:\"addon\";s:10:\"term_group\";i:0;s:16:\"term_taxonomy_id\";i:4;s:8:\"taxonomy\";s:17:\"download_category\";s:11:\"description\";s:0:\"\";s:6:\"parent\";i:0;s:5:\"count\";i:5;s:6:\"filter\";s:3:\"raw\";}}s:4:\"tags\";b:0;s:9:\"permalink\";s:42:\"https://wpemaillog.com/addons/more-fields/\";s:7:\"version\";s:5:\"2.1.0\";}s:7:\"pricing\";a:3:{s:10:\"singlesite\";s:5:\"19.00\";s:8:\"2-5sites\";s:5:\"37.00\";s:14:\"unlimitedsites\";s:5:\"49.00\";}s:9:\"licensing\";a:4:{s:7:\"enabled\";b:1;s:7:\"version\";s:5:\"2.1.0\";s:8:\"exp_unit\";s:5:\"years\";s:10:\"exp_length\";s:1:\"1\";}}i:1;a:3:{s:4:\"info\";a:14:{s:2:\"id\";i:16;s:4:\"slug\";s:12:\"resend-email\";s:5:\"title\";s:12:\"Resend Email\";s:11:\"create_date\";s:19:\"2017-03-07 11:40:25\";s:13:\"modified_date\";s:19:\"2020-05-22 13:44:15\";s:6:\"status\";s:7:\"publish\";s:4:\"link\";s:46:\"http://wpemaillog.com/?post_type=download&p=16\";s:7:\"content\";s:369:\"Resend Email add-on allows you to resend the entire email directly from the email log. Before re-sending the email, this add-on allows you to modify the different fields before re-sending the email.\r\n\r\nYou can also resend all emails or only selected emails in bulk in addition to individually re-sending them.\r\n<h3>Screenshots</h3>\r\n[gallery ids=\"980,981,982,983,984\"]\";s:7:\"excerpt\";s:156:\"Resend Email add-on allows you to resend the entire email directly from the email log. You can also modify the different fields before re-sending the email.\";s:9:\"thumbnail\";s:76:\"https://wpemaillog.com/wp-content/uploads/edd/2016/11/resend-email-addon.png\";s:8:\"category\";a:1:{i:0;a:10:{s:7:\"term_id\";i:4;s:4:\"name\";s:5:\"Addon\";s:4:\"slug\";s:5:\"addon\";s:10:\"term_group\";i:0;s:16:\"term_taxonomy_id\";i:4;s:8:\"taxonomy\";s:17:\"download_category\";s:11:\"description\";s:0:\"\";s:6:\"parent\";i:0;s:5:\"count\";i:5;s:6:\"filter\";s:3:\"raw\";}}s:4:\"tags\";b:0;s:9:\"permalink\";s:43:\"https://wpemaillog.com/addons/resend-email/\";s:7:\"version\";s:5:\"2.2.0\";}s:7:\"pricing\";a:3:{s:10:\"singlesite\";s:5:\"19.00\";s:8:\"2-5sites\";s:5:\"37.00\";s:14:\"unlimitedsites\";s:5:\"49.00\";}s:9:\"licensing\";a:4:{s:7:\"enabled\";b:1;s:7:\"version\";s:5:\"2.2.0\";s:8:\"exp_unit\";s:5:\"years\";s:10:\"exp_length\";s:1:\"1\";}}i:2;a:3:{s:4:\"info\";a:14:{s:2:\"id\";i:311;s:4:\"slug\";s:16:\"auto-delete-logs\";s:5:\"title\";s:16:\"Auto Delete Logs\";s:11:\"create_date\";s:19:\"2017-03-07 11:30:56\";s:13:\"modified_date\";s:19:\"2020-07-05 11:33:41\";s:6:\"status\";s:7:\"publish\";s:4:\"link\";s:48:\"https://wpemaillog.com/?post_type=download&p=311\";s:7:\"content\";s:154:\"The Auto Delete Logs add-on allows you to automatically delete logs based on a schedule.\r\n<h3>Screenshots</h3>\r\n[gallery columns=\"2\" ids=\"791182, 791183\"]\";s:7:\"excerpt\";s:88:\"The Auto Delete Logs add-on allows you to automatically delete logs based on a schedule.\";s:9:\"thumbnail\";s:75:\"https://wpemaillog.com/wp-content/uploads/edd/2017/03/delete-logs-addon.png\";s:8:\"category\";a:1:{i:0;a:10:{s:7:\"term_id\";i:4;s:4:\"name\";s:5:\"Addon\";s:4:\"slug\";s:5:\"addon\";s:10:\"term_group\";i:0;s:16:\"term_taxonomy_id\";i:4;s:8:\"taxonomy\";s:17:\"download_category\";s:11:\"description\";s:0:\"\";s:6:\"parent\";i:0;s:5:\"count\";i:5;s:6:\"filter\";s:3:\"raw\";}}s:4:\"tags\";b:0;s:9:\"permalink\";s:47:\"https://wpemaillog.com/addons/auto-delete-logs/\";s:7:\"version\";s:5:\"1.1.1\";}s:7:\"pricing\";a:3:{s:10:\"singlesite\";s:5:\"19.00\";s:8:\"2-5sites\";s:5:\"37.00\";s:14:\"unlimitedsites\";s:5:\"49.00\";}s:9:\"licensing\";a:4:{s:7:\"enabled\";b:1;s:7:\"version\";s:5:\"1.1.1\";s:8:\"exp_unit\";s:5:\"years\";s:10:\"exp_length\";s:1:\"1\";}}i:3;a:3:{s:4:\"info\";a:14:{s:2:\"id\";i:20;s:4:\"slug\";s:13:\"forward-email\";s:5:\"title\";s:13:\"Forward Email\";s:11:\"create_date\";s:19:\"2017-03-07 11:30:56\";s:13:\"modified_date\";s:19:\"2020-05-27 13:21:45\";s:6:\"status\";s:7:\"publish\";s:4:\"link\";s:46:\"http://wpemaillog.com/?post_type=download&p=20\";s:7:\"content\";s:358:\"Forward Email add-on allows you to send a copy of all the emails send from WordPress, to another email address. The add-on allows you to choose whether you want to forward through to, cc or bcc fields. This can be extremely useful when you want to debug by analyzing the emails that are sent from WordPress.\r\n<h3>Screenshots</h3>\r\n[gallery ids=\"987,988,989\"]\";s:7:\"excerpt\";s:110:\"Forward Email add-on allows you to send a copy of all the emails send from WordPress, to another email address\";s:9:\"thumbnail\";s:77:\"https://wpemaillog.com/wp-content/uploads/edd/2016/11/forward-email-addon.png\";s:8:\"category\";a:1:{i:0;a:10:{s:7:\"term_id\";i:4;s:4:\"name\";s:5:\"Addon\";s:4:\"slug\";s:5:\"addon\";s:10:\"term_group\";i:0;s:16:\"term_taxonomy_id\";i:4;s:8:\"taxonomy\";s:17:\"download_category\";s:11:\"description\";s:0:\"\";s:6:\"parent\";i:0;s:5:\"count\";i:5;s:6:\"filter\";s:3:\"raw\";}}s:4:\"tags\";b:0;s:9:\"permalink\";s:44:\"https://wpemaillog.com/addons/forward-email/\";s:7:\"version\";s:5:\"2.0.2\";}s:7:\"pricing\";a:3:{s:10:\"singlesite\";s:5:\"19.00\";s:8:\"2-5sites\";s:5:\"37.00\";s:14:\"unlimitedsites\";s:5:\"49.00\";}s:9:\"licensing\";a:4:{s:7:\"enabled\";b:1;s:7:\"version\";s:5:\"2.0.2\";s:8:\"exp_unit\";s:5:\"years\";s:10:\"exp_length\";s:1:\"1\";}}i:4;a:3:{s:4:\"info\";a:14:{s:2:\"id\";i:308;s:4:\"slug\";s:11:\"export-logs\";s:5:\"title\";s:11:\"Export Logs\";s:11:\"create_date\";s:19:\"2017-03-07 11:20:12\";s:13:\"modified_date\";s:19:\"2020-07-05 11:34:53\";s:6:\"status\";s:7:\"publish\";s:4:\"link\";s:48:\"https://wpemaillog.com/?post_type=download&p=308\";s:7:\"content\";s:215:\"Export Logs add-on allows you to export the logged email logs as a csv file. The exported logs can be used for further processing or for record keeping.\r\n<h3>Screenshots</h3>\r\n[gallery ids=\"965,966,967,968, 791221\"]\";s:7:\"excerpt\";s:103:\"Export Logs add-on allows you to export the logged email logs for further processing or record keeping.\";s:9:\"thumbnail\";s:75:\"https://wpemaillog.com/wp-content/uploads/edd/2017/03/export-logs-addon.png\";s:8:\"category\";a:1:{i:0;a:10:{s:7:\"term_id\";i:4;s:4:\"name\";s:5:\"Addon\";s:4:\"slug\";s:5:\"addon\";s:10:\"term_group\";i:0;s:16:\"term_taxonomy_id\";i:4;s:8:\"taxonomy\";s:17:\"download_category\";s:11:\"description\";s:0:\"\";s:6:\"parent\";i:0;s:5:\"count\";i:5;s:6:\"filter\";s:3:\"raw\";}}s:4:\"tags\";b:0;s:9:\"permalink\";s:42:\"https://wpemaillog.com/addons/export-logs/\";s:7:\"version\";s:5:\"1.3.0\";}s:7:\"pricing\";a:3:{s:10:\"singlesite\";s:5:\"19.00\";s:8:\"2-5sites\";s:5:\"37.00\";s:14:\"unlimitedsites\";s:5:\"49.00\";}s:9:\"licensing\";a:4:{s:7:\"enabled\";b:1;s:7:\"version\";s:5:\"1.3.0\";s:8:\"exp_unit\";s:5:\"years\";s:10:\"exp_length\";s:1:\"1\";}}}s:13:\"request_speed\";d:0.0055980682373046875;}','no'),(2925,'_site_transient_timeout_browser_7eb58c7166c36d2a167da3ac5db9e9b2','1629926216','no'),(2926,'_site_transient_browser_7eb58c7166c36d2a167da3ac5db9e9b2','a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:13:\"92.0.4515.131\";s:8:\"platform\";s:5:\"Linux\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}','no'),(2927,'_site_transient_timeout_php_check_9236ad8f2e178e4ce7b4ef5302b7fae9','1629926217','no'),(2928,'_site_transient_php_check_9236ad8f2e178e4ce7b4ef5302b7fae9','a:5:{s:19:\"recommended_version\";s:3:\"7.4\";s:15:\"minimum_version\";s:6:\"5.6.20\";s:12:\"is_supported\";b:1;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}','no'),(2929,'_site_transient_timeout_community-events-a7357de8bc456af953e615b9f50062ab','1629364617','no'),(2930,'_site_transient_community-events-a7357de8bc456af953e615b9f50062ab','a:4:{s:9:\"sandboxed\";b:0;s:5:\"error\";N;s:8:\"location\";a:1:{s:2:\"ip\";s:10:\"3.129.13.0\";}s:6:\"events\";a:6:{i:0;a:10:{s:4:\"type\";s:6:\"meetup\";s:5:\"title\";s:55:\"Watch Party + Discussion group: Intro to Block Patterns\";s:3:\"url\";s:68:\"https://www.meetup.com/learn-wordpress-discussions/events/279774853/\";s:6:\"meetup\";s:27:\"Learn WordPress Discussions\";s:10:\"meetup_url\";s:51:\"https://www.meetup.com/learn-wordpress-discussions/\";s:4:\"date\";s:19:\"2021-08-18 18:00:00\";s:8:\"end_date\";s:19:\"2021-08-18 19:00:00\";s:20:\"start_unix_timestamp\";i:1629334800;s:18:\"end_unix_timestamp\";i:1629338400;s:8:\"location\";a:4:{s:8:\"location\";s:6:\"Online\";s:7:\"country\";s:2:\"US\";s:8:\"latitude\";d:37.779998779297;s:9:\"longitude\";d:-122.41999816895;}}i:1;a:10:{s:4:\"type\";s:6:\"meetup\";s:5:\"title\";s:23:\"Athens WordPress Meetup\";s:3:\"url\";s:61:\"https://www.meetup.com/Athens-WordPress/events/rppxwryccmbcb/\";s:6:\"meetup\";s:16:\"Athens WordPress\";s:10:\"meetup_url\";s:40:\"https://www.meetup.com/Athens-WordPress/\";s:4:\"date\";s:19:\"2021-09-01 18:00:00\";s:8:\"end_date\";s:19:\"2021-09-01 20:00:00\";s:20:\"start_unix_timestamp\";i:1630533600;s:18:\"end_unix_timestamp\";i:1630540800;s:8:\"location\";a:4:{s:8:\"location\";s:6:\"Online\";s:7:\"country\";s:2:\"US\";s:8:\"latitude\";d:39.310001373291;s:9:\"longitude\";d:-82.099998474121;}}i:2;a:10:{s:4:\"type\";s:6:\"meetup\";s:5:\"title\";s:33:\"Monthly Columbus WordPress Meetup\";s:3:\"url\";s:56:\"https://www.meetup.com/wp-columbus/events/hrwfjsyccmbdb/\";s:6:\"meetup\";s:25:\"Columbus WordPress Meetup\";s:10:\"meetup_url\";s:35:\"https://www.meetup.com/wp-columbus/\";s:4:\"date\";s:19:\"2021-09-02 18:30:00\";s:8:\"end_date\";s:19:\"2021-09-02 21:00:00\";s:20:\"start_unix_timestamp\";i:1630621800;s:18:\"end_unix_timestamp\";i:1630630800;s:8:\"location\";a:4:{s:8:\"location\";s:6:\"Online\";s:7:\"country\";s:2:\"US\";s:8:\"latitude\";d:40.119998931885;s:9:\"longitude\";d:-83.029998779297;}}i:3;a:10:{s:4:\"type\";s:6:\"meetup\";s:5:\"title\";s:23:\"Athens WordPress Meetup\";s:3:\"url\";s:61:\"https://www.meetup.com/Athens-WordPress/events/rppxwryccnbjb/\";s:6:\"meetup\";s:16:\"Athens WordPress\";s:10:\"meetup_url\";s:40:\"https://www.meetup.com/Athens-WordPress/\";s:4:\"date\";s:19:\"2021-10-06 18:00:00\";s:8:\"end_date\";s:19:\"2021-10-06 20:00:00\";s:20:\"start_unix_timestamp\";i:1633557600;s:18:\"end_unix_timestamp\";i:1633564800;s:8:\"location\";a:4:{s:8:\"location\";s:6:\"Online\";s:7:\"country\";s:2:\"US\";s:8:\"latitude\";d:39.310001373291;s:9:\"longitude\";d:-82.099998474121;}}i:4;a:10:{s:4:\"type\";s:6:\"meetup\";s:5:\"title\";s:33:\"Monthly Columbus WordPress Meetup\";s:3:\"url\";s:56:\"https://www.meetup.com/wp-columbus/events/hrwfjsyccnbkb/\";s:6:\"meetup\";s:25:\"Columbus WordPress Meetup\";s:10:\"meetup_url\";s:35:\"https://www.meetup.com/wp-columbus/\";s:4:\"date\";s:19:\"2021-10-07 18:30:00\";s:8:\"end_date\";s:19:\"2021-10-07 21:00:00\";s:20:\"start_unix_timestamp\";i:1633645800;s:18:\"end_unix_timestamp\";i:1633654800;s:8:\"location\";a:4:{s:8:\"location\";s:6:\"Online\";s:7:\"country\";s:2:\"US\";s:8:\"latitude\";d:40.119998931885;s:9:\"longitude\";d:-83.029998779297;}}i:5;a:10:{s:4:\"type\";s:6:\"meetup\";s:5:\"title\";s:23:\"Athens WordPress Meetup\";s:3:\"url\";s:61:\"https://www.meetup.com/Athens-WordPress/events/rppxwryccpbfb/\";s:6:\"meetup\";s:16:\"Athens WordPress\";s:10:\"meetup_url\";s:40:\"https://www.meetup.com/Athens-WordPress/\";s:4:\"date\";s:19:\"2021-11-03 18:00:00\";s:8:\"end_date\";s:19:\"2021-11-03 20:00:00\";s:20:\"start_unix_timestamp\";i:1635976800;s:18:\"end_unix_timestamp\";i:1635984000;s:8:\"location\";a:4:{s:8:\"location\";s:6:\"Online\";s:7:\"country\";s:2:\"US\";s:8:\"latitude\";d:39.310001373291;s:9:\"longitude\";d:-82.099998474121;}}}}','no');
/*!40000 ALTER TABLE `wp_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_postmeta`
--

DROP TABLE IF EXISTS `wp_postmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_postmeta` (
  `meta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=2093 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_postmeta`
--

LOCK TABLES `wp_postmeta` WRITE;
/*!40000 ALTER TABLE `wp_postmeta` DISABLE KEYS */;
INSERT INTO `wp_postmeta` VALUES (1593,1566,'_note','a:4:{s:5:\"color\";s:7:\"#ffffff\";s:10:\"color_text\";s:5:\"white\";s:10:\"visibility\";s:7:\"private\";s:9:\"note_type\";s:7:\"regular\";}'),(1605,1577,'_wp_attached_file','2021/07/d1qr4l-80520085-bc29-4bec-91cb-84b9031f32fe.jpg'),(1606,1577,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:1781;s:6:\"height\";i:1182;s:4:\"file\";s:55:\"2021/07/d1qr4l-80520085-bc29-4bec-91cb-84b9031f32fe.jpg\";s:5:\"sizes\";a:6:{s:6:\"medium\";a:4:{s:4:\"file\";s:55:\"d1qr4l-80520085-bc29-4bec-91cb-84b9031f32fe-300x199.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:199;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:56:\"d1qr4l-80520085-bc29-4bec-91cb-84b9031f32fe-1024x680.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:680;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:55:\"d1qr4l-80520085-bc29-4bec-91cb-84b9031f32fe-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:55:\"d1qr4l-80520085-bc29-4bec-91cb-84b9031f32fe-768x510.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:510;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"1536x1536\";a:4:{s:4:\"file\";s:57:\"d1qr4l-80520085-bc29-4bec-91cb-84b9031f32fe-1536x1019.jpg\";s:5:\"width\";i:1536;s:6:\"height\";i:1019;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"post-thumbnail\";a:4:{s:4:\"file\";s:57:\"d1qr4l-80520085-bc29-4bec-91cb-84b9031f32fe-1568x1041.jpg\";s:5:\"width\";i:1568;s:6:\"height\";i:1041;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:6:\"PV320C\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),(1608,1555,'_edit_lock','1629321501:3'),(1610,1558,'_edit_lock','1627307768:3'),(1611,1556,'_edit_lock','1627475627:3'),(1613,1556,'_edit_last','3'),(1615,1557,'_edit_lock','1627475632:3'),(1697,1555,'_edit_last','3'),(2064,1557,'_edit_last','3'),(2066,1558,'_edit_last','3'),(2068,1559,'_edit_lock','1627307774:3'),(2085,1619,'_wp_trash_meta_status','draft'),(2086,1619,'_wp_trash_meta_time','1627475780'),(2087,1619,'_wp_desired_post_slug',''),(2089,1620,'_wp_trash_meta_status','draft'),(2090,1620,'_wp_trash_meta_time','1627475782'),(2091,1620,'_wp_desired_post_slug','');
/*!40000 ALTER TABLE `wp_postmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_posts`
--

DROP TABLE IF EXISTS `wp_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_posts` (
  `ID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int NOT NULL DEFAULT '0',
  `post_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=1623 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_posts`
--

LOCK TABLES `wp_posts` WRITE;
/*!40000 ALTER TABLE `wp_posts` DISABLE KEYS */;
INSERT INTO `wp_posts` VALUES (1555,1,'2021-07-06 12:12:28','2021-07-06 12:12:28','Content of test post 1.\r\n[FCFS status=\"open\" max-users=\"15\"]','Test Post One','','publish','open','open','','test-post-one','','','2021-08-18 21:17:26','2021-08-18 21:17:26','',0,'http://3.129.13.214/test-post-one/',0,'post','',0),(1556,1,'2021-07-06 12:12:28','2021-07-06 12:12:28','Content of test post 2.','Test Post Two','','publish','open','open','','test-post-two','','','2021-07-26 13:57:43','2021-07-26 13:57:43','',0,'http://3.129.13.214/test-post-two/',0,'post','',0),(1557,1,'2021-07-06 12:12:28','2021-07-06 12:12:28','Content of test post 3.','Test Post Three','','publish','open','open','','test-post-three','','','2021-07-26 13:58:24','2021-07-26 13:58:24','',0,'http://3.129.13.214/test-post-three/',0,'post','',0),(1558,1,'2021-07-06 12:12:28','2021-07-06 12:12:28','Content of test post 4.','Test Post Four','','publish','open','open','','test-post-four','','','2021-07-26 13:58:31','2021-07-26 13:58:31','',0,'http://3.129.13.214/test-post-four/',0,'post','',0),(1559,1,'2021-07-06 12:12:28','2021-07-06 12:12:28','Content of test post 5.','Test Post Five','','publish','open','open','','test-post-five','','','2021-07-23 16:01:54','2021-07-23 16:01:54','',0,'http://3.129.13.214/test-post-five/',0,'post','',0),(1566,3,'2021-07-15 20:33:20','2021-07-15 20:33:20','\n				\n				\n				\n																','adsfasdfasdfa','','publish','closed','closed','','new-note','','','2021-07-15 20:34:08','2021-07-15 20:34:08','',0,'http://3.129.13.214/notes/new-note/',0,'note','',0),(1577,3,'2021-07-17 22:38:50','2021-07-17 22:38:50','','d1qr4l-80520085-bc29-4bec-91cb-84b9031f32fe','','inherit','open','closed','','d1qr4l-80520085-bc29-4bec-91cb-84b9031f32fe','','','2021-07-17 22:38:50','2021-07-17 22:38:50','',0,'http://3.129.13.214/wp-content/uploads/2021/07/d1qr4l-80520085-bc29-4bec-91cb-84b9031f32fe.jpg',0,'attachment','image/jpeg',0),(1581,3,'2021-07-21 19:37:40','2021-07-21 19:37:40','Content of test post 2.','Test Post Two','','inherit','closed','closed','','1556-revision-v1','','','2021-07-21 19:37:40','2021-07-21 19:37:40','',1556,'http://3.129.13.214/?p=1581',0,'revision','',0),(1609,3,'2021-07-23 14:57:51','2021-07-23 14:57:51','Content of test post 1.','Test Post One','','inherit','closed','closed','','1555-revision-v1','','','2021-07-23 14:57:51','2021-07-23 14:57:51','',1555,'http://3.129.13.214/?p=1609',0,'revision','',0),(1611,3,'2021-07-23 15:28:07','2021-07-23 15:28:07','Content of test post 1.\r\n[FCFS]','Test Post One','','inherit','closed','closed','','1555-revision-v1','','','2021-07-23 15:28:07','2021-07-23 15:28:07','',1555,'http://3.129.13.214/?p=1611',0,'revision','',0),(1612,3,'2021-07-23 15:39:22','2021-07-23 15:39:22','Content of test post 3.','Test Post Three','','inherit','closed','closed','','1557-revision-v1','','','2021-07-23 15:39:22','2021-07-23 15:39:22','',1557,'http://3.129.13.214/?p=1612',0,'revision','',0),(1613,3,'2021-07-23 15:39:34','2021-07-23 15:39:34','Content of test post 4.','Test Post Four','','inherit','closed','closed','','1558-revision-v1','','','2021-07-23 15:39:34','2021-07-23 15:39:34','',1558,'http://3.129.13.214/?p=1613',0,'revision','',0),(1614,3,'2021-07-23 15:39:52','2021-07-23 15:39:52','Content of test post 5.','Test Post Five','','inherit','closed','closed','','1559-revision-v1','','','2021-07-23 15:39:52','2021-07-23 15:39:52','',1559,'http://3.129.13.214/?p=1614',0,'revision','',0),(1619,3,'2021-07-28 12:36:20','2021-07-28 12:36:20','','1555','','trash','closed','closed','','__trashed','','','2021-07-28 12:36:20','2021-07-28 12:36:20','',0,'http://3.129.13.214/?post_type=fcfs&#038;p=1619',0,'fcfs','',0),(1620,3,'2021-07-28 12:36:22','2021-07-28 12:36:22','','1555','','trash','closed','closed','','__trashed-2','','','2021-07-28 12:36:22','2021-07-28 12:36:22','',0,'http://3.129.13.214/?post_type=fcfs&#038;p=1620',0,'fcfs','',0),(1621,3,'2021-08-18 21:17:26','2021-08-18 21:17:26','Content of test post 1.\r\n[FCFS status=\"open\" max-users=\"15\"]','Test Post One','','inherit','closed','closed','','1555-revision-v1','','','2021-08-18 21:17:26','2021-08-18 21:17:26','',1555,'http://3.129.13.214/?p=1621',0,'revision','',0),(1622,3,'2021-08-18 21:20:19','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2021-08-18 21:20:19','0000-00-00 00:00:00','',0,'http://3.129.13.214/?p=1622',0,'post','',0);
/*!40000 ALTER TABLE `wp_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_relationships`
--

DROP TABLE IF EXISTS `wp_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_term_relationships` (
  `object_id` bigint unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint unsigned NOT NULL DEFAULT '0',
  `term_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_relationships`
--

LOCK TABLES `wp_term_relationships` WRITE;
/*!40000 ALTER TABLE `wp_term_relationships` DISABLE KEYS */;
INSERT INTO `wp_term_relationships` VALUES (1555,1,0),(1556,1,0),(1557,1,0),(1558,1,0),(1559,1,0);
/*!40000 ALTER TABLE `wp_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_taxonomy`
--

DROP TABLE IF EXISTS `wp_term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint unsigned NOT NULL DEFAULT '0',
  `count` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_taxonomy`
--

LOCK TABLES `wp_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wp_term_taxonomy` DISABLE KEYS */;
INSERT INTO `wp_term_taxonomy` VALUES (1,1,'category','',0,5);
/*!40000 ALTER TABLE `wp_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_termmeta`
--

DROP TABLE IF EXISTS `wp_termmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_termmeta` (
  `meta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_termmeta`
--

LOCK TABLES `wp_termmeta` WRITE;
/*!40000 ALTER TABLE `wp_termmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_termmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_terms`
--

DROP TABLE IF EXISTS `wp_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_terms` (
  `term_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_terms`
--

LOCK TABLES `wp_terms` WRITE;
/*!40000 ALTER TABLE `wp_terms` DISABLE KEYS */;
INSERT INTO `wp_terms` VALUES (1,'Uncategorized','uncategorized',0);
/*!40000 ALTER TABLE `wp_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_usermeta`
--

DROP TABLE IF EXISTS `wp_usermeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_usermeta`
--

LOCK TABLES `wp_usermeta` WRITE;
/*!40000 ALTER TABLE `wp_usermeta` DISABLE KEYS */;
INSERT INTO `wp_usermeta` VALUES (1,1,'nickname','General Chicken'),(2,1,'first_name','John'),(3,1,'last_name','Dee'),(4,1,'description',''),(5,1,'rich_editing','true'),(6,1,'syntax_highlighting','true'),(7,1,'comment_shortcuts','false'),(8,1,'admin_color','fresh'),(9,1,'use_ssl','0'),(10,1,'show_admin_bar_front','true'),(11,1,'locale',''),(12,1,'wp_capabilities','a:1:{s:13:\"administrator\";b:1;}'),(13,1,'wp_user_level','10'),(14,1,'dismissed_wp_pointers',''),(15,1,'show_welcome_panel','1'),(16,1,'session_tokens','a:1:{s:64:\"550c61bf063672356ce66674d7ca4ec51740f3e4ac1695e3c01a153e05e1b678\";a:4:{s:10:\"expiration\";i:1625731300;s:2:\"ip\";s:13:\"24.253.35.100\";s:2:\"ua\";s:76:\"Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:89.0) Gecko/20100101 Firefox/89.0\";s:5:\"login\";i:1625558500;}}'),(17,1,'wp_user-settings','editor=html'),(18,1,'wp_user-settings-time','1622432414'),(19,1,'wp_dashboard_quick_press_last_post_id','1542'),(20,1,'community-events-location','a:1:{s:2:\"ip\";s:11:\"24.253.35.0\";}'),(35,3,'nickname','Codeception'),(36,3,'first_name',''),(37,3,'last_name',''),(38,3,'description',''),(39,3,'rich_editing','true'),(40,3,'syntax_highlighting','true'),(41,3,'comment_shortcuts','false'),(42,3,'admin_color','fresh'),(43,3,'use_ssl','0'),(44,3,'show_admin_bar_front','true'),(45,3,'locale',''),(46,3,'wp_capabilities','a:1:{s:13:\"administrator\";b:1;}'),(47,3,'wp_user_level','10'),(48,3,'session_tokens','a:3:{s:64:\"65f154eb240abbcae1a03740a5a81f3338002dc674b1dfce1bcab0f91bcfac54\";a:4:{s:10:\"expiration\";i:1630531016;s:2:\"ip\";s:12:\"3.129.13.214\";s:2:\"ua\";s:105:\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36\";s:5:\"login\";i:1629321416;}s:64:\"4f72a751af5df55feed4ce29ce978550367f0a65a201d74669109e96a58a30e6\";a:4:{s:10:\"expiration\";i:1629494227;s:2:\"ip\";s:13:\"24.253.35.100\";s:2:\"ua\";s:68:\"Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101 Firefox/78.0\";s:5:\"login\";i:1629321427;}s:64:\"50eb28d2937396fa2652f962bf5576d7933fc0d6de86afd42608a8051560db86\";a:4:{s:10:\"expiration\";i:1630531219;s:2:\"ip\";s:12:\"3.129.13.214\";s:2:\"ua\";s:105:\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36\";s:5:\"login\";i:1629321619;}}'),(49,3,'wp_dashboard_quick_press_last_post_id','1622'),(50,3,'community-events-location','a:1:{s:2:\"ip\";s:10:\"3.129.13.0\";}'),(56,3,'closedpostboxes_manifest','a:0:{}'),(57,3,'metaboxhidden_manifest','a:0:{}'),(58,3,'wp_user-settings','editor=html&ampampampampampamplibraryContent=upload&ampampampampampampunfold=1&ampampampampampampmfold=o&ampampampampampampposts_list_mode=list&ampampampampampposts_list_mode=list&ampampampampampunfold=1&ampampampampampmfold=o&ampampampampposts_list_mode=list&ampposts_list_mode=list&ampmfold=o'),(59,3,'wp_user-settings-time','1629321423'),(118,3,'closedpostboxes_dashboard','a:3:{i:0;s:18:\"dashboard_activity\";i:1;s:21:\"dashboard_quick_press\";i:2;s:17:\"dashboard_primary\";}'),(119,3,'metaboxhidden_dashboard','a:0:{}'),(120,3,'closedpostboxes_post','a:0:{}'),(121,3,'metaboxhidden_post','a:0:{}'),(122,3,'edit_fcfs_per_page','4'),(123,3,'edit_post_per_page','45'),(124,3,'manageedit-fcfscolumnshidden','a:0:{}'),(125,3,'dismissed_wp_pointers','plugin_editor_notice'),(126,3,'fep_review_notice_dismiss','1626978525'),(128,3,'_fep_user_announcement_count','a:1:{s:6:\"unread\";i:0;}'),(130,3,'_fep_user_message_count','a:2:{s:5:\"total\";i:1;s:6:\"unread\";i:0;}'),(159,6,'nickname','SubscriberMan'),(160,6,'first_name','Subscriber'),(161,6,'last_name','Man'),(162,6,'description',''),(163,6,'rich_editing','true'),(164,6,'syntax_highlighting','true'),(165,6,'comment_shortcuts','false'),(166,6,'admin_color','fresh'),(167,6,'use_ssl','0'),(168,6,'show_admin_bar_front','true'),(169,6,'locale',''),(170,6,'wp_capabilities','a:1:{s:10:\"subscriber\";b:1;}'),(171,6,'wp_user_level','0'),(172,6,'dismissed_wp_pointers',''),(173,7,'nickname','ContributorMan'),(174,7,'first_name','Contributor'),(175,7,'last_name','Man'),(176,7,'description',''),(177,7,'rich_editing','true'),(178,7,'syntax_highlighting','true'),(179,7,'comment_shortcuts','false'),(180,7,'admin_color','fresh'),(181,7,'use_ssl','0'),(182,7,'show_admin_bar_front','true'),(183,7,'locale',''),(184,7,'wp_capabilities','a:1:{s:11:\"contributor\";b:1;}'),(185,7,'wp_user_level','1'),(186,7,'dismissed_wp_pointers',''),(187,8,'nickname','EditorMan'),(188,8,'first_name','Editor'),(189,8,'last_name','Man'),(190,8,'description',''),(191,8,'rich_editing','true'),(192,8,'syntax_highlighting','true'),(193,8,'comment_shortcuts','false'),(194,8,'admin_color','fresh'),(195,8,'use_ssl','0'),(196,8,'show_admin_bar_front','true'),(197,8,'locale',''),(198,8,'wp_capabilities','a:1:{s:6:\"editor\";b:1;}'),(199,8,'wp_user_level','7'),(200,8,'dismissed_wp_pointers','');
/*!40000 ALTER TABLE `wp_usermeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_users`
--

DROP TABLE IF EXISTS `wp_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_users` (
  `ID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int NOT NULL DEFAULT '0',
  `display_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_users`
--

LOCK TABLES `wp_users` WRITE;
/*!40000 ALTER TABLE `wp_users` DISABLE KEYS */;
INSERT INTO `wp_users` VALUES (1,'admin','$P$B3DMrUFfKqaYErry8yXNEaDxT6theX/','admin','johndeebdd@gmail.com','https://generalchicken.guru','2021-05-31 03:40:14','',0,'admin'),(3,'Codeception','$P$B9u/ob42WrQAbscvTqITQdHI/vpc9i/','codeception','email@email.com','','2021-06-01 09:55:49','',0,'Codeception'),(6,'SubscriberMan','$P$BAMZrRSxq1AvW.mhsFvuZN0R/B7Dmj0','subscriberman','subscriberman@email.com','','2021-07-26 14:05:26','',0,'Subscriber Man'),(7,'ContributorMan','$P$BNQLu4OqwZ2RQ4t9J7nQVnC9zBcZQU/','contributorman','contributorman@email.com','','2021-07-26 14:05:59','',0,'Contributor Man'),(8,'EditorMan','$P$BFK97qdQyOYY/YbExG8BRU5WpLbdpS0','editorman','editorman@email.com','','2021-07-26 14:06:28','',0,'Editor Man');
/*!40000 ALTER TABLE `wp_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-18 21:21:01
