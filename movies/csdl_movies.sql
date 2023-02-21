-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: tbl_movies
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
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `id_Genres` int NOT NULL,
  `emotional` varchar(45) DEFAULT NULL,
  `act` varchar(45) DEFAULT NULL,
  `Fiction` varchar(45) DEFAULT NULL,
  `Humorous` varchar(45) DEFAULT NULL,
  `Horrified` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_Genres`),
  UNIQUE KEY `id_Genres_UNIQUE` (`id_Genres`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `history` (
  `id_History` int NOT NULL,
  `user_id_User` int NOT NULL,
  `movies_id_Movies` int NOT NULL,
  `movies_genres_id_Genres` int NOT NULL,
  PRIMARY KEY (`id_History`,`user_id_User`,`movies_id_Movies`,`movies_genres_id_Genres`),
  UNIQUE KEY `id_History_UNIQUE` (`id_History`),
  KEY `fk_history_user1_idx` (`user_id_User`),
  KEY `fk_history_movies1_idx` (`movies_id_Movies`,`movies_genres_id_Genres`),
  CONSTRAINT `fk_history_movies1` FOREIGN KEY (`movies_id_Movies`, `movies_genres_id_Genres`) REFERENCES `movies` (`id_Movies`, `genres_id_Genres`),
  CONSTRAINT `fk_history_user1` FOREIGN KEY (`user_id_User`) REFERENCES `user` (`id_User`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `id_Movies` int NOT NULL,
  `movie_Name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `directors` varchar(45) DEFAULT NULL,
  `performer` varchar(45) DEFAULT NULL,
  `year_Of_manufacture` varchar(45) DEFAULT NULL,
  `link_Movies` varchar(45) DEFAULT NULL,
  `trailler` varchar(45) DEFAULT NULL,
  `Category` varchar(45) DEFAULT NULL,
  `genres_id_Genres` int NOT NULL,
  PRIMARY KEY (`id_Movies`,`genres_id_Genres`),
  UNIQUE KEY `id_Movies_UNIQUE` (`id_Movies`),
  KEY `fk_movies_genres_idx` (`genres_id_Genres`),
  CONSTRAINT `fk_movies_genres` FOREIGN KEY (`genres_id_Genres`) REFERENCES `genres` (`id_Genres`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id_Reviews` int NOT NULL,
  `Comments` varchar(45) DEFAULT NULL,
  `Ratings` int DEFAULT NULL,
  `user_id_User` int NOT NULL,
  `movies_id_Movies` int NOT NULL,
  `movies_genres_id_Genres` int NOT NULL,
  PRIMARY KEY (`id_Reviews`,`user_id_User`,`movies_id_Movies`,`movies_genres_id_Genres`),
  UNIQUE KEY `id_Reviews_UNIQUE` (`id_Reviews`),
  KEY `fk_reviews_user1_idx` (`user_id_User`),
  KEY `fk_reviews_movies1_idx` (`movies_id_Movies`,`movies_genres_id_Genres`),
  CONSTRAINT `fk_reviews_movies1` FOREIGN KEY (`movies_id_Movies`, `movies_genres_id_Genres`) REFERENCES `movies` (`id_Movies`, `genres_id_Genres`),
  CONSTRAINT `fk_reviews_user1` FOREIGN KEY (`user_id_User`) REFERENCES `user` (`id_User`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id_User` int NOT NULL,
  `userName` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id_User`),
  UNIQUE KEY `id_User_UNIQUE` (`id_User`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watch_list`
--

DROP TABLE IF EXISTS `watch_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `watch_list` (
  `id_Watch_List` int NOT NULL,
  `movies_id_Movies` int NOT NULL,
  `movies_genres_id_Genres` int NOT NULL,
  `user_id_User` int NOT NULL,
  PRIMARY KEY (`id_Watch_List`,`movies_id_Movies`,`movies_genres_id_Genres`,`user_id_User`),
  UNIQUE KEY `id_Watch_List_UNIQUE` (`id_Watch_List`),
  KEY `fk_watch_list_movies1_idx` (`movies_id_Movies`,`movies_genres_id_Genres`),
  KEY `fk_watch_list_user1_idx` (`user_id_User`),
  CONSTRAINT `fk_watch_list_movies1` FOREIGN KEY (`movies_id_Movies`, `movies_genres_id_Genres`) REFERENCES `movies` (`id_Movies`, `genres_id_Genres`),
  CONSTRAINT `fk_watch_list_user1` FOREIGN KEY (`user_id_User`) REFERENCES `user` (`id_User`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watch_list`
--

LOCK TABLES `watch_list` WRITE;
/*!40000 ALTER TABLE `watch_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `watch_list` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-21 22:10:33
