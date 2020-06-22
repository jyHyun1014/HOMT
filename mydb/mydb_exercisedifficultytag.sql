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
-- Table structure for table `exercisedifficultytag`
--

DROP TABLE IF EXISTS `exercisedifficultytag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exercisedifficultytag` (
  `difficultytag` varchar(45) NOT NULL COMMENT '이 운동은 얼마나 어려운가',
  `exercise_exerciseName` varchar(45) NOT NULL COMMENT '그 운동은 무엇인가',
  KEY `exercisedifficultytag_ibfk_1` (`exercise_exerciseName`),
  CONSTRAINT `exercisedifficultytag_ibfk_1` FOREIGN KEY (`exercise_exerciseName`) REFERENCES `exercise` (`exercise`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercisedifficultytag`
--

LOCK TABLES `exercisedifficultytag` WRITE;
/*!40000 ALTER TABLE `exercisedifficultytag` DISABLE KEYS */;
INSERT INTO `exercisedifficultytag` VALUES ('easy','Bent Knee Push-up'),('easy','Cobra'),('easy','Contralateral Limb Raises'),('easy','Crunch'),('normal','Downward-facing Dog'),('normal','Forward Lunge'),('hard','Forward Lunge with Arm Drivers'),('normal','Front Plank'),('hard','Glute Activation Lunges'),('easy','Glute Bridge'),('normal','Hip Rotations (Push-up Position)'),('normal','Push-up'),('hard','Push-up with Single-leg Raise'),('normal','Side Lunge'),('easy','Side Lying Hip Abduction'),('easy','Side Lying Hip Adduction'),('hard','Side Plank'),('easy','Side Plank with Bent Knee'),('normal','Side Plank with Straight Leg'),('easy','Single Leg Stand'),('easy','Squat Jumps'),('easy','Standing Calf Raises'),('easy','Supermans'),('easy','Supine Pelvic Tilts'),('normal','Supine Reverse Crunch');
/*!40000 ALTER TABLE `exercisedifficultytag` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-23  1:08:03
