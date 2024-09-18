-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: fraud_dwh
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `d_address`
--

DROP TABLE IF EXISTS `d_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `d_address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `c_id` int DEFAULT NULL,
  `m_id` int DEFAULT NULL,
  `street_id` int DEFAULT NULL,
  `city_id` int DEFAULT NULL,
  `state_id` int DEFAULT NULL,
  `zipcode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_address` (`m_id`,`street_id`,`city_id`,`state_id`,`zipcode`),
  KEY `c_id_idx` (`c_id`),
  KEY `street_id_idx` (`street_id`),
  KEY `city_id_idx` (`city_id`),
  KEY `state_id_idx` (`state_id`),
  CONSTRAINT `c_id` FOREIGN KEY (`c_id`) REFERENCES `d_customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `city_id` FOREIGN KEY (`city_id`) REFERENCES `d_city` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `m_id` FOREIGN KEY (`m_id`) REFERENCES `d_merchant` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `state_id` FOREIGN KEY (`state_id`) REFERENCES `d_state` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `street_id` FOREIGN KEY (`street_id`) REFERENCES `d_street` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=969672 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `d_category`
--

DROP TABLE IF EXISTS `d_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `d_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `d_city`
--

DROP TABLE IF EXISTS `d_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `d_city` (
  `id` int NOT NULL AUTO_INCREMENT,
  `city_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28229 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `d_customer`
--

DROP TABLE IF EXISTS `d_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `d_customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `job_id` int DEFAULT NULL,
  `dob` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_id_idx` (`job_id`),
  CONSTRAINT `job_id` FOREIGN KEY (`job_id`) REFERENCES `d_job` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25597 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `d_day_of_week`
--

DROP TABLE IF EXISTS `d_day_of_week`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `d_day_of_week` (
  `id` int NOT NULL AUTO_INCREMENT,
  `day_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `d_fraud`
--

DROP TABLE IF EXISTS `d_fraud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `d_fraud` (
  `id` int NOT NULL,
  `fraud_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `d_job`
--

DROP TABLE IF EXISTS `d_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `d_job` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_name` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=566 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `d_merchant`
--

DROP TABLE IF EXISTS `d_merchant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `d_merchant` (
  `id` int NOT NULL AUTO_INCREMENT,
  `merchant_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9391 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `d_month`
--

DROP TABLE IF EXISTS `d_month`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `d_month` (
  `month_number` int NOT NULL AUTO_INCREMENT,
  `month_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`month_number`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `d_state`
--

DROP TABLE IF EXISTS `d_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `d_state` (
  `id` int NOT NULL AUTO_INCREMENT,
  `state_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=331 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `d_street`
--

DROP TABLE IF EXISTS `d_street`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `d_street` (
  `id` int NOT NULL AUTO_INCREMENT,
  `street_name` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51037 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `d_timestamp`
--

DROP TABLE IF EXISTS `d_timestamp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `d_timestamp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `trans_timestamp` datetime DEFAULT NULL,
  `trans_year` int DEFAULT NULL,
  `month_number` int DEFAULT NULL,
  `trans_day` int DEFAULT NULL,
  `day_of_week_id` int DEFAULT NULL,
  `trans_hour` int DEFAULT NULL,
  `trans_minute` int DEFAULT NULL,
  `trans_second` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `month_number_idx` (`month_number`),
  KEY `day_of_week_id_idx` (`day_of_week_id`),
  CONSTRAINT `day_of_week_id` FOREIGN KEY (`day_of_week_id`) REFERENCES `d_day_of_week` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `month_number` FOREIGN KEY (`month_number`) REFERENCES `d_month` (`month_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32765 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `f_transaction`
--

DROP TABLE IF EXISTS `f_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `f_transaction` (
  `transaction_id` varchar(45) NOT NULL,
  `timestamp_id` int DEFAULT NULL,
  `merchant_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `cc_num` varchar(45) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `amount` double(10,2) DEFAULT NULL,
  `fraud_id` int DEFAULT NULL,
  `fraud_indicator` int DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `timestamp_id_idx` (`timestamp_id`),
  KEY `merchant_id_idx` (`merchant_id`),
  KEY `customer_id_idx` (`customer_id`),
  KEY `category_id_idx` (`category_id`),
  KEY `fraud_id_idx` (`fraud_id`),
  CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `d_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customer_id` FOREIGN KEY (`customer_id`) REFERENCES `d_customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fraud_id` FOREIGN KEY (`fraud_id`) REFERENCES `d_fraud` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `merchant_id` FOREIGN KEY (`merchant_id`) REFERENCES `d_merchant` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `timestamp_id` FOREIGN KEY (`timestamp_id`) REFERENCES `d_timestamp` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;