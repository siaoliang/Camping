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
-- Table structure for table `product_colors`
--

DROP TABLE IF EXISTS `product_colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_colors` (
  `product_id` int NOT NULL,
  `color_name` varchar(5) NOT NULL,
  `stock` int unsigned NOT NULL,
  `photoUrl` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`product_id`,`color_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_colors`
--

LOCK TABLES `product_colors` WRITE;
/*!40000 ALTER TABLE `product_colors` DISABLE KEYS */;
INSERT INTO `product_colors` VALUES (6,'橄欖綠',5,'https://cdn.cybassets.com/media/W1siZiIsIjEyOTM1L3Byb2R1Y3RzLzMwOTczNzE2LzE2MTY1NjkxNzZfYjEyMDY5ZDEwNzlmOTA4ZmNmY2EuanBlZyJdLFsicCIsInRodW1iIiwiNjAweDYwMCJdXQ.jpeg?sha=dcb872ff9d72ba45'),(6,'紅',4,'https://cdn.cybassets.com/media/W1siZiIsIjEyOTM1L3Byb2R1Y3RzLzMwOTczNjk5L0NNLTI2NzQ0X2ZmODE4MzRlYWY5MTdkOTcwMmVjLmpwZWciXSxbInAiLCJ0aHVtYiIsIjYwMHg2MDAiXV0.jpeg?sha=4c4c46c94c43c136'),(6,'綠',3,'https://cdn.cybassets.com/media/W1siZiIsIjEyOTM1L3Byb2R1Y3RzLzMwOTczNzIzLzIwMDAwMjY3NDVfZDMxODUwNWU2ZWFiYjBlMjgzNWUuanBlZyJdLFsicCIsInRodW1iIiwiNjAweDYwMCJdXQ.jpeg?sha=03af1e2484ffdb26'),(8,'橄欖綠',5,'https://cdn.cybassets.com/media/W1siZiIsIjEyOTM1L3Byb2R1Y3RzLzMwOTczNzY0L0NNLTM2NDMwTTAwMF83OTk1MzUzM2MyNTEyMjVlNzdkOS5qcGVnIl0sWyJwIiwidGh1bWIiLCI2MDB4NjAwIl1d.jpeg?sha=516add7ea358b010'),(8,'灰',3,'https://cdn.cybassets.com/media/W1siZiIsIjEyOTM1L3Byb2R1Y3RzLzMwOTczNzU4L0NNLTM2NDI5TTAwMF9iMjUwYjYyMmUyYzE3NTBkNGI5MC5qcGVnIl0sWyJwIiwidGh1bWIiLCI2MDB4NjAwIl1d.jpeg?sha=72142c7d3643e573'),(8,'迷彩',2,'https://cdn.cybassets.com/media/W1siZiIsIjEyOTM1L3Byb2R1Y3RzLzMwODgxNTUwL0NNLTM1MzQ4XzNlOTllYTZjNGQ1YjViYmNmZmE5LmpwZWciXSxbInAiLCJ0aHVtYiIsIjYwMHg2MDAiXV0.jpeg?sha=7e7a7a6293000445'),(12,'深藍',2,'https://cdn.cybassets.com/media/W1siZiIsIjEyOTM1L3Byb2R1Y3RzLzM0MDMwNjY4LzE2MjYyNDkyNjVfNjlmNzY4ZWVkMWE2ZjgxMjRiZDEuanBlZyJdLFsicCIsInRodW1iIiwiNjAweDYwMCJdXQ.jpeg?sha=0e037d4fafeeb5b0'),(12,'灰',3,'https://cdn.cybassets.com/media/W1siZiIsIjEyOTM1L3Byb2R1Y3RzLzM0MDMwNzUzLzE2MjYyNDk4NDZfZGFkOWY0ZjA5M2FmZGNkNTgyZDQuanBlZyJdLFsicCIsInRodW1iIiwiNjAweDYwMCJdXQ.jpeg?sha=d0bf385890cc60fd'),(12,'紅',4,'https://cdn.cybassets.com/media/W1siZiIsIjEyOTM1L3Byb2R1Y3RzLzM0MDMwODY4LzE2MjYyNTEwNDZfMWMxMzVhNWMwYzNmYjAyNDFkN2EuanBlZyJdLFsicCIsInRodW1iIiwiNjAweDYwMCJdXQ.jpeg?sha=b7352ab5d84f101c'),(12,'綠',5,'https://cdn.cybassets.com/media/W1siZiIsIjEyOTM1L3Byb2R1Y3RzLzM0MDMwMjg1LzE2MjYyNDYzMDhfNzE0OTcwNWY5M2I1YjJhZmY3NjYuanBlZyJdLFsicCIsInRodW1iIiwiNjAweDYwMCJdXQ.jpeg?sha=c4a6e9a825e02317');
/*!40000 ALTER TABLE `product_colors` ENABLE KEYS */;
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
