-- MySQL dump 10.13  Distrib 8.0.20, for macos10.15 (x86_64)
--
-- Host: localhost    Database: design
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
-- Table structure for table `Equipment`
--

DROP TABLE IF EXISTS `Equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Equipment` (
  `EID` decimal(10,0) NOT NULL,
  `RID` decimal(10,0) NOT NULL,
  `ename` char(10) NOT NULL,
  `type` char(5) NOT NULL,
  `plimit` char(5) NOT NULL,
  `llimit` int NOT NULL,
  `edisc` char(100) NOT NULL,
  `attack` int DEFAULT NULL,
  `defence` int DEFAULT NULL,
  PRIMARY KEY (`EID`),
  UNIQUE KEY `Equipment_PK` (`EID`),
  KEY `have_FK` (`RID`),
  CONSTRAINT `FK_EQUIPMEN_HAVE_ROLE` FOREIGN KEY (`RID`) REFERENCES `Role` (`RID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Equipment`
--

LOCK TABLES `Equipment` WRITE;
/*!40000 ALTER TABLE `Equipment` DISABLE KEYS */;
INSERT INTO `Equipment` VALUES (1,1,'bow','bow','arc',1,'a ranged weapon system consisting of an elastic launching device',6,1),(2,1,'crossbow','bow','arc',5,'a ranged weapon using an elastic launching device similar to a bow',8,1),(3,1,'staff','stick','wiz',1,'a thin, light-weight rod that is held with one hand',6,0),(4,1,'scepter','stick','wiz',5,' staff or wand held in the hand by a ruling monarch',10,0),(5,1,'longaxe','axe','ber',1,'an implement that has been used for millennia to shape, split and cut wood',4,3),(6,1,'hatchet','axe','ber',5,'a single-handed striking tool with a sharp blade on one side',5,3),(7,1,'dagger','sword','sman',5,'a short knife with high danger',9,0),(8,1,'falchion','sword','sman',10,'a one-handed, single-edged sword of European origin',6,6),(9,1,'woodsword','sword','sman',1,'a sword made of wood',3,4),(15,1,'hatchet','axe','ber',5,'a single-handed striking tool with a sharp blade on one side',5,3);
/*!40000 ALTER TABLE `Equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Item`
--

DROP TABLE IF EXISTS `Item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Item` (
  `IID` decimal(10,0) NOT NULL,
  `RID` decimal(10,0) NOT NULL,
  `iname` char(10) NOT NULL,
  `itype` char(5) NOT NULL,
  `ieffect` char(50) DEFAULT NULL,
  `idisc` char(100) DEFAULT NULL,
  PRIMARY KEY (`IID`),
  UNIQUE KEY `Item_PK` (`IID`),
  KEY `own_FK` (`RID`),
  CONSTRAINT `FK_ITEM_OWN_ROLE` FOREIGN KEY (`RID`) REFERENCES `Role` (`RID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Item`
--

LOCK TABLES `Item` WRITE;
/*!40000 ALTER TABLE `Item` DISABLE KEYS */;
INSERT INTO `Item` VALUES (1,1,'agate','gem','accessory','a common rock formation, consisting of chalcedony and quartz'),(2,1,'amber','gem','accessory','fossilized tree resin'),(3,1,'emerald','gem','accessory','a gemstone and a variety of the mineral beryl'),(4,1,'jade','gem','accessory','an ornamental mineral');
/*!40000 ALTER TABLE `Item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NPC`
--

DROP TABLE IF EXISTS `NPC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NPC` (
  `NID` decimal(10,0) NOT NULL,
  `nname` char(10) NOT NULL,
  `position` char(10) NOT NULL,
  `ntype` char(5) NOT NULL,
  PRIMARY KEY (`NID`),
  UNIQUE KEY `NPC_PK` (`NID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NPC`
--

LOCK TABLES `NPC` WRITE;
/*!40000 ALTER TABLE `NPC` DISABLE KEYS */;
INSERT INTO `NPC` VALUES (1,'A','Xian','task'),(2,'B','Tianjin','task'),(3,'C','Chongqing','task');
/*!40000 ALTER TABLE `NPC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Player`
--

DROP TABLE IF EXISTS `Player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Player` (
  `PID` char(10) NOT NULL,
  `username` char(10) NOT NULL,
  `password` decimal(10,0) NOT NULL,
  `pname` char(10) NOT NULL,
  PRIMARY KEY (`PID`),
  UNIQUE KEY `Player_PK` (`PID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Player`
--

LOCK TABLES `Player` WRITE;
/*!40000 ALTER TABLE `Player` DISABLE KEYS */;
INSERT INTO `Player` VALUES ('1','Lothar',123,'SHI'),('2','Feiron',321,'LI'),('3','Marcy',132,'HOU');
/*!40000 ALTER TABLE `Player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Role`
--

DROP TABLE IF EXISTS `Role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Role` (
  `RID` decimal(10,0) NOT NULL,
  `PID` char(10) NOT NULL,
  `level` int NOT NULL,
  `strength` int NOT NULL,
  `speed` int NOT NULL,
  `intelligence` int NOT NULL,
  `profession` char(5) NOT NULL,
  `hequipment` decimal(10,0) NOT NULL,
  PRIMARY KEY (`RID`),
  UNIQUE KEY `Role_PK` (`RID`),
  KEY `Create_FK` (`PID`),
  CONSTRAINT `FK_ROLE_CREATE_PLAYER` FOREIGN KEY (`PID`) REFERENCES `Player` (`PID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Role`
--

LOCK TABLES `Role` WRITE;
/*!40000 ALTER TABLE `Role` DISABLE KEYS */;
INSERT INTO `Role` VALUES (1,'1',10,10,15,25,'wiz',4),(2,'1',10,20,5,15,'ber',4),(3,'2',5,10,15,15,'arc',4),(4,'3',5,15,10,10,'sman',4);
/*!40000 ALTER TABLE `Role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Task`
--

DROP TABLE IF EXISTS `Task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Task` (
  `TID` decimal(10,0) NOT NULL,
  `RID` decimal(10,0) NOT NULL,
  `NID` decimal(10,0) NOT NULL,
  `tname` char(20) NOT NULL,
  `llimit` int NOT NULL,
  `plimit` char(5) NOT NULL,
  `ttype` char(5) NOT NULL,
  `tstatus` char(5) NOT NULL,
  `tdisc` char(100) DEFAULT NULL,
  PRIMARY KEY (`TID`),
  UNIQUE KEY `Task_PK` (`TID`),
  KEY `Accept_FK` (`RID`),
  KEY `Issue_FK` (`NID`),
  CONSTRAINT `FK_TASK_ACCEPT_ROLE` FOREIGN KEY (`RID`) REFERENCES `Role` (`RID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_TASK_ISSUE_NPC` FOREIGN KEY (`NID`) REFERENCES `NPC` (`NID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Task`
--

LOCK TABLES `Task` WRITE;
/*!40000 ALTER TABLE `Task` DISABLE KEYS */;
INSERT INTO `Task` VALUES (1,1,1,'save_queen',1,'wiz','adv','fin','save the queen'),(2,1,2,'save_king',10,'ber','dec','unfin','save the king'),(3,1,3,'save_princess',1,'arc','dec','unfin','save the princess'),(4,1,1,'save_prince',5,'sman','adv','fin','save the prince'),(5,1,2,'save_yourself',10,'wiz','dec','unfin','save yourself');
/*!40000 ALTER TABLE `Task` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-05 11:21:00
