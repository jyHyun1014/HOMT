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
-- Table structure for table `exercisebodytag_has_exercise`
--

DROP TABLE IF EXISTS `exercisebodytag_has_exercise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exercisebodytag_has_exercise` (
  `exercisebodytag_bodytag` varchar(45) NOT NULL,
  `exercise_exerciseName` varchar(45) NOT NULL,
  KEY `fk_exerciseBodyTag_has_exerciseTable_exerciseBodyTag1_idx` (`exercisebodytag_bodytag`),
  KEY `exercise_exerciseName` (`exercise_exerciseName`),
  CONSTRAINT `exercisebodytag_has_exercise_ibfk_1` FOREIGN KEY (`exercise_exerciseName`) REFERENCES `exercise` (`exercise`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercisebodytag_has_exercise`
--

LOCK TABLES `exercisebodytag_has_exercise` WRITE;
/*!40000 ALTER TABLE `exercisebodytag_has_exercise` DISABLE KEYS */;
INSERT INTO `exercisebodytag_has_exercise` VALUES ('Shoulders','Bent Knee Push-up'),('Chest','Bent Knee Push-up'),('Arms','Bent Knee Push-up'),('Back','Cobra'),('Abs','Cobra'),('Back','Contralateral Limb Raises'),('Hips','Contralateral Limb Raises'),('Shoulders','Contralateral Limb Raises'),('Abs','Crunch'),('Arms','Downward-facing Dog'),('Back','Downward-facing Dog'),('Hips','Downward-facing Dog'),('Full Body','Downward-facing Dog'),('Legs','Downward-facing Dog'),('Abs','Forward Lunge'),('Hips','Forward Lunge'),('Legs','Forward Lunge'),('Abs','Forward Lunge with Arm Drivers'),('Hips','Forward Lunge with Arm Drivers'),('Legs','Forward Lunge with Arm Drivers'),('Abs','Front Plank'),('Back','Front Plank'),('Abs','Glute Activation Lunges'),('Hips','Glute Activation Lunges'),('Legs','Glute Activation Lunges'),('Abs','Glute Bridge'),('Hips','Glute Bridge'),('Abs','Hip Rotations (Push-up Position)'),('Hips','Hip Rotations (Push-up Position)'),('Legs','Hip Rotations (Push-up Position)'),('Arms','Push-up'),('Chest','Push-up'),('Shoulders','Push-up'),('Arms','Push-up with Single-leg Raise'),('Hips','Push-up with Single-leg Raise'),('Chest','Push-up with Single-leg Raise'),('Full Body','Push-up with Single-leg Raise'),('Shoulders','Push-up with Single-leg Raise'),('Hips','Side Lunge'),('Legs','Side Lunge'),('Hips','Side Lying Hip Abduction'),('Hips','Side Lying Hip Adduction'),('Legs','Side Lying Hip Adduction'),('Abs','Side Plank'),('Hips','Side Plank'),('Abs','Side Plank with Bent Knee'),('Hips','Side Plank with Bent Knee'),('Abs','Side Plank with Straight Leg'),('Hips','Side Plank with Straight Leg'),('Abs','Single Leg Stand'),('Hips','Squat Jumps'),('Legs','Squat Jumps'),('Legs','Standing Calf Raises'),('Shoulders','Supermans'),('Hips','Supermans'),('Back','Supermans'),('Abs','Supine Pelvic Tilts'),('Abs','Supine Reverse Crunch');
/*!40000 ALTER TABLE `exercisebodytag_has_exercise` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-23  1:08:02
