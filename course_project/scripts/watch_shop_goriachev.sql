CREATE DATABASE  IF NOT EXISTS `watch_shop_goriachev` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `watch_shop_goriachev`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: watch_shop_goriachev
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (14,'Австралия'),(4,'Греция'),(8,'Египет'),(2,'Испания'),(3,'Италия'),(11,'Канада'),(13,'Китай'),(15,'Новая Зеландия'),(9,'ОАЭ'),(10,'США'),(7,'Таиланд'),(6,'Турция'),(1,'Франция'),(5,'Хорватия'),(12,'Япония');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufactures`
--

DROP TABLE IF EXISTS `manufactures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manufactures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `country_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `fk_manufactures_countries` (`country_id`),
  CONSTRAINT `fk_manufactures_countries` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufactures`
--

LOCK TABLES `manufactures` WRITE;
/*!40000 ALTER TABLE `manufactures` DISABLE KEYS */;
INSERT INTO `manufactures` VALUES (1,'Time Masters',1),(2,'Precision Timepieces',2),(3,'Horology House',3),(4,'The Watch Workshop',4),(5,'Eternal Watches',5),(6,'Seiko',6),(7,'Swatch',7),(8,'Tag Heuer',8),(9,'Rolex',9),(10,'Patek Philippe',10),(11,'Omega',11),(12,'Casio',12),(13,'Timex',13),(14,'Fossil',14),(15,'Guess',15);
/*!40000 ALTER TABLE `manufactures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchases` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `watch_id` int NOT NULL,
  `price` int NOT NULL,
  `amount` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_purchases_watches` (`watch_id`),
  CONSTRAINT `fk_purchases_watches` FOREIGN KEY (`watch_id`) REFERENCES `watches` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchases`
--

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
INSERT INTO `purchases` VALUES (1,'2022-12-03',13,23100,89),(2,'2022-12-16',4,52000,81),(3,'2023-01-07',22,28900,95),(4,'2023-01-05',8,77700,90),(5,'2022-12-25',25,18300,94),(6,'2023-01-19',1,45000,83),(7,'2022-12-09',12,57600,80),(8,'2022-12-18',17,63100,87),(9,'2023-01-10',9,32100,98),(10,'2023-01-21',20,18900,86),(11,'2022-12-05',23,63500,80),(12,'2023-01-14',16,22900,95),(13,'2023-01-23',10,17600,89),(14,'2022-12-30',6,38500,100),(15,'2022-12-20',19,77800,92),(16,'2023-01-12',2,62500,83),(17,'2023-01-30',7,31400,88),(18,'2022-12-12',14,50100,84),(19,'2022-12-23',11,19400,87),(20,'2022-12-25',3,45400,73),(21,'2022-12-27',5,53400,84),(22,'2022-12-28',18,60300,90),(23,'2022-12-29',15,34000,70),(24,'2022-01-05',21,65300,67),(25,'2023-01-28',24,33000,82);
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `watch_id` int NOT NULL,
  `seller_id` int NOT NULL,
  `price` int NOT NULL,
  `amount` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sales_watches` (`watch_id`),
  KEY `fk_sales_sellers` (`seller_id`),
  CONSTRAINT `fk_sales_sellers` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`id`),
  CONSTRAINT `fk_sales_watches` FOREIGN KEY (`watch_id`) REFERENCES `watches` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1,'2023-02-09',8,9,21850,3),(2,'2023-02-22',23,16,18700,2),(3,'2023-02-12',13,15,41300,6),(4,'2023-02-17',1,5,21500,4),(5,'2023-02-15',8,7,60800,5),(6,'2023-02-18',2,13,62250,4),(7,'2023-02-06',3,1,35700,2),(8,'2023-02-11',25,18,62650,3),(9,'2023-02-23',7,2,33500,2),(10,'2023-02-08',16,7,31550,5),(11,'2023-02-07',22,19,16600,4),(12,'2023-02-01',5,12,22500,3),(13,'2023-02-12',17,7,25850,5),(14,'2023-02-28',11,2,31250,3),(15,'2023-02-26',12,20,62500,5),(16,'2023-02-19',9,17,76800,1),(17,'2023-02-08',6,6,19000,2),(18,'2023-02-10',4,11,40500,4),(19,'2023-02-14',15,3,53300,3),(20,'2023-02-22',8,2,19500,6),(21,'2023-02-03',14,15,56750,2),(22,'2023-02-21',23,17,31650,5),(23,'2023-02-05',21,5,35500,1),(24,'2023-02-14',24,11,71500,6),(25,'2023-02-02',16,16,17300,1),(26,'2023-02-25',3,3,18450,3),(27,'2023-02-18',10,14,54750,5),(28,'2023-02-24',2,20,33000,4),(29,'2023-02-19',19,4,56700,6),(30,'2023-02-27',18,13,27350,3),(31,'2023-02-16',12,9,24450,1),(32,'2023-02-04',13,7,70750,6),(33,'2023-03-05',1,14,23000,4),(34,'2023-03-08',21,4,26400,5),(35,'2023-03-16',8,9,26950,1),(36,'2023-02-05',13,5,65000,2),(37,'2023-03-04',1,11,20000,5),(38,'2023-02-22',21,13,35000,6),(39,'2023-03-14',9,14,50000,4),(40,'2023-03-02',19,3,55000,3),(41,'2023-03-20',17,18,75000,2),(42,'2023-02-13',6,1,45000,1),(43,'2023-02-17',22,8,20000,3),(44,'2023-02-27',4,17,30000,4),(45,'2023-03-18',5,2,70000,5),(46,'2023-03-08',14,19,60000,1),(47,'2023-03-09',16,10,35000,2),(48,'2023-02-19',24,15,40000,6),(49,'2023-02-23',11,12,65000,1),(50,'2023-03-22',8,6,45000,3),(51,'2023-03-21',12,4,50000,4),(52,'2023-03-01',2,16,25000,2),(53,'2023-02-25',23,9,55000,1),(54,'2023-02-08',15,20,80000,5),(55,'2023-02-11',20,7,30000,4);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sellers`
--

DROP TABLE IF EXISTS `sellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sellers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `surname` varchar(60) NOT NULL,
  `name` varchar(60) NOT NULL,
  `patronymic` varchar(60) DEFAULT NULL,
  `interest` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellers`
--

LOCK TABLES `sellers` WRITE;
/*!40000 ALTER TABLE `sellers` DISABLE KEYS */;
INSERT INTO `sellers` VALUES (1,'Иванов','Владимир','Александрович',1.3),(2,'Петров','Валерий','Витальевич',4.2),(3,'Сидоров','Александр','Сергеевич',5.3),(4,'Козлов','Андрей','Александрович',2.3),(5,'Смирнова','Елена','Дмитриевна',1.1),(6,'Федорова','Ольга','Андреевна',0.3),(7,'Попов','Михаил','Сергеевич',5.3),(8,'Александрова','Надежда','Павловна',7),(9,'Кузнецова','Екатерина','Ивановна',2.3),(10,'Николаева','Татьяна','Алексеевна',5.3),(11,'Михайлов','Владимир','Геннадьевич',0.5),(12,'Гаврилов','Анатолий','Сергеевич',10.3),(13,'Полякова','Ирина','Владимировна',7.2),(14,'Калинина','Оксана','Сергеевна',3.3),(15,'Антонов','Дмитрий','Андреевич',6.5),(16,'Лебедева','Марина','Ивановна',5.3),(17,'Савельев','Виктор','Александрович',8.2),(18,'Борисов','Георгий','Петрович',3.4),(19,'Королева','Анастасия','Сергеевна',7.5),(20,'Тихонов','Василий','Дмитриевич',4.4);
/*!40000 ALTER TABLE `sellers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_stock_watches`
--

DROP TABLE IF EXISTS `view_stock_watches`;
/*!50001 DROP VIEW IF EXISTS `view_stock_watches`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_stock_watches` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `manufacture_id`,
 1 AS `watch_type_id`,
 1 AS `amount`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `watch_types`
--

DROP TABLE IF EXISTS `watch_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `watch_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watch_types`
--

LOCK TABLES `watch_types` WRITE;
/*!40000 ALTER TABLE `watch_types` DISABLE KEYS */;
INSERT INTO `watch_types` VALUES (3,'Автоматические'),(10,'Американские'),(15,'Будильники'),(11,'Европейские'),(14,'Интерьерные'),(1,'Кварцевые'),(9,'Китайские'),(5,'Классические'),(13,'Лимитированные серии'),(2,'Механические'),(6,'Повседневные'),(12,'Премиум'),(4,'Спортивные'),(7,'Швейцарские'),(8,'Японские');
/*!40000 ALTER TABLE `watch_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watches`
--

DROP TABLE IF EXISTS `watches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `watches` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `manufacture_id` int NOT NULL,
  `watch_type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_watches_manufactures` (`manufacture_id`),
  KEY `fk_watches_watch_types` (`watch_type_id`),
  CONSTRAINT `fk_watches_manufactures` FOREIGN KEY (`manufacture_id`) REFERENCES `manufactures` (`id`),
  CONSTRAINT `fk_watches_watch_types` FOREIGN KEY (`watch_type_id`) REFERENCES `watch_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watches`
--

LOCK TABLES `watches` WRITE;
/*!40000 ALTER TABLE `watches` DISABLE KEYS */;
INSERT INTO `watches` VALUES (1,'Alpha',5,9),(2,'Classic',1,4),(3,'Originals',7,8),(4,'Royal',3,10),(5,'Expedition',13,11),(6,'Elite',2,12),(7,'Nautilus',10,2),(8,'Aquaracer',8,5),(9,'Signature',4,15),(10,'5 Sports',6,13),(11,'Seamaster',11,1),(12,'Machine',14,7),(13,'Submariner',9,14),(14,'G-Shock',12,6),(15,'Aviator',1,9),(16,'Classic',5,4),(17,'Carrera',8,8),(18,'Elite',3,10),(19,'Weekender',13,11),(20,'Master',2,12),(21,'Calatrava',10,2),(22,'Big Bold',7,5),(23,'Legacy',4,15),(24,'Prospex',6,13),(25,'Speedmaster',11,1);
/*!40000 ALTER TABLE `watches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'watch_shop_goriachev'
--

--
-- Dumping routines for database 'watch_shop_goriachev'
--
/*!50003 DROP PROCEDURE IF EXISTS `stock_watches_by_date` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `stock_watches_by_date`(in date_in date)
begin
    select id,
           name,
           manufacture_id,
           watch_type_id,
           amount
    from (select w.watch_id,
                 sum(w.sum) as amount
          from (select watches.id as watch_id, ifnull(sum(amount), 0) as sum
                from watches
                         left join (select * from purchases where date <= date_in) p on watches.id = p.watch_id
                group by watches.id
                union
                select watches.id as watch_id, -ifnull(sum(amount), 0) as sum
                from watches
                         left join (select * from sales where date <= date_in) p on watches.id = p.watch_id
                group by watches.id) as w
          group by w.watch_id) as res
             join watches on res.watch_id = watches.id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `stock_watches_by_date_and_watch_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `stock_watches_by_date_and_watch_id`(in date_in date, in watch_id_in int)
begin
    select id,
           name,
           manufacture_id,
           watch_type_id,
           amount
    from (select w.watch_id,
                 sum(w.sum) as amount
          from (select watches.id as watch_id, ifnull(sum(amount), 0) as sum
                from watches
                         left join (select *
                                    from purchases
                                    where purchases.watch_id = watch_id_in
                                      and date <= date_in) p
                                   on watches.id = p.watch_id
                where watches.id = watch_id_in
                group by watches.id
                union all
                select watches.id as watch_id, -ifnull(sum(amount), 0) as sum
                from watches
                         left join (select *
                                    from sales
                                    where sales.watch_id = watch_id_in
                                      and date <= date_in) p
                                   on watches.id = p.watch_id
                where watches.id = watch_id_in
                group by watches.id) as w
          group by w.watch_id) as res
             join watches on res.watch_id = watches.id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `stock_watches_by_date_and_watch_id_without_sale_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `stock_watches_by_date_and_watch_id_without_sale_id`(in date_in date, in watch_id_in int, in sale_id_in int)
begin
    select id,
           name,
           manufacture_id,
           watch_type_id,
           amount
    from (select w.watch_id,
                 sum(w.sum) as amount
          from (select watches.id as watch_id, ifnull(sum(amount), 0) as sum
                from watches
                         left join (select *
                                    from purchases
                                    where purchases.watch_id = watch_id_in
                                      and date <= date_in) p
                                   on watches.id = p.watch_id
                where watches.id = watch_id_in
                group by watches.id
                union all
                select watches.id as watch_id, -ifnull(sum(amount), 0) as sum
                from watches
                         left join (select *
                                    from sales
                                    where sales.id != sale_id_in and sales.watch_id = watch_id_in
                                      and date <= date_in) p
                                   on watches.id = p.watch_id
                where watches.id = watch_id_in
                group by watches.id) as w
          group by w.watch_id) as res
             join watches on res.watch_id = watches.id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `view_stock_watches`
--

/*!50001 DROP VIEW IF EXISTS `view_stock_watches`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_stock_watches` AS select `watches`.`id` AS `id`,`watches`.`name` AS `name`,`watches`.`manufacture_id` AS `manufacture_id`,`watches`.`watch_type_id` AS `watch_type_id`,`res`.`amount` AS `amount` from ((select `w`.`watch_id` AS `watch_id`,sum(`w`.`sum`) AS `amount` from (select `watches`.`id` AS `watch_id`,ifnull(sum(`p`.`amount`),0) AS `sum` from (`watches` left join `purchases` `p` on((`watches`.`id` = `p`.`watch_id`))) group by `watches`.`id` union select `watches`.`id` AS `watch_id`,-(ifnull(sum(`p`.`amount`),0)) AS `sum` from (`watches` left join `sales` `p` on((`watches`.`id` = `p`.`watch_id`))) group by `watches`.`id`) `w` group by `w`.`watch_id`) `res` join `watches` on((`res`.`watch_id` = `watches`.`id`))) */;
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

-- Dump completed on 2023-04-28  2:15:51
