CREATE DATABASE  IF NOT EXISTS `umm-jair-martinez` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `umm-jair-martinez`;
-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: umm-jair-martinez
-- ------------------------------------------------------
-- Server version	8.4.6

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
-- Table structure for table `sweets`
--

DROP TABLE IF EXISTS `sweets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sweets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `menu_name_cat` varchar(255) DEFAULT NULL,
  `name_cat` varchar(255) DEFAULT NULL,
  `descripcio_cat` text,
  `menu_name_esp` varchar(255) DEFAULT NULL,
  `name_esp` varchar(255) DEFAULT NULL,
  `descripcio_esp` text,
  `preu` varchar(50) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sweets`
--

LOCK TABLES `sweets` WRITE;
/*!40000 ALTER TABLE `sweets` DISABLE KEYS */;
INSERT INTO `sweets` VALUES (1,'Castanyada','Panellets de pinyons','Elaborats amb pinyons de primera qualitat.','Castañada','Panellets de piñones','Elaborados con piñones de primera calidad.','7.95 €/Kg','panellets-pinyons.jpeg'),(2,'Castanyada','Panellets d\'ametlla','Fets amb ametlles torrades i sucre.','Castañada','Panellets de almendra','Hechos con almendras tostadas y azúcar.','6.95 €/Kg','panellets-dametlla-2.jpeg'),(3,'Castanyada','Assortiment de panellets','Assortiment de panellets: pinyons, ametlla i coco.','Castañada','Surtido de panellets','Surtido de panellets: piñones, almendra y coco.','7.25 €/Kg','Panellets-assortiment.webp'),(4,'Castanyada','Castanyes al forn','Castanyes al forn acabades de coure.','Castañada','Castañas al horno','Castañas al horno recién hechas.','5.25 €/Kg','castanyes.webp'),(5,'Pastissos','Pastís de xocolata','Pastís esponjós amb cobertura de xocolata negra.','Pasteles','Pastel de chocolate','Pastel esponjoso con cobertura de chocolate negro','15.00 €/u','pastis-de-xocolata_2.jpg'),(6,'Pastissos','Pastís de maduixa','Pastís fresc amb crema i maduixes naturals.','Pasteles','Pastel de fresa','Pastel fresco con crema y fresas naturales.','14.50 €/u','pastis-de-maduixa.webp'),(7,'Brioixeria','Croissant de mantega','Croissant artesanal fet amb mantega de primera qualitat.','Bollería','Croissant de mantequilla','Croissant artesanal hecho con mantequilla de primera calidad.','2.50 €/u','croissants.webp'),(8,'Brioixeria','Croissant de xocolata','Croissant farcit de xocolata suau i cremosa.','Bollería','Croissant de chocolate','Croissant relleno de chocolate suave y cremoso.','2.80 €/u','croissant_xocolata.webp'),(9,'Brioixeria','Ensaimada','Ensaimada tradicional mallorquina, lleugera i esponjosa.','Bollería','Ensaimada','Ensaimada tradicional mallorquina, ligera y esponjosa.','3.00 €/u','ensaimada.webp');
/*!40000 ALTER TABLE `sweets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-30  9:15:45

-- Creo el usuario 'magda' con contraseña 'magda'
CREATE USER 'magda'@'localhost' IDENTIFIED BY 'magda';

-- Asigno permisos de consulta, inserción, actualización y borrado 
GRANT SELECT, INSERT, UPDATE, DELETE ON `Umm-Jair-Martinez`.* TO 'magda'@'localhost';

-- Aplico los cambios de permisos
FLUSH PRIVILEGES;