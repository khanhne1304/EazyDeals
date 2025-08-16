CREATE DATABASE  IF NOT EXISTS `eazydeals` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `eazydeals`;


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



DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'Phan Le Chi Khanh','test@gmail.com','admin','22110348'),(4,'Nguyen Ngoc Kin Hao','test1@gmail.com','admin','22110314');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;



DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int DEFAULT NULL,
  `pid` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid_idx` (`uid`),
  KEY `pid_idx` (`pid`),
  CONSTRAINT `pid` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`),
  CONSTRAINT `uid` FOREIGN KEY (`uid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1, 1, 1, 2),(2, 3, 3, 1);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1, 'Giày thể thao', 'sports.jpg'),(2, 'Giày sang trọng', 'formal_shoes.jpg'),(3, 'Sandals', 'sandals.jpg'),(4, 'Giày trẻ em', 'kids_shoes.jpg');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderid` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `paymentType` varchar(100) DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `userId_idx` (`userId`),
  CONSTRAINT `userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'ORD-20230924105716','Đã đặt hàng','COD',1,'2023-09-24 05:27:16'),(2,'ORD-20230924110928','Đã đặt hàng','COD',1,'2023-09-24 05:39:28'),(3,'ORD-20230924111023','Đã đặt hàng','COD',1,'2023-09-24 05:40:23'),(4,'ORD-20230924111502','Đã đặt hàng','COD',1,'2023-09-24 05:45:02'),(5,'ORD-20230924112315','Đã đặt hàng','COD',1,'2023-09-24 05:53:15'),(6,'ORD-20230924115427','Đã đặt hàng','online',1,'2023-09-24 06:24:27'),(7,'ORD-20230924115652','Đã đặt hàng','online',1,'2023-09-24 06:26:52');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;



DROP TABLE IF EXISTS `ordered_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordered_product` (
  `oid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `orderid` int DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `orderid_idx` (`orderid`),
  CONSTRAINT `orderid` FOREIGN KEY (`orderid`) REFERENCES `order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



LOCK TABLES `ordered_product` WRITE;
/*!40000 ALTER TABLE `ordered_product` DISABLE KEYS */;
INSERT INTO `ordered_product` VALUES (1,'Nike Air Max 90',50,'120.00','nike-air-max-900.jpg',3),(2,'Adidas Ultraboost',30,'150000.0','adidas_ultraboost.jpg',4), (3, 'Clarks Formal Leather Shoes',20, '100.00', 'clark_formal.jpg', 2);
/*!40000 ALTER TABLE `ordered_product` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `price` varchar(20) NOT NULL,
  `quantity` int DEFAULT NULL,
  `discount` int DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `cid` int DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `cid_idx` (`cid`),
  CONSTRAINT `cid` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1, 'Nike Air Max 90', 'Thoải mái, thời trang, thích hợp để chạy bộ', '120000.00', 50, 10, 'nike-air-max-900.jpg', 1),(2, 'Adidas Ultraboost', 'Êm ái, phù hợp cho người hay vận động', '1500000.00', 30, 15, 'adidas_ultraboost.jpg', 1),(3, 'Clarks Formal Leather Shoes', 'Thanh lịch và sang trọng, phù hợp với những dịp trang trọng', '1000000.00', 20, 5, 'clark_formal.jpg', 2),(4, 'Birkenstock Sandals', 'Sự bền bỉ và thoải mái', '800000.00', 40, 12, 'birkenstock_sandal.jpg', 3),(5, 'Nike Kids Sneakers', 'Giày thời thượng hợp xu thế cho trẻ em', '900000.00', 25, 8, 'nike_kid_sneakers.jpg', 4),(6, 'Nike JR', 'Thoải mái, thời trang, thích hợp để chạy bộ cho trẻ em ', '120000.00', 50, 10, 'jr-kid.png', 4);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `registerdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `address` varchar(250) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `pincode` varchar(10) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `phone_UNIQUE` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Phan Le Chi Khanh','chikhanhphanle2004@gmail.com','test','22110348','Male','2024-09-24 05:22:11','Long Ho','Vinh Long','84000','VietNam');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;



DROP TABLE IF EXISTS `wishlist`;

CREATE TABLE `wishlist` (
  `idwishlist` int NOT NULL AUTO_INCREMENT,
  `iduser` int DEFAULT NULL,
  `idproduct` int DEFAULT NULL,
  PRIMARY KEY (`idwishlist`),
  KEY `idproduct_idx` (`idproduct`),
  KEY `iduser_idx` (`iduser`),
  CONSTRAINT `idproduct` FOREIGN KEY (`idproduct`) REFERENCES `product` (`pid`),
  CONSTRAINT `iduser` FOREIGN KEY (`iduser`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
INSERT INTO `wishlist` VALUES (1, 1, 2),(2, 3, 4);
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;
