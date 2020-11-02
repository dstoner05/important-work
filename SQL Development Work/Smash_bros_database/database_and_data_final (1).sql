CREATE DATABASE  IF NOT EXISTS `smash_data` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `smash_data`;
-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: smash_data
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `characters`
--

DROP TABLE IF EXISTS `characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `characters` (
  `character_id` int(10) unsigned NOT NULL,
  `smash_Game_Origin_id` int(10) unsigned NOT NULL,
  `tier` varchar(45) NOT NULL,
  `weight` varchar(20) NOT NULL,
  `character_name` varchar(45) NOT NULL,
  PRIMARY KEY (`character_id`),
  UNIQUE KEY `character_name_UNIQUE` (`character_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters`
--

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` VALUES (1,1,'C','Medium','Mario'),(2,1,'B','Super Heavy','Donkey Kong'),(3,1,'A','Heavy','Link'),(4,1,'C','Heavy','Samus'),(5,1,'D','Heavy','Yoshi'),(6,1,'F','Light','Kirby'),(7,1,'A','Light','Fox'),(8,1,'B','Light','Pikachu'),(9,1,'B','Medium','Luigi'),(10,1,'E','Medium','Ness'),(11,1,'B','Heavy','Captain Falcon'),(12,1,'F','Feather','Jigglypuff'),(13,2,'S','Light','Peach'),(14,2,'A','Super Heavy','Bowser'),(15,2,'F','Medium','Ice Climbers'),(16,2,'E','Light','Sheik'),(17,2,'C','Light','Zelda'),(18,2,'C','Medium','Dr. Mario'),(19,2,'C','Feather','Pichu'),(20,2,'C','Light','Falco'),(21,2,'C','Medium','Marth'),(22,2,'A','Light','Young Link'),(23,2,'A','Super Heavy','Ganondorf'),(24,2,'C','Light','Mewtwo'),(25,2,'A','Medium','Roy'),(26,2,'D','Light','Mr. Game & Watch'),(27,3,'C','Light','Meta Knight'),(28,3,'D','Medium','Pit'),(29,3,'A','Light','Zero Suit Samus'),(30,3,'A','Heavy','Wario'),(31,3,'A','Heavy','Snake'),(32,3,'B','Heavy','Ike'),(33,3,'C','Light','Squirtle'),(34,3,'B','Medium','Ivysaur'),(35,3,'C','Super Heavy','Charizard'),(36,3,'D','Medium','Diddy Kong'),(37,3,'E','Medium','Lucas'),(38,3,'D','Light','Sonic'),(39,3,'E','Super Heavy','King Dedede'),(40,3,'S','Light','Olimar'),(41,3,'D','Medium','Lucario'),(42,3,'B','Heavy','R.O.B.'),(43,3,'E','Medium','Toon Link'),(44,3,'A','Mediuim','Wolf'),(45,4,'S','Medium','Lucina'),(46,4,'D','Medium','Dark Pit'),(47,4,'D','Medium','Villager'),(48,4,'D','Heavy','Mega Man'),(49,4,'D','Medium','Wii Fit Trainer'),(50,4,'D','Light','Rosalina & Luma'),(51,4,'F','Light','Little Mac'),(52,4,'D','Light','Greninja'),(53,4,'E','Medium','Mii Brawler'),(54,4,'D','Medium','Mii Swordfighter'),(55,4,'E','Heavy','Mii Gunner'),(56,4,'B','Medium','Palutena'),(57,4,'C','Medium','Pac-Man'),(58,4,'C','Medium','Robin'),(59,4,'C','Medium','Shulk'),(60,4,'E','Heavy','Bowser Jr.'),(61,4,'C','Light','Duck Hunt'),(62,4,'F','Heavy','Ryu'),(63,4,'B','Medium','Cloud'),(64,4,'C','Medium','Corrin'),(65,4,'C','Light','Bayonetta'),(66,5,'C','Heavy','Dark Samus'),(67,5,'A','Light','Daisy'),(68,5,'A','Medium','Chrom'),(69,5,'F','Heavy','Ken'),(70,5,'B','Medium','Inkling'),(71,5,'A','Heavy','Ridley'),(72,5,'C','Heavy','Simon'),(73,5,'C','Heavy','Richter'),(74,5,'A','Super Heavy','King K. Rool'),(75,5,'C','Light','Isabelle'),(76,5,'D','Super Heavy','Incineroar'),(77,5,'C','Heavy','Piranha Plant'),(78,5,'S','Medium','Joker');
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_gamemode`
--

DROP TABLE IF EXISTS `game_gamemode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_gamemode` (
  `smash_game_id` int(10) unsigned NOT NULL,
  `gamemode_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`smash_game_id`,`gamemode_id`),
  KEY `gamemode_fk_idx` (`gamemode_id`),
  CONSTRAINT `game1_fk` FOREIGN KEY (`smash_game_id`) REFERENCES `games` (`game_id`),
  CONSTRAINT `gamemode_fk` FOREIGN KEY (`gamemode_id`) REFERENCES `gamemode` (`gamemode_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_gamemode`
--

LOCK TABLES `game_gamemode` WRITE;
/*!40000 ALTER TABLE `game_gamemode` DISABLE KEYS */;
INSERT INTO `game_gamemode` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(5,2),(2,3),(3,3),(4,3),(5,3),(2,4),(3,4),(5,4),(1,5),(2,5),(3,5),(4,5),(5,5),(1,6),(2,6),(3,6),(4,6),(5,6),(2,7),(4,7),(5,7),(2,8),(3,8),(5,8),(1,10),(2,10),(4,10),(1,11),(2,13),(3,13),(4,13),(4,14),(4,15);
/*!40000 ALTER TABLE `game_gamemode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_items`
--

DROP TABLE IF EXISTS `game_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_items` (
  `smash_game_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`smash_game_id`,`item_id`),
  KEY `items_fk_idx` (`item_id`),
  CONSTRAINT `game3_fk` FOREIGN KEY (`smash_game_id`) REFERENCES `games` (`game_id`),
  CONSTRAINT `items_fk` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_items`
--

LOCK TABLES `game_items` WRITE;
/*!40000 ALTER TABLE `game_items` DISABLE KEYS */;
INSERT INTO `game_items` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(1,2),(2,2),(3,2),(4,2),(5,2),(1,3),(2,3),(3,3),(4,3),(5,3),(1,4),(2,4),(3,4),(1,5),(2,5),(3,5),(4,5),(5,5),(1,6),(2,6),(3,6),(4,6),(5,6),(1,7),(3,7),(4,7),(5,7),(1,8),(2,8),(3,8),(4,8),(5,8),(1,9),(2,9),(1,10),(2,10),(3,10),(4,10),(5,10),(1,11),(2,11),(3,11),(4,11),(5,11),(1,12),(2,12),(3,12),(4,12),(5,12),(1,13),(2,13),(3,13),(4,13),(5,13),(1,14),(2,14),(3,14),(4,14),(5,14),(1,15),(2,15),(3,15),(4,15),(5,15),(1,16),(2,16),(3,16),(4,16),(5,16),(1,17),(2,17),(3,17),(4,17),(5,17),(2,18),(3,18),(4,18),(5,18),(2,19),(3,19),(4,19),(5,19),(2,20),(3,20),(4,20),(5,20),(2,21),(3,21),(4,21),(5,21),(2,22),(2,23),(3,23),(4,23),(5,23),(2,24),(3,24),(4,24),(5,24),(2,25),(3,25),(4,25),(5,25),(2,26),(3,26),(4,26),(5,26),(2,27),(2,28),(3,28),(4,28),(5,28),(2,29),(3,29),(4,29),(5,29),(2,30),(3,30),(4,30),(5,30),(2,31),(2,32),(2,33),(3,33),(4,33),(5,33),(3,34),(4,34),(5,34),(3,35),(4,35),(5,35),(3,36),(4,36),(5,36),(3,37),(4,37),(5,37),(3,38),(4,38),(5,38),(3,39),(4,39),(5,39),(3,40),(4,40),(5,40),(3,41),(4,41),(5,41),(3,42),(4,42),(5,42),(3,43),(3,44),(4,44),(5,44),(3,45),(4,45),(5,45),(3,46),(4,46),(5,46),(3,47),(4,47),(5,47),(3,48),(4,48),(5,48),(3,49),(4,49),(5,49),(3,50),(4,50),(5,50),(3,51),(4,51),(3,52),(4,52),(5,52),(3,53),(4,53),(5,53),(3,54),(4,54),(3,55),(4,55),(5,55),(3,56),(3,57),(4,57),(4,58),(5,58),(4,59),(5,59),(4,60),(5,60),(4,61),(5,61),(4,62),(5,62),(4,63),(5,63),(4,64),(5,64),(4,65),(5,65),(4,66),(5,66),(4,67),(5,67),(4,68),(5,68),(4,69),(5,69),(4,70),(5,70),(4,71),(5,71),(4,72),(5,72),(4,73),(5,73),(4,74),(5,74),(4,75),(5,75),(4,76),(5,76),(4,77),(5,77),(4,78),(5,78),(4,79),(5,79),(4,80),(5,80),(4,81),(5,81),(5,82),(5,83),(5,84),(5,85),(5,86),(5,87),(5,88),(5,89),(5,90),(5,91),(5,92),(5,93),(5,94);
/*!40000 ALTER TABLE `game_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gamemode`
--

DROP TABLE IF EXISTS `gamemode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gamemode` (
  `gamemode_id` int(10) unsigned NOT NULL,
  `game_mode_title` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `smash_meter` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `items_enabled` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `handicap` varchar(10) NOT NULL,
  `scoring_system` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`gamemode_id`),
  KEY `handicap` (`handicap`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gamemode`
--

LOCK TABLES `gamemode` WRITE;
/*!40000 ALTER TABLE `gamemode` DISABLE KEYS */;
INSERT INTO `gamemode` VALUES (1,'Smash','Y','Y','Y','Last Man Standing'),(2,'Squad Strike','N','Y','Y','Last Squad Standing'),(3,'Tourney','N','Y','N','Last Man Standing'),(4,'Special Smash','Y','Y','Y','Last Man Standing'),(5,'Classic Mode','N','N','Y','Number of Bosses Defeated'),(6,'Training','N','N','N',NULL),(7,'Mob Smash','N','Y','Y','Number of Enenmies Defeated'),(8,'Adventure Mode','N','N','N','Completion'),(9,'Spirit Board','N','N','N',NULL),(10,'Target Smash','N','N','N','Number of Targets Smashed'),(11,'Break the Platforms','N','N','N','Number of Platforms Broken'),(12,'Event Smash','N','N','N','Completion'),(13,'Home-Run Contest','N','Y','N','Distance Target Flies'),(14,'Smash Run','N','Y','Y','Time it takes to Complete'),(15,'Smash Tour','N','Y','Y','Last Man Standing');
/*!40000 ALTER TABLE `gamemode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games` (
  `game_id` int(10) unsigned NOT NULL,
  `smash_game_title` varchar(45) DEFAULT NULL,
  `year_released` int(10) unsigned NOT NULL,
  `platforms` varchar(45) NOT NULL,
  PRIMARY KEY (`game_id`),
  UNIQUE KEY `year_released_UNIQUE` (`year_released`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES (1,'Super Smash Bros.',1999,'Nintendo 64'),(2,'Super Smash Bros. Melee',2001,'GameCube'),(3,'Super Smash Bros. Brawl',2008,'Wii'),(4,'Super Smash Bros. 4',2014,'Wii U'),(5,'Super Smash Bros. Ultimate',2018,'Nintendo Switch');
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games_characters`
--

DROP TABLE IF EXISTS `games_characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games_characters` (
  `smash_game_id` int(10) unsigned NOT NULL,
  `character_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`smash_game_id`,`character_id`),
  KEY `character_fk_idx` (`character_id`),
  CONSTRAINT `character_fk` FOREIGN KEY (`character_id`) REFERENCES `characters` (`character_id`),
  CONSTRAINT `smash_fk` FOREIGN KEY (`smash_game_id`) REFERENCES `games` (`game_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games_characters`
--

LOCK TABLES `games_characters` WRITE;
/*!40000 ALTER TABLE `games_characters` DISABLE KEYS */;
INSERT INTO `games_characters` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(1,2),(2,2),(3,2),(4,2),(5,2),(1,3),(2,3),(3,3),(4,3),(5,3),(1,4),(2,4),(3,4),(4,4),(5,4),(1,5),(2,5),(3,5),(4,5),(5,5),(1,6),(2,6),(3,6),(4,6),(5,6),(1,7),(2,7),(3,7),(4,7),(5,7),(1,8),(2,8),(3,8),(4,8),(5,8),(1,9),(2,9),(3,9),(4,9),(5,9),(1,10),(2,10),(3,10),(4,10),(5,10),(1,11),(2,11),(3,11),(4,11),(5,11),(1,12),(2,12),(3,12),(4,12),(5,12),(2,13),(3,13),(4,13),(5,13),(2,14),(3,14),(4,14),(5,14),(2,15),(3,15),(5,15),(2,16),(3,16),(4,16),(5,16),(2,17),(3,17),(4,17),(5,17),(2,18),(4,18),(5,18),(2,19),(5,19),(2,20),(3,20),(4,20),(5,20),(2,21),(3,21),(4,21),(5,21),(2,22),(5,22),(2,23),(3,23),(4,23),(5,23),(2,24),(4,24),(5,24),(2,25),(4,25),(5,25),(2,26),(3,26),(4,26),(5,26),(3,27),(4,27),(5,27),(3,28),(4,28),(5,28),(3,29),(4,29),(5,29),(3,30),(4,30),(5,30),(3,31),(5,31),(3,32),(4,32),(5,32),(3,33),(5,33),(3,34),(5,34),(3,35),(4,35),(5,35),(3,36),(4,36),(5,36),(3,37),(4,37),(5,37),(3,38),(4,38),(5,38),(3,39),(4,39),(5,39),(3,40),(4,40),(5,40),(3,41),(4,41),(5,41),(3,42),(4,42),(5,42),(3,43),(4,43),(5,43),(3,44),(5,44),(4,45),(5,45),(4,46),(5,46),(4,47),(5,47),(4,48),(5,48),(4,49),(5,49),(4,50),(5,50),(4,51),(5,51),(4,52),(5,52),(4,53),(5,53),(4,54),(5,54),(4,55),(5,55),(4,56),(5,56),(4,57),(5,57),(4,58),(5,58),(4,59),(5,59),(4,60),(5,60),(4,61),(5,61),(4,62),(5,62),(4,63),(5,63),(4,64),(5,64),(4,65),(5,65),(5,66),(5,67),(5,68),(5,69),(5,70),(5,71),(5,72),(5,73),(5,74),(5,75),(5,76),(5,77),(5,78);
/*!40000 ALTER TABLE `games_characters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games_stages`
--

DROP TABLE IF EXISTS `games_stages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games_stages` (
  `smash_game_id` int(10) unsigned NOT NULL,
  `stage_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`smash_game_id`,`stage_id`),
  KEY `stages_fk_idx` (`stage_id`),
  CONSTRAINT `game2_fk` FOREIGN KEY (`smash_game_id`) REFERENCES `games` (`game_id`),
  CONSTRAINT `stages_fk` FOREIGN KEY (`stage_id`) REFERENCES `stages` (`stage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games_stages`
--

LOCK TABLES `games_stages` WRITE;
/*!40000 ALTER TABLE `games_stages` DISABLE KEYS */;
INSERT INTO `games_stages` VALUES (1,1),(5,1),(1,2),(5,2),(1,3),(2,3),(4,3),(5,3),(1,4),(4,4),(5,4),(1,5),(4,5),(1,6),(2,6),(5,6),(1,7),(2,7),(5,7),(1,8),(4,8),(1,9),(5,9),(2,10),(3,10),(4,10),(5,10),(2,11),(3,11),(4,11),(5,11),(2,12),(5,12),(2,13),(3,13),(5,13),(2,14),(5,14),(2,15),(5,15),(2,16),(3,16),(4,16),(5,16),(2,17),(5,17),(2,18),(3,18),(4,18),(5,18),(2,19),(3,19),(4,19),(5,19),(2,20),(5,20),(2,21),(3,21),(5,21),(2,22),(5,22),(2,23),(3,23),(4,23),(5,23),(2,24),(5,24),(2,25),(3,25),(5,25),(2,26),(3,26),(4,26),(5,26),(2,27),(5,27),(2,28),(3,28),(5,28),(2,29),(3,29),(4,29),(5,29),(2,30),(5,30),(3,31),(4,31),(5,31),(3,32),(4,32),(5,32),(3,33),(4,33),(5,33),(3,34),(5,34),(3,35),(4,35),(5,35),(3,36),(4,36),(5,36),(3,37),(4,37),(5,37),(3,38),(4,38),(5,38),(3,39),(4,39),(5,39),(3,40),(4,40),(5,40),(3,41),(4,41),(5,41),(3,42),(4,42),(5,42),(3,43),(4,43),(5,43),(3,44),(5,44),(3,45),(4,45),(5,45),(3,46),(4,46),(5,46),(3,47),(4,47),(5,47),(3,48),(4,48),(5,48),(3,49),(4,49),(5,49),(3,50),(5,50),(3,51),(5,51),(3,52),(4,52),(5,52),(3,53),(5,53),(3,54),(5,54),(3,55),(4,55),(5,55),(4,56),(5,56),(4,57),(5,57),(4,58),(5,58),(4,59),(5,59),(4,60),(5,60),(4,61),(5,61),(4,62),(5,62),(4,63),(5,63),(4,64),(5,64),(4,65),(5,65),(4,66),(5,66),(4,67),(5,67),(4,68),(5,68),(4,69),(5,69),(4,70),(5,70),(4,71),(5,71),(4,72),(5,72),(4,73),(5,73),(4,74),(5,74),(4,75),(5,75),(4,76),(5,76),(4,77),(5,77),(4,78),(5,78),(4,79),(5,79),(4,80),(5,80),(4,81),(5,81),(4,82),(5,82),(4,83),(5,83),(4,84),(5,84),(4,85),(5,85),(4,86),(5,86),(4,87),(5,87),(4,88),(5,88),(4,89),(5,89),(4,90),(5,90),(4,91),(5,91),(4,92),(5,92),(4,93),(5,93),(4,94),(5,94),(4,95),(5,95),(4,96),(5,96),(4,97),(5,97),(4,98),(5,98),(4,99),(5,99),(5,100),(5,101),(5,102);
/*!40000 ALTER TABLE `games_stages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `item_id` int(10) unsigned NOT NULL,
  `item_name` varchar(45) NOT NULL,
  `franchise_origin` varchar(45) NOT NULL,
  `smash_game_origin_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'Beam Sword','Super Smash Bros.',1),(2,'Home-Run Bat','Super Smash Bros.',1),(3,'Hammer','Super Smash Bros.',1),(4,'Fan','Super Smash Bros.',1),(5,'Motion-Sensor Bomb','Super Smash Bros.',1),(6,'Bob-omb','Super Smash Bros.',1),(7,'Bumper','Super Smash Bros.',1),(8,'Green Shell','Super Smash Bros.',1),(9,'Red Shell','Super Smash Bros.',1),(10,'Poké Ball','Super Smash Bros.',1),(11,'Ray Gun','Super Smash Bros.',1),(12,'Fire Flower','Super Smash Bros.',1),(13,'Star Rod','Super Smash Bros.',1),(14,'Maxim Tomato','Super Smash Bros.',1),(15,'Heart Container','Super Smash Bros.',1),(16,'Super Star','Super Smash Bros.',1),(17,'Containers','Super Smash Bros.',1),(18,'Food','Melee',2),(19,'Warp Star','Melee',2),(20,'Super Scope','Melee',2),(21,'Lip\'s Stick','Melee',2),(22,'Flipper','Melee',2),(23,'Freezie','Melee',2),(24,'Mr. Saturn','Melee',2),(25,'Super Mushroom','Melee',2),(26,'Poison Mushroom','Melee',2),(27,'Parasol','Melee',2),(28,'Screw Attack','Melee',2),(29,'Metal Box','Melee',2),(30,'Bunny Hood','Melee',2),(31,'Cloaking Device','Melee',2),(32,'Barrel Cannon','Melee',2),(33,'Party Ball','Melee',2),(34,'Smash Ball','Brawl',3),(35,'Assist Trophy','Brawl',3),(36,'Blast Box','Brawl',3),(37,'Sandbag','Brawl',3),(38,'Dragoon Parts','Brawl',3),(39,'Superspicy Curry','Brawl',3),(40,'Timer','Brawl',3),(41,'Lightning','Brawl',3),(42,'Golden Hammer','Brawl',3),(43,'Cracker Launcher','Brawl',3),(44,'Gooey Bomb','Brawl',3),(45,'Smart Bomb','Brawl',3),(46,'Deku Nut','Brawl',3),(47,'Smoke Ball','Brawl',3),(48,'Pitfall','Brawl',3),(49,'Hothead','Brawl',3),(50,'Banana peel','Brawl',3),(51,'Spring','Brawl',3),(52,'Unira','Brawl',3),(53,'Soccer Ball','Brawl',3),(54,'Team Healer','Brawl',3),(55,'Franklin Badge','Brawl',3),(56,'Sticker','Brawl',3),(57,'CD','Brawl',3),(58,'Master Ball','SSB 4',4),(59,'Daybreak Parts','SSB 4',4),(60,'Fairy Bottle','SSB 4',4),(61,'Bullet Bill','SSB 4',4),(62,'Fire Bar','SSB 4',4),(63,'Ore Club','SSB 4',4),(64,'Gust Bellows','SSB 4',4),(65,'Steel Diver','SSB 4',4),(66,'Drill','SSB 4',4),(67,'Bombchu','SSB 4',4),(68,'X Bomb','SSB 4',4),(69,'Hocotate Bomb','SSB 4',4),(70,'POW Block','SSB 4',4),(71,'Spiny Shell','SSB 4',4),(72,'Boomerang','SSB 4',4),(73,'Beetle','SSB 4',4),(74,'Cucco','SSB 4',4),(75,'Beehive','SSB 4',4),(76,'Killer Eye','SSB 4',4),(77,'Boss Galaga','SSB 4',4),(78,'Back Shield','SSB 4',4),(79,'Super Leaf','SSB 4',4),(80,'Rocket Belt','SSB 4',4),(81,'Special Flag','SSB 4',4),(82,'Killing Edge','Ultimate',5),(83,'Staff','Ultimate',5),(84,'Bomber','Ultimate',5),(85,'Fake Smash Ball','Ultimate',5),(86,'Banana Gun','Ultimate',5),(87,'Ramblin\' Evil Mushroom','Ultimate',5),(88,'Super Launch Star','Ultimate',5),(89,'Black Hole','Ultimate',5),(90,'Rage Blaster','Ultimate',5),(91,'Death\'s Scythe','Ultimate',5),(92,'Healing Field','Ultimate',5),(93,'Healing Sprout','Ultimate',5),(94,'Beastball','Ultimate',5);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moves`
--

DROP TABLE IF EXISTS `moves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `moves` (
  `move_id` int(10) unsigned NOT NULL,
  `move_name` varchar(45) NOT NULL,
  `move_input` varchar(45) NOT NULL,
  `character_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`move_id`),
  KEY `move_name` (`move_name`),
  KEY `fk_Moves_character_id_idx` (`character_id`),
  CONSTRAINT `fk_Moves_character_id` FOREIGN KEY (`character_id`) REFERENCES `characters` (`character_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moves`
--

LOCK TABLES `moves` WRITE;
/*!40000 ALTER TABLE `moves` DISABLE KEYS */;
INSERT INTO `moves` VALUES (1,'Fireball','B',1),(2,'Cape','Side B',1),(3,'Super Jump Punch','Up B',1),(4,'F.L.U.D.D.','Down B',1),(5,'Mario Finale','B (Final Smash)',1),(6,'Giant Punch','B',2),(7,'Headbutt','Side B',2),(8,'Spinning Kong','Up B',2),(9,'Hand Slap','Down B',2),(10,'Jungle Rush','B (Final Smash)',2),(11,'Bow and Arrows','B',3),(12,'Boomerang','Side B',3),(13,'Spin Attack','Up B',3),(14,'Remote Bomb','Down B',3),(15,'Ancient Bow and Arrow','B (Final Smash)',3),(16,'Charge Shot','B',4),(17,'Missile','Side B',4),(18,'Screw Attack','Up B',4),(19,'Bomb','Down B',4),(20,'Zero Laser','B (Final Smash)',4),(21,'Egg Lay','B',5),(22,'Egg Roll','Side B',5),(23,'Egg Throw','Up B',5),(24,'Yoshi Bomb','Down B',5),(25,'Stampede!','B (Final Smash)',5),(26,'Inhale','B',6),(27,'Hammer Flip','Side B',6),(28,'Final Cutter','Up B',6),(29,'Stone','Down B',6),(30,'Ultra Sword','B (Final Smash)',6),(31,'Blaster','B',7),(32,'Fox Illusion','Side B',7),(33,'Fire Fox','Up B',7),(34,'Reflector','Down B',7),(35,'Team Star Fox','B (Final Smash)',7),(36,'Thunder Jolt','B',8),(37,'Skull Bash','Side B',8),(38,'Quick Attack','Up B',8),(39,'Thunder','Down B',8),(40,'Volt Tackle','B (Final Smash)',8),(41,'Fireball','B',9),(42,'Green Missile','Side B',9),(43,'Super Jump Punch','Up B',9),(44,'Luigi Cyclone','Down B',9),(45,'Poltergust G-00','B (Final Smash)',9),(46,'PK Flash','B',10),(47,'PK Fire','Side B',10),(48,'PK Thunder','Up B',10),(49,'PSI Magnet','Down B',10),(50,'PK Starstorm','B (Final Smash)',10),(51,'Falcon Punch','B',11),(52,'Raptor Boost','Side B',11),(53,'Falcon Dive','Up B',11),(54,'Falcon Kick','Down B',11),(55,'Blue Falcon','B (Final Smash)',11),(56,'Rollout','B',12),(57,'Pound','Side B',12),(58,'Sing','Up B',12),(59,'Rest','Down B',12),(60,'Puff Up','B (Final Smash)',12),(61,'Toad','B',13),(62,'Peach Bomber','Side B',13),(63,'Peach Parasol','Up B',13),(64,'Vegetable','Down B',13),(65,'Peach Blossom','B (Final Smash)',13),(66,'Fire Breath','B',14),(67,'Flying Slam','Side B',14),(68,'Whirling Fortress','Up B',14),(69,'Bowser Bomb','Down B',14),(70,'Giga Bowser Punch','B (Final Smash)',14),(71,'Ice Shot','B',15),(72,'Squall Hammer','Side B',15),(73,'Belay','Up B',15),(74,'Blizzard','Down B',15),(75,'Iceberg','B (Final Smash)',15),(76,'Needle Storm','B',16),(77,'Burst Grenade','Side B',16),(78,'Vanish','Up B',16),(79,'Bouncing Fish','Down B',16),(80,'Sheikah Dance','B (Final Smash)',16),(81,'Nayru\'s Love','B',17),(82,'Din\'s Fire','Side B',17),(83,'Farore\'s Wind','Up B',17),(84,'Phantom Slash','Down B',17),(85,'Triforce of Wisdom','B (Final Smash)',17),(86,'Megavitamins','B',18),(87,'Super Sheet','Side B',18),(88,'Super Jump Punch','Up B',18),(89,'Dr. Tornado','Down B',18),(90,'Doctor Finale','B (Final Smash)',18),(91,'Thunder Jolt','B',19),(92,'Skull Bash','Side B',19),(93,'Agility','Up B',19),(94,'Thunder','Down B',19),(95,'Volt Tackle','B (Final Smash)',19),(96,'Blaster','B',20),(97,'Falco Phantasm','Side B',20),(98,'Fire Bird','Up B',20),(99,'Reflector','Down B',20),(100,'Team Star Fox','B (Final Smash)',20),(101,'Shield Breaker','B',21),(102,'Dancing Blade','Side B',21),(103,'Dolphin Slash','Up B',21),(104,'Counter','Down B',21),(105,'Critical Hit','B (Final Smash)',21),(106,'Fire Arrow','B',22),(107,'Boomerang','Side B',22),(108,'Spin Attack','Up B',22),(109,'Bomb','Down B',22),(110,'Triforce Slash','B (Final Smash)',22),(111,'Warlock Punch','B',23),(112,'Flame Choke','Side B',23),(113,'Dark Dive','Up B',23),(114,'Wizard\'s Foot','Down B',23),(115,'Ganon, the Demon King','B (Final Smash)',23),(116,'Shadow Ball','B',24),(117,'Confusion','Side B',24),(118,'Teleport','Up B',24),(119,'Disable','Down B',24),(120,'Psystrike','B (Final Smash)',24),(121,'Flare Blade','B',25),(122,'Double-Edge Dance','Side B',25),(123,'Blazer','Up B',25),(124,'Counter','Down B',25),(125,'Critical Hit','B (Final Smash)',25),(126,'Chef','B',26),(127,'Judge','Side B',26),(128,'Fire','Up B',26),(129,'Oil Panic','Down B',26),(130,'Octopus','B (Final Smash)',26),(131,'Mach Knight','B',27),(132,'Drill Rush','Side B',27),(133,'Shuttle Loop','Up B',27),(134,'Dimensional Cape','Down B',27),(135,'Darkness Illusion','B (Final Smash)',27),(136,'Palutena Bow','B',28),(137,'Upperdash Arm','Side B',28),(138,'Power of Flight','Up B',28),(139,'Guardian Orbitars','Down B',28),(140,'Lightning Chariot','B (Final Smash)',28),(141,'Paralyzer','B',29),(142,'Plasma Whip','Side B',29),(143,'Boost Kick','Up B',29),(144,'Flip Jump','Down B',29),(145,'Zero Laser','B (Final Smash)',29),(146,'Chomp','B',30),(147,'Wario Bike','Side B',30),(148,'Corkscrew','Up B',30),(149,'Wario Waft','Down B',30),(150,'Wario-Man','B (Final Smash)',30),(151,'Hand Grenade','B',31),(152,'Remote Missile','Side B',31),(153,'Cypher','Up B',31),(154,'C4','Down B',31),(155,'Covering Fire','B (Final Smash)',31),(156,'Eruption','B',32),(157,'Quick Draw','Side B',32),(158,'Aether','Up B',32),(159,'Counter','Down B',32),(160,'Great Aether','B (Final Smash)',32),(161,'Water Gun','B',33),(162,'Withdraw','Side B',33),(163,'Waterfall','Up B',33),(164,'Pokemon Change','Down B',33),(165,'Triple Finish','B (Final Smash)',33),(166,'Bullet Seed','B',34),(167,'Razor Leaf','Side B',34),(168,'Vine Whip','Up B',34),(169,'Pokemon Change','Down B',34),(170,'Triple Finish','B (Final Smash)',34),(171,'Flamethrower','B',35),(172,'Flare Blitz','Side B',35),(173,'Flying Slam','Up B',35),(174,'Pokemon Change','Down B',35),(175,'Triple Finish','B (Final Smash)',35),(176,'Peanut Popgun','B',36),(177,'Monkey Flip','Side B',36),(178,'Rocketbarrel Boost','Up B',36),(179,'Banana Peel','Down B',36),(180,'Hyper Rocketbarrel','B (Final Smash)',36),(181,'PK Freeze','B',37),(182,'PK Fire','Side B',37),(183,'PK Thunder','Up B',37),(184,'PSI Magnet','Down B',37),(185,'PK Starstorm','B (Final Smash)',37),(186,'Homing Attack','B',38),(187,'Spin Dash','Side B',38),(188,'Spring Jump','Up B',38),(189,'Spin Charge','Down B',38),(190,'Super Sonic','B (Final Smash)',38),(191,'Inhale','B',39),(192,'Gordo Throw','Side B',39),(193,'Super Dedede Jump','Up B',39),(194,'Jet Hammer','Down B',39),(195,'Dede-rush','B (Final Smash)',39),(196,'Pikmin Pluck','B',40),(197,'Pikmin Throw','Side B',40),(198,'Winged Pikmin','Up B',40),(199,'Pikmin Order','Down B',40),(200,'End of Day','B (Final Smash)',40),(201,'Aura Sphere','B',41),(202,'Force Palm','Side B',41),(203,'Extreme Speed','Up B',41),(204,'Double Team','Down B',41),(205,'Aura Storm','B (Final Smash)',41),(206,'Robo Beam','B',42),(207,'Arm Rotor','Side B',42),(208,'Robo Burner','Up B',42),(209,'Gyro','Down B',42),(210,'Guided Robo Beam','B (Final Smash)',42),(211,'Hero\'s Bow','B',43),(212,'Boomerang','Side B',43),(213,'Spin Attack','Up B',43),(214,'Bomb','Down B',43),(215,'Triforce Slash','B (Final Smash)',43),(216,'Blaster','B',44),(217,'Wolf Flash','Side B',44),(218,'Fire Wolf','Up B',44),(219,'Reflector','Down B',44),(220,'Team Star Wolf','B (Final Smash)',44),(221,'Shield Breaker','B',45),(222,'Dancing Blade','Side B',45),(223,'Dolphin Slash','Up B',45),(224,'Counter','Down B',45),(225,'Critical Hit','B (Final Smash)',45),(226,'Silver Bow','B',46),(227,'Electroshock Arm','Side B',46),(228,'Power of Flight','Up B',46),(229,'Guardian Orbitars','Down B',46),(230,'Dark Pit Staff','B (Final Smash)',46),(231,'Pocket','B',47),(232,'Lloid Rocket','Side B',47),(233,'Balloon Trip','Up B',47),(234,'Timber','Down B',47),(235,'Dream Home','B (Final Smash)',47),(236,'Metal Blade','B',48),(237,'Crash Bomber','Side B',48),(238,'Rush Coil','Up B',48),(239,'Leaf Shield','Down B',48),(240,'Mega Legends','B (Final Smash)',48),(241,'Sun Salutation','B',49),(242,'Header','Side B',49),(243,'Super Hoop','Up B',49),(244,'Deep Breathing','Down B',49),(245,'Wii Fit','B (Final Smash)',49),(246,'Luma Shot','B',50),(247,'Star Bits','Side B',50),(248,'Launch Star','Up B',50),(249,'Gravitational Pull','Down B',50),(250,'Grand Star','B (Final Smash)',50),(251,'Straight Lunge','B',51),(252,'Jolt Haymaker','Side B',51),(253,'Rising Uppercut','Up B',51),(254,'Slip Counter','Down B',51),(255,'Gig Mac Rush','B (Final Smash)',51),(256,'Water Shuriken','B',52),(257,'Shadow Sneak','Side B',52),(258,'Hydro Pump','Up B',52),(259,'Substitute','Down B',52),(260,'Secret Ninja Attack','B (Final Smash)',52),(261,'','B',53),(262,'','Side B',53),(263,'','Up B',53),(264,'','Down B',53),(265,'','B (Final Smash)',53),(266,'','B',54),(267,'','Side B',54),(268,'','Up B',54),(269,'','Down B',54),(270,'','B (Final Smash)',54),(271,'','B',55),(272,'','Side B',55),(273,'','Up B',55),(274,'','Down B',55),(275,'','B (Final Smash)',55),(276,'Autoreticle','B',56),(277,'Explosive Flame','Side B',56),(278,'Warp','Up B',56),(279,'Counter/Reflect Barrier','Down B',56),(280,'Black Hole Laser','B (Final Smash)',56),(281,'Bonus Fruit','B',57),(282,'Power Pellet','Side B',57),(283,'Pac-jump','Up B',57),(284,'Fire Hydrant','Down B',57),(285,'Super Pac-Man','B (Final Smash)',57),(286,'Thunder','B',58),(287,'Arcfire','Side B',58),(288,'Elwind','Up B',58),(289,'Nosferatu','Down B',58),(290,'Pair Up','B (Final Smash)',58),(291,'Monado Arts','B',59),(292,'Back Slash','Side B',59),(293,'Air Slash','Up B',59),(294,'Vision','Down B',59),(295,'Chain Attack','B (Final Smash)',59),(296,'Clown Cannon','B',60),(297,'Clown Kart Dash','Side B',60),(298,'Abandon Ship','Up B',60),(299,'Mechakoopa','Down B',60),(300,'Shadow Mario Paint','B (Final Smash)',60),(301,'Trick Shot','B',61),(302,'Clay Shooting','Side B',61),(303,'Duck Jump','Up B',61),(304,'Wild Gunman','Down B',61),(305,'NES Zapper Posse','B (Final Smash)',61),(306,'Hadoken','B',62),(307,'Tatsumaki Senpukyaku','Side B',62),(308,'Shoryuken','Up B',62),(309,'Focus Attack','Down B',62),(310,'Shin Shoryuken/Shinku Hadoken','B (Final Smash)',62),(311,'Blade Beam','B',63),(312,'Cross Slash','Side B',63),(313,'Climhazzard','Up B',63),(314,'Limit Charge/Finishing Touch','Down B',63),(315,'Omnislash','B (Final Smash)',63),(316,'Dragon Fang Shot','B',64),(317,'Dragon Lunge','Side B',64),(318,'Dragon Ascent','Up B',64),(319,'Counter Surge','Down B',64),(320,'Torrential Roar','B (Final Smash)',64),(321,'Bullet Climax','B',65),(322,'Heel Slide/After Burner Kick','Side B',65),(323,'Witch Twist','Up B',65),(324,'Witch Time','Down B',65),(325,'Infernal Climax','B (Final Smash)',65),(326,'Charge Shot','B',66),(327,'Missile','Side B',66),(328,'Screw Attack','Up B',66),(329,'Bomb','Down B',66),(330,'Phazon Laser','B (Final Smash)',66),(331,'Toad','B',67),(332,'Daisy Bomber','Side B',67),(333,'Daisy Parasol','Up B',67),(334,'Vegetable','Down B',67),(335,'Daisy Blossom','B (Final Smash)',67),(336,'Flare Blade','B',68),(337,'Double-Edge Dance','Side B',68),(338,'Soaring Slash','Up B',68),(339,'Counter','Down B',68),(340,'Awakening Aether','B (Final Smash)',68),(341,'Hadoken','B',69),(342,'Tatsumaki Senpukyaku','Side B',69),(343,'Shoryuken','Up B',69),(344,'Focus Attack','Down B',69),(345,'Shippu Jinraikyaku/Shinryuken','B (Final Smash)',69),(346,'Splattershot','B',70),(347,'Splat Roller','Side B',70),(348,'Super Jump','Up B',70),(349,'Splat Bomb','Down B',70),(350,'Killer Wail','B (Final Smash)',70),(351,'Plasma Breath','B',71),(352,'Space Pirate Rush','Side B',71),(353,'Wing Blitz','Up B',71),(354,'Skewer','Down B',71),(355,'Plasma Scream','B (Final Smash)',71),(356,'Axe','B',72),(357,'Cross','Side B',72),(358,'Uppercut','Up B',72),(359,'Holy Water','Down B',72),(360,'Grand Cross','B (Final Smash)',72),(361,'Axe','B',73),(362,'Cross','Side B',73),(363,'Uppercut','Up B',73),(364,'Holy Water','Down B',73),(365,'Grand Cross','B (Final Smash)',73),(366,'Blunderbuss','B',74),(367,'Crownerang','Side B',74),(368,'Propellerpack','Up B',74),(369,'Gut Check','Down B',74),(370,'Blast-o-Matic','B (Final Smash)',74),(371,'Pocket','B',75),(372,'Fishing Rod','Side B',75),(373,'Balloon Trip','Up B',75),(374,'Lloid Trap','Down B',75),(375,'Dream Town Hall','B (Final Smash)',75),(376,'Darkest Lariat','B',76),(377,'Alolan Whip','Side B',76),(378,'Cross Chop','Up B',76),(379,'Revenge','Down B',76),(380,'Max Malicious Moonsault','B (Final Smash)',76),(381,'Ptooie','B',77),(382,'Poison Breath','Side B',77),(383,'Piranhacopter','Up B',77),(384,'Long-Stem Strike','Down B',77),(385,'Petey Piranha','B (Final Smash)',77),(386,'Gun/Gun Special','B',78),(387,'Eiha/Eigaon','Side B',78),(388,'Grappling Hook/Wings of Rebellion','Up B',78),(389,'Rebel\'s Guard/Tetrakarn/Makarakarn','Down B',78),(390,'All-Out Attack','B (Final Smash)',78);
/*!40000 ALTER TABLE `moves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skins`
--

DROP TABLE IF EXISTS `skins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skins` (
  `skin_id` int(10) unsigned NOT NULL,
  `color` varchar(45) NOT NULL,
  `description` varchar(150) NOT NULL,
  `character_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`skin_id`),
  UNIQUE KEY `fk_skins_character_id_idx` (`character_id`),
  CONSTRAINT `fk_skins_character_id` FOREIGN KEY (`character_id`) REFERENCES `characters` (`character_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skins`
--

LOCK TABLES `skins` WRITE;
/*!40000 ALTER TABLE `skins` DISABLE KEYS */;
INSERT INTO `skins` VALUES (1,'red','Mario turns red',1),(2,'green','Luigi turns green',9),(3,'red ','Captain Falcon turns red',11),(4,'blue','Jigglypuff turns blue',12),(5,'yellow','Chrom turns a dark yellow',68),(6,'purple','chrom turns dark purple',64),(7,'blue','Resembles her appearance on the title screen of NES Open Tournament Golf.',67),(8,'red','Resembles a Spanish Flamenco Dress',13),(9,'brown','Resembles Magnus from Kid Icarus: Uprising.',28),(10,'white','Resembles Pit. Dark Pit retains his black wings and gains a red scarf, likely to better differentiate the two.',46),(11,'Blue','Resembles her appearance in Metroid Prime 3: Corruption.',66),(12,'Purple','Resembles Gandrayda from Metroid Prime 3: Corruption.',29),(13,'Pink','Resembles Dixie Kong, Diddy Kong\'s girlfriend.',36),(14,'Black','Resembles a gorilla. The tie is reminiscent of Donkey Kong\'s appearance in Donkey Kong Country\'s Two-Player Contest Mode.',2),(15,'Gray','Based on his appearance in Star Fox Zero.',20),(16,'Blue','Nana\'s parka resembles Popo\'s immediately after touching an enemy but before turning completely white.',15),(17,'Brown','Based on his appearance as a Hero in Fire Emblem: Radiant Dawn.',32),(18,'Black','Partial reversal of its normal colors. It resembles its pre-evolution, Litten, but with a grey torso instead of a black one',76),(19,'Green','Wears her summer outfit from Animal Crossing: New Leaf.',75),(20,'Purple','Resembles the thematic color of Revelations: Persona.',78),(21,'Grey','Resembles his \"Medium Punch\"\" color\"',69);
/*!40000 ALTER TABLE `skins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stages`
--

DROP TABLE IF EXISTS `stages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stages` (
  `stage_id` int(10) unsigned NOT NULL,
  `stage_name` varchar(45) NOT NULL,
  `size` varchar(45) NOT NULL,
  `series_origin` varchar(45) NOT NULL,
  `hazards` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `smash_game_origin` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`stage_id`),
  UNIQUE KEY `stage_name_UNIQUE` (`stage_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stages`
--

LOCK TABLES `stages` WRITE;
/*!40000 ALTER TABLE `stages` DISABLE KEYS */;
INSERT INTO `stages` VALUES (1,'Peach\'s Castle','Small','Mario','N','1'),(2,'Mushroom Kingdom','Big','Mario','Y','1'),(3,'Kongo Jungle','Medium','Donkey Kong','N','1'),(4,'Hyrule Castle','Medium','Legend of Zelda','N','1'),(5,'Super Happy Tree','Medium','Mario','N','1'),(6,'Dream Land','Small','Kirby','N','1'),(7,'Sector Z','Medium','Star Fox','N','1'),(8,'Saffron City','Medium','Pokemon','N','1'),(9,'Battlefield','Medium','Super Smash Bros.','N','2'),(10,'Final Destination','Small','Super Smash Bros.','N','2'),(11,'Princess Peach\'s Castle','Medium','Mario','Y','2'),(12,'Rainbow Cruise','Scroller','Mario','Y','2'),(13,'Mushroom Kingdom II','Big','Mario','N','2'),(14,'Kongo Falls','Tall','Donkey Kong','N','2'),(15,'Jungle Japes','Medium','Donkey Kong','Y','2'),(16,'Great Bay','Small','Legend of Zelda','N','2'),(17,'Temple','Very Big','Legend of Zelda','N','2'),(18,'Brinstar','Small','Metroid ','N','2'),(19,'Brinstar Depths','Medium','Metroid','N','2'),(20,'Big Blue','Medium','F-Zero','Y','2'),(21,'Yoshi\'s Story','Medium','Mario','N','2'),(22,'Yoshi\'s Island (Melee)','Big','Mario','N','2'),(23,'Fountain of Dreams','Medium','Kirby','N','2'),(24,'Green Greens','Medium','Kirby','Y','2'),(25,'Corneria','Medium','Star Fox','Y','2'),(26,'Venom','Medium','Star Fox','N','2'),(27,'Pokémon Stadium','Medium','Pokemon','N','2'),(28,'Onett','Wide','Earthbound','Y','2'),(29,'Fourside','Medium','Earthbound','N','2'),(30,'Delfino Plaza','Small','Mario','N','3'),(31,'Luigi\'s Mansion','Medium','Mario','N','3'),(32,'Figure-8 Circuit','Medium','Mario','Y','3'),(33,'Mario Bros.','Big','Mario','Y','3'),(34,'75 m','Tall','Donkey Kong','Y','3'),(35,'Bridge of Eldin','Wide','Legend of Zelda','Y','3'),(36,'Pirate Ship','Medium','Legend of Zelda','Y','3'),(37,'Norfair','Big','Metroid','Y','3'),(38,'Frigate Orpheon','Medium','Metroid','N','3'),(39,'Yoshi\'s Island','Small','Mario','N','3'),(40,'Halberd','Wide','Kirby','Y','3'),(41,'Lylat Cruise','Small','Star Fox','N','3'),(42,'Pokémon Stadium 2','Medium','Pokemon','N','3'),(43,'Spear Pillar','Small','Pokemon','N','3'),(44,'Port Town Aero Dive','Small','F-Zero','Y','3'),(45,'Castle Siege','Small','Fire Emblem','N','3'),(46,'WarioWare, Inc.','Tall','Mario','Y','3'),(47,'Distant Planet','Big','Pikmin ','Y','3'),(48,'Smashville','Small','Animal Crossing','N','3'),(49,'New Pork City','Very Big','Earthbound','Y','3'),(50,'Summit','Small','Ice Climber ','Y','3'),(51,'Skyworld','Small','Kid Icarus ','N','3'),(52,'Hanenbow','Big','Electroplankton ','N','3'),(53,'Shadow Moses Island','Tall','Metal Gear Solid ','Y','3'),(54,'Green Hill Zone','Big','Sonic the Hedgehog ','N','3'),(55,'3D Land','Scroller','Mario','Y','5'),(56,'Golden Plains','Scroller','Mario','N','5'),(57,'Paper Mario','Medium','Mario','N','5'),(58,'Gerudo Valley','Wide','The Legend of Zelda','N','5'),(59,'Spirit Train','Big','The Legend of Zelda','Y','5'),(60,'Dream Land GB','Small','Kirby','N','5'),(61,'Unova Pokémon League','Medium','Pokemon','Y','5'),(62,'Prism Tower','Wide','Pokemon','N','5'),(63,'Mute City SNES','Wide','F-Zero ','Y','5'),(64,'Magicant','Big','Earthbound','N','5'),(65,'Arena Ferox','Medium','Fire Emblem','N','5'),(66,'Reset Bomb Forest','Small','Kid Icarus','N','5'),(67,'Tortimer Island','Small','Animal Crossing','N','5'),(68,'Balloon Fight','Big','Balloon Fight','Y','5'),(69,'Living Room','Wide','Nintendogs & Nintencats','N','5'),(70,'Find Mii','Big','Find Mii II','Y','5'),(71,'Tomodachi Life','Tall','Tomodachi Life','N','5'),(72,'Big Battlefield','Big','Super Smash Bros.','N','4'),(73,'Mushroom Kingdom U','Small','Mario','Y','4'),(74,'Mario Galaxy','Wide','Mario','N','4'),(75,'Mario Circuit','Small','Mario','Y','4'),(76,'Woolly World','Wide','Mario','Y','4'),(77,'Jungle Hijinxs','Small','Donkey Kong','N','4'),(78,'Skyloft','Medium','Legend of Zelda','N','4'),(79,'Pyrosphere','Medium','Metroid','Y','4'),(80,'The Great Cave Offensive','Very Big','Kirby','N','4'),(81,'Orbital Gate Assault','Big','Sar Fox','Y','4'),(82,'Kalos Pokémon League','Medium','Pokemon','Y','4'),(83,'Coliseum','Wide','Fire Emblem','N','4'),(84,'Palutena\'s Temple','Very Big','Kid Icarus','Y','4'),(85,'Gamer','Medium','Mario','Y','4'),(86,'Garden of Hope','Big','Pikmin ','N','4'),(87,'Town and City','Small','Animal Crossing','N','4'),(88,'Wii Fit Studio','Wide','Wii Fit','N','4'),(89,'Duck Hunt','Wide','Duck Hunt','N','4'),(90,'Wrecking Crew','Tall','Wrecking Crew','Y','4'),(91,'Pilotwings','Small','Pilotwings','N','4'),(92,'Wuhu Island','Small','Pilotwings','N','4'),(93,'Windy Hill','Medium','Sonic the Hedgehog ','N','4'),(94,'Pac-Land','Scroller','Pac-Man','Y','4'),(95,'Suzaku Castle','Medium','Street Fighter','N','5'),(96,'Super Mario Maker','Scroller','Mario','Y','5'),(97,'Midgar','Medium','Final Fantasy','Y','5'),(98,'Umbra Clock Tower','Small','Bayonetta','N','5'),(99,'New Donk City Hall','Medium','Mario','N','5'),(100,'Great Plateau Tower','Small','Legend of Zelda','N','5'),(101,'Moray Towers','Tall','Splatoon','N','5'),(102,'Dracula\'s Castle','Small','Castlevania','N','');
/*!40000 ALTER TABLE `stages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'smash_data'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-04 14:48:40
