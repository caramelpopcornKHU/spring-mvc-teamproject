-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: test_springboot
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `springboot_traffic`
--

DROP TABLE IF EXISTS `springboot_traffic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `springboot_traffic` (
  `id` int NOT NULL AUTO_INCREMENT,
  `req_class` varchar(200) DEFAULT NULL,
  `req_method` varchar(50) DEFAULT NULL,
  `req_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `springboot_traffic`
--

LOCK TABLES `springboot_traffic` WRITE;
/*!40000 ALTER TABLE `springboot_traffic` DISABLE KEYS */;
INSERT INTO `springboot_traffic` VALUES (2,'com.lx.team6springboot.controller.RestAPIMysqlController','getUser','2025-09-11 00:28:57'),(3,'com.lx.team6springboot.controller.RestAPIMysqlController','getUser','2025-09-11 00:30:53'),(4,'com.lx.team6springboot.controller.RestAPIMysqlController','sayHello','2025-09-11 00:32:19'),(5,'com.lx.team6springboot.controller.RestAPIMysqlController','createUser','2025-09-11 00:53:30'),(6,'com.lx.team6springboot.controller.RestAPIMysqlController','createUser','2025-09-11 00:54:00'),(7,'com.lx.team6springboot.controller.RestAPIMysqlController','getUser','2025-09-11 00:54:46'),(8,'com.lx.team6springboot.controller.RestAPIMysqlController','getUser','2025-09-11 00:54:58'),(9,'com.lx.team6springboot.controller.RestAPIMysqlController','getUser','2025-09-11 00:55:02'),(10,'com.lx.team6springboot.controller.RestAPIMysqlController','updateUser','2025-09-11 00:55:59'),(11,'com.lx.team6springboot.controller.RestAPIMysqlController','updateUser','2025-09-11 00:59:51'),(12,'com.lx.team6springboot.controller.RestAPIMysqlController','getUser','2025-09-11 01:01:17'),(13,'com.lx.team6springboot.controller.RestAPIMysqlController','getUser','2025-09-11 01:01:22'),(14,'com.lx.team6springboot.controller.RestAPIMysqlController','getUser','2025-09-11 01:01:42'),(15,'com.lx.team6springboot.controller.RestAPIMysqlController','sayHello','2025-09-11 01:02:18'),(16,'com.lx.team6springboot.controller.RestAPIMysqlController','createUser','2025-09-11 01:04:13'),(17,'com.lx.team6springboot.controller.RestAPIMysqlController','createUser','2025-09-11 01:05:04'),(18,'com.lx.team6springboot.controller.RestAPIMysqlController','getUser','2025-09-11 01:05:40'),(19,'com.lx.team6springboot.controller.RestAPIMysqlController','getUser','2025-09-11 01:06:02'),(20,'com.lx.team6springboot.controller.RestAPIMysqlController','getUser','2025-09-11 01:08:15'),(21,'com.lx.team6springboot.controller.RestAPIMysqlController','getUser','2025-09-11 01:08:34'),(22,'com.lx.team6springboot.controller.RestAPIMysqlController','getUser','2025-09-11 01:08:47'),(23,'com.lx.team6springboot.controller.RestAPIMysqlController','updateUser','2025-09-11 01:09:28'),(24,'com.lx.team6springboot.controller.RestAPIMysqlController','deleteUser','2025-09-11 01:10:05'),(25,'com.lx.team6springboot.controller.RestAPIMysqlController','deleteUser','2025-09-11 01:10:12'),(26,'com.lx.team6springboot.controller.RestAPIMysqlController','deleteUser','2025-09-11 01:10:32'),(27,'com.lx.team6springboot.controller.RestAPIMysqlController','deleteUser','2025-09-11 01:11:06');
/*!40000 ALTER TABLE `springboot_traffic` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-11 10:15:21
