CREATE DATABASE  IF NOT EXISTS `users_books`; 
USE `users_books`;

-- Books structure
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Books data
INSERT INTO `books` VALUES (2,'Cien años de soledad'),(1,'Crimen y castigo'),(6,'El infierno de dante'),(5,'Kafka en la orilla '),(7,'La Biblia'),(4,'Mafalda vol.1'),(9,'Mafalda vol.2'),(11,'Mafalda vol.3'),(10,'Mafalda vol.4'),(3,'Psicoanalisis de masas'),(8,'Tecnología Avanzada de 3º de la ESO');


-- Books-Categories structure
DROP TABLE IF EXISTS `books_categories`;
CREATE TABLE `books_categories` (
  `id_book` int NOT NULL,
  `id_category` int NOT NULL,
  PRIMARY KEY (`id_category`,`id_book`),
  KEY `id_book` (`id_book`),
  CONSTRAINT `books_categories_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `books_categories_ibfk_2` FOREIGN KEY (`id_book`) REFERENCES `books` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Books-Categories data
INSERT INTO `books_categories` VALUES (1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(2,3),(2,4),(3,4),(3,5),(3,6),(3,8),(4,4),(4,5),(5,5),(5,6),(6,7),(6,8),(8,2),(8,7),(10,7),(10,8);

-- Categories structure
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Categories data
INSERT INTO `categories` VALUES (8,'Art'),(6,'Bibliography'),(2,'Comedy'),(1,'Drama'),(7,'History'),(3,'Horror'),(4,'Novel '),(5,'romantic-Comedy');

-- Users Structure
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Users Data
INSERT INTO `users` VALUES (10,'Adolfo'),(3,'Alberto'),(16,'Alvaro'),(15,'Araceli'),(6,'Elena'),(14,'Emilio'),(11,'Esther'),(1,'Gabriel García'),(18,'Ignacio'),(13,'Jesus'),(2,'Jhon Doe'),(17,'Jorge'),(4,'Jose Luis'),(8,'Martin'),(12,'Nahuel'),(9,'Nuria'),(7,'Patricia'),(5,'Rafael');

-- Users_books structure
DROP TABLE IF EXISTS `users_books`;
CREATE TABLE `users_books` (
  `id_user` int NOT NULL,
  `id_book` int NOT NULL,
  PRIMARY KEY (`id_user`,`id_book`),
  KEY `id_book` (`id_book`),
  CONSTRAINT `users_books_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_books_ibfk_2` FOREIGN KEY (`id_book`) REFERENCES `books` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Users-books data
INSERT INTO `users_books` VALUES (3,1),(5,1),(6,1),(7,1),(8,1),(9,1),(16,1),(2,2),(3,2),(5,2),(16,2),(18,2),(2,3),(3,3),(16,3),(2,4),(3,4),(16,4),(2,5),(3,5),(2,6),(3,6),(18,6),(2,7),(3,7),(16,7),(18,7),(3,8),(4,8),(5,8),(6,8),(7,8),(8,8),(16,8),(16,9),(18,10),(16,11);
