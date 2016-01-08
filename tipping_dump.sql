-- MySQL dump 10.13  Distrib 5.5.46, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: tipping
-- ------------------------------------------------------
-- Server version	5.5.46-0ubuntu0.12.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `codes`
--

DROP TABLE IF EXISTS `codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `default_innings` int(11) DEFAULT '2',
  `deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codes`
--

LOCK TABLES `codes` WRITE;
/*!40000 ALTER TABLE `codes` DISABLE KEYS */;
INSERT INTO `codes` VALUES (1,'Test Match',2,0,'2016-01-08 13:30:11','2016-01-08 13:30:11'),(2,'T20',1,0,'2016-01-08 13:30:11','2016-01-08 13:30:11');
/*!40000 ALTER TABLE `codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'Australia',0,'2016-01-08 13:30:10','2016-01-08 13:30:10'),(2,'India',0,'2016-01-08 13:30:10','2016-01-08 13:30:10');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_squads`
--

DROP TABLE IF EXISTS `game_squads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_squads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `player_id` int(11) DEFAULT NULL,
  `selected` tinyint(1) DEFAULT '0',
  `captain` tinyint(1) DEFAULT '0',
  `wicket_keeper` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_game_squads_on_game_id` (`game_id`),
  KEY `index_game_squads_on_country_id` (`country_id`),
  KEY `index_game_squads_on_player_id` (`player_id`),
  CONSTRAINT `fk_rails_d85b3e4b14` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`),
  CONSTRAINT `fk_rails_c954a82919` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`),
  CONSTRAINT `fk_rails_e0b2334109` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_squads`
--

LOCK TABLES `game_squads` WRITE;
/*!40000 ALTER TABLE `game_squads` DISABLE KEYS */;
INSERT INTO `game_squads` VALUES (1,1,NULL,1,1,1,0,'2016-01-08 13:35:15','2016-01-08 13:35:15'),(2,1,NULL,2,1,0,1,'2016-01-08 13:35:15','2016-01-08 13:35:15'),(3,1,NULL,3,1,0,0,'2016-01-08 13:35:15','2016-01-08 13:35:15'),(4,1,NULL,4,1,0,0,'2016-01-08 13:35:15','2016-01-08 13:35:15'),(5,1,NULL,5,1,0,0,'2016-01-08 13:35:15','2016-01-08 13:35:15'),(6,1,NULL,6,1,0,0,'2016-01-08 13:35:15','2016-01-08 13:35:15'),(7,1,NULL,7,1,0,0,'2016-01-08 13:35:15','2016-01-08 13:35:15'),(8,1,NULL,8,1,0,0,'2016-01-08 13:35:15','2016-01-08 13:35:15'),(9,1,NULL,9,1,0,0,'2016-01-08 13:35:15','2016-01-08 13:35:15'),(10,1,NULL,10,1,0,0,'2016-01-08 13:35:15','2016-01-08 13:35:15'),(11,1,NULL,11,1,0,0,'2016-01-08 13:35:15','2016-01-08 13:35:15'),(12,1,NULL,12,0,0,0,'2016-01-08 13:35:15','2016-01-08 13:35:15'),(13,1,NULL,13,0,0,0,'2016-01-08 13:35:15','2016-01-08 13:35:15'),(14,1,NULL,14,0,0,0,'2016-01-08 13:35:15','2016-01-08 13:35:15');
/*!40000 ALTER TABLE `game_squads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `games` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `match_date` date DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `number_of_innings` int(11) DEFAULT '2',
  `location_id` int(11) DEFAULT NULL,
  `code_id` int(11) DEFAULT NULL,
  `squad_1_id` int(11) DEFAULT NULL,
  `squad_2_id` int(11) DEFAULT NULL,
  `wides` int(11) DEFAULT '0',
  `no_balls` int(11) DEFAULT '0',
  `byes` int(11) DEFAULT '0',
  `leg_byes` int(11) DEFAULT '0',
  `extras` int(11) DEFAULT '0',
  `notes` text COLLATE utf8_unicode_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_games_on_squad_1_id` (`squad_1_id`),
  KEY `index_games_on_squad_2_id` (`squad_2_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES (1,NULL,'sdfsvvv',2,1,1,1,2,0,0,0,0,0,NULL,0,'2016-01-08 13:35:15','2016-01-08 13:35:15');
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `innings`
--

DROP TABLE IF EXISTS `innings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `innings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) DEFAULT NULL,
  `batting` int(11) DEFAULT '0',
  `bowling` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_innings_on_game_id` (`game_id`),
  CONSTRAINT `fk_rails_db0e536e89` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `innings`
--

LOCK TABLES `innings` WRITE;
/*!40000 ALTER TABLE `innings` DISABLE KEYS */;
INSERT INTO `innings` VALUES (1,1,1,0,'2016-01-08 13:35:15','2016-01-08 13:35:28'),(2,1,2,0,'2016-01-08 13:35:15','2016-01-08 13:35:28');
/*!40000 ALTER TABLE `innings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_locations_on_country_id` (`country_id`),
  CONSTRAINT `fk_rails_01b674b4b8` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'Sydney Cricket Ground',1,0,'2016-01-08 13:30:10','2016-01-08 13:30:10');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `batting_style` int(11) DEFAULT '0',
  `bowling_style` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` int(11) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `dob` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_players_on_country_id` (`country_id`),
  CONSTRAINT `fk_rails_7965ae0fee` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (1,'Brett Lee',1,0,'Right Hand Fast Bowler',1,0,'2016-01-08 13:30:10','2016-01-08 13:30:10',NULL),(2,'Steven Smith',1,0,'Right Hand Fast Bowler',1,0,'2016-01-08 13:30:10','2016-01-08 13:30:10',NULL),(3,'Joe Burns',1,0,'Right Hand Fast Bowler',1,0,'2016-01-08 13:30:10','2016-01-08 13:30:10',NULL),(4,'Nathan Coulter-Nile',1,0,'Right Hand Fast Bowler',1,0,'2016-01-08 13:30:10','2016-01-08 13:30:10',NULL),(5,'Josh Hazlewood',1,0,'Right Hand Fast Bowler',1,0,'2016-01-08 13:30:10','2016-01-08 13:30:10',NULL),(6,'Nathon Lyon',1,0,'Right Hand Fast Bowler',1,0,'2016-01-08 13:30:10','2016-01-08 13:30:10',NULL),(7,'Mitchell Marsh',1,0,'Right Hand Fast Bowler',1,0,'2016-01-08 13:30:10','2016-01-08 13:30:10',NULL),(8,'Shaun Marsh',1,0,'Right Hand Fast Bowler',1,0,'2016-01-08 13:30:10','2016-01-08 13:30:10',NULL),(9,'Peter Nevill',1,0,'Right Hand Fast Bowler',1,0,'2016-01-08 13:30:10','2016-01-08 13:30:10',NULL),(10,'James Pattinson',1,0,'Right Hand Fast Bowler',1,0,'2016-01-08 13:30:11','2016-01-08 13:30:11',NULL),(11,'Peter Siddle',1,0,'Right Hand Fast Bowler',1,0,'2016-01-08 13:30:11','2016-01-08 13:30:11',NULL),(12,'Adam Voges',1,0,'Right Hand Fast Bowler',1,0,'2016-01-08 13:30:11','2016-01-08 13:30:11',NULL),(13,'David Warner',1,0,'Right Hand Fast Bowler',1,0,'2016-01-08 13:30:11','2016-01-08 13:30:11',NULL),(14,'Scott Boland',1,0,'Right Hand Fast Bowler',1,0,'2016-01-08 13:30:11','2016-01-08 13:30:11',NULL),(15,'Virat Kohli',2,0,'Right Hand Medium Pace',0,0,'2016-01-08 13:30:11','2016-01-08 13:30:11',NULL),(16,'Varun Aason',2,0,'Right Hand Medium Pace',0,0,'2016-01-08 13:30:11','2016-01-08 13:30:11',NULL),(17,'Ravichandran Ashwin',2,0,'Right Hand Medium Pace',0,0,'2016-01-08 13:30:11','2016-01-08 13:30:11',NULL),(18,'Stuart Binny',2,0,'Right Hand Medium Pace',0,0,'2016-01-08 13:30:11','2016-01-08 13:30:11',NULL),(19,'Shikhar Dhawan',2,0,'Right Hand Medium Pace',0,0,'2016-01-08 13:30:11','2016-01-08 13:30:11',NULL),(20,'Gurkeerat Singh Mann',2,0,'Right Hand Medium Pace',0,0,'2016-01-08 13:30:11','2016-01-08 13:30:11',NULL),(21,'Ravindra Jadeja',2,0,'Right Hand Medium Pace',0,0,'2016-01-08 13:30:11','2016-01-08 13:30:11',NULL),(22,'Bhuvneshwar Kumar',2,0,'Right Hand Medium Pace',0,0,'2016-01-08 13:30:11','2016-01-08 13:30:11',NULL),(23,'Amit Mishra',2,0,'Right Hand Medium Pace',0,0,'2016-01-08 13:30:11','2016-01-08 13:30:11',NULL),(24,'Cheteshwar Pujara',2,0,'Right Hand Medium Pace',0,0,'2016-01-08 13:30:11','2016-01-08 13:30:11',NULL),(25,'Ajinkya Rahane',2,0,'Right Hand Medium Pace',0,0,'2016-01-08 13:30:11','2016-01-08 13:30:11',NULL),(26,'Lokesh Rahul',2,0,'Right Hand Medium Pace',0,0,'2016-01-08 13:30:11','2016-01-08 13:30:11',NULL),(27,'Wriddhiman Saha',2,0,'Right Hand Medium Pace',0,0,'2016-01-08 13:30:11','2016-01-08 13:30:11',NULL),(28,'Ishant Sharma',2,0,'Right Hand Medium Pace',0,0,'2016-01-08 13:30:11','2016-01-08 13:30:11',NULL),(29,'Rohit Sharma',2,0,'Right Hand Medium Pace',0,0,'2016-01-08 13:30:11','2016-01-08 13:30:11',NULL),(30,'Murali Vijay',2,0,'Right Hand Medium Pace',0,0,'2016-01-08 13:30:11','2016-01-08 13:30:11',NULL),(31,'Umesh Yadav',2,0,'Right Hand Medium Pace',0,0,'2016-01-08 13:30:11','2016-01-08 13:30:11',NULL),(32,'varun',1,1,'cdcdd',0,0,'2016-01-08 13:30:50','2016-01-08 13:30:50','01/12/2016');
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `run_outs`
--

DROP TABLE IF EXISTS `run_outs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `run_outs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) DEFAULT NULL,
  `innings` int(11) DEFAULT NULL,
  `player_id` int(11) DEFAULT NULL,
  `run_out_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_run_outs_on_game_id` (`game_id`),
  KEY `index_run_outs_on_player_id` (`player_id`),
  CONSTRAINT `fk_rails_44a50d6176` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`),
  CONSTRAINT `fk_rails_7cd39e3a75` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `run_outs`
--

LOCK TABLES `run_outs` WRITE;
/*!40000 ALTER TABLE `run_outs` DISABLE KEYS */;
/*!40000 ALTER TABLE `run_outs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20151203061120'),('20151203061740'),('20151203061858'),('20151203065428'),('20151203065533'),('20151203065842'),('20151203091949'),('20151205235753'),('20151206000058'),('20151206061732'),('20151207084016'),('20151210061109'),('20151210061309'),('20160104020658'),('20160104023553'),('20160108130509');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `squad_players`
--

DROP TABLE IF EXISTS `squad_players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `squad_players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL,
  `squad_id` int(11) DEFAULT NULL,
  `captain` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_squad_players_on_player_id` (`player_id`),
  KEY `index_squad_players_on_squad_id` (`squad_id`),
  CONSTRAINT `fk_rails_e5f7ece302` FOREIGN KEY (`squad_id`) REFERENCES `squads` (`id`),
  CONSTRAINT `fk_rails_e5aad3f807` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `squad_players`
--

LOCK TABLES `squad_players` WRITE;
/*!40000 ALTER TABLE `squad_players` DISABLE KEYS */;
INSERT INTO `squad_players` VALUES (1,1,1,0,'2016-01-08 13:30:12','2016-01-08 13:30:12'),(2,2,1,0,'2016-01-08 13:30:12','2016-01-08 13:30:12'),(3,3,1,0,'2016-01-08 13:30:12','2016-01-08 13:30:12'),(4,4,1,0,'2016-01-08 13:30:12','2016-01-08 13:30:12'),(5,5,1,0,'2016-01-08 13:30:12','2016-01-08 13:30:12'),(6,6,1,0,'2016-01-08 13:30:12','2016-01-08 13:30:12'),(7,7,1,0,'2016-01-08 13:30:12','2016-01-08 13:30:12'),(8,8,1,0,'2016-01-08 13:30:12','2016-01-08 13:30:12'),(9,9,1,0,'2016-01-08 13:30:12','2016-01-08 13:30:12'),(10,10,1,0,'2016-01-08 13:30:12','2016-01-08 13:30:12'),(11,11,1,0,'2016-01-08 13:30:12','2016-01-08 13:30:12'),(12,12,1,0,'2016-01-08 13:30:12','2016-01-08 13:30:12'),(13,13,1,0,'2016-01-08 13:30:12','2016-01-08 13:30:12'),(14,14,1,0,'2016-01-08 13:30:12','2016-01-08 13:30:12'),(15,15,2,0,'2016-01-08 13:30:12','2016-01-08 13:30:12'),(16,16,2,0,'2016-01-08 13:30:12','2016-01-08 13:30:12'),(17,17,2,0,'2016-01-08 13:30:12','2016-01-08 13:30:12'),(18,18,2,0,'2016-01-08 13:30:12','2016-01-08 13:30:12'),(19,19,2,0,'2016-01-08 13:30:12','2016-01-08 13:30:12'),(20,20,2,0,'2016-01-08 13:30:12','2016-01-08 13:30:12'),(21,21,2,0,'2016-01-08 13:30:12','2016-01-08 13:30:12'),(22,22,2,0,'2016-01-08 13:30:12','2016-01-08 13:30:12'),(23,23,2,0,'2016-01-08 13:30:12','2016-01-08 13:30:12'),(24,24,2,0,'2016-01-08 13:30:12','2016-01-08 13:30:12'),(25,25,2,0,'2016-01-08 13:30:12','2016-01-08 13:30:12'),(26,26,2,0,'2016-01-08 13:30:12','2016-01-08 13:30:12'),(27,27,2,0,'2016-01-08 13:30:13','2016-01-08 13:30:13'),(28,28,2,0,'2016-01-08 13:30:13','2016-01-08 13:30:13'),(29,29,2,0,'2016-01-08 13:30:13','2016-01-08 13:30:13'),(30,30,2,0,'2016-01-08 13:30:13','2016-01-08 13:30:13'),(31,31,2,0,'2016-01-08 13:30:13','2016-01-08 13:30:13');
/*!40000 ALTER TABLE `squad_players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `squads`
--

DROP TABLE IF EXISTS `squads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `squads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_squads_on_code_id` (`code_id`),
  KEY `index_squads_on_country_id` (`country_id`),
  CONSTRAINT `fk_rails_e4b985d041` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  CONSTRAINT `fk_rails_f7d6f03270` FOREIGN KEY (`code_id`) REFERENCES `codes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `squads`
--

LOCK TABLES `squads` WRITE;
/*!40000 ALTER TABLE `squads` DISABLE KEYS */;
INSERT INTO `squads` VALUES (1,1,1,0,'2016-01-08 13:30:12','2016-01-08 13:30:12'),(2,1,2,0,'2016-01-08 13:30:12','2016-01-08 13:30:12');
/*!40000 ALTER TABLE `squads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stats`
--

DROP TABLE IF EXISTS `stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inning_id` int(11) DEFAULT NULL,
  `player_id` int(11) DEFAULT NULL,
  `runs` int(11) DEFAULT '0',
  `minutes` int(11) DEFAULT '0',
  `balls` int(11) DEFAULT '0',
  `fours` int(11) DEFAULT '0',
  `sixes` int(11) DEFAULT '0',
  `run_out` tinyint(1) DEFAULT '0',
  `bowled_by` int(11) DEFAULT NULL,
  `caught_by` int(11) DEFAULT NULL,
  `stumped_by` int(11) DEFAULT '0',
  `overs` int(11) DEFAULT '0',
  `maidens` int(11) DEFAULT '0',
  `runs_against` int(11) DEFAULT '0',
  `wickets` int(11) DEFAULT '0',
  `wides` int(11) DEFAULT '0',
  `no_balls` int(11) DEFAULT '0',
  `zeroes_against` int(11) DEFAULT '0',
  `fours_against` int(11) DEFAULT '0',
  `sixes_against` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_stats_on_inning_id` (`inning_id`),
  KEY `index_stats_on_player_id` (`player_id`),
  CONSTRAINT `fk_rails_014a957e83` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`),
  CONSTRAINT `fk_rails_d1fe3810ac` FOREIGN KEY (`inning_id`) REFERENCES `innings` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats`
--

LOCK TABLES `stats` WRITE;
/*!40000 ALTER TABLE `stats` DISABLE KEYS */;
INSERT INTO `stats` VALUES (1,1,1,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'2016-01-08 13:35:15','2016-01-08 13:35:15'),(2,1,2,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'2016-01-08 13:35:15','2016-01-08 13:35:15'),(3,1,3,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'2016-01-08 13:35:15','2016-01-08 13:35:15'),(4,1,4,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'2016-01-08 13:35:15','2016-01-08 13:35:15'),(5,1,5,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'2016-01-08 13:35:15','2016-01-08 13:35:15'),(6,1,6,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'2016-01-08 13:35:15','2016-01-08 13:35:15'),(7,1,7,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'2016-01-08 13:35:15','2016-01-08 13:35:15'),(8,1,8,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'2016-01-08 13:35:15','2016-01-08 13:35:15'),(9,1,9,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'2016-01-08 13:35:15','2016-01-08 13:35:15'),(10,1,10,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'2016-01-08 13:35:15','2016-01-08 13:35:15'),(11,1,11,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'2016-01-08 13:35:15','2016-01-08 13:35:15'),(12,1,12,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'2016-01-08 13:35:15','2016-01-08 13:35:15'),(13,1,13,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'2016-01-08 13:35:15','2016-01-08 13:35:15'),(14,1,14,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'2016-01-08 13:35:15','2016-01-08 13:35:15'),(15,2,1,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'2016-01-08 13:35:15','2016-01-08 13:35:15'),(16,2,2,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'2016-01-08 13:35:15','2016-01-08 13:35:15'),(17,2,3,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'2016-01-08 13:35:15','2016-01-08 13:35:15'),(18,2,4,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'2016-01-08 13:35:15','2016-01-08 13:35:15'),(19,2,5,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'2016-01-08 13:35:15','2016-01-08 13:35:15'),(20,2,6,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'2016-01-08 13:35:15','2016-01-08 13:35:15'),(21,2,7,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'2016-01-08 13:35:15','2016-01-08 13:35:15'),(22,2,8,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'2016-01-08 13:35:15','2016-01-08 13:35:15'),(23,2,9,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'2016-01-08 13:35:15','2016-01-08 13:35:15'),(24,2,10,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'2016-01-08 13:35:15','2016-01-08 13:35:15'),(25,2,11,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'2016-01-08 13:35:16','2016-01-08 13:35:16'),(26,2,12,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'2016-01-08 13:35:16','2016-01-08 13:35:16'),(27,2,13,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'2016-01-08 13:35:16','2016-01-08 13:35:16'),(28,2,14,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'2016-01-08 13:35:16','2016-01-08 13:35:16');
/*!40000 ALTER TABLE `stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_players`
--

DROP TABLE IF EXISTS `team_players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_id` int(11) DEFAULT NULL,
  `player_id` int(11) DEFAULT NULL,
  `captain` tinyint(1) DEFAULT '0',
  `wicket_keeper` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_team_players_on_team_id` (`team_id`),
  CONSTRAINT `fk_rails_5389e2fe6f` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_players`
--

LOCK TABLES `team_players` WRITE;
/*!40000 ALTER TABLE `team_players` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `squad_id` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_teams_on_game_id` (`game_id`),
  CONSTRAINT `fk_rails_5b5c61bcc0` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-08 19:30:20
