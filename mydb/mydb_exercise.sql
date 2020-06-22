CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `exercise`
--

DROP TABLE IF EXISTS `exercise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exercise` (
  `no` int NOT NULL AUTO_INCREMENT COMMENT '운동 번호',
  `exercise` varchar(45) NOT NULL COMMENT '운동명',
  `stepnum` int NOT NULL DEFAULT '0' COMMENT '이 운동은 몇 단계가 있는가',
  `viewer` int NOT NULL DEFAULT '0' COMMENT '이 운동을 사람들이 얼마나 클릭했는가',
  PRIMARY KEY (`no`),
  UNIQUE KEY `exerciseNum_UNIQUE` (`no`),
  UNIQUE KEY `exerciseName_UNIQUE` (`exercise`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercise`
--

LOCK TABLES `exercise` WRITE;
/*!40000 ALTER TABLE `exercise` DISABLE KEYS */;
INSERT INTO `exercise` VALUES (1,'Supermans',2,0),(2,'Push-up',3,0),(3,'Contralateral Limb Raises',3,0),(4,'Bent Knee Push-up',3,0),(5,'Downward-facing Dog',4,0),(6,'Crunch',2,0),(7,'Push-up with Single-leg Raise',3,0),(8,'Front Plank',2,0),(9,'Side Plank with Bent Knee',2,0),(10,'Supine Reverse Crunch',2,0),(11,'Cobra',3,0),(12,'Squat Jumps',5,0),(13,'Forward Lunge',2,0),(14,'Forward Lunge with Arm Drivers',2,0),(15,'Glute Activation Lunges',5,0),(16,'Glute Bridge',2,0),(17,'Hip Rotations (Push-up Position)',4,0),(18,'Side Lunge',3,0),(19,'Side Lying Hip Abduction',2,0),(20,'Side Lying Hip Adduction',2,0),(21,'Side Plank',2,0),(22,'Side Plank with Straight Leg',2,0),(23,'Single Leg Stand',2,0),(24,'Standing Calf Raises',4,0),(25,'Supine Pelvic Tilts',2,0);
/*!40000 ALTER TABLE `exercise` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-23  1:08:04
