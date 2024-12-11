-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: otwarchive_production
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.22.04.1

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
-- Table structure for table `abuse_reports`
--

DROP TABLE IF EXISTS `abuse_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abuse_reports` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `ip_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment_sanitizer_version` smallint NOT NULL DEFAULT '0',
  `summary` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `summary_sanitizer_version` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abuse_reports`
--

LOCK TABLES `abuse_reports` WRITE;
/*!40000 ALTER TABLE `abuse_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `abuse_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_activities`
--

DROP TABLE IF EXISTS `admin_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_activities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `admin_id` int DEFAULT NULL,
  `target_id` int DEFAULT NULL,
  `target_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci,
  `summary_sanitizer_version` smallint NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_activities`
--

LOCK TABLES `admin_activities` WRITE;
/*!40000 ALTER TABLE `admin_activities` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_banners`
--

DROP TABLE IF EXISTS `admin_banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_banners` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8mb4_unicode_ci,
  `content_sanitizer_version` smallint NOT NULL DEFAULT '0',
  `banner_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_banners`
--

LOCK TABLES `admin_banners` WRITE;
/*!40000 ALTER TABLE `admin_banners` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_blacklisted_emails`
--

DROP TABLE IF EXISTS `admin_blacklisted_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_blacklisted_emails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_admin_blacklisted_emails_on_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_blacklisted_emails`
--

LOCK TABLES `admin_blacklisted_emails` WRITE;
/*!40000 ALTER TABLE `admin_blacklisted_emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_blacklisted_emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_post_taggings`
--

DROP TABLE IF EXISTS `admin_post_taggings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_post_taggings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `admin_post_tag_id` int DEFAULT NULL,
  `admin_post_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_admin_post_taggings_on_admin_post_id` (`admin_post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_post_taggings`
--

LOCK TABLES `admin_post_taggings` WRITE;
/*!40000 ALTER TABLE `admin_post_taggings` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_post_taggings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_post_tags`
--

DROP TABLE IF EXISTS `admin_post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_post_tags` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_post_tags`
--

LOCK TABLES `admin_post_tags` WRITE;
/*!40000 ALTER TABLE `admin_post_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_post_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_posts`
--

DROP TABLE IF EXISTS `admin_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `admin_id` int DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `content_sanitizer_version` smallint NOT NULL DEFAULT '0',
  `translated_post_id` int DEFAULT NULL,
  `language_id` int DEFAULT NULL,
  `comment_permissions` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_admin_posts_on_created_at` (`created_at`),
  KEY `index_admin_posts_on_post_id` (`translated_post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_posts`
--

LOCK TABLES `admin_posts` WRITE;
/*!40000 ALTER TABLE `admin_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_settings`
--

DROP TABLE IF EXISTS `admin_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_creation_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `invite_from_queue_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `invite_from_queue_number` bigint DEFAULT NULL,
  `invite_from_queue_frequency` mediumint DEFAULT NULL,
  `days_to_purge_unactivated` mediumint DEFAULT NULL,
  `last_updated_by` bigint DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `invite_from_queue_at` datetime DEFAULT '2009-11-07 21:27:21',
  `suspend_filter_counts` tinyint(1) DEFAULT '0',
  `suspend_filter_counts_at` datetime DEFAULT NULL,
  `enable_test_caching` tinyint(1) DEFAULT '0',
  `cache_expiration` bigint DEFAULT '10',
  `tag_wrangling_off` tinyint(1) NOT NULL DEFAULT '0',
  `default_skin_id` int DEFAULT NULL,
  `request_invite_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `creation_requires_invite` tinyint(1) NOT NULL DEFAULT '0',
  `downloads_enabled` tinyint(1) DEFAULT '1',
  `disabled_support_form_text_sanitizer_version` smallint NOT NULL DEFAULT '0',
  `hide_spam` tinyint(1) NOT NULL DEFAULT '0',
  `disable_support_form` tinyint(1) NOT NULL DEFAULT '0',
  `guest_comments_off` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_admin_settings_on_last_updated_by` (`last_updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_settings`
--

LOCK TABLES `admin_settings` WRITE;
/*!40000 ALTER TABLE `admin_settings` DISABLE KEYS */;
INSERT INTO `admin_settings` VALUES (1,0,1,10,7,7,NULL,'2023-11-06 09:02:57','2023-11-06 09:02:57','2023-11-13 09:02:57',0,NULL,0,10,0,NULL,0,0,1,0,0,0,0);
/*!40000 ALTER TABLE `admin_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `encrypted_password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_salt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `roles` text COLLATE utf8mb4_unicode_ci,
  `reset_password_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_admins_on_email` (`email`),
  UNIQUE KEY `index_admins_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_keys`
--

DROP TABLE IF EXISTS `api_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_keys` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `banned` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_api_keys_on_access_token` (`access_token`),
  UNIQUE KEY `index_api_keys_on_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_keys`
--

LOCK TABLES `api_keys` WRITE;
/*!40000 ALTER TABLE `api_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','production','2023-11-06 09:02:24.052131','2023-11-06 09:02:24.052131'),('schema_sha1','3589745cf743feaa47a4a14c1366022fcb866559','2023-11-06 09:02:24.074649','2023-11-06 09:02:24.074649');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archive_faq_translations`
--

DROP TABLE IF EXISTS `archive_faq_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `archive_faq_translations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `archive_faq_id` int DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_archive_faq_translations_on_archive_faq_id` (`archive_faq_id`),
  KEY `index_archive_faq_translations_on_locale` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archive_faq_translations`
--

LOCK TABLES `archive_faq_translations` WRITE;
/*!40000 ALTER TABLE `archive_faq_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `archive_faq_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archive_faqs`
--

DROP TABLE IF EXISTS `archive_faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `archive_faqs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `admin_id` int DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `position` int DEFAULT '1',
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_archive_faqs_on_slug` (`slug`),
  KEY `index_archive_faqs_on_position` (`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archive_faqs`
--

LOCK TABLES `archive_faqs` WRITE;
/*!40000 ALTER TABLE `archive_faqs` DISABLE KEYS */;
/*!40000 ALTER TABLE `archive_faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audits`
--

DROP TABLE IF EXISTS `audits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audits` (
  `id` int NOT NULL AUTO_INCREMENT,
  `auditable_id` int DEFAULT NULL,
  `auditable_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `associated_id` int DEFAULT NULL,
  `associated_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `audited_changes` text COLLATE utf8mb4_unicode_ci,
  `version` int DEFAULT '0',
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remote_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `request_uuid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `auditable_index` (`auditable_id`,`auditable_type`),
  KEY `associated_index` (`associated_id`,`associated_type`),
  KEY `user_index` (`user_id`,`user_type`),
  KEY `index_audits_on_created_at` (`created_at`),
  KEY `index_audits_on_request_uuid` (`request_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audits`
--

LOCK TABLES `audits` WRITE;
/*!40000 ALTER TABLE `audits` DISABLE KEYS */;
/*!40000 ALTER TABLE `audits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blocks`
--

DROP TABLE IF EXISTS `blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blocks` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `blocker_id` bigint DEFAULT NULL,
  `blocked_id` bigint DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_blocks_on_blocker_id_and_blocked_id` (`blocker_id`,`blocked_id`),
  KEY `index_blocks_on_blocker_id` (`blocker_id`),
  KEY `index_blocks_on_blocked_id` (`blocked_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blocks`
--

LOCK TABLES `blocks` WRITE;
/*!40000 ALTER TABLE `blocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookmarks`
--

DROP TABLE IF EXISTS `bookmarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookmarks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `bookmarkable_type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bookmarkable_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `bookmarker_notes` text COLLATE utf8mb4_unicode_ci,
  `private` tinyint(1) DEFAULT '0',
  `updated_at` datetime DEFAULT NULL,
  `hidden_by_admin` tinyint(1) NOT NULL DEFAULT '0',
  `pseud_id` int NOT NULL,
  `rec` tinyint(1) NOT NULL DEFAULT '0',
  `delta` tinyint(1) DEFAULT '1',
  `bookmarker_notes_sanitizer_version` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_bookmarkable_pseud` (`bookmarkable_id`,`bookmarkable_type`,`pseud_id`),
  KEY `index_bookmarks_on_private_and_hidden_by_admin_and_created_at` (`private`,`hidden_by_admin`,`created_at`),
  KEY `index_bookmarks_on_pseud_id` (`pseud_id`),
  KEY `fk_bookmarks_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookmarks`
--

LOCK TABLES `bookmarks` WRITE;
/*!40000 ALTER TABLE `bookmarks` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookmarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `challenge_assignments`
--

DROP TABLE IF EXISTS `challenge_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `challenge_assignments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `collection_id` int DEFAULT NULL,
  `creation_id` int DEFAULT NULL,
  `creation_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `offer_signup_id` int DEFAULT NULL,
  `request_signup_id` int DEFAULT NULL,
  `pinch_hitter_id` int DEFAULT NULL,
  `sent_at` datetime DEFAULT NULL,
  `fulfilled_at` datetime DEFAULT NULL,
  `defaulted_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `pinch_request_signup_id` int DEFAULT NULL,
  `covered_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_challenge_assignments_on_collection_id` (`collection_id`),
  KEY `assignments_on_creation_id` (`creation_id`),
  KEY `assignments_on_creation_type` (`creation_type`),
  KEY `assignments_on_defaulted_at` (`defaulted_at`),
  KEY `assignments_on_offer_signup_id` (`offer_signup_id`),
  KEY `assignments_on_pinch_hitter_id` (`pinch_hitter_id`),
  KEY `assignments_on_offer_sent_at` (`sent_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `challenge_assignments`
--

LOCK TABLES `challenge_assignments` WRITE;
/*!40000 ALTER TABLE `challenge_assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `challenge_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `challenge_claims`
--

DROP TABLE IF EXISTS `challenge_claims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `challenge_claims` (
  `id` int NOT NULL AUTO_INCREMENT,
  `collection_id` int DEFAULT NULL,
  `creation_id` int DEFAULT NULL,
  `creation_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request_signup_id` int DEFAULT NULL,
  `request_prompt_id` int DEFAULT NULL,
  `claiming_user_id` int DEFAULT NULL,
  `sent_at` datetime DEFAULT NULL,
  `fulfilled_at` datetime DEFAULT NULL,
  `defaulted_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_challenge_claims_on_claiming_user_id` (`claiming_user_id`),
  KEY `index_challenge_claims_on_collection_id` (`collection_id`),
  KEY `creations` (`creation_id`,`creation_type`),
  KEY `index_challenge_claims_on_request_signup_id` (`request_signup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `challenge_claims`
--

LOCK TABLES `challenge_claims` WRITE;
/*!40000 ALTER TABLE `challenge_claims` DISABLE KEYS */;
/*!40000 ALTER TABLE `challenge_claims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `challenge_signups`
--

DROP TABLE IF EXISTS `challenge_signups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `challenge_signups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `collection_id` int DEFAULT NULL,
  `pseud_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `assigned_as_request` tinyint(1) DEFAULT '0',
  `assigned_as_offer` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_challenge_signups_on_collection_id` (`collection_id`),
  KEY `signups_on_pseud_id` (`pseud_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `challenge_signups`
--

LOCK TABLES `challenge_signups` WRITE;
/*!40000 ALTER TABLE `challenge_signups` DISABLE KEYS */;
/*!40000 ALTER TABLE `challenge_signups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chapters`
--

DROP TABLE IF EXISTS `chapters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chapters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int DEFAULT '1',
  `work_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `posted` tinyint(1) NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `summary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `word_count` int DEFAULT NULL,
  `hidden_by_admin` tinyint(1) NOT NULL DEFAULT '0',
  `published_at` date DEFAULT NULL,
  `endnotes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `content_sanitizer_version` smallint NOT NULL DEFAULT '0',
  `notes_sanitizer_version` smallint NOT NULL DEFAULT '0',
  `summary_sanitizer_version` smallint NOT NULL DEFAULT '0',
  `endnotes_sanitizer_version` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_chapters_on_work_id` (`work_id`),
  KEY `works_chapter_index` (`work_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chapters`
--

LOCK TABLES `chapters` WRITE;
/*!40000 ALTER TABLE `chapters` DISABLE KEYS */;
/*!40000 ALTER TABLE `chapters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_items`
--

DROP TABLE IF EXISTS `collection_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collection_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `collection_id` int DEFAULT NULL,
  `item_id` int DEFAULT NULL,
  `item_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'Work',
  `user_approval_status` tinyint NOT NULL DEFAULT '0',
  `collection_approval_status` tinyint NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `anonymous` tinyint(1) NOT NULL DEFAULT '0',
  `unrevealed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `by collection and item` (`collection_id`,`item_id`,`item_type`),
  KEY `collection_items_anonymous` (`anonymous`),
  KEY `index_collection_items_approval_status` (`collection_id`,`user_approval_status`,`collection_approval_status`),
  KEY `collection_items_item_id` (`item_id`),
  KEY `collection_items_unrevealed` (`unrevealed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_items`
--

LOCK TABLES `collection_items` WRITE;
/*!40000 ALTER TABLE `collection_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `collection_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_participants`
--

DROP TABLE IF EXISTS `collection_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collection_participants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `collection_id` int DEFAULT NULL,
  `pseud_id` int DEFAULT NULL,
  `participant_role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'None',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `by collection and pseud` (`collection_id`,`pseud_id`),
  KEY `participants_by_collection_and_role` (`collection_id`,`participant_role`),
  KEY `participants_pseud_id` (`pseud_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_participants`
--

LOCK TABLES `collection_participants` WRITE;
/*!40000 ALTER TABLE `collection_participants` DISABLE KEYS */;
/*!40000 ALTER TABLE `collection_participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_preferences`
--

DROP TABLE IF EXISTS `collection_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collection_preferences` (
  `id` int NOT NULL AUTO_INCREMENT,
  `collection_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `moderated` tinyint(1) NOT NULL DEFAULT '0',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `unrevealed` tinyint(1) NOT NULL DEFAULT '0',
  `anonymous` tinyint(1) NOT NULL DEFAULT '0',
  `gift_exchange` tinyint(1) NOT NULL DEFAULT '0',
  `show_random` tinyint(1) NOT NULL DEFAULT '0',
  `prompt_meme` tinyint(1) NOT NULL DEFAULT '0',
  `email_notify` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_collection_preferences_on_collection_id` (`collection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_preferences`
--

LOCK TABLES `collection_preferences` WRITE;
/*!40000 ALTER TABLE `collection_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `collection_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_profiles`
--

DROP TABLE IF EXISTS `collection_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collection_profiles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `collection_id` int DEFAULT NULL,
  `intro` mediumtext COLLATE utf8mb4_unicode_ci,
  `faq` mediumtext COLLATE utf8mb4_unicode_ci,
  `rules` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `gift_notification` text COLLATE utf8mb4_unicode_ci,
  `intro_sanitizer_version` smallint NOT NULL DEFAULT '0',
  `faq_sanitizer_version` smallint NOT NULL DEFAULT '0',
  `rules_sanitizer_version` smallint NOT NULL DEFAULT '0',
  `assignment_notification` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `index_collection_profiles_on_collection_id` (`collection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_profiles`
--

LOCK TABLES `collection_profiles` WRITE;
/*!40000 ALTER TABLE `collection_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `collection_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collections`
--

DROP TABLE IF EXISTS `collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header_image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `challenge_id` int DEFAULT NULL,
  `challenge_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_content_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_file_size` int DEFAULT NULL,
  `icon_updated_at` datetime DEFAULT NULL,
  `description_sanitizer_version` smallint NOT NULL DEFAULT '0',
  `icon_alt_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `icon_comment_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `multifandom` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_collections_on_name` (`name`),
  KEY `index_collections_on_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collections`
--

LOCK TABLES `collections` WRITE;
/*!40000 ALTER TABLE `collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pseud_id` int DEFAULT NULL,
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `depth` int DEFAULT NULL,
  `threaded_left` int DEFAULT NULL,
  `threaded_right` int DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commentable_id` int DEFAULT NULL,
  `commentable_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `thread` int DEFAULT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `hidden_by_admin` tinyint(1) NOT NULL DEFAULT '0',
  `edited_at` datetime DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `parent_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment_content_sanitizer_version` smallint NOT NULL DEFAULT '0',
  `iced` tinyint(1) NOT NULL DEFAULT '0',
  `unreviewed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_comments_commentable` (`commentable_id`,`commentable_type`),
  KEY `index_comments_parent` (`parent_id`,`parent_type`),
  KEY `index_comments_on_pseud_id` (`pseud_id`),
  KEY `comments_by_thread` (`thread`),
  KEY `index_comments_on_ip_address` (`ip_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_taggings`
--

DROP TABLE IF EXISTS `common_taggings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `common_taggings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `common_tag_id` int NOT NULL,
  `filterable_id` int NOT NULL,
  `filterable_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_common_tags` (`common_tag_id`,`filterable_type`,`filterable_id`),
  KEY `index_common_taggings_on_filterable_id` (`filterable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_taggings`
--

LOCK TABLES `common_taggings` WRITE;
/*!40000 ALTER TABLE `common_taggings` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_taggings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creatorships`
--

DROP TABLE IF EXISTS `creatorships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creatorships` (
  `id` int NOT NULL AUTO_INCREMENT,
  `creation_id` int DEFAULT NULL,
  `creation_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pseud_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `creation_id_creation_type_pseud_id` (`creation_id`,`creation_type`,`pseud_id`),
  KEY `index_creatorships_pseud` (`pseud_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creatorships`
--

LOCK TABLES `creatorships` WRITE;
/*!40000 ALTER TABLE `creatorships` DISABLE KEYS */;
/*!40000 ALTER TABLE `creatorships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delayed_jobs`
--

DROP TABLE IF EXISTS `delayed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delayed_jobs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `priority` int DEFAULT '0',
  `attempts` int DEFAULT '0',
  `handler` text COLLATE utf8mb4_unicode_ci,
  `last_error` text COLLATE utf8mb4_unicode_ci,
  `run_at` datetime DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `failed_at` datetime DEFAULT NULL,
  `locked_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `delayed_jobs_failed_at` (`failed_at`),
  KEY `delayed_jobs_locked_at` (`locked_at`),
  KEY `delayed_jobs_locked_by` (`locked_by`),
  KEY `delayed_jobs_run_at` (`run_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delayed_jobs`
--

LOCK TABLES `delayed_jobs` WRITE;
/*!40000 ALTER TABLE `delayed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `delayed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_author_names`
--

DROP TABLE IF EXISTS `external_author_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `external_author_names` (
  `id` int NOT NULL AUTO_INCREMENT,
  `external_author_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_external_author_names_on_external_author_id` (`external_author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_author_names`
--

LOCK TABLES `external_author_names` WRITE;
/*!40000 ALTER TABLE `external_author_names` DISABLE KEYS */;
/*!40000 ALTER TABLE `external_author_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_authors`
--

DROP TABLE IF EXISTS `external_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `external_authors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_claimed` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` int DEFAULT NULL,
  `do_not_email` tinyint(1) NOT NULL DEFAULT '0',
  `do_not_import` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_external_authors_on_email` (`email`),
  KEY `index_external_authors_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_authors`
--

LOCK TABLES `external_authors` WRITE;
/*!40000 ALTER TABLE `external_authors` DISABLE KEYS */;
/*!40000 ALTER TABLE `external_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_creatorships`
--

DROP TABLE IF EXISTS `external_creatorships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `external_creatorships` (
  `id` int NOT NULL AUTO_INCREMENT,
  `creation_id` int DEFAULT NULL,
  `creation_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `archivist_id` int DEFAULT NULL,
  `external_author_name_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_external_creatorships_on_archivist_id` (`archivist_id`),
  KEY `index_external_creatorships_on_creation_id_and_creation_type` (`creation_id`,`creation_type`),
  KEY `index_external_creatorships_on_external_author_name_id` (`external_author_name_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_creatorships`
--

LOCK TABLES `external_creatorships` WRITE;
/*!40000 ALTER TABLE `external_creatorships` DISABLE KEYS */;
/*!40000 ALTER TABLE `external_creatorships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_works`
--

DROP TABLE IF EXISTS `external_works`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `external_works` (
  `id` int NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dead` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci,
  `hidden_by_admin` tinyint(1) NOT NULL DEFAULT '0',
  `summary_sanitizer_version` smallint NOT NULL DEFAULT '0',
  `language_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_works`
--

LOCK TABLES `external_works` WRITE;
/*!40000 ALTER TABLE `external_works` DISABLE KEYS */;
/*!40000 ALTER TABLE `external_works` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fannish_next_of_kins`
--

DROP TABLE IF EXISTS `fannish_next_of_kins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fannish_next_of_kins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `kin_id` int DEFAULT NULL,
  `kin_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_fannish_next_of_kins_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fannish_next_of_kins`
--

LOCK TABLES `fannish_next_of_kins` WRITE;
/*!40000 ALTER TABLE `fannish_next_of_kins` DISABLE KEYS */;
/*!40000 ALTER TABLE `fannish_next_of_kins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite_tags`
--

DROP TABLE IF EXISTS `favorite_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite_tags` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `tag_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_favorite_tags_on_user_id_and_tag_id` (`user_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_tags`
--

LOCK TABLES `favorite_tags` WRITE;
/*!40000 ALTER TABLE `favorite_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorite_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedbacks`
--

DROP TABLE IF EXISTS `feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedbacks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `summary` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment_sanitizer_version` smallint NOT NULL DEFAULT '0',
  `summary_sanitizer_version` smallint NOT NULL DEFAULT '0',
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rollout` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbacks`
--

LOCK TABLES `feedbacks` WRITE;
/*!40000 ALTER TABLE `feedbacks` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter_counts`
--

DROP TABLE IF EXISTS `filter_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filter_counts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `filter_id` bigint NOT NULL,
  `public_works_count` bigint DEFAULT '0',
  `unhidden_works_count` bigint DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_filter_counts_on_filter_id` (`filter_id`),
  KEY `index_public_works_count` (`public_works_count`),
  KEY `index_unhidden_works_count` (`unhidden_works_count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_counts`
--

LOCK TABLES `filter_counts` WRITE;
/*!40000 ALTER TABLE `filter_counts` DISABLE KEYS */;
/*!40000 ALTER TABLE `filter_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter_taggings`
--

DROP TABLE IF EXISTS `filter_taggings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filter_taggings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `filter_id` bigint NOT NULL,
  `filterable_id` bigint NOT NULL,
  `filterable_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `inherited` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_filter_taggings_on_filter_and_filterable` (`filter_id`,`filterable_type`,`filterable_id`),
  KEY `index_filter_taggings_filterable` (`filterable_id`,`filterable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_taggings`
--

LOCK TABLES `filter_taggings` WRITE;
/*!40000 ALTER TABLE `filter_taggings` DISABLE KEYS */;
/*!40000 ALTER TABLE `filter_taggings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gift_exchanges`
--

DROP TABLE IF EXISTS `gift_exchanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gift_exchanges` (
  `id` int NOT NULL AUTO_INCREMENT,
  `request_restriction_id` int DEFAULT NULL,
  `offer_restriction_id` int DEFAULT NULL,
  `requests_num_required` int NOT NULL DEFAULT '1',
  `offers_num_required` int NOT NULL DEFAULT '1',
  `requests_num_allowed` int NOT NULL DEFAULT '1',
  `offers_num_allowed` int NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `signup_instructions_general` text COLLATE utf8mb4_unicode_ci,
  `signup_instructions_requests` text COLLATE utf8mb4_unicode_ci,
  `signup_instructions_offers` text COLLATE utf8mb4_unicode_ci,
  `signup_open` tinyint(1) NOT NULL DEFAULT '0',
  `signups_open_at` datetime DEFAULT NULL,
  `signups_close_at` datetime DEFAULT NULL,
  `assignments_due_at` datetime DEFAULT NULL,
  `works_reveal_at` datetime DEFAULT NULL,
  `authors_reveal_at` datetime DEFAULT NULL,
  `request_url_label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request_description_label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `offer_url_label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `offer_description_label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_zone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `potential_match_settings_id` int DEFAULT NULL,
  `assignments_sent_at` datetime DEFAULT NULL,
  `signup_instructions_general_sanitizer_version` smallint NOT NULL DEFAULT '0',
  `signup_instructions_requests_sanitizer_version` smallint NOT NULL DEFAULT '0',
  `signup_instructions_offers_sanitizer_version` smallint NOT NULL DEFAULT '0',
  `requests_summary_visible` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gift_exchanges`
--

LOCK TABLES `gift_exchanges` WRITE;
/*!40000 ALTER TABLE `gift_exchanges` DISABLE KEYS */;
/*!40000 ALTER TABLE `gift_exchanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gifts`
--

DROP TABLE IF EXISTS `gifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gifts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `work_id` int DEFAULT NULL,
  `recipient_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `pseud_id` int DEFAULT NULL,
  `rejected` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_gifts_on_pseud_id` (`pseud_id`),
  KEY `index_gifts_on_recipient_name` (`recipient_name`),
  KEY `index_gifts_on_work_id` (`work_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gifts`
--

LOCK TABLES `gifts` WRITE;
/*!40000 ALTER TABLE `gifts` DISABLE KEYS */;
/*!40000 ALTER TABLE `gifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inbox_comments`
--

DROP TABLE IF EXISTS `inbox_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inbox_comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `feedback_comment_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `read` tinyint(1) NOT NULL DEFAULT '0',
  `replied_to` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_inbox_comments_on_feedback_comment_id` (`feedback_comment_id`),
  KEY `index_inbox_comments_on_read_and_user_id` (`read`,`user_id`),
  KEY `index_inbox_comments_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inbox_comments`
--

LOCK TABLES `inbox_comments` WRITE;
/*!40000 ALTER TABLE `inbox_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `inbox_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `innodb_monitor`
--

DROP TABLE IF EXISTS `innodb_monitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `innodb_monitor` (
  `a` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `innodb_monitor`
--

LOCK TABLES `innodb_monitor` WRITE;
/*!40000 ALTER TABLE `innodb_monitor` DISABLE KEYS */;
/*!40000 ALTER TABLE `innodb_monitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invitations`
--

DROP TABLE IF EXISTS `invitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invitations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `creator_id` int DEFAULT NULL,
  `invitee_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sent_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `used` tinyint(1) NOT NULL DEFAULT '0',
  `invitee_id` int DEFAULT NULL,
  `invitee_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redeemed_at` datetime DEFAULT NULL,
  `from_queue` tinyint(1) NOT NULL DEFAULT '0',
  `external_author_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_invitations_on_creator_id_and_creator_type` (`creator_id`,`creator_type`),
  KEY `index_invitations_on_external_author_id` (`external_author_id`),
  KEY `index_invitations_on_invitee_id_and_invitee_type` (`invitee_id`,`invitee_type`),
  KEY `index_invitations_on_token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invitations`
--

LOCK TABLES `invitations` WRITE;
/*!40000 ALTER TABLE `invitations` DISABLE KEYS */;
/*!40000 ALTER TABLE `invitations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invite_requests`
--

DROP TABLE IF EXISTS `invite_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invite_requests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `simplified_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ip_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_invite_requests_on_simplified_email` (`simplified_email`),
  KEY `index_invite_requests_on_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invite_requests`
--

LOCK TABLES `invite_requests` WRITE;
/*!40000 ALTER TABLE `invite_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `invite_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `known_issues`
--

DROP TABLE IF EXISTS `known_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `known_issues` (
  `id` int NOT NULL AUTO_INCREMENT,
  `admin_id` int DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `content_sanitizer_version` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `known_issues`
--

LOCK TABLES `known_issues` WRITE;
/*!40000 ALTER TABLE `known_issues` DISABLE KEYS */;
/*!40000 ALTER TABLE `known_issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kudos`
--

DROP TABLE IF EXISTS `kudos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kudos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `commentable_id` int DEFAULT NULL,
  `commentable_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `ip_address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_kudos_on_commentable_and_ip_address` (`commentable_id`,`commentable_type`,`ip_address`),
  UNIQUE KEY `index_kudos_on_commentable_and_user` (`commentable_id`,`commentable_type`,`user_id`),
  KEY `index_kudos_on_ip_address` (`ip_address`),
  KEY `index_kudos_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kudos`
--

LOCK TABLES `kudos` WRITE;
/*!40000 ALTER TABLE `kudos` DISABLE KEYS */;
/*!40000 ALTER TABLE `kudos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `short` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abuse_support_available` tinyint(1) NOT NULL DEFAULT '0',
  `support_available` tinyint(1) NOT NULL DEFAULT '0',
  `sortable_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `index_languages_on_short` (`short`),
  KEY `index_languages_on_sortable_name` (`sortable_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'en','English',0,0,'');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `last_wrangling_activities`
--

DROP TABLE IF EXISTS `last_wrangling_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `last_wrangling_activities` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_last_wrangling_activities_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `last_wrangling_activities`
--

LOCK TABLES `last_wrangling_activities` WRITE;
/*!40000 ALTER TABLE `last_wrangling_activities` DISABLE KEYS */;
/*!40000 ALTER TABLE `last_wrangling_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locales`
--

DROP TABLE IF EXISTS `locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `iso` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `main` tinyint(1) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `language_id` int NOT NULL,
  `interface_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `email_enabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_locales_on_iso` (`iso`),
  KEY `index_locales_on_language_id` (`language_id`),
  KEY `index_locales_on_short` (`short`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locales`
--

LOCK TABLES `locales` WRITE;
/*!40000 ALTER TABLE `locales` DISABLE KEYS */;
INSERT INTO `locales` VALUES (1,'en',NULL,'English (US)',1,'2023-11-06 09:02:57',1,0,0);
/*!40000 ALTER TABLE `locales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_items`
--

DROP TABLE IF EXISTS `log_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `admin_id` int DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  `action` tinyint DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `enddate` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `note_sanitizer_version` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_log_items_on_admin_id` (`admin_id`),
  KEY `index_log_items_on_role_id` (`role_id`),
  KEY `index_log_items_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_items`
--

LOCK TABLES `log_items` WRITE;
/*!40000 ALTER TABLE `log_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_taggings`
--

DROP TABLE IF EXISTS `meta_taggings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meta_taggings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `meta_tag_id` bigint NOT NULL,
  `sub_tag_id` bigint NOT NULL,
  `direct` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_meta_taggings_on_meta_tag_id_and_sub_tag_id` (`meta_tag_id`,`sub_tag_id`),
  KEY `index_meta_taggings_on_sub_tag_id` (`sub_tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_taggings`
--

LOCK TABLES `meta_taggings` WRITE;
/*!40000 ALTER TABLE `meta_taggings` DISABLE KEYS */;
/*!40000 ALTER TABLE `meta_taggings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moderated_works`
--

DROP TABLE IF EXISTS `moderated_works`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `moderated_works` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `work_id` bigint NOT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `reviewed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_moderated_works_on_work_id` (`work_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moderated_works`
--

LOCK TABLES `moderated_works` WRITE;
/*!40000 ALTER TABLE `moderated_works` DISABLE KEYS */;
/*!40000 ALTER TABLE `moderated_works` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mutes`
--

DROP TABLE IF EXISTS `mutes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mutes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `muter_id` bigint DEFAULT NULL,
  `muted_id` bigint DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_mutes_on_muter_id_and_muted_id` (`muter_id`,`muted_id`),
  KEY `index_mutes_on_muter_id` (`muter_id`),
  KEY `index_mutes_on_muted_id` (`muted_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mutes`
--

LOCK TABLES `mutes` WRITE;
/*!40000 ALTER TABLE `mutes` DISABLE KEYS */;
/*!40000 ALTER TABLE `mutes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owned_set_taggings`
--

DROP TABLE IF EXISTS `owned_set_taggings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owned_set_taggings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owned_tag_set_id` int DEFAULT NULL,
  `set_taggable_id` int DEFAULT NULL,
  `set_taggable_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owned_set_taggings`
--

LOCK TABLES `owned_set_taggings` WRITE;
/*!40000 ALTER TABLE `owned_set_taggings` DISABLE KEYS */;
/*!40000 ALTER TABLE `owned_set_taggings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owned_tag_sets`
--

DROP TABLE IF EXISTS `owned_tag_sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owned_tag_sets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tag_set_id` int DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  `nominated` tinyint(1) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `description_sanitizer_version` smallint NOT NULL DEFAULT '0',
  `fandom_nomination_limit` int NOT NULL DEFAULT '0',
  `character_nomination_limit` int NOT NULL DEFAULT '0',
  `relationship_nomination_limit` int NOT NULL DEFAULT '0',
  `freeform_nomination_limit` int NOT NULL DEFAULT '0',
  `usable` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owned_tag_sets`
--

LOCK TABLES `owned_tag_sets` WRITE;
/*!40000 ALTER TABLE `owned_tag_sets` DISABLE KEYS */;
/*!40000 ALTER TABLE `owned_tag_sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `potential_match_settings`
--

DROP TABLE IF EXISTS `potential_match_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `potential_match_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `num_required_prompts` int NOT NULL DEFAULT '1',
  `num_required_fandoms` int NOT NULL DEFAULT '0',
  `num_required_characters` int NOT NULL DEFAULT '0',
  `num_required_relationships` int NOT NULL DEFAULT '0',
  `num_required_freeforms` int NOT NULL DEFAULT '0',
  `num_required_categories` int NOT NULL DEFAULT '0',
  `num_required_ratings` int NOT NULL DEFAULT '0',
  `num_required_archive_warnings` int NOT NULL DEFAULT '0',
  `include_optional_fandoms` tinyint(1) NOT NULL DEFAULT '0',
  `include_optional_characters` tinyint(1) NOT NULL DEFAULT '0',
  `include_optional_relationships` tinyint(1) NOT NULL DEFAULT '0',
  `include_optional_freeforms` tinyint(1) NOT NULL DEFAULT '0',
  `include_optional_categories` tinyint(1) NOT NULL DEFAULT '0',
  `include_optional_ratings` tinyint(1) NOT NULL DEFAULT '0',
  `include_optional_archive_warnings` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `potential_match_settings`
--

LOCK TABLES `potential_match_settings` WRITE;
/*!40000 ALTER TABLE `potential_match_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `potential_match_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `potential_matches`
--

DROP TABLE IF EXISTS `potential_matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `potential_matches` (
  `id` int NOT NULL AUTO_INCREMENT,
  `collection_id` int DEFAULT NULL,
  `offer_signup_id` int DEFAULT NULL,
  `request_signup_id` int DEFAULT NULL,
  `num_prompts_matched` int DEFAULT NULL,
  `assigned` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `max_tags_matched` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_potential_matches_on_collection_id` (`collection_id`),
  KEY `index_potential_matches_on_offer_signup_id` (`offer_signup_id`),
  KEY `index_potential_matches_on_request_signup_id` (`request_signup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `potential_matches`
--

LOCK TABLES `potential_matches` WRITE;
/*!40000 ALTER TABLE `potential_matches` DISABLE KEYS */;
/*!40000 ALTER TABLE `potential_matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preferences`
--

DROP TABLE IF EXISTS `preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preferences` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `history_enabled` tinyint(1) DEFAULT '1',
  `email_visible` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `date_of_birth_visible` tinyint(1) DEFAULT '0',
  `edit_emails_off` tinyint(1) NOT NULL DEFAULT '0',
  `comment_emails_off` tinyint(1) NOT NULL DEFAULT '0',
  `adult` tinyint(1) DEFAULT '0',
  `hide_warnings` tinyint(1) NOT NULL DEFAULT '0',
  `comment_inbox_off` tinyint(1) DEFAULT '0',
  `comment_copy_to_self_off` tinyint(1) NOT NULL DEFAULT '1',
  `work_title_format` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'TITLE - AUTHOR - FANDOM',
  `hide_freeform` tinyint(1) NOT NULL DEFAULT '0',
  `first_login` tinyint(1) DEFAULT '1',
  `automatically_approve_collections` tinyint(1) NOT NULL DEFAULT '0',
  `collection_emails_off` tinyint(1) NOT NULL DEFAULT '0',
  `collection_inbox_off` tinyint(1) NOT NULL DEFAULT '0',
  `recipient_emails_off` tinyint(1) NOT NULL DEFAULT '0',
  `view_full_works` tinyint(1) NOT NULL DEFAULT '0',
  `time_zone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plain_text_skin` tinyint(1) NOT NULL DEFAULT '0',
  `disable_work_skins` tinyint(1) NOT NULL DEFAULT '0',
  `skin_id` int DEFAULT NULL,
  `minimize_search_engines` tinyint(1) NOT NULL DEFAULT '0',
  `kudos_emails_off` tinyint(1) NOT NULL DEFAULT '0',
  `disable_share_links` tinyint(1) NOT NULL DEFAULT '0',
  `banner_seen` tinyint(1) NOT NULL DEFAULT '0',
  `allow_gifts` tinyint(1) NOT NULL DEFAULT '0',
  `preferred_locale` int NOT NULL DEFAULT '1',
  `allow_cocreator` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_preferences_on_user_id` (`user_id`),
  KEY `index_preferences_on_skin_id` (`skin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preferences`
--

LOCK TABLES `preferences` WRITE;
/*!40000 ALTER TABLE `preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_me` text COLLATE utf8mb4_unicode_ci,
  `date_of_birth` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_me_sanitizer_version` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_profiles_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prompt_memes`
--

DROP TABLE IF EXISTS `prompt_memes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prompt_memes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `request_restriction_id` int DEFAULT NULL,
  `requests_num_required` int NOT NULL DEFAULT '1',
  `requests_num_allowed` int NOT NULL DEFAULT '5',
  `signup_open` tinyint(1) NOT NULL DEFAULT '1',
  `signups_open_at` datetime DEFAULT NULL,
  `signups_close_at` datetime DEFAULT NULL,
  `assignments_due_at` datetime DEFAULT NULL,
  `works_reveal_at` datetime DEFAULT NULL,
  `authors_reveal_at` datetime DEFAULT NULL,
  `signup_instructions_general` text COLLATE utf8mb4_unicode_ci,
  `signup_instructions_requests` text COLLATE utf8mb4_unicode_ci,
  `request_url_label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request_description_label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_zone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signup_instructions_general_sanitizer_version` smallint NOT NULL DEFAULT '0',
  `signup_instructions_requests_sanitizer_version` smallint NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `anonymous` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prompt_memes`
--

LOCK TABLES `prompt_memes` WRITE;
/*!40000 ALTER TABLE `prompt_memes` DISABLE KEYS */;
/*!40000 ALTER TABLE `prompt_memes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prompt_restrictions`
--

DROP TABLE IF EXISTS `prompt_restrictions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prompt_restrictions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tag_set_id` int DEFAULT NULL,
  `optional_tags_allowed` tinyint(1) NOT NULL DEFAULT '0',
  `description_allowed` tinyint(1) NOT NULL DEFAULT '1',
  `url_required` tinyint(1) NOT NULL DEFAULT '0',
  `fandom_num_required` int NOT NULL DEFAULT '0',
  `category_num_required` int NOT NULL DEFAULT '0',
  `rating_num_required` int NOT NULL DEFAULT '0',
  `character_num_required` int NOT NULL DEFAULT '0',
  `relationship_num_required` int NOT NULL DEFAULT '0',
  `freeform_num_required` int NOT NULL DEFAULT '0',
  `archive_warning_num_required` int NOT NULL DEFAULT '0',
  `fandom_num_allowed` int NOT NULL DEFAULT '1',
  `category_num_allowed` int NOT NULL DEFAULT '0',
  `rating_num_allowed` int NOT NULL DEFAULT '0',
  `character_num_allowed` int NOT NULL DEFAULT '1',
  `relationship_num_allowed` int NOT NULL DEFAULT '1',
  `freeform_num_allowed` int NOT NULL DEFAULT '0',
  `archive_warning_num_allowed` int NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `description_required` tinyint(1) NOT NULL DEFAULT '0',
  `url_allowed` tinyint(1) NOT NULL DEFAULT '0',
  `allow_any_fandom` tinyint(1) NOT NULL DEFAULT '0',
  `allow_any_character` tinyint(1) NOT NULL DEFAULT '0',
  `allow_any_rating` tinyint(1) NOT NULL DEFAULT '0',
  `allow_any_relationship` tinyint(1) NOT NULL DEFAULT '0',
  `allow_any_category` tinyint(1) NOT NULL DEFAULT '0',
  `allow_any_archive_warning` tinyint(1) NOT NULL DEFAULT '0',
  `allow_any_freeform` tinyint(1) NOT NULL DEFAULT '0',
  `require_unique_fandom` tinyint(1) NOT NULL DEFAULT '0',
  `require_unique_character` tinyint(1) NOT NULL DEFAULT '0',
  `require_unique_rating` tinyint(1) NOT NULL DEFAULT '0',
  `require_unique_relationship` tinyint(1) NOT NULL DEFAULT '0',
  `require_unique_category` tinyint(1) NOT NULL DEFAULT '0',
  `require_unique_archive_warning` tinyint(1) NOT NULL DEFAULT '0',
  `require_unique_freeform` tinyint(1) NOT NULL DEFAULT '0',
  `character_restrict_to_fandom` tinyint(1) NOT NULL DEFAULT '0',
  `relationship_restrict_to_fandom` tinyint(1) NOT NULL DEFAULT '0',
  `character_restrict_to_tag_set` tinyint(1) NOT NULL DEFAULT '0',
  `relationship_restrict_to_tag_set` tinyint(1) NOT NULL DEFAULT '0',
  `title_required` tinyint(1) NOT NULL DEFAULT '0',
  `title_allowed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prompt_restrictions`
--

LOCK TABLES `prompt_restrictions` WRITE;
/*!40000 ALTER TABLE `prompt_restrictions` DISABLE KEYS */;
/*!40000 ALTER TABLE `prompt_restrictions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prompts`
--

DROP TABLE IF EXISTS `prompts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prompts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `collection_id` int DEFAULT NULL,
  `challenge_signup_id` int DEFAULT NULL,
  `pseud_id` int DEFAULT NULL,
  `tag_set_id` int DEFAULT NULL,
  `optional_tag_set_id` int DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `position` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_sanitizer_version` smallint NOT NULL DEFAULT '0',
  `any_fandom` tinyint(1) NOT NULL DEFAULT '0',
  `any_character` tinyint(1) NOT NULL DEFAULT '0',
  `any_rating` tinyint(1) NOT NULL DEFAULT '0',
  `any_relationship` tinyint(1) NOT NULL DEFAULT '0',
  `any_category` tinyint(1) NOT NULL DEFAULT '0',
  `any_archive_warning` tinyint(1) NOT NULL DEFAULT '0',
  `any_freeform` tinyint(1) NOT NULL DEFAULT '0',
  `anonymous` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_prompts_on_challenge_signup_id` (`challenge_signup_id`),
  KEY `index_prompts_on_collection_id` (`collection_id`),
  KEY `index_prompts_on_optional_tag_set_id` (`optional_tag_set_id`),
  KEY `index_prompts_on_tag_set_id` (`tag_set_id`),
  KEY `index_prompts_on_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prompts`
--

LOCK TABLES `prompts` WRITE;
/*!40000 ALTER TABLE `prompts` DISABLE KEYS */;
/*!40000 ALTER TABLE `prompts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pseuds`
--

DROP TABLE IF EXISTS `pseuds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pseuds` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `icon_file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_content_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_file_size` int DEFAULT NULL,
  `icon_updated_at` datetime DEFAULT NULL,
  `icon_alt_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `delta` tinyint(1) DEFAULT '1',
  `description_sanitizer_version` smallint NOT NULL DEFAULT '0',
  `icon_comment_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `index_psueds_on_name` (`name`),
  KEY `index_pseuds_on_user_id_and_name` (`user_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pseuds`
--

LOCK TABLES `pseuds` WRITE;
/*!40000 ALTER TABLE `pseuds` DISABLE KEYS */;
/*!40000 ALTER TABLE `pseuds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_translations`
--

DROP TABLE IF EXISTS `question_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_translations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question_id` int DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `content_sanitizer_version` smallint NOT NULL DEFAULT '0',
  `screencast_sanitizer_version` smallint NOT NULL DEFAULT '0',
  `is_translated` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_question_translations_on_locale` (`locale`),
  KEY `index_question_translations_on_question_id` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_translations`
--

LOCK TABLES `question_translations` WRITE;
/*!40000 ALTER TABLE `question_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `archive_faq_id` int DEFAULT NULL,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `anchor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `screencast` text COLLATE utf8mb4_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `position` int DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `index_questions_on_archive_faq_id_and_position` (`archive_faq_id`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `readings`
--

DROP TABLE IF EXISTS `readings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `readings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `major_version_read` int DEFAULT NULL,
  `minor_version_read` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `work_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `last_viewed` datetime DEFAULT NULL,
  `view_count` int DEFAULT '0',
  `toread` tinyint(1) NOT NULL DEFAULT '0',
  `toskip` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_readings_on_user_id` (`user_id`),
  KEY `index_readings_on_work_id` (`work_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `readings`
--

LOCK TABLES `readings` WRITE;
/*!40000 ALTER TABLE `readings` DISABLE KEYS */;
/*!40000 ALTER TABLE `readings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `related_works`
--

DROP TABLE IF EXISTS `related_works`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `related_works` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int DEFAULT NULL,
  `parent_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `work_id` int DEFAULT NULL,
  `reciprocal` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `translation` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_related_works_on_parent_id_and_parent_type` (`parent_id`,`parent_type`),
  KEY `index_related_works_on_work_id` (`work_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `related_works`
--

LOCK TABLES `related_works` WRITE;
/*!40000 ALTER TABLE `related_works` DISABLE KEYS */;
/*!40000 ALTER TABLE `related_works` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authorizable_type` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authorizable_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_roles_on_authorizable_id_and_authorizable_type` (`authorizable_id`,`authorizable_type`),
  KEY `index_roles_on_authorizable_type` (`authorizable_type`),
  KEY `index_roles_on_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_users`
--

DROP TABLE IF EXISTS `roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles_users` (
  `user_id` int DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `index_roles_users_on_role_id_and_user_id` (`role_id`,`user_id`),
  KEY `index_roles_users_on_user_id_and_role_id` (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_users`
--

LOCK TABLES `roles_users` WRITE;
/*!40000 ALTER TABLE `roles_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20141003204623'),('20141003205439'),('20141004123421'),('20141127004302'),('20150725141326'),('20150901024743'),('20150901132832'),('20151018165632'),('20151129234505'),('20160331005706'),('20160416163754'),('20170321202522'),('20170331170222'),('20170414154143'),('20170918172719'),('20171006090901'),('20171030201300'),('20171030220348'),('20171031204025'),('20171114212142'),('20180108220405'),('20180428201347'),('20180519055830'),('20180731034724'),('20180811160316'),('20180917212655'),('20181201022717'),('20181222022628'),('20181222042042'),('20181224173813'),('20190207034230'),('20190405191806'),('20190421213603'),('20190423215601'),('20200115232918'),('20200210013551'),('20200221045607'),('20200325021219'),('20200406185632'),('20200406190444'),('20200415010506'),('20200423205608'),('20200504132624'),('20200613211440'),('20200814233538'),('20200829050124'),('20201214013251'),('20210625232846'),('20210626010047'),('20210831214137'),('20211204001151'),('20211205115025'),('20211230202951'),('20220212222625'),('20220519071139'),('20220821213412'),('20220911173601'),('20220918015954'),('20230113225105'),('20230408145819'),('20230429120200');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searches`
--

DROP TABLE IF EXISTS `searches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searches` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searches`
--

LOCK TABLES `searches` WRITE;
/*!40000 ALTER TABLE `searches` DISABLE KEYS */;
/*!40000 ALTER TABLE `searches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serial_works`
--

DROP TABLE IF EXISTS `serial_works`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serial_works` (
  `id` int NOT NULL AUTO_INCREMENT,
  `series_id` int DEFAULT NULL,
  `work_id` int DEFAULT NULL,
  `position` int DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_serial_works_on_series_id` (`series_id`),
  KEY `index_serial_works_on_work_id` (`work_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serial_works`
--

LOCK TABLES `serial_works` WRITE;
/*!40000 ALTER TABLE `serial_works` DISABLE KEYS */;
/*!40000 ALTER TABLE `serial_works` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `series`
--

DROP TABLE IF EXISTS `series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `series` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci,
  `series_notes` text COLLATE utf8mb4_unicode_ci,
  `hidden_by_admin` tinyint(1) NOT NULL DEFAULT '0',
  `restricted` tinyint(1) NOT NULL DEFAULT '1',
  `complete` tinyint(1) NOT NULL DEFAULT '0',
  `summary_sanitizer_version` smallint NOT NULL DEFAULT '0',
  `series_notes_sanitizer_version` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series`
--

LOCK TABLES `series` WRITE;
/*!40000 ALTER TABLE `series` DISABLE KEYS */;
/*!40000 ALTER TABLE `series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `set_taggings`
--

DROP TABLE IF EXISTS `set_taggings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `set_taggings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tag_id` int DEFAULT NULL,
  `tag_set_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_set_taggings_on_tag_id` (`tag_id`),
  KEY `index_set_taggings_on_tag_set_id` (`tag_set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `set_taggings`
--

LOCK TABLES `set_taggings` WRITE;
/*!40000 ALTER TABLE `set_taggings` DISABLE KEYS */;
/*!40000 ALTER TABLE `set_taggings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skin_parents`
--

DROP TABLE IF EXISTS `skin_parents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skin_parents` (
  `id` int NOT NULL AUTO_INCREMENT,
  `child_skin_id` int DEFAULT NULL,
  `parent_skin_id` int DEFAULT NULL,
  `position` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skin_parents`
--

LOCK TABLES `skin_parents` WRITE;
/*!40000 ALTER TABLE `skin_parents` DISABLE KEYS */;
/*!40000 ALTER TABLE `skin_parents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skins`
--

DROP TABLE IF EXISTS `skins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` int DEFAULT NULL,
  `css` text COLLATE utf8mb4_unicode_ci,
  `public` tinyint(1) DEFAULT '0',
  `official` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `icon_file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_content_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_file_size` int DEFAULT NULL,
  `icon_updated_at` datetime DEFAULT NULL,
  `icon_alt_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `margin` int DEFAULT NULL,
  `paragraph_gap` int DEFAULT NULL,
  `font` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_em` int DEFAULT NULL,
  `background_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foreground_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `rejected` tinyint(1) NOT NULL DEFAULT '0',
  `admin_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_sanitizer_version` smallint NOT NULL DEFAULT '0',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paragraph_margin` float DEFAULT NULL,
  `headercolor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accent_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ie_condition` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `do_not_upgrade` tinyint(1) NOT NULL DEFAULT '0',
  `cached` tinyint(1) NOT NULL DEFAULT '0',
  `unusable` tinyint(1) NOT NULL DEFAULT '0',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `in_chooser` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_skins_on_author_id` (`author_id`),
  KEY `index_skins_on_in_chooser` (`in_chooser`),
  KEY `index_skins_on_public_and_official` (`public`,`official`),
  KEY `index_skins_on_title` (`title`),
  KEY `index_skins_on_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skins`
--

LOCK TABLES `skins` WRITE;
/*!40000 ALTER TABLE `skins` DISABLE KEYS */;
/*!40000 ALTER TABLE `skins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_counters`
--

DROP TABLE IF EXISTS `stat_counters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stat_counters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `work_id` int DEFAULT NULL,
  `hit_count` int NOT NULL DEFAULT '0',
  `download_count` int NOT NULL DEFAULT '0',
  `comments_count` int NOT NULL DEFAULT '0',
  `kudos_count` int NOT NULL DEFAULT '0',
  `bookmarks_count` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_hit_counters_on_work_id` (`work_id`),
  KEY `index_hit_counters_on_hit_count` (`hit_count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_counters`
--

LOCK TABLES `stat_counters` WRITE;
/*!40000 ALTER TABLE `stat_counters` DISABLE KEYS */;
/*!40000 ALTER TABLE `stat_counters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscriptions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `subscribable_id` int DEFAULT NULL,
  `subscribable_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscribable` (`subscribable_id`,`subscribable_type`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_nominations`
--

DROP TABLE IF EXISTS `tag_nominations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag_nominations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tag_set_nomination_id` int DEFAULT NULL,
  `fandom_nomination_id` int DEFAULT NULL,
  `tagname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_tagname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `rejected` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `canonical` tinyint(1) NOT NULL DEFAULT '0',
  `exists` tinyint(1) NOT NULL DEFAULT '0',
  `parented` tinyint(1) NOT NULL DEFAULT '0',
  `synonym` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_tag_nominations_on_tagname` (`tagname`),
  KEY `index_tag_nominations_on_type_and_tag_set_nomination_id` (`type`,`tag_set_nomination_id`),
  KEY `index_tag_nominations_on_type_and_fandom_nomination_id` (`type`,`fandom_nomination_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_nominations`
--

LOCK TABLES `tag_nominations` WRITE;
/*!40000 ALTER TABLE `tag_nominations` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_nominations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_set_associations`
--

DROP TABLE IF EXISTS `tag_set_associations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag_set_associations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owned_tag_set_id` int DEFAULT NULL,
  `tag_id` int DEFAULT NULL,
  `parent_tag_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_set_associations`
--

LOCK TABLES `tag_set_associations` WRITE;
/*!40000 ALTER TABLE `tag_set_associations` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_set_associations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_set_nominations`
--

DROP TABLE IF EXISTS `tag_set_nominations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag_set_nominations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pseud_id` int DEFAULT NULL,
  `owned_tag_set_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_tag_set_nominations_on_pseud_id_and_owned_tag_set_id` (`pseud_id`,`owned_tag_set_id`),
  KEY `index_tag_set_nominations_on_owned_tag_set_id` (`owned_tag_set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_set_nominations`
--

LOCK TABLES `tag_set_nominations` WRITE;
/*!40000 ALTER TABLE `tag_set_nominations` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_set_nominations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_set_ownerships`
--

DROP TABLE IF EXISTS `tag_set_ownerships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag_set_ownerships` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pseud_id` int DEFAULT NULL,
  `owned_tag_set_id` int DEFAULT NULL,
  `owner` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_set_ownerships`
--

LOCK TABLES `tag_set_ownerships` WRITE;
/*!40000 ALTER TABLE `tag_set_ownerships` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_set_ownerships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_sets`
--

DROP TABLE IF EXISTS `tag_sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag_sets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_sets`
--

LOCK TABLES `tag_sets` WRITE;
/*!40000 ALTER TABLE `tag_sets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggings`
--

DROP TABLE IF EXISTS `taggings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taggings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tagger_id` int DEFAULT NULL,
  `taggable_id` int NOT NULL,
  `taggable_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `tagger_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_taggings_polymorphic` (`tagger_id`,`tagger_type`,`taggable_id`,`taggable_type`),
  KEY `index_taggings_taggable` (`taggable_id`,`taggable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggings`
--

LOCK TABLES `taggings` WRITE;
/*!40000 ALTER TABLE `taggings` DISABLE KEYS */;
/*!40000 ALTER TABLE `taggings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `canonical` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `taggings_count_cache` int DEFAULT '0',
  `adult` tinyint(1) DEFAULT '0',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `merger_id` int DEFAULT NULL,
  `delta` tinyint(1) DEFAULT '0',
  `last_wrangler_id` int DEFAULT NULL,
  `last_wrangler_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unwrangleable` tinyint(1) NOT NULL DEFAULT '0',
  `sortable_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_tags_on_name` (`name`),
  KEY `index_tags_on_canonical` (`canonical`),
  KEY `tag_created_at_index` (`created_at`),
  KEY `index_tags_on_id_and_type` (`id`,`type`),
  KEY `index_tags_on_merger_id` (`merger_id`),
  KEY `index_tags_on_sortable_name` (`sortable_name`),
  KEY `index_tags_on_taggings_count_cache` (`taggings_count_cache`),
  KEY `index_tags_on_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_invite_requests`
--

DROP TABLE IF EXISTS `user_invite_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_invite_requests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  `granted` tinyint(1) NOT NULL DEFAULT '0',
  `handled` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_invite_requests_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_invite_requests`
--

LOCK TABLES `user_invite_requests` WRITE;
/*!40000 ALTER TABLE `user_invite_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_invite_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `encrypted_password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_salt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `banned` tinyint(1) NOT NULL DEFAULT '0',
  `invitation_id` int DEFAULT NULL,
  `suspended_until` datetime DEFAULT NULL,
  `out_of_invites` tinyint(1) NOT NULL DEFAULT '1',
  `failed_attempts` int DEFAULT '0',
  `confirmation_sent_at` datetime DEFAULT NULL,
  `reset_password_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unlock_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `accepted_tos_version` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_login` (`login`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`),
  UNIQUE KEY `index_users_on_unlock_token` (`unlock_token`),
  UNIQUE KEY `index_users_on_confirmation_token` (`confirmation_token`),
  UNIQUE KEY `index_users_on_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_links`
--

DROP TABLE IF EXISTS `work_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_links` (
  `id` int NOT NULL AUTO_INCREMENT,
  `work_id` int DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `work_links_work_id_url` (`work_id`,`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_links`
--

LOCK TABLES `work_links` WRITE;
/*!40000 ALTER TABLE `work_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `work_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_original_creators`
--

DROP TABLE IF EXISTS `work_original_creators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_original_creators` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `work_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_work_original_creators_on_work_id_and_user_id` (`work_id`,`user_id`),
  KEY `index_work_original_creators_on_work_id` (`work_id`),
  KEY `index_work_original_creators_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_original_creators`
--

LOCK TABLES `work_original_creators` WRITE;
/*!40000 ALTER TABLE `work_original_creators` DISABLE KEYS */;
/*!40000 ALTER TABLE `work_original_creators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `works`
--

DROP TABLE IF EXISTS `works`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `works` (
  `id` int NOT NULL AUTO_INCREMENT,
  `expected_number_of_chapters` int DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `major_version` int DEFAULT '1',
  `minor_version` int DEFAULT '0',
  `posted` tinyint(1) NOT NULL DEFAULT '0',
  `language_id` int DEFAULT NULL,
  `restricted` tinyint(1) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `word_count` int DEFAULT NULL,
  `hidden_by_admin` tinyint(1) NOT NULL DEFAULT '0',
  `delta` tinyint(1) DEFAULT '0',
  `revised_at` datetime DEFAULT NULL,
  `title_to_sort_on` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `backdate` tinyint(1) NOT NULL DEFAULT '0',
  `endnotes` text COLLATE utf8mb4_unicode_ci,
  `imported_from_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `complete` tinyint(1) NOT NULL DEFAULT '0',
  `summary_sanitizer_version` smallint NOT NULL DEFAULT '0',
  `notes_sanitizer_version` smallint NOT NULL DEFAULT '0',
  `endnotes_sanitizer_version` smallint NOT NULL DEFAULT '0',
  `work_skin_id` int DEFAULT NULL,
  `in_anon_collection` tinyint(1) NOT NULL DEFAULT '0',
  `in_unrevealed_collection` tinyint(1) NOT NULL DEFAULT '0',
  `ip_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spam` tinyint(1) NOT NULL DEFAULT '0',
  `spam_checked_at` datetime DEFAULT NULL,
  `comment_permissions` tinyint NOT NULL DEFAULT '0',
  `moderated_commenting_enabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `complete_works` (`complete`,`posted`,`hidden_by_admin`),
  KEY `index_works_on_delta` (`delta`),
  KEY `index_works_on_imported_from_url` (`imported_from_url`),
  KEY `index_works_on_ip_address` (`ip_address`),
  KEY `index_works_on_language_id` (`language_id`),
  KEY `visible_works` (`restricted`,`posted`,`hidden_by_admin`),
  KEY `index_works_on_revised_at` (`revised_at`),
  KEY `index_works_on_spam` (`spam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works`
--

LOCK TABLES `works` WRITE;
/*!40000 ALTER TABLE `works` DISABLE KEYS */;
/*!40000 ALTER TABLE `works` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wrangling_assignments`
--

DROP TABLE IF EXISTS `wrangling_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wrangling_assignments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `fandom_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wrangling_assignments_by_fandom_id` (`fandom_id`),
  KEY `wrangling_assignments_by_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wrangling_assignments`
--

LOCK TABLES `wrangling_assignments` WRITE;
/*!40000 ALTER TABLE `wrangling_assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `wrangling_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wrangling_guidelines`
--

DROP TABLE IF EXISTS `wrangling_guidelines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wrangling_guidelines` (
  `id` int NOT NULL AUTO_INCREMENT,
  `admin_id` int DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `position` int DEFAULT NULL,
  `content_sanitizer_version` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wrangling_guidelines`
--

LOCK TABLES `wrangling_guidelines` WRITE;
/*!40000 ALTER TABLE `wrangling_guidelines` DISABLE KEYS */;
/*!40000 ALTER TABLE `wrangling_guidelines` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-06  6:25:19
