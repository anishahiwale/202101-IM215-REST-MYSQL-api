-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: donationdb
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `tbl_applog`
--

DROP TABLE IF EXISTS `tbl_applog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_applog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_applog`
--

LOCK TABLES `tbl_applog` WRITE;
/*!40000 ALTER TABLE `tbl_applog` DISABLE KEYS */;
INSERT INTO `tbl_applog` VALUES (1,'alpha21','2021-04-05 22:30:10');
/*!40000 ALTER TABLE `tbl_applog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_donations`
--

DROP TABLE IF EXISTS `tbl_donations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_donations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `donor_id` int DEFAULT NULL,
  `receiver_id` int DEFAULT NULL,
  `donationAmt` decimal(18,2) DEFAULT NULL,
  `transcation_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `donor_id_idx` (`donor_id`),
  KEY `receiver_id_idx` (`receiver_id`),
  CONSTRAINT `donor_id` FOREIGN KEY (`donor_id`) REFERENCES `tbl_donorinfo` (`id`),
  CONSTRAINT `receiver_id` FOREIGN KEY (`receiver_id`) REFERENCES `tbl_recieverinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_donations`
--

LOCK TABLES `tbl_donations` WRITE;
/*!40000 ALTER TABLE `tbl_donations` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_donations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_donorinfo`
--

DROP TABLE IF EXISTS `tbl_donorinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_donorinfo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `Dob` varchar(50) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `zipcode` varchar(10) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `emailid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_donorinfo`
--

LOCK TABLES `tbl_donorinfo` WRITE;
/*!40000 ALTER TABLE `tbl_donorinfo` DISABLE KEYS */;
INSERT INTO `tbl_donorinfo` VALUES (2,'donor','alpha21','alpha','char','male','01/01/2014','root','Street','3251','','us','2417854','ok@ok.com'),(12,'donor','Kevin45','kevin','jaysu','male','01/01/202','admin','Street','3251','','us','8745123','kevin@kevin.com');
/*!40000 ALTER TABLE `tbl_donorinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_recieverinfo`
--

DROP TABLE IF EXISTS `tbl_recieverinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_recieverinfo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `role` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_recieverinfo`
--

LOCK TABLES `tbl_recieverinfo` WRITE;
/*!40000 ALTER TABLE `tbl_recieverinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_recieverinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'donationdb'
--

--
-- Dumping routines for database 'donationdb'
--
/*!50003 DROP PROCEDURE IF EXISTS `USP_CRUD_Donorinfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_CRUD_Donorinfo`(
 IN username varchar(50) 
,IN Firstname varchar(50)
,IN lastname varchar(50)
,IN gender varchar(50)
,IN Dob varchar(50)
,IN password varchar(50)
,IN street varchar(50)
,IN zipcode varchar(50)
,IN city varchar(50)
,IN country varchar(50)
,IN phone varchar(50)
,IN emailid varchar(50)
,IN operation varchar(20)
)
BEGIN
	IF operation = 'insert' THEN
    INSERT INTO `donationdb`.`tbl_donorinfo`
(`role`,
`username`,
`firstname`,
`lastname`,
`gender`,
`Dob`,
`password`,
`street`,
`zipcode`,
`city`,
`country`,
`phone`,
`emailid`)
 VALUES
(
			'donor'
			,username  
			,Firstname
			,lastname 
			,gender   
			,Dob      
			,password 
			,street  
			,zipcode 
			,city    
			,country 
			,phone   
			,emailid 
);

Select 'inserted' as firstname;
    END IF ;
    IF operation = 'update' THEN
    UPDATE `donationdb`.`tbl_donorinfo`
SET
`firstname` = Firstname ,
`lastname` = lastname,
`gender` = gender,
`Dob` = Dob,
`street` = street,
`zipcode` = zipcode,
`city` = city,
`country` = country,
`phone` = phone,
`emailid` =emailid
WHERE `username` = username and 'password' = password ;

Select 'updated' as firstname;
		
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_Login_Update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_Login_Update`(
IN uname varchar(50),
IN pass varchar(50),
IN operation varchar(10)
)
BEGIN
DECLARE result INT;
IF operation = 'Login' THEN
    SELECT count(*) INTO result from tbl_donorinfo where username = uname and password = pass LIMIT 1 ;
    IF result = 1 THEN 
		Select firstname from tbl_donorinfo where username = uname and password = pass LIMIT 1 ;
        INSERT INTO `donationdb`.`tbl_applog`(`username`,`last_login`) VALUES  (uname, NOW());

	ELSE 
		Select 'lock' as firstname ;
    END IF;	
END IF;
IF operation = 'update' THEN
	Update tbl_donorinfo SET password = pass where username = uname;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-05 23:24:18
