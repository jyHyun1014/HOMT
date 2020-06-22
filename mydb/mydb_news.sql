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
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `no` int NOT NULL AUTO_INCREMENT COMMENT '뉴스 번호',
  `title` varchar(45) NOT NULL COMMENT '뉴스의 제목은 무엇입니까\\nex) 집콕생활로 확"찐"자가 되어버린 집콕러들을 위한 실내 운동법,\\n"우리 가족 면역력 높이기" 코로나19 극복 면역력 높이는 4가지 방법',
  `subhead` varchar(45) DEFAULT NULL COMMENT '이 뉴스의 소제목은 무엇입니까\\nex) 제주 소식, 쉽게 따라하는 건강습관...',
  `content` longtext NOT NULL COMMENT '뉴스내용',
  `publisher` varchar(45) DEFAULT NULL COMMENT '뉴스의 출처는 어디입니까\nex) 매경헬스',
  `src` varchar(45) DEFAULT NULL COMMENT 'url',
  `date` datetime(6) NOT NULL COMMENT '언제 작성된 뉴스입니까',
  `summarynum` int NOT NULL DEFAULT '0' COMMENT '이 뉴스는 몇 줄로 정리됩니까',
  `viewer` int NOT NULL DEFAULT '0' COMMENT '몇 명이 이 뉴스를 읽었습니까',
  `user_userid` varchar(45) DEFAULT NULL,
  `newstag_tag` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`no`),
  UNIQUE KEY `newsId_UNIQUE` (`no`),
  KEY `user_userid_idx` (`user_userid`),
  KEY `newstag_tag_idx` (`newstag_tag`),
  CONSTRAINT `newstag_tag` FOREIGN KEY (`newstag_tag`) REFERENCES `newstag` (`tag`),
  CONSTRAINT `user_userid` FOREIGN KEY (`user_userid`) REFERENCES `user` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
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
