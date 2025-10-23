-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.30 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour cinema
CREATE DATABASE IF NOT EXISTS `cinema` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cinema`;

-- Listage de la structure de table cinema. actor
CREATE TABLE IF NOT EXISTS `actor` (
  `id_actor` int NOT NULL AUTO_INCREMENT,
  `id_person` int NOT NULL,
  PRIMARY KEY (`id_actor`),
  KEY `id_person` (`id_person`),
  CONSTRAINT `FK_actor_person` FOREIGN KEY (`id_person`) REFERENCES `person` (`id_person`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema.actor : ~11 rows (environ)
INSERT INTO `actor` (`id_actor`, `id_person`) VALUES
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5),
	(6, 6),
	(7, 7),
	(9, 9),
	(10, 10),
	(11, 11),
	(13, 13);

-- Listage de la structure de table cinema. classified
CREATE TABLE IF NOT EXISTS `classified` (
  `id_film` int NOT NULL,
  `id_genre` int NOT NULL,
  KEY `id_film` (`id_film`),
  KEY `id_genre` (`id_genre`),
  CONSTRAINT `FK_classified_film` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`),
  CONSTRAINT `FK_classified_genre` FOREIGN KEY (`id_genre`) REFERENCES `genre` (`id_genre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema.classified : ~7 rows (environ)
INSERT INTO `classified` (`id_film`, `id_genre`) VALUES
	(1, 1),
	(1, 2),
	(2, 3),
	(2, 1),
	(3, 4),
	(5, 1),
	(5, 5);

-- Listage de la structure de table cinema. director
CREATE TABLE IF NOT EXISTS `director` (
  `id_director` int NOT NULL AUTO_INCREMENT,
  `id_person` int NOT NULL,
  PRIMARY KEY (`id_director`),
  KEY `id_person` (`id_person`),
  CONSTRAINT `FK_director_person` FOREIGN KEY (`id_person`) REFERENCES `person` (`id_person`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema.director : ~4 rows (environ)
INSERT INTO `director` (`id_director`, `id_person`) VALUES
	(1, 1),
	(2, 8),
	(3, 11),
	(4, 12);

-- Listage de la structure de table cinema. film
CREATE TABLE IF NOT EXISTS `film` (
  `id_film` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `year_of_release` int NOT NULL,
  `duration` int NOT NULL,
  `synopsis` text NOT NULL,
  `rate` decimal(20,6) NOT NULL,
  `id_director` int NOT NULL,
  PRIMARY KEY (`id_film`),
  KEY `id_director` (`id_director`),
  CONSTRAINT `FK_film_director` FOREIGN KEY (`id_director`) REFERENCES `director` (`id_director`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema.film : ~5 rows (environ)
INSERT INTO `film` (`id_film`, `title`, `year_of_release`, `duration`, `synopsis`, `rate`, `id_director`) VALUES
	(1, 'Blazing Saddles', 1974, 89, 'La mise en place d\'une ligne de chemin de fer ne peut aboutir à cause d\'une zone de sables mouvants. L\'itinéraire doit être changé, ce qui fait que la ligne pourrait passer par Rock Ridge, une ville frontière où tous les habitants portent le même nom, Johnson. Le procureur général intrigant Hedley Lamarr — à ne pas confondre, ce qui arrive souvent dans le film, avec l\'actrice Hedy Lamarr — souhaite racheter à bas prix les terrains prévus pour la construction. Pour y parvenir, il tente de chasser les habitants de leur ville. Ainsi, pour leur faire peur, y envoie-t-il une bande de malfaiteurs dirigée par l\'inepte Taggart, ce qui incite la population de Rock Ridge à demander au gouverneur de leur affecter un nouveau shérif.', 4.000000, 1),
	(2, 'Robin Hood : Men in thights', 1993, 104, 'Robin des Bois est fait prisonnier pendant les croisades. Il s\'évade et rentre en Angleterre. À son arrivée, il trouve un pays en proie aux répressions du Prince Jean, le frère du Roi Richard parti en guerre et dont on est sans nouvelles. Avec à ses côtés Petit Jean, Will Scarlet, Mirette et le fils d\'Al-Ergie, Atchoo (dont le nom est phonétiquement similaire à un éternuement, auquel on répond « à vos souhaits »), il va tout mettre en œuvre pour déjouer les plans du Prince Jean et du shérif de Rottengham.', 2.500000, 1),
	(3, 'Fight Club', 1999, 139, 'Pourvu d\'une situation des plus enviable, un jeune homme à bout de nerfs retrouve un équilibre relatif en compagnie de Marla, rencontrée dans un groupe d\'entraide. Il fait également la connaissance de Tyler Durden, personnage enthousiaste et charismatique.', 4.500000, 2),
	(4, 'Once upon a time in Hollywood', 2019, 161, 'Il s\'agit d\'une uchronie tournant autour de la carrière déclinante d\'un acteur fictif, Rick Dalton (interprété par Leonardo DiCaprio), flanqué de son ami Cliff Booth — sa doublure de toujours pour les cascades — (rôle tenu par Brad Pitt), et du meurtre bien réel de Sharon Tate (jouée par Margot Robbie) perpétré en août 1969 par la « famille » Charles Manson, un drame auquel Tarantino donne une issue différente', 3.800000, 3),
	(5, 'Snatch', 2000, 104, 'Turkish — qui est le narrateur du film — et son partenaire Tommy sont assis face à un homme inconnu. Ils ont passé une mauvaise semaine, et se retrouvent là pour une histoire de diamant.', 4.200000, 4);

-- Listage de la structure de table cinema. genre
CREATE TABLE IF NOT EXISTS `genre` (
  `id_genre` int NOT NULL AUTO_INCREMENT,
  `wording` varchar(50) NOT NULL,
  PRIMARY KEY (`id_genre`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema.genre : ~5 rows (environ)
INSERT INTO `genre` (`id_genre`, `wording`) VALUES
	(1, 'Comédie'),
	(2, 'Western'),
	(3, 'Parodie'),
	(4, 'Thriller'),
	(5, 'film de gangsters');

-- Listage de la structure de table cinema. person
CREATE TABLE IF NOT EXISTS `person` (
  `id_person` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `birthday` date NOT NULL,
  PRIMARY KEY (`id_person`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema.person : ~13 rows (environ)
INSERT INTO `person` (`id_person`, `first_name`, `last_name`, `gender`, `birthday`) VALUES
	(1, 'Mel', 'Brooks', 'male', '1926-06-28'),
	(2, 'Madeline', 'Khan', 'female', '1942-09-29'),
	(3, 'Brad', 'Pitt', 'male', '1963-12-13'),
	(4, 'Gene', 'Wilder', 'male', '1933-06-11'),
	(5, 'Cary', 'Elwes', 'male', '1962-10-26'),
	(6, 'Amy', 'Yasbeck', 'female', '1962-09-12'),
	(7, 'Edward', 'Norton', 'male', '1969-07-18'),
	(8, 'David', 'Fincher', 'male', '1962-07-28'),
	(9, 'Margot ', 'Robbie', 'female', '1990-06-02'),
	(10, 'Leonardo', 'DiCaprio', 'male', '1974-11-11'),
	(11, 'Quentin', 'Tarantino', 'male', '1963-03-27'),
	(12, 'Guy', 'Ritchie', 'male', '1968-09-10'),
	(13, 'Jason', 'Statham', 'male', '1967-06-26');

-- Listage de la structure de table cinema. play
CREATE TABLE IF NOT EXISTS `play` (
  `id_film` int NOT NULL,
  `id_actor` int NOT NULL,
  `id_role` int NOT NULL,
  KEY `id_film` (`id_film`),
  KEY `id_actor` (`id_actor`),
  KEY `id_role` (`id_role`),
  CONSTRAINT `FK_play_actor` FOREIGN KEY (`id_actor`) REFERENCES `actor` (`id_actor`),
  CONSTRAINT `FK_play_film` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`),
  CONSTRAINT `FK_play_role` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema.play : ~12 rows (environ)
INSERT INTO `play` (`id_film`, `id_actor`, `id_role`) VALUES
	(1, 1, 1),
	(1, 1, 2),
	(1, 2, 4),
	(1, 4, 3),
	(2, 6, 6),
	(2, 5, 5),
	(2, 1, 7),
	(3, 3, 8),
	(3, 7, 9),
	(4, 3, 12),
	(4, 10, 11),
	(4, 9, 10);

-- Listage de la structure de table cinema. poster
CREATE TABLE IF NOT EXISTS `poster` (
  `id_poster` int NOT NULL AUTO_INCREMENT,
  `url` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_film` int NOT NULL,
  PRIMARY KEY (`id_poster`),
  KEY `id_film` (`id_film`),
  CONSTRAINT `FK_poster_film` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema.poster : ~4 rows (environ)
INSERT INTO `poster` (`id_poster`, `url`, `id_film`) VALUES
	(1, 'https://thumb.canalplus.pro/http/unsafe/%7BresolutionXY%7D/filters:quality(%7BimageQualityPercentage%7D)/img-hapi.canalplus.pro:80/ServiceImage/ImageID/52836988', 1),
	(2, 'https://upload.wikimedia.org/wikipedia/en/1/12/RobinHoodMeninTights_Poster.jpg', 2),
	(3, 'https://fr.web.img3.acsta.net/pictures/19/04/08/14/11/0688770.jpg', 3),
	(4, 'https://m.media-amazon.com/images/M/MV5BMzMzNmViNjYtN2ViNi00NDM3LWFlMmItNDYyMGIzY2EzZjE2XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg', 4);

-- Listage de la structure de table cinema. role
CREATE TABLE IF NOT EXISTS `role` (
  `id_role` int NOT NULL AUTO_INCREMENT,
  `character_first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `character_last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema.role : ~12 rows (environ)
INSERT INTO `role` (`id_role`, `character_first_name`, `character_last_name`) VALUES
	(1, 'Gouverneur William', 'J'),
	(2, 'Chef', 'Indien'),
	(3, 'Jim', 'Waco Kid'),
	(4, 'Lili', 'Von Schtupp'),
	(5, 'Robin', 'Des Bois'),
	(6, 'Lady', 'Marianne'),
	(7, 'Rabbin', 'Tuckman'),
	(8, 'Tyler', 'Durden'),
	(9, 'Le Narrateur', NULL),
	(10, 'Sharon', 'Tate'),
	(11, 'Rick', 'Dalton'),
	(12, 'Cliff', 'Booth');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
