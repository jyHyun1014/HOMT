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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `no` int NOT NULL AUTO_INCREMENT COMMENT '유저 번호',
  `gender` tinyint(1) NOT NULL DEFAULT '0' COMMENT '성별은 무엇인가\\\\n(0: 남성 1: 여성)',
  `firstname` varchar(45) NOT NULL COMMENT '유저 이름',
  `lastname` varchar(45) NOT NULL COMMENT '유저 성\\nex) 김,이,박',
  `email` varchar(45) NOT NULL COMMENT '유저 아이디(이메일)',
  `password` varchar(45) NOT NULL COMMENT '유저 비밀번호',
  `phone` varchar(45) NOT NULL COMMENT '유저 전화번호',
  `birth` date NOT NULL COMMENT '유저 생년월일',
  `height` double DEFAULT '0' COMMENT '유저 키',
  `weight` double DEFAULT '0' COMMENT '유저 몸무게',
  `ismanager` tinyint(1) NOT NULL DEFAULT '0' COMMENT '유저는 관리자이다\\\\n0: 아니다\\\\n1: 맞다',
  PRIMARY KEY (`no`),
  UNIQUE KEY `userNum_UNIQUE` (`no`),
  UNIQUE KEY `userId_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,'지연','현','Hjy@email.com','1234','010-0000-0000','1999-01-01',0,0,1),(2,1,'희진','소','Shj@email.com','1234','010-0000-0000','1999-01-01',0,0,1),(3,1,'승연','이','Lsy@email.com','1234','010-0000-0000','1999-01-20',160,50,1),(4,0,'길동','홍','asdf@email.com','1234','010-1234-5678','2020-06-18',150,40,0),(8,1,'진이','황','a@a','aaaa','010-1234-5678','2020-06-23',150,40,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
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
