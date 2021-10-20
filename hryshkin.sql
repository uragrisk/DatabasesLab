-- MySQL dump 10.13  Distrib 5.7.34, for Win64 (x86_64)
--
-- Host: localhost    Database: hryshkin
-- ------------------------------------------------------
-- Server version	5.7.34-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES ('Kharkiv','Kharkiv'),('Kyiv','Kyiv'),('Lviv','Lviv'),('Mukachevo','Transcarpathian'),('Lutsk','Volyn');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `office_hours`
--

LOCK TABLES `office_hours` WRITE;
/*!40000 ALTER TABLE `office_hours` DISABLE KEYS */;
INSERT INTO `office_hours` VALUES (1,'08:30:00','19:30:00'),(2,'08:00:00','19:00:00'),(3,'08:00:00','18:00:00'),(4,'08:00:00','19:00:00'),(5,'09:00:00','19:00:00'),(6,'09:00:00','19:00:00'),(7,'08:30:00','19:30:00');
/*!40000 ALTER TABLE `office_hours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `package`
--

LOCK TABLES `package` WRITE;
/*!40000 ALTER TABLE `package` DISABLE KEYS */;
INSERT INTO `package` VALUES (1,0.5,'Apple',1,3,9,NULL),(2,1.1,'Food',NULL,1,2,3),(3,50,'Door',6,3,1,NULL);
/*!40000 ALTER TABLE `package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `parcel_machine`
--

LOCK TABLES `parcel_machine` WRITE;
/*!40000 ALTER TABLE `parcel_machine` DISABLE KEYS */;
INSERT INTO `parcel_machine` VALUES (1,'Zelena  568',1008,'Kharkiv'),(2,'Khreshchatyk 123',123,'Kyiv'),(3,'Volya 56',145,'Lutsk');
/*!40000 ALTER TABLE `parcel_machine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `post_office`
--

LOCK TABLES `post_office` WRITE;
/*!40000 ALTER TABLE `post_office` DISABLE KEYS */;
INSERT INTO `post_office` VALUES (1,'Lychakivska 156',40,'Lviv',1),(3,'Khreshchatyk 1',1,'Kyiv',3),(4,'Zelena  68',56,'Kharkiv',5),(5,'Svitla 97',93,'Lutsk',2),(6,'Lvivska 103',43,'Mukachevo',4);
/*!40000 ALTER TABLE `post_office` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `recipient`
--

LOCK TABLES `recipient` WRITE;
/*!40000 ALTER TABLE `recipient` DISABLE KEYS */;
INSERT INTO `recipient` VALUES (1,'Andrii','Horich','+38099648823','36987','Bila 98','00103','Kyiv'),(2,'Vova','Heroi','+38097648823','69488','Nova 96/8','75236','Lviv'),(3,'Nazar','Hrushch','+38095848823','36987','Pole 98','58754','Lutsk');
/*!40000 ALTER TABLE `recipient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES ('Kharkiv'),('Kyiv'),('Lviv'),('Transcarpathian'),('Volyn');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sender`
--

LOCK TABLES `sender` WRITE;
/*!40000 ALTER TABLE `sender` DISABLE KEYS */;
INSERT INTO `sender` VALUES (1,'Yura','Hryshkin','+38099568236','0012356'),(2,'Igor','Naliv','+38099789823','1235694'),(9,'Maxym','Gort','+38096789823','6589452');
/*!40000 ALTER TABLE `sender` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-20  8:19:52
