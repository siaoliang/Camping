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
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `unitPrice` double NOT NULL,
  `stock` int unsigned NOT NULL,
  `photoUrl` varchar(300) DEFAULT NULL,
  `description` varchar(250) NOT NULL DEFAULT '',
  `shelfDate` date NOT NULL DEFAULT (curdate()),
  `discount` int NOT NULL DEFAULT '0',
  `sort` varchar(10) DEFAULT '帳篷',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Coleman 氣候達人BREATHE圓頂帳',16500,3,'https://cdn.cybassets.com/media/W1siZiIsIjEyOTM1L3Byb2R1Y3RzLzMwODI2MzQ0L0NNLTI3MjgyXzIwZWM5YjRjODI5NTMyNGRmNzA4LmpwZWciXSxbInAiLCJ0aHVtYiIsIjYwMHg2MDAiXV0.jpeg?sha=787b153fc8027bcd','','2021-12-24',10,'帳篷'),(2,'Coleman4S露營帳',19900,3,'https://cdn.cybassets.com/media/W1siZiIsIjEyOTM1L3Byb2R1Y3RzLzMyOTY2NjkwLzE2MTIyNTczMTZfOTA3OTY0NWE2OGUxMTg5MTUxZmUuanBlZyJdLFsicCIsInRodW1iIiwiNjAweDYwMCJdXQ.jpeg?sha=b1904df0457eb857','','2021-12-24',10,'帳篷'),(3,'Coleman 舒適達人3段式帆布甲板椅',5700,5,'https://cdn.cybassets.com/media/W1siZiIsIjEyOTM1L3Byb2R1Y3RzLzMwODI2NjA2LzE2MTE1NjMwODNfYmQ3ZTc0MmIxZTZhM2MxZGJmMTkuanBlZyJdLFsicCIsInRodW1iIiwiNjAweDYwMCJdXQ.jpeg?sha=03c8a50b0168b718','三段式高度調節，依個人習慣調整最舒適的座姿','2021-12-24',0,'椅子'),(4,'Coleman達人ROOMⅢ',24000,2,'images\\帳篷系列\\Coleman達人ROOMⅢ\\Coleman達人ROOMⅢ.png','最頂尖的達人系列，四季全天候戶外高機能款','2021-12-24',0,'帳篷'),(5,'Coleman人透氣圓頂露營帳',14999,1,'images\\帳篷系列\\Coleman人透氣圓頂露營帳\\Coleman人透氣圓頂露營帳V.png','經典TOUGH系列最新款，搭配地墊+地布的高CP值套裝組','2021-12-24',10,'帳篷'),(6,'Coleman LAY躺椅',3700,6,'https://cdn.cybassets.com/media/W1siZiIsIjEyOTM1L3Byb2R1Y3RzLzMwOTczNjk5L0NNLTI2NzQ0X2ZmODE4MzRlYWY5MTdkOTcwMmVjLmpwZWciXSxbInAiLCJ0aHVtYiIsIjYwMHg2MDAiXV0.jpeg?sha=4c4c46c94c43c136','露營/野餐/戶外休閒躺椅','2021-12-25',0,'椅子'),(7,'Coleman 渡假休閒椅',1200,10,'https://cdn.cybassets.com/media/W1siZiIsIjEyOTM1L3Byb2R1Y3RzLzMwOTczNjg3L0NNLTMzNTYwX2FmZDI4YTE4YTk5YzE0NWU1ZDY2LmpwZWciXSxbInAiLCJ0aHVtYiIsIjYwMHg2MDAiXV0.jpeg?sha=5ccec07c6748e2e0','經典設計戶外休閒椅','2021-12-25',0,'椅子'),(8,'Coleman 療癒椅',1500,10,'https://cdn.cybassets.com/media/W1siZiIsIjEyOTM1L3Byb2R1Y3RzLzMwOTczNzY0L0NNLTM2NDMwTTAwMF83OTk1MzUzM2MyNTEyMjVlNzdkOS5qcGVnIl0sWyJwIiwidGh1bWIiLCI2MDB4NjAwIl1d.jpeg?sha=516add7ea358b010','大人小孩適用戶外椅/露營椅/休閒椅','2021-12-25',0,'椅子'),(9,'Coleman 413氣化雙口爐 ',9800,5,'https://cdn.cybassets.com/media/W1siZiIsIjEyOTM1L3Byb2R1Y3RzLzMxNDk3Nzc5LzE1OTg2MTA1MzRfYzYwZDc0MDNhMzg3NjkxMzliYWIuanBlZyJdLFsicCIsInRodW1iIiwiNjAweDYwMCJdXQ.jpeg?sha=7efe95214770def2','Coleman 經典商品','2021-12-25',0,'爐具'),(10,'Coleman 508氣化爐',5100,10,'https://cdn.cybassets.com/media/W1siZiIsIjEyOTM1L3Byb2R1Y3RzLzMxMDU4NTY3L0NNLTA1MDhKXzcwY2U3YTY2MWQyMTZlMmE0ZjMzLmpwZWciXSxbInAiLCJ0aHVtYiIsIjYwMHg2MDAiXV0.jpeg?sha=6f41b362d36c0388','適應急遽氣候變化的氣化單口爐','2021-12-25',0,'爐具'),(11,'Coleman 286氣化中單燈 ',5100,8,'https://cdn.cybassets.com/media/W1siZiIsIjEyOTM1L3Byb2R1Y3RzLzMwOTc2ODczL0NNLTAyODZKX2M5NzViNDQ5Mzk1MjZhZmE2NGU0LmpwZWciXSxbInAiLCJ0aHVtYiIsIjYwMHg2MDAiXV0.jpeg?sha=21ace525b5257dee','入門款單燈蕊氣化燈','2021-12-25',0,'燈具'),(12,'Coleman 吸震摺椅',650,5,'https://cdn.cybassets.com/media/W1siZiIsIjEyOTM1L3Byb2R1Y3RzLzM0MDMwMjg1LzE2MjYyNDYzMDhfNzE0OTcwNWY5M2I1YjJhZmY3NjYuanBlZyJdLFsicCIsInRodW1iIiwiNjAweDYwMCJdXQ.jpeg?sha=c4a6e9a825e02317','居家、露營登山、戶外活動皆適用的輕量摺椅','2022-01-03',0,'椅子');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
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
