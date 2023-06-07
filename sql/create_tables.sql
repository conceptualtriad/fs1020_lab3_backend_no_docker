-- MariaDB dump 10.19  Distrib 10.6.7-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: `fs1020-lab3-db`
-- ------------------------------------------------------
-- Server version	10.6.7-MariaDB-2ubuntu1.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Setup --

-- DROP DATABASE IF EXISTS `fs1020-lab3-db`;
-- DROP USER IF EXISTS ip_admin@localhost;
CREATE DATABASE IF NOT EXISTS `fs1020-lab3-db`;
CREATE USER IF NOT EXISTS 'MYSQL_USER'@'localhost' IDENTIFIED BY '{$MYSQL_PASSWORD}';
GRANT ALL ON `fs1020-lab3-db`.* TO 'MYSQL_USER'@'localhost';

-- -- Only run following query if experiencing permission issues
-- ALTER USER 'ip_admin'@'localhost' IDENTIFIED WITH mysql_native_password BY 'ADmin1337';

FLUSH PRIVILEGES;
SHOW GRANTS FOR 'MYSQL_USER'@'localhost';

USE `fs1020-lab3-db`;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `entryId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) NOT NULL,
  `userEmail` varchar(255) NOT NULL,
  `userPhoneNumber` varchar(25) NOT NULL,
  `entryContent` varchar(5000) NOT NULL,
  PRIMARY KEY (`entryId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
INSERT INTO `entries` VALUES (1,'Rayana Ayim','rayim@kayaka.com','378-447-5345','Dogecoin to the moon! Hodl!'),(2,'Akasuki Fukuda','afukuda@kawaii.jp','555-666-7777','All your base are belong to us!'),(3,'Fester Bestertester','btester@madcomics.com','555-666-7777','Lorem ipsum dolor sit amet consectetur adipisicing elit. Velit rem assumenda iure. Obcaecati, eligendi earum!');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio`
--

DROP TABLE IF EXISTS `portfolio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portfolio` (
  `portfolioId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `portfolioItemTitle` varchar(255) NOT NULL,
  `portfolioItemDescription` varchar(500) NOT NULL,
  `portfolioItemImageTag` varchar(255) NOT NULL,
  PRIMARY KEY (`portfolioId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio`
--

LOCK TABLES `portfolio` WRITE;
/*!40000 ALTER TABLE `portfolio` DISABLE KEYS */;
INSERT INTO `portfolio` VALUES (1,'Fugit impedit sit aliquid quas enim','Lorem ipsum, dolor sit amet consectetur adipisicing elit. Totam debitis quod iste saepe repudiandae reprehenderit, eos vitae. Magnam, dolores vel!','coder'),(2,'Nihil dolorem sapiente corporis tempore amet nulla omnis','Lorem ipsum, dolor sit amet consectetur adipisicing elit. Totam debitis quod iste saepe repudiandae reprehenderit, eos vitae. Magnam, dolores vel!','data'),(3,'Magni, deleniti consequuntur laboriosam','Lorem ipsum, dolor sit amet consectetur adipisicing elit. Totam debitis quod iste saepe repudiandae reprehenderit, eos vitae. Magnam, dolores vel!','database'),(4,'Cum nisi eos ad quae sit odio','Lorem ipsum, dolor sit amet consectetur adipisicing elit. Totam debitis quod iste saepe repudiandae reprehenderit, eos vitae. Magnam, dolores vel!','developer'),(5,'Lorem ipsum dolor sit amet','Lorem ipsum, dolor sit amet consectetur adipisicing elit. Totam debitis quod iste saepe repudiandae reprehenderit, eos vitae. Magnam, dolores vel!','pcb'),(6,'Ipsa vel accusantium possimus','Lorem ipsum, dolor sit amet consectetur adipisicing elit. Totam debitis quod iste saepe repudiandae reprehenderit, eos vitae. Magnam, dolores vel!','coffee');
/*!40000 ALTER TABLE `portfolio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resumeDescriptions`
--

DROP TABLE IF EXISTS `resumeDescriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resumeDescriptions` (
  `resumeDescriptionId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resumeItemId` int(10) unsigned NOT NULL,
  `resumeItemDescription` varchar(1000) NOT NULL,
  PRIMARY KEY (`resumeDescriptionId`),
  KEY `resumeItemId` (`resumeItemId`),
  CONSTRAINT `resumeDescriptions_ibfk_1` FOREIGN KEY (`resumeItemId`) REFERENCES `resumeItems` (`resumeItemId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resumeDescriptions`
--

LOCK TABLES `resumeDescriptions` WRITE;
/*!40000 ALTER TABLE `resumeDescriptions` DISABLE KEYS */;
INSERT INTO `resumeDescriptions` VALUES (1,1,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quam quaerat fugiat soluta explicabo.'),(2,1,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eius repellat minus itaque! Debitis, fuga mollitia.'),(3,1,'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolorum quibusdam ipsam enim.'),(4,2,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quam quaerat fugiat soluta explicabo.'),(5,2,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eius repellat minus itaque! Debitis, fuga mollitia.'),(6,2,'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolorum quibusdam ipsam enim.'),(7,3,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quam quaerat fugiat soluta explicabo.'),(8,3,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eius repellat minus itaque! Debitis, fuga mollitia.'),(9,3,'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolorum quibusdam ipsam enim.'),(10,4,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quam quaerat fugiat soluta explicabo.'),(11,4,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eius repellat minus itaque! Debitis, fuga mollitia.'),(12,4,'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolorum quibusdam ipsam enim.'),(13,5,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quam quaerat fugiat soluta explicabo.'),(14,5,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eius repellat minus itaque! Debitis, fuga mollitia.'),(15,5,'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolorum quibusdam ipsam enim.'),(16,6,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quam quaerat fugiat soluta explicabo.'),(17,6,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eius repellat minus itaque! Debitis, fuga mollitia.'),(18,6,'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolorum quibusdam ipsam enim.'),(19,7,'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolorum quibusdam ipsam enim.'),(20,7,'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolorum quibusdam ipsam enim.'),(21,7,'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolorum quibusdam ipsam enim.');
/*!40000 ALTER TABLE `resumeDescriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resumeItems`
--

DROP TABLE IF EXISTS `resumeItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resumeItems` (
  `resumeItemId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resumeItemType` varchar(50) NOT NULL,
  `resumeItem` varchar(255) NOT NULL,
  `resumeItemTitle` varchar(255) NOT NULL,
  PRIMARY KEY (`resumeItemId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resumeItems`
--

LOCK TABLES `resumeItems` WRITE;
/*!40000 ALTER TABLE `resumeItems` DISABLE KEYS */;
INSERT INTO `resumeItems` VALUES (1,'Work','Job Title 1','Company 1 · 3 yrs (Current)'),(2,'Work','Job Title 2','Company 2 · 1 yr'),(3,'Work','Job Title 3','Company 3 · 2 yrs'),(4,'Education','Full-Stack Web Development','York University Continuing Education 1 yr'),(5,'Education','Program Name','Program Title'),(6,'Achievement','Achievement One','Achievement Title One'),(7,'Achievement','Achievement Two','Achievement Title Two');
/*!40000 ALTER TABLE `resumeItems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) NOT NULL,
  `userPassword` varchar(255) NOT NULL,
  `userEmail` varchar(255) NOT NULL,
  `isAdmin` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Super Admin','$argon2i$v=19$m=4096,t=3,p=1$qG4e7dI4/PAoer3XB+6CUQ$GxxGD7Nn8Hjd3zeyKEjSPwcIRCUtbJptEd59FwW1yHA','address@email.com',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-28 18:15:40
