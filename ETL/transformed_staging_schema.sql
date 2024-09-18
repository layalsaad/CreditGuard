-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: fraudulent_activities
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
-- Table structure for table `bank`
--

DROP TABLE IF EXISTS `bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank` (
  `TransactionID` text,
  `Category` text,
  `TransactionAmount` double DEFAULT NULL,
  `cc_num` bigint DEFAULT NULL,
  `Timestamp` datetime DEFAULT NULL,
  `MerchantName` text,
  `Location` text,
  `CustomerID` text,
  `CustomerName` text,
  `gender` text,
  `dob` text,
  `job` text,
  `Address` text,
  `FraudIndicator` bigint DEFAULT NULL,
  `fraud_type` bigint DEFAULT NULL,
  `Year` int DEFAULT NULL,
  `Month` int DEFAULT NULL,
  `Day` int DEFAULT NULL,
  `Day_of_Week` text,
  `Hour` int DEFAULT NULL,
  `Minute` int DEFAULT NULL,
  `Second` int DEFAULT NULL,
  `m_street` text,
  `m_city` text,
  `m_state` text,
  `m_zip` text,
  `c_street` text,
  `c_city` text,
  `c_state` text,
  `c_zip` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `credit_card`
--

DROP TABLE IF EXISTS `credit_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credit_card` (
  `trans_date_trans_time` datetime DEFAULT NULL,
  `cc_num` bigint DEFAULT NULL,
  `merchant` text,
  `category` text,
  `amt` double DEFAULT NULL,
  `first` text,
  `last` text,
  `gender` text,
  `street` text,
  `city` text,
  `state` text,
  `zip` bigint DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `long` double DEFAULT NULL,
  `city_pop` bigint DEFAULT NULL,
  `job` text,
  `dob` text,
  `trans_num` text,
  `unix_time` bigint DEFAULT NULL,
  `merch_lat` double DEFAULT NULL,
  `merch_long` double DEFAULT NULL,
  `is_fraud` bigint DEFAULT NULL,
  `customer_name` text,
  `fraud_type` bigint DEFAULT NULL,
  `Year` int DEFAULT NULL,
  `Month` int DEFAULT NULL,
  `Day` int DEFAULT NULL,
  `Day_of_Week` text,
  `Hour` int DEFAULT NULL,
  `Minute` int DEFAULT NULL,
  `Second` int DEFAULT NULL,
  `m_street` text,
  `m_city` text,
  `m_state` text,
  `m_zip` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
