-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: up_demo
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `userMail` varchar(255) NOT NULL,
  `goodArticle` varchar(6) NOT NULL,
  `count` int DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `fk_user_cart_idx` (`userMail`),
  KEY `fk_good_cart_idx` (`goodArticle`),
  CONSTRAINT `fk_good_cart` FOREIGN KEY (`goodArticle`) REFERENCES `goods` (`good_article`),
  CONSTRAINT `fk_user_cart` FOREIGN KEY (`userMail`) REFERENCES `users` (`user_mail`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Женская обувь'),(2,'Мужская обувь');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods` (
  `good_article` varchar(6) NOT NULL,
  `good_name` varchar(255) NOT NULL,
  `unit_id` int DEFAULT NULL,
  `good_price` float DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  `manufacturer_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `good_discount` int DEFAULT NULL,
  `goods_actual_count` int DEFAULT NULL,
  `good_description` text,
  `good_image` text,
  `good_status` int DEFAULT NULL,
  PRIMARY KEY (`good_article`),
  KEY `fk_unit_idx` (`unit_id`),
  KEY `fk_supplier_idx` (`supplier_id`),
  KEY `fk_manu_idx` (`manufacturer_id`),
  KEY `fk_category_idx` (`category_id`),
  CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`),
  CONSTRAINT `fk_manu` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturers` (`manufacturer_id`),
  CONSTRAINT `fk_supplier` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`),
  CONSTRAINT `fk_unit` FOREIGN KEY (`unit_id`) REFERENCES `units` (`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES ('ARF123','qwe',1,1256,1,2,1,10,100,'fwef',NULL,NULL),('ART445','AAAA',1,2000,1,1,1,50,111,'qweqweeqw',NULL,NULL),('B320R5','Туфли',1,4300,1,5,1,2,6,'Туфли Rieker женские демисезонные, размер 41, цвет коричневый','9.jpg',1),('B431R5','Ботинки',1,2700,2,5,2,2,5,'Мужские кожаные ботинки/мужские ботинки','',1),('C436G5','Ботинки',1,10200,1,1,1,15,9,'Ботинки женские, ARGO, размер 40','',1),('D268G5','Туфли',1,4399,2,5,1,3,12,'Туфли Rieker женские демисезонные, размер 36, цвет коричневый','',1),('D329H3','Полуботинки',1,1890,2,1,1,4,4,'Полуботинки Alessio Nesca женские 3-30797-47, размер 37, цвет: бордовый','8.jpg',1),('D364R4','Туфли',1,12400,1,3,1,16,5,'Туфли Luiza Belly женские Kate-lazo черные из натуральной замши','',1),('D572U8','Кроссовки',1,4100,2,6,2,3,6,'129615-4 Кроссовки мужские','6.jpg',1),('E482R4','Полуботинки',1,1800,1,3,1,2,14,'Полуботинки kari женские MYZ20S-149, размер 41, цвет: черный','',1),('F427R5','Ботинки',1,11800,2,5,1,15,11,'Ботинки на молнии с декоративной пряжкой FRAU','',1),('F572H7','Туфли',1,2700,1,4,1,2,14,'Туфли Marco Tozzi женские летние, размер 39, цвет черный','7.jpg',1),('F635R4','Ботинки',1,3244,2,4,1,2,13,'Ботинки Marco Tozzi женские демисезонные, размер 39, цвет бежевый','2.jpg',1),('G432E4','Туфли',1,2800,1,3,1,3,15,'Туфли kari женские TR-YR-413017, размер 37, цвет: черный','10.jpg',1),('G531F4','Ботинки',1,6600,1,3,1,12,9,'Ботинки женские зимние ROMER арт. 893167-01 Черный','',1),('G783F5','Ботинки',1,5900,1,6,2,2,8,'Мужские ботинки Рос-Обувь кожаные с натуральным мехом','4.jpg',1),('H535R5','Ботинки',1,2300,2,5,1,2,7,'Женские Ботинки демисезонные','',1),('H782T5','Туфли',1,4499,1,3,2,4,5,'Туфли kari мужские классика MYZ21AW-450A, размер 43, цвет: черный','3.jpg',1),('J384T6','Ботинки',1,3800,2,5,2,2,16,'B3430/14 Полуботинки мужские Rieker','5.jpg',1),('J542F5','Тапочки',1,500,1,3,2,13,0,'Тапочки мужские Арт.70701-55-67син р.41','',1),('K345R4','Полуботинки',1,2100,2,2,2,2,3,'407700/01-02 Полуботинки мужские CROSBY','',1),('K358H6','Тапочки',1,599,1,5,2,20,2,'Тапочки мужские син р.41','',1),('L754R4','Полуботинки',1,1700,1,3,1,2,7,'Полуботинки kari женские WB2020SS-26, размер 38, цвет: черный','',1),('M542T5','Кроссовки',1,2800,2,5,2,18,3,'Кроссовки мужские TOFA','',1),('N457T5','Полуботинки',1,4600,1,2,1,3,13,'Полуботинки Ботинки черные зимние, мех','',1),('O754F4','Туфли',1,5400,2,5,1,4,18,'Туфли женские демисезонные Rieker артикул 55073-68/37','',1),('P764G4','Туфли',1,6800,1,2,1,15,15,'Туфли женские, ARGO, размер 38','',1),('S213E3','Полуботинки',1,2156,2,2,2,3,6,'407700/01-01 Полуботинки мужские CROSBY','',1),('S326R5','Тапочки',1,9900,2,2,2,17,15,'Мужские кожаные тапочки \"Профиль С.Дали\" ','',1),('S634B5','Кеды',1,5500,2,2,2,3,0,'Кеды Caprice мужские демисезонные, размер 42, цвет черный','',1),('T324F5','Сапоги',1,4699,1,2,1,2,5,'Сапоги замша Цвет: синий','',1),('А112Т4','Ботинки',1,4990,1,3,1,3,6,'Женские Ботинки демисезонные kari','1.jpg',1);
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturers`
--

DROP TABLE IF EXISTS `manufacturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manufacturers` (
  `manufacturer_id` int NOT NULL AUTO_INCREMENT,
  `manufacturer_name` varchar(255) NOT NULL,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturers`
--

LOCK TABLES `manufacturers` WRITE;
/*!40000 ALTER TABLE `manufacturers` DISABLE KEYS */;
INSERT INTO `manufacturers` VALUES (1,'Alessio Nesca'),(2,'CROSBY'),(3,'Kari'),(4,'Marco Tozzi'),(5,'Rieker'),(6,'Рос');
/*!40000 ALTER TABLE `manufacturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_goods`
--

DROP TABLE IF EXISTS `order_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_goods` (
  `order_id` int NOT NULL,
  `good_article` varchar(6) NOT NULL,
  `count` int DEFAULT NULL,
  PRIMARY KEY (`order_id`,`good_article`),
  KEY `fk_order_goods_idx` (`order_id`),
  KEY `fk_goods_order_idx` (`good_article`),
  CONSTRAINT `fk_goods_order` FOREIGN KEY (`good_article`) REFERENCES `goods` (`good_article`),
  CONSTRAINT `fk_order_goods` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_goods`
--

LOCK TABLES `order_goods` WRITE;
/*!40000 ALTER TABLE `order_goods` DISABLE KEYS */;
INSERT INTO `order_goods` VALUES (1,'F635R4',2),(1,'А112Т4',2),(2,'G783F5',1),(2,'H782T5',1),(3,'D572U8',10),(3,'J384T6',10),(4,'D329H3',4),(4,'F572H7',5),(5,'F635R4',2),(5,'А112Т4',2),(6,'G783F5',1),(6,'H782T5',1),(7,'D572U8',10),(7,'J384T6',10),(8,'D329H3',4),(8,'F572H7',5),(9,'B320R5',5),(9,'G432E4',1),(10,'E482R4',5),(10,'S213E3',5),(13,'ARF123',1);
/*!40000 ALTER TABLE `order_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_statuses`
--

DROP TABLE IF EXISTS `order_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_statuses` (
  `status_id` int NOT NULL AUTO_INCREMENT,
  `status_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_statuses`
--

LOCK TABLES `order_statuses` WRITE;
/*!40000 ALTER TABLE `order_statuses` DISABLE KEYS */;
INSERT INTO `order_statuses` VALUES (1,'Завершен'),(2,'Новый');
/*!40000 ALTER TABLE `order_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `order_date` date DEFAULT NULL,
  `deliver_date` date DEFAULT NULL,
  `pickup_id` int DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `order_code` varchar(3) DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk_pickup_idx` (`pickup_id`),
  KEY `fk_user_idx` (`user_email`),
  KEY `fk_status_idx` (`status_id`),
  CONSTRAINT `fk_pickup` FOREIGN KEY (`pickup_id`) REFERENCES `pickup_point` (`pickup_id`),
  CONSTRAINT `fk_status` FOREIGN KEY (`status_id`) REFERENCES `order_statuses` (`status_id`),
  CONSTRAINT `fk_user` FOREIGN KEY (`user_email`) REFERENCES `users` (`user_mail`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2025-02-27','2025-04-20',1,'1diph5e@tutanota.com','901',1),(2,'2022-09-28','2025-04-21',11,'94d5ous@gmail.com','902',1),(3,'2025-03-21','2025-04-22',2,'uth4iz@mail.com','903',1),(4,'2025-02-20','2025-04-23',11,'yzls62@outlook.com','904',1),(5,'2025-03-17','2025-04-24',2,'1diph5e@tutanota.com','905',1),(6,'2025-03-01','2025-04-25',15,'94d5ous@gmail.com','906',1),(7,'2025-02-28','2025-04-26',3,'uth4iz@mail.com','907',1),(8,'2025-03-31','2025-04-27',19,'yzls62@outlook.com','908',2),(9,'2025-04-02','2025-04-28',5,'1diph5e@tutanota.com','909',2),(10,'2025-04-03','2025-04-29',19,'1diph5e@tutanota.com','910',2),(13,'2026-03-12','2026-03-15',14,'1qz4kw@mail.com','295',2);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pickup_point`
--

DROP TABLE IF EXISTS `pickup_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pickup_point` (
  `pickup_id` int NOT NULL AUTO_INCREMENT,
  `pickup_index` varchar(6) DEFAULT NULL,
  `pickup_city` varchar(255) DEFAULT NULL,
  `pickup_street` varchar(255) DEFAULT NULL,
  `pickup_num_house` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`pickup_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pickup_point`
--

LOCK TABLES `pickup_point` WRITE;
/*!40000 ALTER TABLE `pickup_point` DISABLE KEYS */;
INSERT INTO `pickup_point` VALUES (1,'420151','Лесной','Вишневая','32'),(2,'125061','Лесной','Подгорная','8'),(3,'630370','Лесной','Шоссейная','24'),(4,'400562','Лесной','Зеленая','32'),(5,'614510','Лесной','Маяковского','47'),(6,'410542','Лесной','Светлая','46'),(7,'620839','Лесной','Цветочная','8'),(8,'443890','Лесной','Коммунистическая','1'),(9,'603379','Лесной','Спортивная','46'),(10,'603721','Лесной','Гоголя','41'),(11,'410172','Лесной','Северная','13'),(12,'614611','Лесной','Молодежная','50'),(13,'454311','г.Лесной','Новая','19'),(14,'660007','Лесной','Октябрьская','19'),(15,'603036','Лесной','Садовая','4'),(16,'394060','г.Лесной','Фрунзе','43'),(17,'410661','Лесной','Школьная','50'),(18,'625590','Лесной','Коммунистическая','20'),(19,'625683','Лесной','8 Марта',''),(20,'450983','г.Лесной','Комсомольская','26'),(21,'394782','Лесной','Чехова','3'),(22,'603002','Лесной','Дзержинского','28'),(23,'450558','Лесной','Набережная','30'),(24,'344288','Лесной','Чехова','1'),(25,'614164','Лесной','  Степная','30'),(26,'394242','Лесной','Коммунистическая','43'),(27,'660540','Лесной','Солнечная','25'),(28,'125837','Лесной','Шоссейная','40'),(29,'125703','Лесной','Партизанская','49'),(30,'625283','Лесной','Победы','46'),(31,'614753','Лесной','Полевая','35'),(32,'426030','Лесной','Маяковского','44'),(33,'450375','Лесной','Клубная','44'),(34,'625560','Лесной','Некрасова','12'),(35,'630201','Лесной','Комсомольская','17'),(36,'190949','Лесной','Мичурина','26');
/*!40000 ALTER TABLE `pickup_point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Авторизированный клиент'),(2,'Администратор'),(3,'Менеджер');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `supplier_id` int NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(255) NOT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'Kari'),(2,'Обувь для вас');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `units` (
  `unit_id` int NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='		';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units`
--

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
INSERT INTO `units` VALUES (1,'шт.');
/*!40000 ALTER TABLE `units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_mail` varchar(255) NOT NULL,
  `role_id` int DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`user_mail`),
  KEY `fk_role_idx` (`role_id`),
  CONSTRAINT `fk_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('1diph5e@tutanota.com',3,'Степанов','Михаил','Артёмович','8ntwUp'),('1qz4kw@mail.com',1,'Ворсин','Петр','Евгеньевич','gynQMT'),('4np6se@mail.com',1,'Старикова','Елена','Павловна','AtnDjr'),('5d4zbu@tutanota.com',1,'Михайлюк','Анна','Вячеславовна','rwVDh9'),('94d5ous@gmail.com',2,'Никифорова','Весения','Николаевна','uzWC67'),('ptec8ym@yahoo.com',1,'Ситдикова','Елена','Анатольевна','LdNyos'),('tjde7c@yahoo.com',3,'Ворсин','Петр','Евгеньевич','YOyhfR'),('uth4iz@mail.com',2,'Сазонов','Руслан','Германович','2L6KZG'),('wpmrc3do@tutanota.com',3,'Старикова','Елена','Павловна','RSbvHv'),('yzls62@outlook.com',2,'Одинцов','Серафим','Артёмович','JlFRCZ');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-22 16:55:00
