-- MySQL dump 10.13  Distrib 8.0.21, for osx10.15 (x86_64)
--
-- Host: localhost    Database: snet0408
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  `body` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`user_id`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `communities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_requests`
--

DROP TABLE IF EXISTS `friend_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend_requests` (
  `initiator_user_id` bigint unsigned NOT NULL,
  `target_user_id` bigint unsigned NOT NULL,
  `status` enum('requested','approved','unfriended','decline') DEFAULT 'requested',
  `requested_add` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`initiator_user_id`,`target_user_id`),
  KEY `friend_requests_iui_idx` (`initiator_user_id`),
  KEY `target_user_id` (`target_user_id`),
  CONSTRAINT `friend_requests_fk1` FOREIGN KEY (`initiator_user_id`) REFERENCES `profiles` (`user_id`),
  CONSTRAINT `friend_requests_ibfk_1` FOREIGN KEY (`target_user_id`) REFERENCES `profiles` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_requests`
--

LOCK TABLES `friend_requests` WRITE;
/*!40000 ALTER TABLE `friend_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `friend_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes_media`
--

DROP TABLE IF EXISTS `likes_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes_media` (
  `user_id` bigint unsigned NOT NULL,
  `music_id` bigint unsigned NOT NULL,
  `video_id` bigint unsigned NOT NULL,
  `photos_id` bigint unsigned NOT NULL,
  `liked_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`music_id`,`video_id`,`photos_id`),
  KEY `music_id` (`music_id`),
  KEY `video_id` (`video_id`),
  KEY `photos_id` (`photos_id`),
  CONSTRAINT `likes_media_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`user_id`),
  CONSTRAINT `likes_media_ibfk_2` FOREIGN KEY (`music_id`) REFERENCES `music` (`id`),
  CONSTRAINT `likes_media_ibfk_3` FOREIGN KEY (`video_id`) REFERENCES `video` (`id`),
  CONSTRAINT `likes_media_ibfk_4` FOREIGN KEY (`photos_id`) REFERENCES `photos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes_media`
--

LOCK TABLES `likes_media` WRITE;
/*!40000 ALTER TABLE `likes_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `likes_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes_photo`
--

DROP TABLE IF EXISTS `likes_photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes_photo` (
  `user_id` bigint unsigned NOT NULL,
  `liked_photo_id` bigint unsigned NOT NULL,
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`liked_photo_id`),
  KEY `liked_photo_id` (`liked_photo_id`),
  CONSTRAINT `likes_photo_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`user_id`),
  CONSTRAINT `likes_photo_ibfk_2` FOREIGN KEY (`liked_photo_id`) REFERENCES `photos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes_photo`
--

LOCK TABLES `likes_photo` WRITE;
/*!40000 ALTER TABLE `likes_photo` DISABLE KEYS */;
/*!40000 ALTER TABLE `likes_photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes_posts`
--

DROP TABLE IF EXISTS `likes_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes_posts` (
  `user_id` bigint unsigned NOT NULL,
  `posts_id` bigint unsigned NOT NULL,
  `liked_at` datetime DEFAULT CURRENT_TIMESTAMP,
  KEY `user_id` (`user_id`),
  KEY `posts_id` (`posts_id`),
  CONSTRAINT `likes_posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`user_id`),
  CONSTRAINT `likes_posts_ibfk_2` FOREIGN KEY (`posts_id`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes_posts`
--

LOCK TABLES `likes_posts` WRITE;
/*!40000 ALTER TABLE `likes_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `likes_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes_users`
--

DROP TABLE IF EXISTS `likes_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes_users` (
  `user_id` bigint unsigned NOT NULL,
  `liked_by` bigint unsigned NOT NULL,
  `liked_at` datetime DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `liked_by` (`liked_by`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `likes_users_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`user_id`),
  CONSTRAINT `likes_users_ibfk_2` FOREIGN KEY (`liked_by`) REFERENCES `profiles` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes_users`
--

LOCK TABLES `likes_users` WRITE;
/*!40000 ALTER TABLE `likes_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `likes_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `massages`
--

DROP TABLE IF EXISTS `massages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `massages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint unsigned NOT NULL,
  `to_user_id` bigint unsigned NOT NULL,
  `body` text,
  `is_read` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_user_id` (`to_user_id`),
  CONSTRAINT `massages_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `profiles` (`user_id`),
  CONSTRAINT `massages_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `profiles` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `massages`
--

LOCK TABLES `massages` WRITE;
/*!40000 ALTER TABLE `massages` DISABLE KEYS */;
/*!40000 ALTER TABLE `massages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `music`
--

DROP TABLE IF EXISTS `music`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `music` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `artist_id` bigint unsigned NOT NULL,
  `album_id` bigint unsigned NOT NULL,
  `track_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `music`
--

LOCK TABLES `music` WRITE;
/*!40000 ALTER TABLE `music` DISABLE KEYS */;
/*!40000 ALTER TABLE `music` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `photos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `file` varchar(255) DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `description` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `body` text,
  `attachments` json DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `user_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `gender` char(1) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `photo_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `name` (`name`),
  KEY `lastname` (`lastname`),
  CONSTRAINT `profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'Lorna','Ankunding','f','2012-03-20',NULL),(2,'Gabe','Stroman','f','1998-10-11',NULL),(3,'Leila','Donnelly','f','1979-05-20',NULL),(4,'Roderick','Brakus','f','2001-12-04',NULL),(5,'Walton','Graham','f','2005-05-04',NULL),(6,'Lea','Cole','f','1981-12-09',NULL),(7,'Brenden','Schiller','m','1976-09-10',NULL),(8,'Ignatius','Kunze','m','1994-02-12',NULL),(9,'Alfonzo','Schuster','m','1978-08-04',NULL),(10,'Porter','Hane','f','1999-03-08',NULL),(11,'Lurline','Roberts','f','1987-03-24',NULL),(12,'Kristy','Murazik','m','2018-12-06',NULL),(13,'Aryanna','Hermiston','f','1978-05-10',NULL),(14,'Marcelina','Deckow','f','2011-10-04',NULL),(15,'Franco','West','f','1970-11-15',NULL),(16,'Pamela','Mraz','f','1992-07-23',NULL),(17,'Eileen','Rau','f','1995-05-14',NULL),(18,'Rey','Predovic','f','2004-01-31',NULL),(19,'Aniya','Dicki','f','1994-08-07',NULL),(20,'Jaylin','Pollich','f','1972-09-09',NULL),(21,'Francesco','Hansen','m','2015-01-12',NULL),(22,'Ocie','Wiegand','f','1993-12-26',NULL),(23,'Estefania','Bahringer','m','2001-09-21',NULL),(24,'Kassandra','Kohler','f','1980-08-05',NULL),(25,'Adelia','Bechtelar','m','2018-02-23',NULL),(26,'Jaime','Doyle','m','1993-03-10',NULL),(27,'Garett','Hamill','m','1970-10-17',NULL),(28,'Jasen','Metz','m','1982-01-18',NULL),(29,'Wade','Hintz','m','1982-10-12',NULL),(30,'Jane','Greenholt','m','2005-11-03',NULL),(31,'Caterina','Durgan','m','1973-07-25',NULL),(32,'Dallas','Reichert','f','2003-11-15',NULL),(33,'Vicenta','Ortiz','f','1980-09-24',NULL),(34,'Raul','Frami','f','2016-11-29',NULL),(35,'Brisa','Beer','f','2006-01-21',NULL),(36,'Pearline','Padberg','f','2003-08-14',NULL),(37,'Mae','Mayer','f','1998-09-11',NULL),(38,'Lacy','Thompson','f','1994-05-23',NULL),(39,'Cruz','Stehr','m','2005-04-21',NULL),(40,'Shayne','Weissnat','m','1998-08-12',NULL),(41,'Drake','Dickens','f','1982-01-22',NULL),(42,'Shea','Upton','f','1986-03-23',NULL),(43,'Charlotte','Hagenes','m','2003-08-11',NULL),(44,'Jamal','Robel','f','2006-09-13',NULL),(45,'John','Waters','m','2002-02-09',NULL),(46,'Guy','Towne','m','1985-08-14',NULL),(47,'Mariela','Vandervort','m','1982-07-19',NULL),(48,'Melody','Jones','m','2002-12-23',NULL),(49,'Darrel','Mraz','m','1995-05-14',NULL),(50,'Edmond','Ziemann','m','1984-04-27',NULL),(51,'Amani','Thiel','m','1990-11-07',NULL),(52,'Willa','Mayer','f','2013-08-21',NULL),(53,'Garry','Ullrich','m','2005-08-01',NULL),(54,'Johathan','Miller','f','1987-05-29',NULL),(55,'Saul','Lebsack','f','1984-11-07',NULL),(56,'Elda','Ullrich','m','1972-07-11',NULL),(57,'Yolanda','Cremin','f','1981-12-12',NULL),(58,'Lester','Huels','f','1996-10-17',NULL),(59,'Estevan','Brekke','f','1985-06-24',NULL),(60,'Kaylah','Schowalter','f','1977-08-17',NULL),(61,'Leilani','Padberg','f','1971-07-23',NULL),(62,'Lina','Bradtke','m','1981-12-26',NULL),(63,'Hans','Eichmann','f','1990-10-26',NULL),(64,'Lily','Beatty','m','1983-06-07',NULL),(65,'Sigurd','Goldner','f','2000-03-02',NULL),(66,'Clementine','Dare','m','1974-11-20',NULL),(67,'Charley','Mante','m','2007-06-19',NULL),(68,'Pamela','Lebsack','f','1977-06-08',NULL),(69,'Raquel','Tromp','f','1983-04-18',NULL),(70,'Luigi','Maggio','m','2016-08-04',NULL),(71,'Maxie','Hessel','m','2008-01-07',NULL),(72,'Jaqueline','Crona','f','2014-09-30',NULL),(73,'Marianna','Grant','f','2009-10-27',NULL),(74,'Talon','Jerde','f','1985-09-30',NULL),(75,'Margie','Dach','f','2007-03-14',NULL),(76,'Cornell','Rice','m','2018-08-19',NULL),(77,'Afton','Torphy','m','2017-11-22',NULL),(78,'Sibyl','O\'Keefe','m','1981-11-28',NULL),(79,'Christy','Hilpert','f','1977-06-17',NULL),(80,'Lamont','Herzog','m','1993-08-18',NULL),(81,'Rolando','Denesik','f','2012-01-03',NULL),(82,'Karine','Treutel','f','1971-09-08',NULL),(83,'Hallie','Hoeger','m','1974-05-21',NULL),(84,'Andreanne','Little','f','2007-10-02',NULL),(85,'Jordyn','Wisozk','m','1998-06-23',NULL),(86,'Harold','Price','f','1994-02-09',NULL),(87,'Reta','O\'Kon','f','1998-06-09',NULL),(88,'Summer','Walsh','f','2018-10-01',NULL),(89,'Connie','Mosciski','f','1971-12-07',NULL),(90,'Minnie','Roberts','f','1974-11-16',NULL),(91,'Chasity','Auer','f','1994-08-30',NULL),(92,'Alena','Ferry','m','1991-08-25',NULL),(93,'Carli','Parisian','f','2009-10-29',NULL),(94,'Kim','Farrell','m','1986-02-04',NULL),(95,'Darrel','Tremblay','m','1980-10-01',NULL),(96,'Mustafa','Tillman','f','1982-01-17',NULL),(97,'Krystel','Olson','m','1972-04-04',NULL),(98,'Zoie','Gerlach','m','1976-10-29',NULL),(99,'Tristin','Mosciski','f','1981-08-19',NULL),(100,'Seth','Baumbach','m','1988-06-02',NULL);
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reposts`
--

DROP TABLE IF EXISTS `reposts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reposts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint unsigned NOT NULL,
  `reposted_from` bigint unsigned NOT NULL,
  `reposted_to` bigint unsigned NOT NULL,
  `reposted_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `post_id` (`post_id`),
  KEY `reposted_to` (`reposted_to`),
  KEY `reposted_from` (`reposted_from`),
  CONSTRAINT `reposts_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `reposts_ibfk_2` FOREIGN KEY (`reposted_to`) REFERENCES `profiles` (`user_id`),
  CONSTRAINT `reposts_ibfk_3` FOREIGN KEY (`reposted_from`) REFERENCES `profiles` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reposts`
--

LOCK TABLES `reposts` WRITE;
/*!40000 ALTER TABLE `reposts` DISABLE KEYS */;
/*!40000 ALTER TABLE `reposts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(120) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `pass` varchar(200) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `visible_for` enum('all','frends_of_friends','friends') DEFAULT 'all',
  `may_comment` tinyint(1) DEFAULT NULL,
  `may_massage` enum('all','frends_of_friends','friends') DEFAULT 'all',
  `invite_to_community` enum('all','friends_of_friends','friends') DEFAULT 'all',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'olson.talon@example.net','1-572-895-1723x','','2000-05-15 17:18:02','all',NULL,'friends','friends'),(2,'mosciski.darryl@example.com','172-060-9257x66','','1971-04-14 23:46:48','frends_of_friends',NULL,'friends','friends_of_friends'),(3,'qgutkowski@example.org','(700)595-1984','','1999-04-28 00:36:11','frends_of_friends',NULL,'friends','all'),(4,'beryl.grimes@example.org','(196)094-9320x5','','2001-12-03 08:09:17','frends_of_friends',NULL,'frends_of_friends','friends_of_friends'),(5,'hfeest@example.com','(786)223-2897','','1979-02-25 19:56:59','all',NULL,'frends_of_friends','friends'),(6,'chesley.kutch@example.com','483-399-5927','','1992-11-25 14:48:02','friends',NULL,'all','friends'),(7,'adriel91@example.net','07519514496','','2016-04-07 04:15:17','frends_of_friends',NULL,'frends_of_friends','friends_of_friends'),(8,'chauck@example.org','1-732-338-7093x','','1990-01-11 07:04:51','frends_of_friends',NULL,'friends','friends'),(9,'athena.cassin@example.com','05438361711','','1982-09-21 06:38:13','frends_of_friends',NULL,'all','friends'),(10,'mccullough.liliana@example.org','1-557-360-9043x','','1980-02-01 10:58:09','friends',NULL,'friends','all'),(11,'odie07@example.org','1-270-849-2420x','','1990-03-13 18:52:42','all',NULL,'frends_of_friends','friends_of_friends'),(12,'mcdermott.nicklaus@example.net','(295)687-3517','','1976-07-02 11:33:53','frends_of_friends',NULL,'friends','all'),(13,'bailey33@example.com','848-992-5669x39','','2014-05-17 08:33:20','friends',NULL,'all','friends'),(14,'vergie.hodkiewicz@example.net','08031785300','','2018-08-30 12:53:46','all',NULL,'friends','all'),(15,'pgreenholt@example.org','1-925-800-8321x','','1982-04-10 00:01:28','frends_of_friends',NULL,'frends_of_friends','friends'),(16,'alehner@example.com','04464461547','','1977-02-16 04:23:19','all',NULL,'all','friends'),(17,'kimberly.hintz@example.org','1-778-507-3151','','1977-02-21 12:14:25','all',NULL,'friends','friends'),(18,'cassandra24@example.net','603-988-9870','','1972-10-30 15:09:16','all',NULL,'friends','all'),(19,'eldred.mueller@example.com','1-126-998-0105x','','1977-08-12 20:18:00','all',NULL,'friends','friends_of_friends'),(20,'salvador.schumm@example.net','982-159-4742','','1973-04-05 16:32:38','friends',NULL,'all','friends'),(21,'shanelle.bosco@example.net','434.095.7048','','1996-08-19 23:47:17','all',NULL,'friends','friends_of_friends'),(22,'qgulgowski@example.org','1-421-575-3889x','','1998-09-09 00:09:52','frends_of_friends',NULL,'friends','friends'),(23,'fermin.mclaughlin@example.net','833.828.6316x03','','2014-03-25 12:35:28','all',NULL,'frends_of_friends','friends'),(24,'daisha.hahn@example.com','(100)043-6404','','1981-02-26 16:53:00','all',NULL,'friends','friends'),(25,'gus29@example.com','(493)992-6178x1','','2010-02-04 06:53:15','friends',NULL,'friends','all'),(26,'dkeebler@example.com','592.741.8463x15','','1997-09-18 13:01:11','frends_of_friends',NULL,'frends_of_friends','friends_of_friends'),(27,'sconn@example.org','558-892-1658','','2020-03-09 20:52:02','frends_of_friends',NULL,'friends','friends_of_friends'),(28,'dwight30@example.net','(712)569-1040x3','','2003-12-21 10:56:24','friends',NULL,'friends','friends_of_friends'),(29,'kayden.ziemann@example.com','338.312.3783x87','','2012-06-18 15:45:22','all',NULL,'frends_of_friends','friends'),(30,'monahan.elmo@example.com','1-193-425-6222x','','1978-08-02 12:46:32','friends',NULL,'friends','friends'),(31,'schultz.jacky@example.net','553.853.2107x07','','1979-02-03 23:18:04','all',NULL,'friends','friends'),(32,'ahmad.waters@example.org','1-056-966-8280','','2005-01-17 12:07:32','all',NULL,'all','all'),(33,'reta.nicolas@example.net','1-253-555-8324x','','1970-03-07 00:37:14','friends',NULL,'all','friends_of_friends'),(34,'trey53@example.com','02612231590','','2010-07-09 23:38:07','friends',NULL,'frends_of_friends','all'),(35,'mbergnaum@example.com','006-098-0415x47','','2015-11-03 17:28:04','friends',NULL,'friends','friends_of_friends'),(36,'carmella58@example.net','011-573-6924x15','','2016-03-18 13:05:19','friends',NULL,'friends','all'),(37,'alisa28@example.com','(144)629-8422','','2005-04-21 18:33:33','friends',NULL,'friends','friends'),(38,'bartell.joseph@example.com','1-890-987-2047x','','1984-12-28 19:04:18','all',NULL,'friends','friends'),(39,'gutkowski.addie@example.net','432-442-0599x72','','2011-04-30 03:34:39','all',NULL,'frends_of_friends','friends_of_friends'),(40,'dkonopelski@example.com','1-094-592-2901x','','1985-01-09 20:48:54','all',NULL,'friends','friends'),(41,'hyatt.litzy@example.net','(796)859-6449','','2000-02-10 03:54:04','frends_of_friends',NULL,'all','all'),(42,'irwin.johnston@example.net','268-724-1014','','2004-09-14 20:24:41','frends_of_friends',NULL,'frends_of_friends','all'),(43,'rbins@example.com','983-078-2737x87','','1978-06-08 03:39:16','friends',NULL,'all','friends_of_friends'),(44,'albina63@example.org','07607663195','','1996-10-03 05:06:11','friends',NULL,'frends_of_friends','all'),(45,'ford.metz@example.net','113-895-1361','','2009-12-18 12:24:43','all',NULL,'friends','friends_of_friends'),(46,'antonio.mayert@example.net','(712)933-9277','','1982-12-26 11:48:04','friends',NULL,'all','friends_of_friends'),(47,'rhuel@example.net','(296)881-7295x3','','1984-07-02 14:42:25','frends_of_friends',NULL,'all','friends_of_friends'),(48,'langworth.jade@example.net','923-575-0678','','1989-12-23 11:34:19','all',NULL,'friends','all'),(49,'yschulist@example.net','(288)099-0400x9','','1986-12-31 06:12:20','all',NULL,'frends_of_friends','friends_of_friends'),(50,'vada86@example.com','1-878-192-7729x','','2003-11-16 15:18:25','friends',NULL,'friends','all'),(51,'hkling@example.com','1-185-097-0433','','2016-10-05 14:06:20','all',NULL,'frends_of_friends','all'),(52,'chelsie.berge@example.net','1-870-019-9533','','2019-07-25 18:14:45','friends',NULL,'friends','friends'),(53,'jackeline.kertzmann@example.com','00657398763','','2015-04-20 16:59:14','frends_of_friends',NULL,'all','friends_of_friends'),(54,'kattie14@example.com','171.725.4192x34','','2018-01-09 19:08:55','all',NULL,'friends','all'),(55,'ulices.weimann@example.org','(817)884-9239','','1998-06-19 08:27:15','all',NULL,'all','all'),(56,'kelly23@example.com','(836)760-5490x4','','1995-06-05 02:37:19','frends_of_friends',NULL,'frends_of_friends','friends'),(57,'julius52@example.org','1-964-432-6776','','1996-08-15 12:09:52','all',NULL,'all','friends'),(58,'judah63@example.com','(454)287-6628x2','','2001-06-29 18:48:59','friends',NULL,'frends_of_friends','friends_of_friends'),(59,'hahn.rudolph@example.org','231-926-2858x19','','1980-07-12 15:56:06','frends_of_friends',NULL,'frends_of_friends','friends_of_friends'),(60,'nella.gulgowski@example.org','(495)390-3747x3','','2014-03-02 19:33:14','frends_of_friends',NULL,'frends_of_friends','all'),(61,'posinski@example.org','883.611.9939','','2000-09-10 22:44:48','all',NULL,'frends_of_friends','all'),(62,'vesta.mclaughlin@example.org','274-827-1598x53','','2020-03-12 02:16:39','friends',NULL,'friends','friends_of_friends'),(63,'huel.ramiro@example.com','(954)230-9044','','2010-08-18 00:54:39','all',NULL,'friends','all'),(64,'jalen.thiel@example.org','(477)419-6750','','1978-04-29 17:33:49','frends_of_friends',NULL,'all','friends_of_friends'),(65,'wtillman@example.net','364-083-3380x46','','2006-07-21 17:16:23','frends_of_friends',NULL,'frends_of_friends','friends_of_friends'),(66,'kristian.walker@example.net','1-299-526-6645x','','1991-10-29 11:12:03','all',NULL,'friends','all'),(67,'koepp.isadore@example.com','04162172528','','2010-03-29 02:42:11','frends_of_friends',NULL,'friends','friends_of_friends'),(68,'fadel.lia@example.org','05973557905','','2011-02-13 05:52:36','frends_of_friends',NULL,'friends','all'),(69,'bret.d\'amore@example.com','522.120.7272x88','','2005-09-27 09:52:05','friends',NULL,'all','friends'),(70,'afton48@example.net','(224)873-4008x7','','2011-04-27 07:45:57','all',NULL,'frends_of_friends','friends'),(71,'sophie67@example.org','1-489-505-6734x','','1981-02-16 21:16:19','friends',NULL,'friends','friends'),(72,'javon.mcdermott@example.net','+33(6)080790724','','2007-09-14 15:56:55','frends_of_friends',NULL,'frends_of_friends','all'),(73,'urodriguez@example.net','865-569-2008x06','','1989-12-25 20:44:37','frends_of_friends',NULL,'friends','friends_of_friends'),(74,'lowe.alaina@example.org','(779)166-5239','','2001-12-25 06:09:00','all',NULL,'all','friends_of_friends'),(75,'fswaniawski@example.org','1-962-651-9198x','','1971-07-26 17:51:48','friends',NULL,'friends','friends_of_friends'),(76,'harber.sharon@example.com','529.419.8230','','1990-11-12 07:40:02','friends',NULL,'frends_of_friends','all'),(77,'koepp.chris@example.com','1-722-665-2100x','','1997-12-06 00:00:34','all',NULL,'all','friends'),(78,'madisen.simonis@example.com','1-825-836-0028','','1997-05-15 20:20:48','friends',NULL,'all','friends_of_friends'),(79,'king.carlee@example.net','1-107-416-8154x','','1985-10-19 03:50:03','friends',NULL,'friends','all'),(80,'neil35@example.org','1-807-582-6879','','2002-09-16 13:03:31','friends',NULL,'all','friends_of_friends'),(81,'iwill@example.net','629-887-3321','','2001-04-24 19:21:22','friends',NULL,'all','friends'),(82,'koepp.ova@example.com','924-935-6219x97','','1978-01-10 12:30:31','all',NULL,'frends_of_friends','all'),(83,'yrodriguez@example.com','899.879.2253x83','','2017-10-25 01:18:41','frends_of_friends',NULL,'frends_of_friends','all'),(84,'trutherford@example.com','1-241-008-5228x','','2015-12-05 03:30:28','all',NULL,'frends_of_friends','all'),(85,'conner.block@example.net','1-748-054-3319x','','1984-09-23 13:08:19','all',NULL,'frends_of_friends','friends_of_friends'),(86,'ystokes@example.com','231.540.2575','','1993-04-22 16:10:36','friends',NULL,'friends','all'),(87,'moore.rhoda@example.com','030-030-1253x62','','1974-04-11 21:43:11','friends',NULL,'friends','friends'),(88,'dickens.sim@example.org','+94(1)065492109','','1980-05-23 02:25:05','frends_of_friends',NULL,'all','friends'),(89,'antonina48@example.org','(282)774-6583','','1979-04-27 05:26:05','friends',NULL,'all','friends'),(90,'mrosenbaum@example.com','364.595.7577','','2014-01-05 05:05:05','all',NULL,'frends_of_friends','all'),(91,'hunter80@example.com','1-329-975-0611','','2004-11-24 11:56:46','all',NULL,'all','friends'),(92,'pedro09@example.net','1-460-453-2411','','2001-06-19 21:10:59','friends',NULL,'frends_of_friends','all'),(93,'ksipes@example.com','752.113.0877','','1975-07-28 10:13:18','all',NULL,'all','all'),(94,'audra52@example.com','257.728.5259x38','','1999-11-14 09:00:46','frends_of_friends',NULL,'friends','friends_of_friends'),(95,'ankunding.roxane@example.com','(950)227-3126','','1986-05-19 21:49:33','all',NULL,'frends_of_friends','friends_of_friends'),(96,'ipadberg@example.com','1-473-442-2489x','','1978-09-04 11:24:03','all',NULL,'friends','friends_of_friends'),(97,'rempel.desmond@example.net','644-080-5945','','1971-03-21 04:46:52','all',NULL,'frends_of_friends','all'),(98,'nauer@example.net','589.593.5924x48','','2018-09-14 23:19:30','frends_of_friends',NULL,'frends_of_friends','friends_of_friends'),(99,'stephan.lynch@example.org','1-878-741-0783x','','1977-07-02 14:18:14','all',NULL,'all','friends_of_friends'),(100,'caroline.pagac@example.net','758-885-0566x17','','2007-06-20 06:56:04','all',NULL,'friends','friends');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_communities`
--

DROP TABLE IF EXISTS `users_communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_communities` (
  `community_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `is_admin` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`community_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `users_communities_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`user_id`),
  CONSTRAINT `users_communities_ibfk_2` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_communities`
--

LOCK TABLES `users_communities` WRITE;
/*!40000 ALTER TABLE `users_communities` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `video` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `video_name` varchar(255) DEFAULT NULL,
  `video_description` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-19 13:39:46
