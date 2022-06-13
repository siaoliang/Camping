-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: camping
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` char(10) DEFAULT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL,
  `birthday` date NOT NULL,
  `gender` char(1) DEFAULT NULL,
  `address` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(20) NOT NULL DEFAULT '',
  `subscribed` tinyint NOT NULL DEFAULT '0',
  `discount` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES ('A123456789','錢多多','ellis@PChome.com.tw','asdf123456','2000-10-10','M','','0911223344',1,0),(NULL,'錢多多','ellis00@PChome.com.tw','asdf123456','1989-02-02','\0','','',0,0),(NULL,'天天天','ellis000@PChome.com.tw','asdf0001','1919-09-09',NULL,'','0912345',1,0),(NULL,'天天天','ellis0000@PChome.com.tw','asdf0000','1999-09-09',NULL,'','8989',1,0),('A123456798','錢少少','ellis01@PChome.com.tw','asdf1234','2002-10-10','M','','',0,0),('A223456789','錢很少','ellis03@PChome.com.tw','asdf1235','1999-10-20','F','','',0,15),('A206338382','錢很多','ellis04@PChome.com.tw','asdf1236','1999-10-20','F','台北市復興北路99號14F','0987654321',1,15),('A224234234','錢超多','ellis05@PChome.com.tw','asdf1237','1999-10-20','F','','',1,0),('A169241284','老天爺','ellis06@PChome.com.tw','asdf1230','1988-08-08','M','','',0,0),('A169241293','老天爺','ellis07@PChome.com.tw','asdf12355','1988-08-08','M','','',0,0),('L123505302','我的天','ellis08@PChome.com.tw','asdf1235','1999-10-20','F','','',0,0),(NULL,'好想睡','ellis10@PChome.com.tw','asdf123123','1989-09-09',NULL,'','0912345678',1,0),(NULL,'天天天','ellis1055@PChome.com.tw','asdf0003','1999-09-09',NULL,'','0912345679',0,0),(NULL,'好想睡阿','ellis11@PChome.com.tw','asdf123123','1989-09-09',NULL,'','0912345679',1,0),(NULL,'天天天','ellis111@PChome.com.tw','asdf0022','1999-08-09',NULL,'','0912345679',1,0),(NULL,'好想睡阿','ellis12@PChome.com.tw','asdf123123','1989-09-09',NULL,'','0912345678',1,0),(NULL,'天天天','ellis123@PChome.com.tw','asdf00012','1999-08-08',NULL,'','0912345678',1,0),(NULL,'天天天','ellis123123@PChome.com.tw','asdf0000','1989-09-09',NULL,'','0912345678',1,0),(NULL,'天天優','ellis2266@PChome.com.tw','asdf2266','1989-06-06',NULL,'','0912345679',1,0),(NULL,'天天天','ellis33@PChome.com.tw','asdf123456','1919-12-09',NULL,'','0912345',1,0),(NULL,'錢多多','ellis53@PChome.com.tw','asdf123456','1999-09-09',NULL,'','0912345',1,0),(NULL,'錢多多','ellis54@PChome.com.tw','asdf123456','1999-08-08',NULL,'','0912345',1,0),(NULL,'錢多多','ellis55@PChome.com.tw','asdf12345','1999-09-09',NULL,'','',1,0),(NULL,'錢多多','ellis58@PChome.com.tw','asdf123456','1988-08-08',NULL,'','0912345',1,0),(NULL,'天天天','ellis666@PChome.com.tw','asdf0000','1999-09-09',NULL,'','8989',1,0),(NULL,'天天天','ellis887@PChome.com.tw','asdf55688','1989-09-09',NULL,'','0912345678',1,0);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-03 19:16:02
