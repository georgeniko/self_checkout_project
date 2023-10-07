-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: selfcheckoutdb
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `cart`
--
DROP SCHEMA IF EXISTS selfcheckoutdb;
CREATE SCHEMA selfcheckoutdb;
USE selfcheckoutdb;

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `Cart_ID` int unsigned NOT NULL,
  `Value` float(6,2) DEFAULT NULL,
  `Date_Time` datetime DEFAULT NULL,
  `Payment_Method` enum('Cash','Credit Card') DEFAULT NULL,
  `Code_String` char(10) DEFAULT NULL,
  `Store_ID` int unsigned NOT NULL,
  `Terminal_ID` int unsigned NOT NULL,
  `Card_Number` int unsigned DEFAULT NULL,
  PRIMARY KEY (`Cart_ID`),
  KEY `fk_Cart_Terminal1_idx` (`Store_ID`,`Terminal_ID`),
  KEY `fk_Cart_Discount_Code1_idx` (`Code_String`),
  KEY `fk_Cart_Customer1_idx` (`Card_Number`),
  CONSTRAINT `fk_Cart_Customer1` FOREIGN KEY (`Card_Number`) REFERENCES `customer` (`Card_Number`),
  CONSTRAINT `fk_Cart_Discount_Code1` FOREIGN KEY (`Code_String`) REFERENCES `discount_code` (`Code_String`),
  CONSTRAINT `fk_Cart_Terminal1` FOREIGN KEY (`Store_ID`, `Terminal_ID`) REFERENCES `terminal` (`Store_ID`, `Terminal_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (12,17.01,'2021-04-07 19:10:11','Credit Card','LM00004321',8,2,5867),(44,53.67,'2021-01-10 10:56:12','Cash',NULL,8,1,12456),(58,18.04,'2021-02-07 14:23:09','Cash',NULL,11,2,NULL),(91,3.99,'2021-02-22 17:04:23','Credit Card',NULL,17,1,78956),(112,241.30,'2021-02-20 13:48:56','Credit Card','AB00004567',16,1,12456),(147,496.49,'2021-03-12 11:49:34','Credit Card','LJ00004512',17,2,5867),(245,30.00,'2021-03-08 18:23:01','Credit Card',NULL,11,4,78956),(378,0.79,'2021-03-29 09:12:45','Cash',NULL,8,1,NULL),(567,89.23,'2021-03-29 09:15:05','Credit Card',NULL,8,1,NULL);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_has_product`
--

DROP TABLE IF EXISTS `cart_has_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_has_product` (
  `Cart_ID` int unsigned NOT NULL,
  `Barcode` varchar(15) NOT NULL,
  `Quantity` smallint unsigned DEFAULT NULL,
  PRIMARY KEY (`Cart_ID`,`Barcode`),
  KEY `fk_Cart_has_Product_Product1_idx` (`Barcode`),
  KEY `fk_Cart_has_Product_Cart1_idx` (`Cart_ID`),
  CONSTRAINT `fk_Cart_has_Product_Cart1` FOREIGN KEY (`Cart_ID`) REFERENCES `cart` (`Cart_ID`),
  CONSTRAINT `fk_Cart_has_Product_Product1` FOREIGN KEY (`Barcode`) REFERENCES `product` (`Barcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_has_product`
--

LOCK TABLES `cart_has_product` WRITE;
/*!40000 ALTER TABLE `cart_has_product` DISABLE KEYS */;
INSERT INTO `cart_has_product` VALUES (44,'20269937',1),(44,'5201673001034',5),(58,'5201083328318',3),(91,'5201673001034',2),(112,'5203278054873',1);
/*!40000 ALTER TABLE `cart_has_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `Card_Number` int unsigned NOT NULL,
  `Full_Name` varchar(50) DEFAULT NULL,
  `Contact_Number` char(10) DEFAULT NULL,
  PRIMARY KEY (`Card_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1356,'Georgios Nikolis','2310333333'),(5867,'Iliana Daniilidou','2310222222'),(12456,'Makis Kotsampasis','2310111111'),(14234,'Takis Tsoukalas','6922222222'),(58486,'Konstantinos Konstantinidis','6969420616'),(78576,'Lefteris Pantazis','6911111111'),(78956,'Paraskevas Koutsikos','6944444444');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `customer_buys_product`
--

DROP TABLE IF EXISTS `customer_buys_product`;
/*!50001 DROP VIEW IF EXISTS `customer_buys_product`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customer_buys_product` AS SELECT 
 1 AS `Card_Number`,
 1 AS `Full_Name`,
 1 AS `Date_Time`,
 1 AS `Barcode`,
 1 AS `Quantity`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `discount_code`
--

DROP TABLE IF EXISTS `discount_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount_code` (
  `Code_String` char(10) NOT NULL,
  `Expiration_Date` date DEFAULT NULL,
  `Discount_Percentage` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`Code_String`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount_code`
--

LOCK TABLES `discount_code` WRITE;
/*!40000 ALTER TABLE `discount_code` DISABLE KEYS */;
INSERT INTO `discount_code` VALUES ('AB00002356','2021-12-30',5),('AB00004567','2021-02-21',10),('BN00008798','2020-07-16',25),('BN00008799','2020-07-17',15),('BN00008898','2020-07-18',25),('GN00008798','2020-08-25',29),('GN00008799','2020-09-15',45),('JU00003213','2022-03-20',6),('LJ00004512','2021-03-25',19),('LM00004321','2021-04-08',20);
/*!40000 ALTER TABLE `discount_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `engineer_locations`
--

DROP TABLE IF EXISTS `engineer_locations`;
/*!50001 DROP VIEW IF EXISTS `engineer_locations`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `engineer_locations` AS SELECT 
 1 AS `SSN`,
 1 AS `Full_Name`,
 1 AS `Contact_Number`,
 1 AS `Store_ID`,
 1 AS `Location`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `engineer_maintains_store`
--

DROP TABLE IF EXISTS `engineer_maintains_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `engineer_maintains_store` (
  `SSN` char(9) NOT NULL,
  `Store_ID` int unsigned NOT NULL,
  PRIMARY KEY (`SSN`,`Store_ID`),
  KEY `fk_Maintenance_Engineer_has_Store_Store1_idx` (`Store_ID`),
  KEY `fk_Maintenance_Engineer_has_Store_Maintenance_Engineer1_idx` (`SSN`),
  CONSTRAINT `fk_Maintenance_Engineer_has_Store_Maintenance_Engineer1` FOREIGN KEY (`SSN`) REFERENCES `maintenance_engineer` (`SSN`),
  CONSTRAINT `fk_Maintenance_Engineer_has_Store_Store1` FOREIGN KEY (`Store_ID`) REFERENCES `store` (`Store_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engineer_maintains_store`
--

LOCK TABLES `engineer_maintains_store` WRITE;
/*!40000 ALTER TABLE `engineer_maintains_store` DISABLE KEYS */;
INSERT INTO `engineer_maintains_store` VALUES ('542113193',8),('351359809',11),('353541358',11),('359271749',16),('530593920',17);
/*!40000 ALTER TABLE `engineer_maintains_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance_engineer`
--

DROP TABLE IF EXISTS `maintenance_engineer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenance_engineer` (
  `SSN` char(9) NOT NULL,
  `Username` varchar(50) DEFAULT NULL,
  `Full_Name` varchar(50) DEFAULT NULL,
  `Contact_Number` char(10) DEFAULT NULL,
  PRIMARY KEY (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance_engineer`
--

LOCK TABLES `maintenance_engineer` WRITE;
/*!40000 ALTER TABLE `maintenance_engineer` DISABLE KEYS */;
INSERT INTO `maintenance_engineer` VALUES ('351359809','iongr','Ioanna Grammatikopoulou','6995453565'),('353541358','Konef','Konstantinos Efraimidis','6965722332'),('359271749','katriN','Katerina Nakou','6972856975'),('530593920','tram','Marios Petrou','6944544323'),('542113193','Rafpa','Rafail Papadakis','6962249452');
/*!40000 ALTER TABLE `maintenance_engineer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `Barcode` varchar(15) NOT NULL,
  `Image_Link` varchar(150) DEFAULT NULL,
  `Price` float(6,2) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Barcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('20269937','https://drive.google.com/file/d/1rGu8K03NqVsuR2Rp678NfekupviHgU5x/view?usp=sharing',1.20,'Κάλας Αλάτι Μαγειρικό Πλαστική Φιάλη 400gr'),('5201083328318','https://drive.google.com/file/d/1KPwjf1R7aytTqk7swssb6aYivwxgmJWE/view?usp=sharing',1.25,'Μεβγάλ Γιαούρτι Παραδοσιακό Πρόβειο 6,7% 300gr'),('5201673001034','https://drive.google.com/file/d/1Kg4dHYmWwp6iAOt7WWlgxdmQIA5o9YsC/view?usp=sharing',0.96,'Καραμολέγκος Μίνι Τοστ Σταρένιο 340gr'),('5203278054873','https://drive.google.com/file/d/14rNrT0vyALgVGoB0t02MkFiBY6sv3Zvj/view?usp=sharing',1.54,'Παπαδοπούλου Μπισκότα Digestive 250gr'),('8000500357729','https://drive.google.com/file/d/1PHViA6SgjjRnloyMcnMuremX3w8ghJkD/view?usp=sharing',2.96,'Ferrero Nutella Πραλίνα Βάζο 400gr');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store` (
  `Store_ID` int unsigned NOT NULL,
  `Location` varchar(80) DEFAULT NULL,
  `Contact_Number` char(10) DEFAULT NULL,
  PRIMARY KEY (`Store_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (8,'Agias Sofias 3, Thessaloniki','2310225568'),(11,'Delfon 54, Thessaloniki','2310857813'),(16,'Grigoriou Lampraki 186, Thessaloniki','2311965121'),(17,'Ioanni Pasalidi 152, Thessaloniki ','2310482271');
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_clerk`
--

DROP TABLE IF EXISTS `store_clerk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_clerk` (
  `SSN` char(9) NOT NULL,
  `Full_Name` varchar(50) DEFAULT NULL,
  `Contact_Number` char(10) DEFAULT NULL,
  `Work_Schedule` varchar(100) DEFAULT NULL,
  `Store_ID` int unsigned NOT NULL,
  PRIMARY KEY (`SSN`),
  KEY `fk_Store_Clerk_Store1_idx` (`Store_ID`),
  CONSTRAINT `fk_Store_Clerk_Store1` FOREIGN KEY (`Store_ID`) REFERENCES `store` (`Store_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_clerk`
--

LOCK TABLES `store_clerk` WRITE;
/*!40000 ALTER TABLE `store_clerk` DISABLE KEYS */;
INSERT INTO `store_clerk` VALUES ('122008932','Afroditi Zikou','6990013441','9:00-17:00 Mon-Sat',8),('335783561',' Anastasia Moura','6980456728','9:00-17:00 Mon \nWed Fri, 13:00-21:00 Tue Thu Sat',11),('432641895','Panagiota Anastasiou','6978845662','07:00-15:00 Mon-Fri',17),('678448901','Efstathios Charalampou','6989567821','13:00-21:00 Mon Wed Fri, 9:00-17:00 Tue Thu Sat',16);
/*!40000 ALTER TABLE `store_clerk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_has_product`
--

DROP TABLE IF EXISTS `store_has_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_has_product` (
  `Barcode` varchar(15) NOT NULL,
  `Store_ID` int unsigned NOT NULL,
  `Quantity` smallint unsigned DEFAULT NULL,
  PRIMARY KEY (`Barcode`,`Store_ID`),
  KEY `fk_Product_has_Store_Store1_idx` (`Store_ID`),
  KEY `fk_Product_has_Store_Product1_idx` (`Barcode`),
  CONSTRAINT `fk_Product_has_Store_Product1` FOREIGN KEY (`Barcode`) REFERENCES `product` (`Barcode`),
  CONSTRAINT `fk_Product_has_Store_Store1` FOREIGN KEY (`Store_ID`) REFERENCES `store` (`Store_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_has_product`
--

LOCK TABLES `store_has_product` WRITE;
/*!40000 ALTER TABLE `store_has_product` DISABLE KEYS */;
INSERT INTO `store_has_product` VALUES ('20269937',8,3530),('5201083328318',11,3900),('5201673001034',11,2000),('5201673001034',17,4000),('5203278054873',16,2800);
/*!40000 ALTER TABLE `store_has_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `store_sold_product`
--

DROP TABLE IF EXISTS `store_sold_product`;
/*!50001 DROP VIEW IF EXISTS `store_sold_product`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `store_sold_product` AS SELECT 
 1 AS `Store_ID`,
 1 AS `Barcode`,
 1 AS `Quantity`,
 1 AS `Date_Time`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `terminal`
--

DROP TABLE IF EXISTS `terminal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terminal` (
  `Store_ID` int unsigned NOT NULL,
  `Terminal_ID` int unsigned NOT NULL,
  `Terminal_Total` float(6,2) DEFAULT NULL,
  `Status` enum('Active','Busy','Down') DEFAULT NULL,
  `Language` enum('Greek','English') DEFAULT NULL,
  PRIMARY KEY (`Store_ID`,`Terminal_ID`),
  KEY `fk_Terminal_Store_idx` (`Store_ID`),
  CONSTRAINT `fk_Terminal_Store` FOREIGN KEY (`Store_ID`) REFERENCES `store` (`Store_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terminal`
--

LOCK TABLES `terminal` WRITE;
/*!40000 ALTER TABLE `terminal` DISABLE KEYS */;
INSERT INTO `terminal` VALUES (8,1,1027.56,'Active','Greek'),(8,2,8.40,'Down','Greek'),(11,1,744.03,'Busy','Greek'),(11,2,11.45,'Down','Greek'),(11,3,811.78,'Busy','Greek'),(11,4,188.40,'Active','Greek'),(16,1,107.98,'Busy','Greek'),(16,2,18.20,'Busy','Greek'),(17,1,56.35,'Active','English'),(17,2,88.40,'Active','Greek');
/*!40000 ALTER TABLE `terminal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `customer_buys_product`
--

/*!50001 DROP VIEW IF EXISTS `customer_buys_product`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_buys_product` AS select `customer`.`Card_Number` AS `Card_Number`,`customer`.`Full_Name` AS `Full_Name`,`cart`.`Date_Time` AS `Date_Time`,`cart_has_product`.`Barcode` AS `Barcode`,`cart_has_product`.`Quantity` AS `Quantity` from ((`customer` join `cart` on((`customer`.`Card_Number` = `cart`.`Card_Number`))) join `cart_has_product` on((`cart`.`Cart_ID` = `cart_has_product`.`Cart_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `engineer_locations`
--

/*!50001 DROP VIEW IF EXISTS `engineer_locations`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `engineer_locations` AS select `maintenance_engineer`.`SSN` AS `SSN`,`maintenance_engineer`.`Full_Name` AS `Full_Name`,`maintenance_engineer`.`Contact_Number` AS `Contact_Number`,`store`.`Store_ID` AS `Store_ID`,`store`.`Location` AS `Location` from ((`maintenance_engineer` join `engineer_maintains_store` on((`maintenance_engineer`.`SSN` = `engineer_maintains_store`.`SSN`))) join `store` on((`store`.`Store_ID` = `engineer_maintains_store`.`Store_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `store_sold_product`
--

/*!50001 DROP VIEW IF EXISTS `store_sold_product`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `store_sold_product` AS select `cart`.`Store_ID` AS `Store_ID`,`cart_has_product`.`Barcode` AS `Barcode`,`cart_has_product`.`Quantity` AS `Quantity`,`cart`.`Date_Time` AS `Date_Time` from (`cart` join `cart_has_product` on((`cart`.`Cart_ID` = `cart_has_product`.`Cart_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-19  0:48:29
