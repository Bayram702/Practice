-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_shoes
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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id_category` int NOT NULL,
  `name_category` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Женская обувь'),(2,'Мужская обувь');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `id_client` int NOT NULL,
  `id_role` int DEFAULT NULL,
  `FIO` varchar(225) DEFAULT NULL,
  `login` varchar(100) DEFAULT NULL,
  `password` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_client`),
  KEY `role_idx` (`id_role`),
  CONSTRAINT `role` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,3,'Ворсин Петр Евгеньевич','tjde7c@yahoo.com','YOyhfR'),(2,1,'Ворсин Петр Евгеньевич','1qz4kw@mail.com','gynQMT'),(3,1,'Михайлюк Анна Вячеславовна','5d4zbu@tutanota.com','rwVDh9'),(4,2,'Никифорова Весения Николаевна','94d5ous@gmail.com','uzWC67'),(5,2,'Одинцов Серафим Артёмович','yzls62@outlook.com','JlFRCZ'),(6,2,'Сазонов Руслан Германович','uth4iz@mail.com','2L6KZG'),(7,1,'Ситдикова Елена Анатольевна','ptec8ym@yahoo.com','LdNyos'),(8,3,'Старикова Елена Павловна','wpmrc3do@tutanota.com','RSbvHv'),(9,1,'Старикова Елена Павловна','4np6se@mail.com','AtnDjr'),(10,3,'Степанов Михаил Артёмович','1diph5e@tutanota.com','8ntwUp');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacture`
--

DROP TABLE IF EXISTS `manufacture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manufacture` (
  `id_manufacture` int NOT NULL,
  `name_manufacture` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_manufacture`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacture`
--

LOCK TABLES `manufacture` WRITE;
/*!40000 ALTER TABLE `manufacture` DISABLE KEYS */;
INSERT INTO `manufacture` VALUES (1,'Alessio Nesca'),(2,'CROSBY'),(3,'Kari'),(4,'Marco Tozzi'),(5,'Rieker'),(6,'Рос');
/*!40000 ALTER TABLE `manufacture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id_order` int NOT NULL,
  `date_order` date DEFAULT NULL,
  `date_dilivery` date DEFAULT NULL,
  `id_pick_up` int DEFAULT NULL,
  `FIO_client` int DEFAULT NULL,
  `code` int DEFAULT NULL,
  `status` enum('Завершен','Новый') DEFAULT NULL,
  PRIMARY KEY (`id_order`),
  KEY `point _idx` (`id_pick_up`) /*!80000 INVISIBLE */,
  KEY `client_idx` (`FIO_client`),
  CONSTRAINT `client` FOREIGN KEY (`FIO_client`) REFERENCES `client` (`id_client`),
  CONSTRAINT `point ` FOREIGN KEY (`id_pick_up`) REFERENCES `pick_up` (`id_pick_up`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'2025-02-27','2025-04-20',1,10,901,'Завершен'),(2,'2022-09-28','2025-04-21',11,4,902,'Завершен'),(3,'2025-03-21','2025-04-22',2,6,903,'Завершен'),(4,'2025-02-20','2025-04-23',11,5,904,'Завершен'),(5,'2025-03-17','2025-04-24',2,10,905,'Завершен'),(6,'2025-03-01','2025-04-25',15,4,906,'Завершен'),(7,'2025-03-01','2025-04-26',3,6,907,'Завершен'),(8,'2025-03-31','2025-04-27',19,5,908,'Новый'),(9,'2025-04-02','2025-04-28',5,10,909,'Новый'),(10,'2025-04-03','2025-04-29',19,10,910,'Новый');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_sostav`
--

DROP TABLE IF EXISTS `order_sostav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_sostav` (
  `id_order_sostav` int NOT NULL,
  `id_order` int DEFAULT NULL,
  `id_tovar` varchar(10) DEFAULT NULL,
  `count` int DEFAULT NULL,
  PRIMARY KEY (`id_order_sostav`),
  KEY `order_idx` (`id_order`),
  KEY `tovar_idx` (`id_tovar`),
  CONSTRAINT `order` FOREIGN KEY (`id_order`) REFERENCES `order` (`id_order`),
  CONSTRAINT `tovar` FOREIGN KEY (`id_tovar`) REFERENCES `tovar` (`id_tovar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_sostav`
--

LOCK TABLES `order_sostav` WRITE;
/*!40000 ALTER TABLE `order_sostav` DISABLE KEYS */;
INSERT INTO `order_sostav` VALUES (1,1,'А112Т4',2),(2,2,'H782T5',1),(3,3,'J384T6',10),(4,4,'F572H7',5),(5,5,'А112Т4',2),(6,6,'H782T5',1),(7,7,'J384T6',10),(8,8,'F572H7',5),(9,9,'B320R5',5),(10,10,'S213E3',5),(11,1,'F635R4',2),(12,2,'G783F5',1),(13,3,'D572U8',10),(14,4,'D329H3',4),(15,5,'F635R4',2),(16,6,'G783F5',1),(17,7,'D572U8',10),(18,8,'D329H3',4),(19,9,'G432E4',1),(20,10,'E482R4',5);
/*!40000 ALTER TABLE `order_sostav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pick_up`
--

DROP TABLE IF EXISTS `pick_up`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pick_up` (
  `id_pick_up` int NOT NULL,
  `code` int DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `home` int DEFAULT NULL,
  PRIMARY KEY (`id_pick_up`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pick_up`
--

LOCK TABLES `pick_up` WRITE;
/*!40000 ALTER TABLE `pick_up` DISABLE KEYS */;
INSERT INTO `pick_up` VALUES (1,125061,'г. Лесной','ул. Подгорная',8),(2,125703,'г. Лесной','ул. Партизанская',49),(3,125837,'г. Лесной','ул. Шоссейная',40),(4,190949,'г. Лесной','ул. Мичурина',26),(5,344288,'г. Лесной','ул. Чехова',1),(6,394060,'г.Лесной','ул. Фрунзе',43),(7,394242,'г. Лесной','ул. Коммунистическая',43),(8,394782,'г. Лесной','ул. Чехова',3),(9,400562,'г. Лесной','ул. Зеленая',32),(10,410172,'г. Лесной','ул. Северная',13),(11,410542,'г. Лесной','ул. Светлая',46),(12,410661,'г. Лесной','ул. Школьная',50),(13,420151,'г. Лесной','ул. Вишневая',32),(14,426030,'г. Лесной','ул. Маяковского',44),(15,443890,'г. Лесной','ул. Коммунистическая',1),(16,450375,'г. Лесной','ул. Клубная',44),(17,450558,'г. Лесной','ул. Набережная',30),(18,450983,'г.Лесной','ул. Комсомольская',26),(19,454311,'г.Лесной','ул. Новая',19),(20,603002,'г. Лесной','ул. Дзержинского',28),(21,603036,'г. Лесной','ул. Садовая',4),(22,603379,'г. Лесной','ул. Спортивная',46),(23,603721,'г. Лесной','ул. Гоголя',41),(24,614164,'г.Лесной','  ул. Степная',30),(25,614510,'г. Лесной','ул. Маяковского',47),(26,614611,'г. Лесной','ул. Молодежная',50),(27,614753,'г. Лесной','ул. Полевая',35),(28,620839,'г. Лесной','ул. Цветочная',8),(29,625283,'г. Лесной','ул. Победы',46),(30,625560,'г. Лесной','ул. Некрасова',12),(31,625590,'г. Лесной','ул. Коммунистическая',20),(32,625683,'г. Лесной','ул. 8 Марта',1),(33,630201,'г. Лесной','ул. Комсомольская',17),(34,630370,'г. Лесной','ул. Шоссейная',24),(35,660007,'г.Лесной','ул. Октябрьская',19),(36,660540,'г. Лесной','ул. Солнечная',25);
/*!40000 ALTER TABLE `pick_up` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id_role` int NOT NULL,
  `name_role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Авторизированный клиент'),(2,'Администратор'),(3,'Менеджер');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `id_supplier` int NOT NULL,
  `name_supplier` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_supplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Kari'),(2,'Обувь для вас');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tovar`
--

DROP TABLE IF EXISTS `tovar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tovar` (
  `id_tovar` varchar(10) NOT NULL,
  `name_tovar` varchar(45) DEFAULT NULL,
  `edenica` varchar(45) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `id_supplier` int DEFAULT NULL,
  `id_manufacture` int DEFAULT NULL,
  `id_category` int DEFAULT NULL,
  `discount` int DEFAULT NULL,
  `count` int DEFAULT NULL,
  `description` varchar(225) DEFAULT NULL,
  `photo` varchar(225) NOT NULL,
  PRIMARY KEY (`id_tovar`),
  KEY `supplier_idx` (`id_supplier`),
  KEY `manufacture_idx` (`id_manufacture`),
  KEY `category_idx` (`id_category`),
  CONSTRAINT `category` FOREIGN KEY (`id_category`) REFERENCES `category` (`id_category`),
  CONSTRAINT `manufacture` FOREIGN KEY (`id_manufacture`) REFERENCES `manufacture` (`id_manufacture`),
  CONSTRAINT `supplier` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id_supplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tovar`
--

LOCK TABLES `tovar` WRITE;
/*!40000 ALTER TABLE `tovar` DISABLE KEYS */;
INSERT INTO `tovar` VALUES ('B320R5','Туфли','шт.',4300,1,5,1,2,6,'Туфли Rieker женские демисезонные, размер 41, цвет коричневый',''),('B431R5','Ботинки','шт.',2700,2,5,2,2,5,'Мужские кожаные ботинки/мужские ботинки',''),('C436G5','Ботинки','шт.',10200,1,1,1,15,9,'Ботинки женские, ARGO, размер 40',''),('D268G5','Туфли','шт.',4399,2,5,1,3,12,'Туфли Rieker женские демисезонные, размер 36, цвет коричневый',''),('D329H3','Полуботинки','шт.',1890,2,1,1,4,4,'Полуботинки Alessio Nesca женские 3-30797-47, размер 37, цвет: бордовый',''),('D364R4','Туфли','шт.',12400,1,3,1,16,5,'Туфли Luiza Belly женские Kate-lazo черные из натуральной замши',''),('D572U8','Кроссовки','шт.',4100,2,6,2,3,6,'129615-4 Кроссовки мужские',''),('E482R4','Полуботинки','шт.',1800,1,3,1,2,14,'Полуботинки kari женские MYZ20S-149, размер 41, цвет: черный',''),('F427R5','Ботинки','шт.',11800,2,5,1,15,11,'Ботинки на молнии с декоративной пряжкой FRAU',''),('F572H7','Туфли','шт.',2700,1,4,1,2,14,'Туфли Marco Tozzi женские летние, размер 39, цвет черный',''),('F635R4','Ботинки','шт.',3244,2,4,1,2,13,'Ботинки Marco Tozzi женские демисезонные, размер 39, цвет бежевый',''),('G432E4','Туфли','шт.',2800,1,3,1,3,15,'Туфли kari женские TR-YR-413017, размер 37, цвет: черный',''),('G531F4','Ботинки','шт.',6600,1,3,1,12,9,'Ботинки женские зимние ROMER арт. 893167-01 Черный',''),('G783F5','Ботинки','шт.',5900,1,6,2,2,8,'Мужские ботинки Рос-Обувь кожаные с натуральным мехом',''),('H535R5','Ботинки','шт.',2322,2,5,1,2,7,'Женские Ботинки демисезонные',''),('H782T5','Туфли','шт.',4499,1,3,2,4,5,'Туфли kari мужские классика MYZ21AW-450A, размер 43, цвет: черный',''),('J384T6','Ботинки','шт.',3800,2,5,2,2,16,'B3430/14 Полуботинки мужские Rieker',''),('J542F5','Тапочки','шт.',500,1,3,2,13,0,'Тапочки мужские Арт.70701-55-67син р.41',''),('K345R4','Полуботинки','шт.',2100,2,2,2,2,3,'407700/01-02 Полуботинки мужские CROSBY',''),('K358H6','Тапочки','шт.',599,1,5,2,20,2,'Тапочки мужские син р.41',''),('L754R4','Полуботинки','шт.',1700,1,3,1,2,7,'Полуботинки kari женские WB2020SS-26, размер 38, цвет: черный',''),('M542T5','Кроссовки','шт.',2800,2,5,2,18,3,'Кроссовки мужские TOFA',''),('N457T5','Полуботинки','шт.',4600,1,2,1,3,13,'Полуботинки Ботинки черные зимние, мех',''),('O754F4','Туфли','шт.',5400,2,5,1,4,18,'Туфли женские демисезонные Rieker артикул 55073-68/37',''),('P764G4','Туфли','шт.',6800,1,2,1,15,15,'Туфли женские, ARGO, размер 38',''),('S213E3','Полуботинки','шт.',2156,2,2,2,3,6,'407700/01-01 Полуботинки мужские CROSBY',''),('S326R5','Тапочки','шт.',9900,2,2,2,17,15,'Мужские кожаные тапочки \"Профиль С.Дали\" ',''),('S634B5','Кеды','шт.',5500,2,2,2,3,0,'Кеды Caprice мужские демисезонные, размер 42, цвет черный',''),('T324F5','Сапоги','шт.',4699,1,2,1,2,5,'Сапоги замша Цвет: синий',''),('А112Т4','Ботинки','шт.',4990,1,3,1,3,6,'Женские Ботинки демисезонные kari','');
/*!40000 ALTER TABLE `tovar` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-22 14:19:55
