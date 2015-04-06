-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tmi
-- ------------------------------------------------------
-- Server version	5.6.23-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `adminfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('RAFernandez');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `album` (
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`title`),
  CONSTRAINT `albumfk_1` FOREIGN KEY (`title`) REFERENCES `work` (`title`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES ('Hybrid Theory'),('Save Rock and Roll');
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `all works`
--

DROP TABLE IF EXISTS `all works`;
/*!50001 DROP VIEW IF EXISTS `all works`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `all works` AS SELECT 
 1 AS `title`,
 1 AS `Created By`,
 1 AS `description`,
 1 AS `class`,
 1 AS `cover`,
 1 AS `rating`,
 1 AS `releaseYear`,
 1 AS `viewCount`,
 1 AS `isVerified`,
 1 AS `network`,
 1 AS `studio`,
 1 AS `publisher`,
 1 AS `wordcount`,
 1 AS `datePremiered`,
 1 AS `Graphic Novel Illustrator`,
 1 AS `Comic/Manga Illustrator`,
 1 AS `URL`,
 1 AS `org`,
 1 AS `album`,
 1 AS `recordingStudio`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `animation`
--

DROP TABLE IF EXISTS `animation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `animation` (
  `title` varchar(100) NOT NULL,
  `studio` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`title`),
  KEY `animationfk_2` (`studio`),
  CONSTRAINT `animationfk_1` FOREIGN KEY (`title`) REFERENCES `television` (`title`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animation`
--

LOCK TABLES `animation` WRITE;
/*!40000 ALTER TABLE `animation` DISABLE KEYS */;
INSERT INTO `animation` VALUES ('My Teen Romantic Comedy SNAFU','Brains Base'),('Clannad: After Story','Kyoto Animation'),('Bodacious Space Pirates','Satelight'),('Puella Magi Madoka Magica','Shaft'),('Fate/Zero','ufotable'),('Steins;Gate','White Fox');
/*!40000 ALTER TABLE `animation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book` (
  `title` varchar(100) NOT NULL,
  `publisher` varchar(45) DEFAULT NULL,
  `wordcount` int(11) DEFAULT NULL,
  PRIMARY KEY (`title`),
  CONSTRAINT `bookfk_1` FOREIGN KEY (`title`) REFERENCES `work` (`title`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES ('Kick-Ass',NULL,NULL),('Ready Player One','Random House',NULL),('The Killing Joke',NULL,NULL),('V for Vendetta',NULL,NULL),('Watchmen',NULL,NULL);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comicissue`
--

DROP TABLE IF EXISTS `comicissue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comicissue` (
  `comic` varchar(100) NOT NULL DEFAULT '',
  `issue` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`comic`,`issue`),
  CONSTRAINT `comicissuefk_1` FOREIGN KEY (`comic`) REFERENCES `comicsmanga` (`title`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comicissue`
--

LOCK TABLES `comicissue` WRITE;
/*!40000 ALTER TABLE `comicissue` DISABLE KEYS */;
/*!40000 ALTER TABLE `comicissue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comicsmanga`
--

DROP TABLE IF EXISTS `comicsmanga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comicsmanga` (
  `title` varchar(100) NOT NULL,
  `illustrator` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`title`),
  KEY `comicsmangafk_2` (`illustrator`),
  CONSTRAINT `comicsmangafk_1` FOREIGN KEY (`title`) REFERENCES `book` (`title`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comicsmangafk_2` FOREIGN KEY (`illustrator`) REFERENCES `creator` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comicsmanga`
--

LOCK TABLES `comicsmanga` WRITE;
/*!40000 ALTER TABLE `comicsmanga` DISABLE KEYS */;
INSERT INTO `comicsmanga` VALUES ('Kick-Ass','John Romita Jr.');
/*!40000 ALTER TABLE `comicsmanga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `console`
--

DROP TABLE IF EXISTS `console`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `console` (
  `name` varchar(45) NOT NULL,
  `developer` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `console`
--

LOCK TABLES `console` WRITE;
/*!40000 ALTER TABLE `console` DISABLE KEYS */;
INSERT INTO `console` VALUES ('Mac','Apple'),('PC','Microsoft'),('PlayStation 3','Sony'),('PlayStation 4','Sony'),('Wii','Nintendo'),('Wii U','Nintendo'),('Xbox 360','Microsoft'),('Xbox One','Microsoft');
/*!40000 ALTER TABLE `console` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consolegame`
--

DROP TABLE IF EXISTS `consolegame`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consolegame` (
  `title` varchar(100) NOT NULL DEFAULT '',
  `console` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`title`,`console`),
  KEY `consolegamefk_2` (`console`),
  CONSTRAINT `consolegamefk_1` FOREIGN KEY (`title`) REFERENCES `videogame` (`title`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `consolegamefk_2` FOREIGN KEY (`console`) REFERENCES `console` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consolegame`
--

LOCK TABLES `consolegame` WRITE;
/*!40000 ALTER TABLE `consolegame` DISABLE KEYS */;
INSERT INTO `consolegame` VALUES ('Assassin\'s Creed Unity','PC'),('Mass Effect 3','PC'),('Metal Gear Solid V: The Phantom Pain','PC'),('Mass Effect 3','PlayStation 3'),('Metal Gear Solid V: The Phantom Pain','PlayStation 3'),('Assassin\'s Creed Unity','PlayStation 4'),('Metal Gear Solid V: The Phantom Pain','PlayStation 4'),('Mass Effect 3','Wii U'),('Mass Effect 3','Xbox 360'),('Metal Gear Solid V: The Phantom Pain','Xbox 360'),('Assassin\'s Creed Unity','Xbox One'),('Metal Gear Solid V: The Phantom Pain','Xbox One');
/*!40000 ALTER TABLE `consolegame` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creator`
--

DROP TABLE IF EXISTS `creator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creator` (
  `name` varchar(70) NOT NULL,
  `bio` varchar(255) DEFAULT NULL,
  `trivia` varchar(255) DEFAULT NULL,
  `isVerified` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creator`
--

LOCK TABLES `creator` WRITE;
/*!40000 ALTER TABLE `creator` DISABLE KEYS */;
INSERT INTO `creator` VALUES ('Ai Yoshimura',NULL,NULL,1),('Akiyuki Shinbou','Akiyuki Shinbou is a freelance director, who is now working with Shaft as an educator. He says that the reason he sticks with Shaft is due to their system, professional and digital capacity; which makes his expression of direction much easier.',NULL,1),('Alan Moore',NULL,NULL,1),('Alejandro Gonzalez Inarritu','Alejandro González Iñárritu is a Mexican film director, producer, screenwriter, and composer. González Iñárritu is the first Mexican director to be nominated for the Academy Award for Best Director and the ... ',NULL,1),('Andrew Lloyd Webber','(born 22 March 1948) is an English composer and impresario of musical theatre.','He\'s actually a baron how cool',0),('Bioware','BioWare is a Canadian video game developer founded in February 1995 by newly graduated medical doctors Ray Muzyka, Greg Zeschuk, and Augustine Yip. BioWare is currently owned by American company Electronic Arts.','Awesome stories',1),('Bruno Heller',NULL,NULL,0),('Christopher Nolan','Christopher Jonathan James Nolan is a British film director, screenwriter, and producer. He has created several of the most critically and commercially successful films of the early 21st century.',NULL,1),('D.B. Weiss',NULL,NULL,0),('Dan Harmon',NULL,NULL,0),('David Benioff',NULL,NULL,0),('David Shore',NULL,NULL,0),('Ei Aoki',NULL,NULL,1),('Ernest Cline','Ernest Cline is an American novelist, spoken word artist and screenwriter.',NULL,1),('Fall Out Boy',NULL,NULL,0),('Hiroshi Hamasaki',NULL,NULL,1),('Hoyt Van Hoytema','Hoyte van Hoytema is a Dutch-Swedish cinematographer who studied at the Polish National Filmschool in Lodz. He has worked primarily in Sweden, but also in Germany, Norway, the United States and the United Kingdom.','Can handhold IMAX cameras',1),('iFixit','Right to Repair. iFixit is a global community of people helping each other repair things. Let\'s fix the world, one device at a time. Why Repair?',NULL,1),('James McVinnie','Animator and Director',NULL,0),('John Romita Jr.',NULL,NULL,1),('Kojima Productions','Kojima Productions is a Japanese video game development studio under the guidance of game designer Hideo Kojima. The company is a subsidiary of Konami, and is located in Roppongi Hills in Roppongi, Tokyo','Hideo Kojima\'s Studio',1),('Linkin Park','Linkin Park is an American rock band from Agoura Hills, California. Formed in 1996, the band rose to international fame with their debut album Hybrid Theory, which was certified Diamond by the RIAA',NULL,0),('Mark Millar',NULL,NULL,1),('Matthew Weiner',NULL,NULL,0),('Michael Bay','Michael Benjamin Bay is an American film director and producer. He is known for directing big-budget action films characterized by fast edits, stylistic visuals and extreme use of special effects.','Explosions; Teal and Orange; Boobs',1),('Michael Schur',NULL,NULL,0),('Peter Gould',NULL,NULL,0),('Tatsou Satou','Born in Oiso, Kanagawa, Japan.',NULL,1),('Tatsuya Ishihara',NULL,NULL,1),('Ubisoft','Ubisoft Entertainment S.A. is a French multinational video game developer and publisher, headquartered in Montreuil, France.','French',1),('Vince Gilligan',NULL,NULL,0),('Wikipedia','The w0rlz most accuratest dictionary',NULL,1);
/*!40000 ALTER TABLE `creator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `episode`
--

DROP TABLE IF EXISTS `episode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `episode` (
  `title` varchar(100) NOT NULL DEFAULT '',
  `season` int(11) NOT NULL DEFAULT '0',
  `noInSeason` int(11) NOT NULL DEFAULT '0',
  `epTitle` varchar(50) DEFAULT NULL,
  `airdate` date DEFAULT NULL,
  PRIMARY KEY (`title`,`season`,`noInSeason`),
  CONSTRAINT `episodefk_1` FOREIGN KEY (`title`) REFERENCES `television` (`title`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `episode`
--

LOCK TABLES `episode` WRITE;
/*!40000 ALTER TABLE `episode` DISABLE KEYS */;
INSERT INTO `episode` VALUES ('Better Call Saul',1,2,'Mijo',NULL),('Better Call Saul',1,3,'Nacho',NULL),('Better Call Saul',1,6,'Five-O',NULL),('Breaking Bad',1,6,'Crazy Handful of Nothin\'',NULL),('Breaking Bad',2,2,'Grilled',NULL),('Breaking Bad',2,12,'Phoenix',NULL),('Breaking Bad',2,13,'ABQ',NULL),('Breaking Bad',3,7,'One Minute',NULL),('Breaking Bad',3,12,'Half Measures',NULL),('Breaking Bad',3,13,'Full Measure',NULL),('Breaking Bad',4,10,'Salud',NULL),('Breaking Bad',4,11,'Crawl Space',NULL),('Breaking Bad',4,12,'End Times',NULL),('Breaking Bad',4,13,'Face Off',NULL),('Breaking Bad',5,7,'Say My Name',NULL),('Breaking Bad',5,14,'Ozymandias',NULL),('Community',1,24,'Modern Warfare',NULL),('Community',2,1,'Anthropology 101',NULL),('Community',2,23,'A Fistful of Paintballs',NULL),('Community',3,4,'Remedial Chaos Theory',NULL),('Community',5,8,'App Development and Condiments',NULL),('Game of Thrones',1,9,'Baelor',NULL),('Game of Thrones',2,9,'Blackwater',NULL),('Game of Thrones',3,9,'The Rains of Castamere',NULL),('Game of Thrones',4,2,'The Lion and the Rose',NULL),('Game of Thrones',4,8,'The Mountain and the Viper',NULL),('Game of Thrones',4,10,'The Children',NULL),('Gotham',1,7,'Penguin\'s Umbrella',NULL),('Gotham',1,18,'Everybody Has a Cobblepot',NULL),('House M.D.',1,21,'Three Stories',NULL),('House M.D.',2,24,'No Reason',NULL),('House M.D.',4,15,'House\'s Head',NULL),('Mad Men',1,12,'Kennedy vs. Nixon',NULL),('Mad Men',1,13,'The Wheel',NULL),('Mad Men',2,2,'Flight 1',NULL),('Parks and Recreation',2,7,'Hunting Trip',NULL),('Parks and Recreation',2,21,'Telethon',NULL),('Parks and Recreation',3,7,'Harvest Festival',NULL),('Parks and Recreation',4,14,'Bowling For Votes',NULL),('Parks and Recreation',4,24,'Win, Lose, Draw',NULL),('Parks and Recreation',5,10,'Leslie and Ben',NULL),('Parks and Recreation',6,22,'Moving Up Part 2',NULL),('Parks and Recreation',7,4,'Leslie and Ron',NULL),('Parks and Recreation',7,12,'One Last Ride Part 1',NULL),('Parks and Recreation',7,13,'One Last Ride Part 2',NULL);
/*!40000 ALTER TABLE `episode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `episodes`
--

DROP TABLE IF EXISTS `episodes`;
/*!50001 DROP VIEW IF EXISTS `episodes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `episodes` AS SELECT 
 1 AS `title`,
 1 AS `Episode Count`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorites` (
  `username` varchar(20) NOT NULL DEFAULT '',
  `title` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`username`,`title`),
  KEY `favoritesfk_2` (`title`),
  CONSTRAINT `favoritesfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `favoritesfk_2` FOREIGN KEY (`title`) REFERENCES `work` (`title`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` VALUES ('RAFernandez','Birdman'),('Viola','Clannad: After Story'),('RAFernandez','Interstellar'),('RAFernandez','Mass Effect 3'),('Viola','Mass Effect 3'),('Viola','My Teen Romantic Comedy SNAFU');
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genre` (
  `genre` varchar(50) NOT NULL DEFAULT '',
  `work` varchar(100) NOT NULL DEFAULT '',
  `isVerified` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`genre`,`work`),
  KEY `genrefk_1` (`work`),
  CONSTRAINT `genrefk_1` FOREIGN KEY (`work`) REFERENCES `work` (`title`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES ('drama','Clannad: After Story',1),('drama','Puella Magi Madoka Magica',1),('historic fiction','Assassin\'s Creed Unity',1),('science fiction','Interstellar',0),('science fiction','Mass Effect 3',1);
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graphicnovel`
--

DROP TABLE IF EXISTS `graphicnovel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graphicnovel` (
  `title` varchar(100) NOT NULL,
  `illustrator` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`title`),
  KEY `graphicnovelidx_1` (`illustrator`),
  CONSTRAINT `graphicnovelfk_1` FOREIGN KEY (`title`) REFERENCES `book` (`title`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `graphicnovelfk_2` FOREIGN KEY (`illustrator`) REFERENCES `creator` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graphicnovel`
--

LOCK TABLES `graphicnovel` WRITE;
/*!40000 ALTER TABLE `graphicnovel` DISABLE KEYS */;
INSERT INTO `graphicnovel` VALUES ('The Killing Joke',NULL),('V For Vendetta',NULL),('Watchmen',NULL);
/*!40000 ALTER TABLE `graphicnovel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `home page`
--

DROP TABLE IF EXISTS `home page`;
/*!50001 DROP VIEW IF EXISTS `home page`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `home page` AS SELECT 
 1 AS `title`,
 1 AS `Created By`,
 1 AS `description`,
 1 AS `class`,
 1 AS `rating`,
 1 AS `cover`,
 1 AS `releaseYear`,
 1 AS `viewCount`,
 1 AS `isVerified`,
 1 AS `network`,
 1 AS `studio`,
 1 AS `publisher`,
 1 AS `wordcount`,
 1 AS `datePremiered`,
 1 AS `Graphic Novel Illustrator`,
 1 AS `Comic/Manga Illustrator`,
 1 AS `URL`,
 1 AS `org`,
 1 AS `album`,
 1 AS `recordingStudio`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `keyword`
--

DROP TABLE IF EXISTS `keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keyword` (
  `keyword` varchar(50) NOT NULL DEFAULT '',
  `work` varchar(100) NOT NULL DEFAULT '',
  `isVerified` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`keyword`,`work`),
  KEY `keywordfk_1` (`work`),
  CONSTRAINT `keywordfk_1` FOREIGN KEY (`work`) REFERENCES `work` (`title`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keyword`
--

LOCK TABLES `keyword` WRITE;
/*!40000 ALTER TABLE `keyword` DISABLE KEYS */;
INSERT INTO `keyword` VALUES ('Fear is how I fall','Crawling',0),('Hans Zimmer\'s organs','Interstellar',1),('I\'ve had enough of your snide insinuations','Mass Effect 3',1),('Pointy blond hair','Crawling',1);
/*!40000 ALTER TABLE `keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liveactionanimation`
--

DROP TABLE IF EXISTS `liveactionanimation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liveactionanimation` (
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`title`),
  CONSTRAINT `liveactionanimationfk_1` FOREIGN KEY (`title`) REFERENCES `work` (`title`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liveactionanimation`
--

LOCK TABLES `liveactionanimation` WRITE;
/*!40000 ALTER TABLE `liveactionanimation` DISABLE KEYS */;
INSERT INTO `liveactionanimation` VALUES ('Better Call Saul'),('Birdman'),('Bodacious Space Pirates'),('Breaking Bad'),('Clannad: After Story'),('Community'),('End of the Line'),('Fate/Zero'),('Game of Thrones'),('Gotham'),('House M.D.'),('Interstellar'),('Mad Men'),('My Teen Romantic Comedy SNAFU'),('Parks and Recreation'),('Puella Magi Madoka Magica'),('Steins;Gate'),('Transformers: Age of Extinction');
/*!40000 ALTER TABLE `liveactionanimation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `music`
--

DROP TABLE IF EXISTS `music`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `music` (
  `title` varchar(100) NOT NULL,
  `album` varchar(70) DEFAULT NULL,
  `recordingStudio` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`title`),
  KEY `musicfk_2` (`album`),
  CONSTRAINT `musicfk_1` FOREIGN KEY (`title`) REFERENCES `work` (`title`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `musicfk_2` FOREIGN KEY (`album`) REFERENCES `album` (`title`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `music`
--

LOCK TABLES `music` WRITE;
/*!40000 ALTER TABLE `music` DISABLE KEYS */;
INSERT INTO `music` VALUES ('Crawling','Hybrid Theory','Warner Brothers'),('In The End','Hybrid Theory','Warner Brothers');
/*!40000 ALTER TABLE `music` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `proposals`
--

DROP TABLE IF EXISTS `proposals`;
/*!50001 DROP VIEW IF EXISTS `proposals`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `proposals` AS SELECT 
 1 AS `title`,
 1 AS `Created By`,
 1 AS `description`,
 1 AS `cover`,
 1 AS `isVerified`,
 1 AS `class`,
 1 AS `releaseYear`,
 1 AS `viewCount`,
 1 AS `network`,
 1 AS `studio`,
 1 AS `publisher`,
 1 AS `wordcount`,
 1 AS `datePremiered`,
 1 AS `Graphic Novel Illustrator`,
 1 AS `Comic/Manga Illustrator`,
 1 AS `URL`,
 1 AS `org`,
 1 AS `album`,
 1 AS `recordingStudio`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating` (
  `username` varchar(20) NOT NULL DEFAULT '',
  `title` varchar(100) NOT NULL DEFAULT '',
  `rating` int(11) NOT NULL,
  PRIMARY KEY (`username`,`title`),
  KEY `ratingfk_2` (`title`),
  CONSTRAINT `ratingfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ratingfk_2` FOREIGN KEY (`title`) REFERENCES `work` (`title`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES ('Cookie','Better Call Saul',3),('Cookie','Community',4),('Cookie','Game of Thrones',3),('Cookie','House M.D.',3),('Cookie','Jesus Christ Superstar',5),('Cookie','Potato',5),('Cookie','The Killing Joke',5),('Cookie','V for Vendetta',4),('Potato','Better Call Saul',4),('Potato','Community',4),('Potato','Game of Thrones',1),('Potato','House M.D.',3),('Potato','Jesus Christ Superstar',3),('Potato','Potato',5),('Potato','V for Vendetta',3),('Potato','Watchmen',5),('RAFernandez','Better Call Saul',4),('RAFernandez','Birdman',5),('RAFernandez','Community',5),('RAFernandez','Game of Thrones',5),('RAFernandez','House M.D.',3),('RAFernandez','Mass Effect 3',5),('RAFernandez','Potato',1),('RAFernandez','The Killing Joke',4),('RAFernandez','Transformers: Age of Extinction',1),('RAFernandez','V for Vendetta',5),('Viola','Better Call Saul',4),('Viola','Bodacious Space Pirates',3),('Viola','Community',4),('Viola','Fate/Zero',4),('Viola','Game of Thrones',5),('Viola','House M.D.',4),('Viola','Jesus Christ Superstar',1),('Viola','Kick-Ass',3),('Viola','My Teen Romantic Comedy SNAFU',4),('Viola','Puella Magi Madoka Magica',5),('Viola','V for Vendetta',5);
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recommendation`
--

DROP TABLE IF EXISTS `recommendation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recommendation` (
  `username` varchar(20) NOT NULL DEFAULT '',
  `workFrom` varchar(100) NOT NULL DEFAULT '',
  `workTo` varchar(100) NOT NULL DEFAULT '',
  `isRec` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`username`,`workFrom`,`workTo`,`isRec`),
  KEY `recommendationfk_2` (`workFrom`),
  KEY `recommendationfk_3` (`workTo`),
  CONSTRAINT `recommendationfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `recommendationfk_2` FOREIGN KEY (`workFrom`) REFERENCES `work` (`title`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `recommendationfk_3` FOREIGN KEY (`workTo`) REFERENCES `work` (`title`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recommendation`
--

LOCK TABLES `recommendation` WRITE;
/*!40000 ALTER TABLE `recommendation` DISABLE KEYS */;
INSERT INTO `recommendation` VALUES ('Viola','Bodacious Space Pirates','Interstellar',1),('RAFernandez','Crawling','In the End',1),('RAFernandez','In the End','Crawling',1),('RAFernandez','Interstellar','Mass Effect 3',1),('Viola','Interstellar','Bodacious Space Pirates',1),('RAFernandez','Mass Effect 3','Interstellar',1);
/*!40000 ALTER TABLE `recommendation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `username` varchar(20) NOT NULL DEFAULT '',
  `title` varchar(100) NOT NULL DEFAULT '',
  `review` varchar(2500) NOT NULL,
  `isFlagged` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`username`,`title`),
  KEY `reviewfk_2` (`title`),
  CONSTRAINT `reviewfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reviewfk_2` FOREIGN KEY (`title`) REFERENCES `work` (`title`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES ('RAFernandez','Birdman','Exceptional!',0),('RAFernandez','Hybrid Theory','A 21th century classic',0),('Viola','Clannad: After Story','One of the best anime ever released',0);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `television`
--

DROP TABLE IF EXISTS `television`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `television` (
  `title` varchar(100) NOT NULL,
  `network` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`title`),
  CONSTRAINT `televisionfk_1` FOREIGN KEY (`title`) REFERENCES `liveactionanimation` (`title`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `television`
--

LOCK TABLES `television` WRITE;
/*!40000 ALTER TABLE `television` DISABLE KEYS */;
INSERT INTO `television` VALUES ('Better Call Saul','AMC'),('Bodacious Space Pirates',''),('Breaking Bad','AMC'),('Clannad: After Story',''),('Community','NBC'),('Fate/Zero',''),('Game of Thrones','HBO'),('Gotham','FOX'),('House M.D.','FOX'),('Mad Men','AMC'),('My Teen Romantic Comedy SNAFU',''),('Parks and Recreation','NBC'),('Puella Magi Madoka Magica',''),('Steins;Gate','');
/*!40000 ALTER TABLE `television` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theater`
--

DROP TABLE IF EXISTS `theater`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `theater` (
  `title` varchar(100) NOT NULL,
  `datePremiered` date DEFAULT NULL,
  PRIMARY KEY (`title`),
  CONSTRAINT `theaterfk_1` FOREIGN KEY (`title`) REFERENCES `work` (`title`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theater`
--

LOCK TABLES `theater` WRITE;
/*!40000 ALTER TABLE `theater` DISABLE KEYS */;
INSERT INTO `theater` VALUES ('Jesus Christ Superstar','1970-05-11');
/*!40000 ALTER TABLE `theater` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `username` varchar(20) NOT NULL,
  `fname` varchar(30) NOT NULL,
  `lname` varchar(30) NOT NULL,
  `gender` char(1) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL,
  `profpic` varchar(45) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `isFlagged` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('Cookie','Cookie','Batter','F','cookies@yahoo.com','chocolatechips','cookie.jpg','A cookie',1),('Potato','Potato','Salad','M','potato@gmail.com','potatoes','potato.jpg','An ordinary garden potato',0),('RAFernandez','Austin','Fernandez','M','ryanaustinf@potato.com','Game of Breaking Gotham Parks','Austin.jpg','It\'s Austin. Enough said.',0),('Viola','Jonah','Syfu','M','jonahsyfu@yahoo.com','kokoro23','Viola.jpg','An ordinary guy who likes anime and video games.',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videogame`
--

DROP TABLE IF EXISTS `videogame`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videogame` (
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`title`),
  CONSTRAINT `videogamefk_1` FOREIGN KEY (`title`) REFERENCES `work` (`title`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videogame`
--

LOCK TABLES `videogame` WRITE;
/*!40000 ALTER TABLE `videogame` DISABLE KEYS */;
INSERT INTO `videogame` VALUES ('Assassin\'s Creed Unity'),('Mass Effect 3'),('Metal Gear Solid V: The Phantom Pain');
/*!40000 ALTER TABLE `videogame` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webcontent`
--

DROP TABLE IF EXISTS `webcontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webcontent` (
  `title` varchar(100) NOT NULL,
  `URL` varchar(100) NOT NULL,
  `org` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`title`),
  CONSTRAINT `webcontentfk_1` FOREIGN KEY (`title`) REFERENCES `work` (`title`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webcontent`
--

LOCK TABLES `webcontent` WRITE;
/*!40000 ALTER TABLE `webcontent` DISABLE KEYS */;
INSERT INTO `webcontent` VALUES ('Potato','http://en.wikipedia.org/wiki/Potato','Wikipedia');
/*!40000 ALTER TABLE `webcontent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work`
--

DROP TABLE IF EXISTS `work`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work` (
  `title` varchar(100) NOT NULL,
  `releaseYear` char(4) DEFAULT NULL,
  `cover` varchar(100) DEFAULT NULL,
  `class` varchar(45) NOT NULL,
  `viewCount` int(11) DEFAULT '0',
  `isVerified` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`title`,`class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work`
--

LOCK TABLES `work` WRITE;
/*!40000 ALTER TABLE `work` DISABLE KEYS */;
INSERT INTO `work` VALUES ('Assassin\'s Creed Unity','2014','covers/Assassin\'s Creed Unity.jpg','video game',0,1,NULL),('Avatar: The Last Airbender','2003',NULL,'animation',0,0,NULL),('BAYBEH BAYBEH','1999',NULL,'music',0,0,'OH BAYBEH BAYBEH'),('Better Call Saul','2015',NULL,'television',50,1,NULL),('Birdman','2014','covers/Birdman.jpg','movie',0,1,NULL),('Bodacious Space Pirates','2012','covers/Bodacious Space Pirates.jpg','animation',0,1,NULL),('Boku no Pico','????',NULL,'animation',0,0,'Most sublime work ever.'),('Breaking Bad','2008',NULL,'television',50,1,NULL),('Clannad: After Story','2008','covers/Clannad: After Story.jpg','animation',0,1,NULL),('Community','2009',NULL,'television',50,1,NULL),('Crawling','2000','covers/Hybrid Theory.jpg','music',0,1,NULL),('Death Note','2006',NULL,'animation',0,0,'Some guy gets a notebook. He writes your name; you die. End of story. Also, there\'s this guy called L. He\'s awesome, but he dies in episode 25 and then the show suck supreme balls after that... except for the finale... that was fucking awesome...'),('End of the Line','2014',NULL,'animation',124,0,NULL),('Fate/Zero','2011','covers/Fate Zero.jpg','animation',0,1,NULL),('Fullmetal Alchemist: Brotherhood','2009',NULL,'animation',0,0,'ALCHEMY AND SHIT'),('Game of Thrones','2011',NULL,'television',1000,1,'Seven families fight for the Iron Throne of Westeros; a force in the North threatens to destroy everything in Westeros; and in the east, the refugee Daenerys Targaryen seeks to reclaim her family\'s throne. Amidst all this chaos, Winter is Coming.'),('Gotham','2014',NULL,'television',20,1,NULL),('House M.D.','2004',NULL,'television',50,1,NULL),('Hybrid Theory','2000','covers/Hybrid Theory.jpg','album',12,1,NULL),('Hyperdimension Neptunia Re;Birth 2','2014',NULL,'video game',0,0,'CONSOLE WARS AND SHIT'),('In the End','2000','covers/Hybrid Theory.jpg','music',0,1,NULL),('Interstellar','2014','covers/Interstellar.jpg','movie',100000,1,'In a dying Earth, a farmer named Cooper seeks to save the human race by finding another planet through a wormhole by Saturn.'),('Jesus Christ Superstar','1970','covers/Jesus Christ Superstar.jpg','theater',214,1,NULL),('Kick-Ass','2010',NULL,'comic',60,1,NULL),('Mad Men','2007',NULL,'television',30,1,NULL),('Mass Effect 3','2012','covers/Mass Effect 3.jpg','video game',0,1,NULL),('Metal Gear Solid 4','2008',NULL,'video game',0,0,'Old Snake \"snakes\" around *wink* *wink*.'),('Metal Gear Solid V: The Phantom Pain','2015','covers/Metal Gear Solid V: The Phantom Pain.jpg','video game',0,1,NULL),('Mistborn: The Final Empire','2007',NULL,'book',0,0,'A Mistborn rebel, Kelsier, attempts to overthrow an oppressive government led by a godlike persona known as the Lord Ruler.'),('My Teen Romantic Comedy SNAFU','2013','covers/My Teen Romantic Comedy SNAFU.jpg','animation',0,1,NULL),('Parks and Recreation','2008',NULL,'television',50,1,NULL),('Pokemon AlphaSapphire','2014',NULL,'video game',0,0,'A remake of Pokemon Sapphire.'),('Potato','','covers/Potato.jpg','web content',54767363,1,NULL),('Puella Magi Madoka Magica','2011','covers/Puella Magi Madoka Magica.jpg','animation',0,1,NULL),('Ready Player One','2011','covers/Ready Player One.jpg','book',0,1,NULL),('Save Rock and Roll','2013','covers/Save Rock and Roll.jpg','album',124,0,NULL),('Steins;Gate','2011','covers/Steins Gate.jpg','animation',0,1,NULL),('The Dark Knight','2008',NULL,'movie',0,0,NULL),('The Killing Joke','1988',NULL,'graphic novel',60,1,NULL),('The Shining','1980',NULL,'movie',0,0,'Jack Nicholson goes crazy.							\r\n						'),('The Walking Dead','2009',NULL,'television',0,0,NULL),('The Walking Dead','2013',NULL,'video game',0,0,NULL),('Transformers: Age of Extinction','2014','covers/Transformers: Age of Extinction.jpg','movie',0,1,NULL),('V for Vendetta','1985',NULL,'graphic novel',60,1,NULL),('Watchmen','1987',NULL,'graphic novel',60,1,NULL);
/*!40000 ALTER TABLE `work` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workcreator`
--

DROP TABLE IF EXISTS `workcreator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workcreator` (
  `name` varchar(70) NOT NULL DEFAULT '',
  `title` varchar(100) NOT NULL DEFAULT '',
  `role` varchar(45) NOT NULL,
  `isMain` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`,`title`),
  KEY `workcreatorfk_2` (`title`),
  CONSTRAINT `workcreatorfk_1` FOREIGN KEY (`name`) REFERENCES `creator` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `workcreatorfk_2` FOREIGN KEY (`title`) REFERENCES `work` (`title`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workcreator`
--

LOCK TABLES `workcreator` WRITE;
/*!40000 ALTER TABLE `workcreator` DISABLE KEYS */;
INSERT INTO `workcreator` VALUES ('Ai Yoshimura','My Teen Romantic Comedy SNAFU','Director',1),('Akiyuki Shinbou','Puella Magi Madoka Magica','Director',1),('Alan Moore','The Killing Joke','Writer',1),('Alan Moore','V for Vendetta','Writer',1),('Alan Moore','Watchmen','Writer',1),('Alejandro Gonzalez Inarritu','Birdman','Director',1),('Andrew Lloyd Webber','Jesus Christ Superstar','Composer',1),('Bioware','Mass Effect 3','Developer',1),('Bruno Heller','Gotham','showrunner',1),('Christopher Nolan','Interstellar','Director',1),('D.B. Weiss','Game of Thrones','showrunner',1),('Dan Harmon','Community','showrunner',1),('David Benioff','Game of Thrones','showrunner',1),('David Shore','House M.D.','showrunner',1),('Ei Aoki','Fate/Zero','Director',1),('Ernest Cline','Ready Player One','Author',1),('Fall Out Boy','Save Rock and Roll','Artist',1),('Hiroshi Hamasaki','Steins;Gate','Director',1),('Hoyt Van Hoytema','Interstellar','Cinematographer',0),('James McVinnie','End of the Line','Director',1),('Kojima Productions','Metal Gear Solid V: The Phantom Pain','Developer',1),('Linkin Park','In The End','Performer',1),('Mark Millar','Kick-Ass','Writer',1),('Matthew Weiner','Mad Men','showrunner',1),('Michael Bay','Transformers: Age of Extinction','Director',1),('Michael Schur','Parks and Recreation','showrunner',1),('Peter Gould','Better Call Saul','showrunner',1),('Tatsou Satou','Bodacious Space Pirates','Director',1),('Tatsuya Ishihara','Clannad: After Story','Director',1),('Ubisoft','Assassin\'s Creed Unity','Developer',1),('Vince Gilligan','Better Call Saul','showrunner',1),('Vince Gilligan','Breaking Bad','showrunner',1);
/*!40000 ALTER TABLE `workcreator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `all works`
--

/*!50001 DROP VIEW IF EXISTS `all works`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `all works` AS select `w`.`title` AS `title`,`wc2`.`name` AS `Created By`,`w`.`description` AS `description`,`w`.`class` AS `class`,`w`.`cover` AS `cover`,ifnull(avg(`r`.`rating`),0) AS `rating`,`w`.`releaseYear` AS `releaseYear`,`w`.`viewCount` AS `viewCount`,`w`.`isVerified` AS `isVerified`,`t`.`network` AS `network`,`a`.`studio` AS `studio`,`b`.`publisher` AS `publisher`,`b`.`wordcount` AS `wordcount`,`th`.`datePremiered` AS `datePremiered`,`gn`.`illustrator` AS `Graphic Novel Illustrator`,`cm`.`illustrator` AS `Comic/Manga Illustrator`,`wc`.`URL` AS `URL`,`wc`.`org` AS `org`,`m`.`album` AS `album`,`m`.`recordingStudio` AS `recordingStudio` from (((((((((((((`work` `w` left join `liveactionanimation` `laa` on((`w`.`title` = `laa`.`title`))) left join `television` `t` on((`w`.`title` = `t`.`title`))) left join `animation` `a` on((`t`.`title` = `a`.`title`))) left join `book` `b` on((`w`.`title` = `b`.`title`))) left join `graphicnovel` `gn` on((`b`.`title` = `gn`.`title`))) left join `comicsmanga` `cm` on((`b`.`title` = `cm`.`title`))) left join `webcontent` `wc` on((`w`.`title` = `wc`.`title`))) left join `theater` `th` on((`w`.`title` = `th`.`title`))) left join `videogame` `v` on((`w`.`title` = `v`.`title`))) left join `music` `m` on((`w`.`title` = `m`.`title`))) left join `album` `al` on((`w`.`title` = `al`.`title`))) left join `workcreator` `wc2` on(((`w`.`title` = `wc2`.`title`) and (`wc2`.`isMain` = 1)))) left join `rating` `r` on((`w`.`title` = `r`.`title`))) group by `w`.`title` order by `w`.`viewCount` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `episodes`
--

/*!50001 DROP VIEW IF EXISTS `episodes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `episodes` AS select `t`.`title` AS `title`,count(`e`.`title`) AS `Episode Count` from (`television` `t` join `episode` `e`) where (`t`.`title` = `e`.`title`) group by `t`.`title` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `home page`
--

/*!50001 DROP VIEW IF EXISTS `home page`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `home page` AS select `w`.`title` AS `title`,`wc2`.`name` AS `Created By`,`w`.`description` AS `description`,`w`.`class` AS `class`,ifnull(avg(`r`.`rating`),0) AS `rating`,`w`.`cover` AS `cover`,`w`.`releaseYear` AS `releaseYear`,`w`.`viewCount` AS `viewCount`,`w`.`isVerified` AS `isVerified`,`t`.`network` AS `network`,`a`.`studio` AS `studio`,`b`.`publisher` AS `publisher`,`b`.`wordcount` AS `wordcount`,`th`.`datePremiered` AS `datePremiered`,`gn`.`illustrator` AS `Graphic Novel Illustrator`,`cm`.`illustrator` AS `Comic/Manga Illustrator`,`wc`.`URL` AS `URL`,`wc`.`org` AS `org`,`m`.`album` AS `album`,`m`.`recordingStudio` AS `recordingStudio` from (((((((((((((`work` `w` left join `liveactionanimation` `laa` on((`w`.`title` = `laa`.`title`))) left join `television` `t` on((`w`.`title` = `t`.`title`))) left join `animation` `a` on((`t`.`title` = `a`.`title`))) left join `book` `b` on((`w`.`title` = `b`.`title`))) left join `graphicnovel` `gn` on((`b`.`title` = `gn`.`title`))) left join `comicsmanga` `cm` on((`b`.`title` = `cm`.`title`))) left join `webcontent` `wc` on((`w`.`title` = `wc`.`title`))) left join `theater` `th` on((`w`.`title` = `th`.`title`))) left join `videogame` `v` on((`w`.`title` = `v`.`title`))) left join `music` `m` on((`w`.`title` = `m`.`title`))) left join `album` `al` on((`w`.`title` = `al`.`title`))) left join `workcreator` `wc2` on(((`w`.`title` = `wc2`.`title`) and (`wc2`.`isMain` = 1)))) left join `rating` `r` on((`w`.`title` = `r`.`title`))) where (`w`.`isVerified` = 1) group by `w`.`title` order by `w`.`viewCount` desc limit 10 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `proposals`
--

/*!50001 DROP VIEW IF EXISTS `proposals`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `proposals` AS select `w`.`title` AS `title`,`wc2`.`name` AS `Created By`,`w`.`description` AS `description`,`w`.`cover` AS `cover`,`w`.`isVerified` AS `isVerified`,`w`.`class` AS `class`,`w`.`releaseYear` AS `releaseYear`,`w`.`viewCount` AS `viewCount`,`t`.`network` AS `network`,`a`.`studio` AS `studio`,`b`.`publisher` AS `publisher`,`b`.`wordcount` AS `wordcount`,`th`.`datePremiered` AS `datePremiered`,`gn`.`illustrator` AS `Graphic Novel Illustrator`,`cm`.`illustrator` AS `Comic/Manga Illustrator`,`wc`.`URL` AS `URL`,`wc`.`org` AS `org`,`m`.`album` AS `album`,`m`.`recordingStudio` AS `recordingStudio` from ((((((((((((`work` `w` left join `liveactionanimation` `laa` on((`w`.`title` = `laa`.`title`))) left join `television` `t` on((`w`.`title` = `t`.`title`))) left join `animation` `a` on((`t`.`title` = `a`.`title`))) left join `book` `b` on((`w`.`title` = `b`.`title`))) left join `graphicnovel` `gn` on((`b`.`title` = `gn`.`title`))) left join `comicsmanga` `cm` on((`b`.`title` = `cm`.`title`))) left join `webcontent` `wc` on((`w`.`title` = `wc`.`title`))) left join `theater` `th` on((`w`.`title` = `th`.`title`))) left join `videogame` `v` on((`w`.`title` = `v`.`title`))) left join `music` `m` on((`w`.`title` = `m`.`title`))) left join `album` `al` on((`w`.`title` = `al`.`title`))) left join `workcreator` `wc2` on(((`w`.`title` = `wc2`.`title`) and (`wc2`.`isMain` = 1)))) where (`w`.`isVerified` = 0) order by `w`.`viewCount` desc */;
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

-- Dump completed on 2015-03-22 19:11:51
