CREATE DATABASE  IF NOT EXISTS `tmi` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `tmi`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: tmi
-- ------------------------------------------------------
-- Server version	5.6.22-log

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
INSERT INTO `admin` VALUES ('Hodor'),('RAFernandez');
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
  `class` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`title`,`class`),
  CONSTRAINT `albumfk_1` FOREIGN KEY (`title`, `class`) REFERENCES `work` (`title`, `class`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES ('Hybrid Theory','album'),('Save Rock and Roll','album');
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `all works`
--

DROP TABLE IF EXISTS `all works`;
/*!50001 DROP VIEW IF EXISTS `all works`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `all works` (
  `title` tinyint NOT NULL,
  `Created By` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `class` tinyint NOT NULL,
  `cover` tinyint NOT NULL,
  `rating` tinyint NOT NULL,
  `releaseYear` tinyint NOT NULL,
  `viewCount` tinyint NOT NULL,
  `isVerified` tinyint NOT NULL,
  `network` tinyint NOT NULL,
  `studio` tinyint NOT NULL,
  `publisher` tinyint NOT NULL,
  `wordcount` tinyint NOT NULL,
  `datePremiered` tinyint NOT NULL,
  `Graphic Novel Illustrator` tinyint NOT NULL,
  `Comic/Manga Illustrator` tinyint NOT NULL,
  `URL` tinyint NOT NULL,
  `org` tinyint NOT NULL,
  `album` tinyint NOT NULL,
  `recordingStudio` tinyint NOT NULL
) ENGINE=MyISAM */;
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
  `class` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`title`,`class`),
  KEY `animationfk_2` (`studio`),
  CONSTRAINT `animationfk_1` FOREIGN KEY (`title`, `class`) REFERENCES `television` (`title`, `class`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animation`
--

LOCK TABLES `animation` WRITE;
/*!40000 ALTER TABLE `animation` DISABLE KEYS */;
INSERT INTO `animation` VALUES ('My Teen Romantic Comedy SNAFU','Brains Base','animation'),('Clannad: After Story','Kyoto Animation','animation'),('Bodacious Space Pirates','Satelight','animation'),('Puella Magi Madoka Magica','Shaft','animation'),('Fate/Zero','ufotable','animation'),('Steins;Gate','White Fox','animation');
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
  `class` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`title`,`class`),
  CONSTRAINT `bookfk_1` FOREIGN KEY (`title`, `class`) REFERENCES `work` (`title`, `class`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES ('Kick-Ass',NULL,NULL,'comic'),('Ready Player One','Random House',NULL,'book'),('The Killing Joke',NULL,NULL,'graphic novel'),('V for Vendetta',NULL,NULL,'graphic novel'),('Watchmen',NULL,NULL,'graphic novel');
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
  `class` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`comic`,`class`,`issue`),
  CONSTRAINT `comicissuefk_1` FOREIGN KEY (`comic`, `class`) REFERENCES `comicsmanga` (`title`, `class`) ON DELETE CASCADE ON UPDATE CASCADE
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
  `class` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`title`,`class`),
  KEY `comicsmangafk_2` (`illustrator`),
  CONSTRAINT `comicsmangafk_1` FOREIGN KEY (`title`, `class`) REFERENCES `book` (`title`, `class`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comicsmangafk_2` FOREIGN KEY (`illustrator`) REFERENCES `creator` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comicsmanga`
--

LOCK TABLES `comicsmanga` WRITE;
/*!40000 ALTER TABLE `comicsmanga` DISABLE KEYS */;
INSERT INTO `comicsmanga` VALUES ('Kick-Ass','John Romita Jr.','comic');
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
INSERT INTO `creator` VALUES ('Ai Yoshimura',NULL,NULL,1),('Akiyuki Shinbou','Akiyuki Shinbou is a freelance director, who is now working with Shaft as an educator. He says that the reason he sticks with Shaft is due to their system, professional and digital capacity; which makes his expression of direction much easier.',NULL,1),('Alan Moore',NULL,NULL,1),('Alejandro Gonzalez Inarritu','Alejandro González Iñárritu is a Mexican film director, producer, screenwriter, and composer. González Iñárritu is the first Mexican director to be nominated for the Academy Award for Best Director and the ... ',NULL,1),('Bioware','BioWare is a Canadian video game developer founded in February 1995 by newly graduated medical doctors Ray Muzyka, Greg Zeschuk, and Augustine Yip. BioWare is currently owned by American company Electronic Arts.','Awesome stories',1),('Christopher Nolan','Christopher Jonathan James Nolan is a British film director, screenwriter, and producer. He has created several of the most critically and commercially successful films of the early 21st century.',NULL,1),('Ei Aoki',NULL,NULL,1),('Ernest Cline','Ernest Cline is an American novelist, spoken word artist and screenwriter.',NULL,1),('Fall Out Boy',NULL,NULL,0),('George R.R. Martin','He kills characters.','yes',0),('Hiroshi Hamasaki',NULL,NULL,1),('Hoyt Van Hoytema','Hoyte van Hoytema is a Dutch-Swedish cinematographer who studied at the Polish National Filmschool in Lodz. He has worked primarily in Sweden, but also in Germany, Norway, the United States and the United Kingdom.','Can handhold IMAX cameras',1),('iFixit','Right to Repair. iFixit is a global community of people helping each other repair things. Let\'s fix the world, one device at a time. Why Repair?',NULL,1),('James McVinnie','Animator and Director',NULL,0),('John Romita Jr.',NULL,NULL,1),('Jonah Boobs','He grew his boobs when she turned 17.','Has boobs',0),('Kojima Productions','Kojima Productions is a Japanese video game development studio under the guidance of game designer Hideo Kojima. The company is a subsidiary of Konami, and is located in Roppongi Hills in Roppongi, Tokyo','Hideo Kojima\'s Studio',1),('Linkin Park','Linkin Park is an American rock band from Agoura Hills, California. Formed in 1996, the band rose to international fame with their debut album Hybrid Theory, which was certified Diamond by the RIAA',NULL,0),('Mark Millar',NULL,NULL,1),('Matthew Weiner',NULL,NULL,0),('Michael Bay','Michael Benjamin Bay is an American film director and producer. He is known for directing big-budget action films characterized by fast edits, stylistic visuals and extreme use of special effects.','Explosions; Teal and Orange; Boobs',1),('Michael Schur',NULL,NULL,0),('Peter Gould',NULL,NULL,0),('Tatsou Satou','Born in Oiso, Kanagawa, Japan.',NULL,1),('Tatsuya Ishihara',NULL,NULL,1),('Tom Cruise','','Does his own stunts.',0),('Ubisoft','Ubisoft Entertainment S.A. is a French multinational video game developer and publisher, headquartered in Montreuil, France.','French',1),('Vince Gilligan',NULL,NULL,0),('Wikipedia','The w0rlz most accuratest dictionary',NULL,1);
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
  `class` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`title`,`class`,`season`,`noInSeason`),
  CONSTRAINT `episodefk_1` FOREIGN KEY (`title`, `class`) REFERENCES `television` (`title`, `class`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `episode`
--

LOCK TABLES `episode` WRITE;
/*!40000 ALTER TABLE `episode` DISABLE KEYS */;
INSERT INTO `episode` VALUES ('Better Call Saul',1,2,'Mijo',NULL,'television'),('Better Call Saul',1,3,'Nacho',NULL,'television'),('Better Call Saul',1,6,'Five-O',NULL,'television'),('Breaking Bad',1,6,'Crazy Handful of Nothin\'',NULL,'television'),('Breaking Bad',2,2,'Grilled',NULL,'television'),('Breaking Bad',2,12,'Phoenix',NULL,'television'),('Breaking Bad',2,13,'ABQ',NULL,'television'),('Breaking Bad',3,7,'One Minute',NULL,'television'),('Breaking Bad',3,12,'Half Measures',NULL,'television'),('Breaking Bad',3,13,'Full Measure',NULL,'television'),('Breaking Bad',4,10,'Salud',NULL,'television'),('Breaking Bad',4,11,'Crawl Space',NULL,'television'),('Breaking Bad',4,12,'End Times',NULL,'television'),('Breaking Bad',4,13,'Face Off',NULL,'television'),('Breaking Bad',5,7,'Say My Name',NULL,'television'),('Breaking Bad',5,14,'Ozymandias',NULL,'television'),('Community',1,24,'Modern Warfare',NULL,'television'),('Community',2,1,'Anthropology 101',NULL,'television'),('Community',2,23,'A Fistful of Paintballs',NULL,'television'),('Community',3,4,'Remedial Chaos Theory',NULL,'television'),('Community',5,8,'App Development and Condiments',NULL,'television'),('Game of Thrones',1,9,'Baelor',NULL,'television'),('Game of Thrones',2,9,'Blackwater',NULL,'television'),('Game of Thrones',3,9,'The Rains of Castamere',NULL,'television'),('Game of Thrones',4,2,'The Lion and the Rose',NULL,'television'),('Game of Thrones',4,8,'The Mountain and the Viper',NULL,'television'),('Game of Thrones',4,10,'The Children',NULL,'television'),('Gotham',1,7,'Penguin\'s Umbrella',NULL,'television'),('Gotham',1,18,'Everybody Has a Cobblepot',NULL,'television'),('House M.D.',1,21,'Three Stories',NULL,'television'),('House M.D.',2,24,'No Reason',NULL,'television'),('House M.D.',4,15,'House\'s Head',NULL,'television'),('Mad Men',1,12,'Kennedy vs. Nixon',NULL,'television'),('Mad Men',1,13,'The Wheel',NULL,'television'),('Mad Men',2,2,'Flight 1',NULL,'television'),('Parks and Recreation',2,7,'Hunting Trip',NULL,'television'),('Parks and Recreation',2,21,'Telethon',NULL,'television'),('Parks and Recreation',3,7,'Harvest Festival',NULL,'television'),('Parks and Recreation',4,14,'Bowling For Votes',NULL,'television'),('Parks and Recreation',4,24,'Win, Lose, Draw',NULL,'television'),('Parks and Recreation',5,10,'Leslie and Ben',NULL,'television'),('Parks and Recreation',6,22,'Moving Up Part 2',NULL,'television'),('Parks and Recreation',7,4,'Leslie and Ron',NULL,'television'),('Parks and Recreation',7,12,'One Last Ride Part 1',NULL,'television'),('Parks and Recreation',7,13,'One Last Ride Part 2',NULL,'television');
/*!40000 ALTER TABLE `episode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `episodes`
--

DROP TABLE IF EXISTS `episodes`;
/*!50001 DROP VIEW IF EXISTS `episodes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `episodes` (
  `title` tinyint NOT NULL,
  `Episode Count` tinyint NOT NULL
) ENGINE=MyISAM */;
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
  `titleclass` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`username`,`title`,`titleclass`),
  KEY `favoritesfk_2` (`title`,`titleclass`),
  CONSTRAINT `favoritesfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `favoritesfk_2` FOREIGN KEY (`title`, `titleclass`) REFERENCES `work` (`title`, `class`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` VALUES ('Hodor','Better Call Saul','television'),('RAFernandez','Birdman','movie'),('Viola','Clannad: After Story','animation'),('ImpasaurusRex','Death Note','animation'),('IAmGroot','Fate/Zero','animation'),('JhayFelix','Fullmetal Alchemist: Brotherhood','animation'),('Hodor','Game of Thrones','television'),('IAmGroot','Game of Thrones','television'),('ImpasaurusRex','Game of Thrones','television'),('Hodor','Interstellar','movie'),('IAmGroot','Interstellar','movie'),('RAFernandez','Interstellar','movie'),('Hodor','Jesus Christ Superstar','theater'),('ImpasaurusRex','Jesus Christ Superstar','theater'),('JhayFelix','Mass Effect 3','video game'),('RAFernandez','Mass Effect 3','video game'),('Viola','Mass Effect 3','video game'),('Hodor','Mistborn: The Final Empire','book'),('ImpasaurusRex','My Teen Romantic Comedy SNAFU','animation'),('Viola','My Teen Romantic Comedy SNAFU','animation');
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
  `workclass` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`genre`,`work`,`workclass`),
  KEY `genrefk_1` (`work`,`workclass`),
  CONSTRAINT `genrefk_1` FOREIGN KEY (`work`, `workclass`) REFERENCES `work` (`title`, `class`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES ('Action','Interstellar',1,'movie'),('Adventure','Interstellar',1,'movie'),('drama','Clannad: After Story',1,'animation'),('Drama','Game of Thrones',1,'television'),('drama','Puella Magi Madoka Magica',1,'animation'),('Fantasy','Game of Thrones',1,'television'),('historic fiction','Assassin\'s Creed Unity',1,'video game'),('Sci-Fi','Interstellar',1,'movie'),('science fiction','Interstellar',1,'movie'),('science fiction','Mass Effect 3',1,'video game'),('Thriller','Interstellar',1,'movie'),('War','Game of Thrones',1,'television');
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
  `class` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`title`,`class`),
  KEY `graphicnovelidx_1` (`illustrator`),
  CONSTRAINT `graphicnovelfk_1` FOREIGN KEY (`title`, `class`) REFERENCES `book` (`title`, `class`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `graphicnovelfk_2` FOREIGN KEY (`illustrator`) REFERENCES `creator` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graphicnovel`
--

LOCK TABLES `graphicnovel` WRITE;
/*!40000 ALTER TABLE `graphicnovel` DISABLE KEYS */;
INSERT INTO `graphicnovel` VALUES ('The Killing Joke',NULL,'graphic novel'),('V For Vendetta',NULL,'graphic novel'),('Watchmen',NULL,'graphic novel');
/*!40000 ALTER TABLE `graphicnovel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `home page`
--

DROP TABLE IF EXISTS `home page`;
/*!50001 DROP VIEW IF EXISTS `home page`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `home page` (
  `title` tinyint NOT NULL,
  `Created By` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `class` tinyint NOT NULL,
  `rating` tinyint NOT NULL,
  `cover` tinyint NOT NULL,
  `releaseYear` tinyint NOT NULL,
  `viewCount` tinyint NOT NULL,
  `isVerified` tinyint NOT NULL,
  `network` tinyint NOT NULL,
  `studio` tinyint NOT NULL,
  `publisher` tinyint NOT NULL,
  `wordcount` tinyint NOT NULL,
  `datePremiered` tinyint NOT NULL,
  `Graphic Novel Illustrator` tinyint NOT NULL,
  `Comic/Manga Illustrator` tinyint NOT NULL,
  `URL` tinyint NOT NULL,
  `org` tinyint NOT NULL,
  `album` tinyint NOT NULL,
  `recordingStudio` tinyint NOT NULL
) ENGINE=MyISAM */;
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
  `workclass` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`keyword`,`work`,`workclass`),
  KEY `keywordfk_1` (`work`,`workclass`),
  CONSTRAINT `keywordfk_1` FOREIGN KEY (`work`, `workclass`) REFERENCES `work` (`title`, `class`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keyword`
--

LOCK TABLES `keyword` WRITE;
/*!40000 ALTER TABLE `keyword` DISABLE KEYS */;
INSERT INTO `keyword` VALUES ('Bastards','Game of Thrones',1,'television'),('bitch','Better Call Saul',1,'television'),('black hole','Interstellar',1,'movie'),('Broken Things','Game of Thrones',1,'television'),('Controversial Ending','Mass Effect 3',1,'video game'),('Cripples','Game of Thrones',1,'television'),('Dragons','Game of Thrones',1,'television'),('father and daughter','Interstellar',1,'movie'),('Fear is how I fall','Crawling',1,'music'),('Hans Zimmer\'s organs','Interstellar',1,'movie'),('I\'ve had enough of your snide insinuations','Mass Effect 3',1,'video game'),('Incest','Game of Thrones',1,'television'),('Pointy blond hair','Crawling',1,'music'),('Red Wedding','Game of Thrones',1,'television'),('space','Interstellar',1,'movie'),('tidal wave','Interstellar',1,'movie'),('time','Interstellar',1,'movie'),('War','Game of Thrones',1,'television'),('Winter is Coming','Game of Thrones',1,'television');
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
  `class` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`title`,`class`),
  CONSTRAINT `liveactionanimationfk_1` FOREIGN KEY (`title`, `class`) REFERENCES `work` (`title`, `class`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liveactionanimation`
--

LOCK TABLES `liveactionanimation` WRITE;
/*!40000 ALTER TABLE `liveactionanimation` DISABLE KEYS */;
INSERT INTO `liveactionanimation` VALUES ('Better Call Saul','television'),('Birdman','movie'),('Bodacious Space Pirates','animation'),('Breaking Bad','television'),('Clannad: After Story','animation'),('Community','television'),('End of the Line','animation'),('Fate/Zero','animation'),('Game of Thrones','television'),('Gotham','television'),('House M.D.','television'),('Interstellar','movie'),('Mad Men','television'),('My Teen Romantic Comedy SNAFU','animation'),('Parks and Recreation','television'),('Puella Magi Madoka Magica','animation'),('Steins;Gate','animation'),('Transformers: Age of Extinction','movie');
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
  `class` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`title`,`class`),
  KEY `musicfk_2` (`album`),
  CONSTRAINT `musicfk_1` FOREIGN KEY (`title`, `class`) REFERENCES `work` (`title`, `class`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `musicfk_2` FOREIGN KEY (`album`) REFERENCES `album` (`title`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `music`
--

LOCK TABLES `music` WRITE;
/*!40000 ALTER TABLE `music` DISABLE KEYS */;
INSERT INTO `music` VALUES ('Crawling','Hybrid Theory','Warner Brothers','music'),('In The End','Hybrid Theory','Warner Brothers','music');
/*!40000 ALTER TABLE `music` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `proposals`
--

DROP TABLE IF EXISTS `proposals`;
/*!50001 DROP VIEW IF EXISTS `proposals`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `proposals` (
  `title` tinyint NOT NULL,
  `Created By` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `cover` tinyint NOT NULL,
  `isVerified` tinyint NOT NULL,
  `class` tinyint NOT NULL,
  `releaseYear` tinyint NOT NULL,
  `viewCount` tinyint NOT NULL,
  `network` tinyint NOT NULL,
  `studio` tinyint NOT NULL,
  `publisher` tinyint NOT NULL,
  `wordcount` tinyint NOT NULL,
  `datePremiered` tinyint NOT NULL,
  `Graphic Novel Illustrator` tinyint NOT NULL,
  `Comic/Manga Illustrator` tinyint NOT NULL,
  `URL` tinyint NOT NULL,
  `org` tinyint NOT NULL,
  `album` tinyint NOT NULL,
  `recordingStudio` tinyint NOT NULL
) ENGINE=MyISAM */;
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
  `titleclass` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`username`,`title`,`titleclass`),
  KEY `ratingfk_2` (`title`,`titleclass`),
  CONSTRAINT `ratingfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ratingfk_2` FOREIGN KEY (`title`, `titleclass`) REFERENCES `work` (`title`, `class`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES ('Cookie','Better Call Saul',3,'television'),('Cookie','Community',4,'television'),('Cookie','Game of Thrones',3,'television'),('Cookie','House M.D.',3,'television'),('Cookie','Jesus Christ Superstar',5,'theater'),('Cookie','Potato',5,'web content'),('Cookie','The Killing Joke',5,'graphic novel'),('Cookie','V for Vendetta',4,'graphic novel'),('eggs','Interstellar',5,'movie'),('Hodor','Game of Thrones',5,'television'),('Hodor','Steins;Gate',5,'animation'),('Potato','Better Call Saul',4,'television'),('Potato','Community',4,'television'),('Potato','Game of Thrones',1,'television'),('Potato','House M.D.',3,'television'),('Potato','Jesus Christ Superstar',3,'theater'),('Potato','Potato',5,'web content'),('Potato','V for Vendetta',3,'graphic novel'),('Potato','Watchmen',5,'graphic novel'),('RAFernandez','Better Call Saul',4,'television'),('RAFernandez','Birdman',5,'movie'),('RAFernandez','Community',5,'television'),('RAFernandez','Game of Thrones',5,'television'),('RAFernandez','House M.D.',3,'television'),('RAFernandez','Mass Effect 3',5,'video game'),('RAFernandez','Potato',1,'web content'),('RAFernandez','The Killing Joke',4,'graphic novel'),('RAFernandez','Transformers: Age of Extinction',1,'movie'),('RAFernandez','V for Vendetta',5,'graphic novel'),('Viola','Better Call Saul',4,'television'),('Viola','Bodacious Space Pirates',3,'animation'),('Viola','Community',4,'television'),('Viola','Fate/Zero',4,'animation'),('Viola','Game of Thrones',5,'television'),('Viola','House M.D.',4,'television'),('Viola','Jesus Christ Superstar',1,'theater'),('Viola','Kick-Ass',3,'comic'),('Viola','My Teen Romantic Comedy SNAFU',4,'animation'),('Viola','Puella Magi Madoka Magica',5,'animation'),('Viola','V for Vendetta',5,'graphic novel');
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
  `workFromClass` varchar(45) NOT NULL DEFAULT '',
  `workToClass` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`username`,`workFrom`,`workFromClass`,`workTo`,`workToClass`,`isRec`),
  KEY `recommendationfk_2` (`workFrom`,`workFromClass`),
  KEY `recommendationfk_3` (`workTo`,`workToClass`),
  CONSTRAINT `recommendationfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `recommendationfk_2` FOREIGN KEY (`workFrom`, `workFromClass`) REFERENCES `work` (`title`, `class`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `recommendationfk_3` FOREIGN KEY (`workTo`, `workToClass`) REFERENCES `work` (`title`, `class`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recommendation`
--

LOCK TABLES `recommendation` WRITE;
/*!40000 ALTER TABLE `recommendation` DISABLE KEYS */;
INSERT INTO `recommendation` VALUES ('Hodor','Avatar: The Last Airbender','Game of Thrones',1,'animation','television'),('IAmGroot','Avatar: The Last Airbender','Fate/Zero',1,'animation','animation'),('JhayFelix','Avatar: The Last Airbender','Fullmetal Alchemist: Brotherhood',1,'animation','animation'),('JhayFelix','Bodacious Space Pirates','Fullmetal Alchemist: Brotherhood',0,'animation','animation'),('Viola','Bodacious Space Pirates','Interstellar',1,'animation','movie'),('Hodor','Breaking Bad','Game of Thrones',1,'television','television'),('IAmGroot','Breaking Bad','Fate/Zero',1,'television','animation'),('IAmGroot','Clannad: After Story','Fate/Zero',1,'animation','animation'),('RAFernandez','Crawling','In the End',1,'music','music'),('Hodor','Death Note','Game of Thrones',1,'animation','television'),('IAmGroot','Death Note','Fate/Zero',1,'animation','animation'),('IAmGroot','Death Note','Interstellar',1,'animation','movie'),('JhayFelix','Death Note','Fullmetal Alchemist: Brotherhood',1,'animation','animation'),('Hodor','Fate/Zero','Game of Thrones',1,'animation','television'),('IAmGroot','Fate/Zero','Avatar: The Last Airbender',1,'animation','animation'),('IAmGroot','Fate/Zero','Breaking Bad',1,'animation','television'),('IAmGroot','Fate/Zero','Clannad: After Story',1,'animation','animation'),('IAmGroot','Fate/Zero','Death Note',1,'animation','animation'),('IAmGroot','Fate/Zero','Fullmetal Alchemist: Brotherhood',1,'animation','animation'),('IAmGroot','Fate/Zero','Game of Thrones',1,'animation','television'),('IAmGroot','Fate/Zero','Interstellar',1,'animation','movie'),('IAmGroot','Fate/Zero','Mass Effect 3',0,'animation','video game'),('IAmGroot','Fate/Zero','Metal Gear Solid 4',1,'animation','video game'),('IAmGroot','Fate/Zero','Metal Gear Solid V: The Phantom Pain',1,'animation','video game'),('IAmGroot','Fate/Zero','Mistborn: The Final Empire',1,'animation','book'),('IAmGroot','Fate/Zero','Potato',0,'animation','web content'),('IAmGroot','Fate/Zero','Steins;Gate',1,'animation','animation'),('IAmGroot','Fate/Zero','Transformers: Age of Extinction',0,'animation','movie'),('JhayFelix','Fate/Zero','Fullmetal Alchemist: Brotherhood',1,'animation','animation'),('Hodor','Fullmetal Alchemist: Brotherhood','Game of Thrones',1,'animation','television'),('IAmGroot','Fullmetal Alchemist: Brotherhood','Fate/Zero',1,'animation','animation'),('JhayFelix','Fullmetal Alchemist: Brotherhood','Avatar: The Last Airbender',1,'animation','animation'),('JhayFelix','Fullmetal Alchemist: Brotherhood','Bodacious Space Pirates',0,'animation','animation'),('JhayFelix','Fullmetal Alchemist: Brotherhood','Death Note',1,'animation','animation'),('JhayFelix','Fullmetal Alchemist: Brotherhood','Fate/Zero',1,'animation','animation'),('JhayFelix','Fullmetal Alchemist: Brotherhood','Game of Thrones',1,'animation','television'),('JhayFelix','Fullmetal Alchemist: Brotherhood','Gotham',1,'animation','television'),('JhayFelix','Fullmetal Alchemist: Brotherhood','Mad Men',0,'animation','television'),('JhayFelix','Fullmetal Alchemist: Brotherhood','Mass Effect 3',1,'animation','video game'),('JhayFelix','Fullmetal Alchemist: Brotherhood','Potato',0,'animation','web content'),('JhayFelix','Fullmetal Alchemist: Brotherhood','Puella Magi Madoka Magica',1,'animation','animation'),('JhayFelix','Fullmetal Alchemist: Brotherhood','Steins;Gate',1,'animation','animation'),('JhayFelix','Fullmetal Alchemist: Brotherhood','The Walking Dead',0,'animation','television'),('JhayFelix','Fullmetal Alchemist: Brotherhood','Transformers: Age of Extinction',0,'animation','movie'),('Hodor','Game of Thrones','Avatar: The Last Airbender',1,'television','animation'),('Hodor','Game of Thrones','Breaking Bad',1,'television','television'),('Hodor','Game of Thrones','Death Note',1,'television','animation'),('Hodor','Game of Thrones','Fate/Zero',1,'television','animation'),('Hodor','Game of Thrones','Fullmetal Alchemist: Brotherhood',1,'television','animation'),('Hodor','Game of Thrones','Gotham',0,'television','television'),('Hodor','Game of Thrones','House M.D.',1,'television','television'),('Hodor','Game of Thrones','Interstellar',1,'television','movie'),('Hodor','Game of Thrones','Kick-Ass',0,'television','comic'),('Hodor','Game of Thrones','Mad Men',1,'television','television'),('Hodor','Game of Thrones','Metal Gear Solid 4',1,'television','video game'),('Hodor','Game of Thrones','Metal Gear Solid V: The Phantom Pain',1,'television','video game'),('Hodor','Game of Thrones','Mistborn: The Final Empire',1,'television','book'),('Hodor','Game of Thrones','Potato',0,'television','web content'),('Hodor','Game of Thrones','Ready Player One',1,'television','book'),('Hodor','Game of Thrones','Steins;Gate',1,'television','animation'),('Hodor','Game of Thrones','Transformers: Age of Extinction',0,'television','movie'),('Hodor','Game of Thrones','V for Vendetta',1,'television','graphic novel'),('Hodor','Game of Thrones','Watchmen',1,'television','graphic novel'),('IAmGroot','Game of Thrones','Fate/Zero',1,'television','animation'),('JhayFelix','Game of Thrones','Fullmetal Alchemist: Brotherhood',1,'television','animation'),('Hodor','Gotham','Game of Thrones',0,'television','television'),('JhayFelix','Gotham','Fullmetal Alchemist: Brotherhood',1,'television','animation'),('Hodor','House M.D.','Game of Thrones',1,'television','television'),('RAFernandez','In the End','Crawling',1,'music','music'),('Hodor','Interstellar','Game of Thrones',1,'movie','television'),('IAmGroot','Interstellar','Death Note',1,'movie','animation'),('IAmGroot','Interstellar','Fate/Zero',1,'movie','animation'),('IAmGroot','Interstellar','Mass Effect 3',1,'movie','video game'),('IAmGroot','Interstellar','Metal Gear Solid 4',1,'movie','video game'),('IAmGroot','Interstellar','Metal Gear Solid V: The Phantom Pain',1,'movie','video game'),('IAmGroot','Interstellar','Potato',0,'movie','web content'),('IAmGroot','Interstellar','Steins;Gate',1,'movie','animation'),('IAmGroot','Interstellar','Transformers: Age of Extinction',0,'movie','movie'),('RAFernandez','Interstellar','Mass Effect 3',1,'movie','video game'),('Viola','Interstellar','Bodacious Space Pirates',1,'movie','animation'),('Hodor','Kick-Ass','Game of Thrones',0,'comic','television'),('Hodor','Mad Men','Game of Thrones',1,'television','television'),('JhayFelix','Mad Men','Fullmetal Alchemist: Brotherhood',0,'television','animation'),('IAmGroot','Mass Effect 3','Fate/Zero',0,'video game','animation'),('IAmGroot','Mass Effect 3','Interstellar',1,'video game','movie'),('JhayFelix','Mass Effect 3','Fullmetal Alchemist: Brotherhood',1,'video game','animation'),('RAFernandez','Mass Effect 3','Interstellar',1,'video game','movie'),('Hodor','Metal Gear Solid 4','Game of Thrones',1,'video game','television'),('IAmGroot','Metal Gear Solid 4','Fate/Zero',1,'video game','animation'),('IAmGroot','Metal Gear Solid 4','Interstellar',1,'video game','movie'),('Hodor','Metal Gear Solid V: The Phantom Pain','Game of Thrones',1,'video game','television'),('IAmGroot','Metal Gear Solid V: The Phantom Pain','Fate/Zero',1,'video game','animation'),('IAmGroot','Metal Gear Solid V: The Phantom Pain','Interstellar',1,'video game','movie'),('Hodor','Mistborn: The Final Empire','Game of Thrones',1,'book','television'),('IAmGroot','Mistborn: The Final Empire','Fate/Zero',1,'book','animation'),('Hodor','Potato','Game of Thrones',0,'web content','television'),('IAmGroot','Potato','Fate/Zero',0,'web content','animation'),('IAmGroot','Potato','Interstellar',0,'web content','movie'),('JhayFelix','Potato','Fullmetal Alchemist: Brotherhood',0,'web content','animation'),('JhayFelix','Puella Magi Madoka Magica','Fullmetal Alchemist: Brotherhood',1,'animation','animation'),('Hodor','Ready Player One','Game of Thrones',1,'book','television'),('Hodor','Steins;Gate','Game of Thrones',1,'animation','television'),('IAmGroot','Steins;Gate','Fate/Zero',1,'animation','animation'),('IAmGroot','Steins;Gate','Interstellar',1,'animation','movie'),('JhayFelix','Steins;Gate','Fullmetal Alchemist: Brotherhood',1,'animation','animation'),('JhayFelix','The Walking Dead','Fullmetal Alchemist: Brotherhood',0,'television','animation'),('Hodor','Transformers: Age of Extinction','Game of Thrones',0,'movie','television'),('IAmGroot','Transformers: Age of Extinction','Fate/Zero',0,'movie','animation'),('IAmGroot','Transformers: Age of Extinction','Interstellar',0,'movie','movie'),('JhayFelix','Transformers: Age of Extinction','Fullmetal Alchemist: Brotherhood',0,'movie','animation'),('Hodor','V for Vendetta','Game of Thrones',1,'graphic novel','television'),('Hodor','Watchmen','Game of Thrones',1,'graphic novel','television');
/*!40000 ALTER TABLE `recommendation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `recommendations`
--

DROP TABLE IF EXISTS `recommendations`;
/*!50001 DROP VIEW IF EXISTS `recommendations`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `recommendations` (
  `title` tinyint NOT NULL,
  `createdBy` tinyint NOT NULL,
  `recommendationTo` tinyint NOT NULL,
  `recommendationToClassification` tinyint NOT NULL,
  `recommendationFrom` tinyint NOT NULL,
  `recommendationFromClassification` tinyint NOT NULL,
  `isRec` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `classification` tinyint NOT NULL,
  `cover` tinyint NOT NULL,
  `rating` tinyint NOT NULL,
  `releaseYear` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

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
  `isFlagged` tinyint(1) DEFAULT '0',
  `titleclass` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`username`,`title`,`titleclass`),
  KEY `reviewfk_2` (`title`,`titleclass`),
  CONSTRAINT `reviewfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reviewfk_2` FOREIGN KEY (`title`, `titleclass`) REFERENCES `work` (`title`, `class`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES ('Hodor','Game of Thrones','HODOR?!?!?!',1,'television'),('Hodor','Steins;Gate','HODOR?!?!?!',0,'animation'),('RAFernandez','Birdman','Exceptional!',0,'movie'),('RAFernandez','Hybrid Theory','A 21th century classic',0,'album'),('RAFernandez','Interstellar','An Austin review',0,'movie'),('Viola','Clannad: After Story','One of the best anime ever released',0,'animation'),('Viola','Interstellar','Here\'s the review',0,'movie');
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
  `class` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`title`,`class`),
  CONSTRAINT `televisionfk_1` FOREIGN KEY (`title`, `class`) REFERENCES `liveactionanimation` (`title`, `class`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `television`
--

LOCK TABLES `television` WRITE;
/*!40000 ALTER TABLE `television` DISABLE KEYS */;
INSERT INTO `television` VALUES ('Better Call Saul','AMC','television'),('Bodacious Space Pirates','','animation'),('Breaking Bad','AMC','television'),('Clannad: After Story','','animation'),('Community','NBC','television'),('Fate/Zero','','animation'),('Game of Thrones','HBO','television'),('Gotham','FOX','television'),('House M.D.','FOX','television'),('Mad Men','AMC','television'),('My Teen Romantic Comedy SNAFU','','animation'),('Parks and Recreation','NBC','television'),('Puella Magi Madoka Magica','','animation'),('Steins;Gate','','animation');
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
  `class` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`title`,`class`),
  CONSTRAINT `theaterfk_1` FOREIGN KEY (`title`, `class`) REFERENCES `work` (`title`, `class`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theater`
--

LOCK TABLES `theater` WRITE;
/*!40000 ALTER TABLE `theater` DISABLE KEYS */;
INSERT INTO `theater` VALUES ('Jesus Christ Superstar','1970-05-11','theater');
/*!40000 ALTER TABLE `theater` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `unrecommendations`
--

DROP TABLE IF EXISTS `unrecommendations`;
/*!50001 DROP VIEW IF EXISTS `unrecommendations`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `unrecommendations` (
  `title` tinyint NOT NULL,
  `createdBy` tinyint NOT NULL,
  `unrecommendationFrom` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `classification` tinyint NOT NULL,
  `cover` tinyint NOT NULL,
  `rating` tinyint NOT NULL,
  `releaseYear` tinyint NOT NULL,
  `unRecCtr` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

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
  `isFlagged` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('<h2>Darren</h2>','Darren','sapalo','m','a@a.com','1234','default','hello wurld',0),('a','a','a','m','a@yahoo.com','a','default','a',0),('Cookie','Cookie','Batter','F','cookies@yahoo.com','chocolatechips','cookie.jpg','A cookie',1),('eggs','eggs','eggs','m','eggs@yahoo.com','eggs','default','eggs',0),('esgz','srg','srh','m','weg@sbfhz.com','egg','default','sgawseg',0),('Hodor','Hodor','Hodor','m','Hodor@Hodor.Hodor','Hodor','default','HodorHodorHodor',1),('IAmGroot','Groot','Groot','m','IAmGroot@IAmGroot.IAmGroot','IAmGroot','default','I am Groot.',0),('ImpasaurusRex','Tyrion','Lannister','m','tyrion.lannister@westeros.org','whetstone','default','RAWR',0),('jh','Jascha ','Heifetz','m','jimhoyle@yahoo.com','jascha','default','It\'s Heifetz',0),('JhayFelix','John Joseph','Andres','f','andres_johnjoseph@yahoo.com','123321','default','I love ( . Y . )',0),('Pikachu','Pikachu','Pikachu','m','Pikachu@Pikachu.Pikachu','Pikachu','default','Pika Pika!',0),('Potato','Potato','Salad','M','potato@gmail.com','potatoes','potato.jpg','An ordinary garden potato',0),('RAFernandez','Austin','Fernandez','M','ryanaustinf@potato.com','Game of Breaking Gotham Parks','Austin.jpg','It\'s Austin. Enough said.',0),('Random','Random','Random','m','Random@Random.com','Random','default','Random',0),('TheImp','Tyrion','Lannister','m','tyrion.lannister@westeros.org','whetstone','default','',0),('Viola','Jonah','Syfu','M','jonahsyfu@yahoo.com','kokoro23','Viola.jpg','An ordinary guy who likes anime and video games.',0);
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
  `class` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`title`,`class`),
  CONSTRAINT `videogamefk_1` FOREIGN KEY (`title`, `class`) REFERENCES `work` (`title`, `class`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videogame`
--

LOCK TABLES `videogame` WRITE;
/*!40000 ALTER TABLE `videogame` DISABLE KEYS */;
INSERT INTO `videogame` VALUES ('Assassin\'s Creed Unity','video game'),('Mass Effect 3','video game'),('Metal Gear Solid V: The Phantom Pain','video game');
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
  `class` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`title`,`class`),
  CONSTRAINT `webcontentfk_1` FOREIGN KEY (`title`, `class`) REFERENCES `work` (`title`, `class`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webcontent`
--

LOCK TABLES `webcontent` WRITE;
/*!40000 ALTER TABLE `webcontent` DISABLE KEYS */;
INSERT INTO `webcontent` VALUES ('Potato','http://en.wikipedia.org/wiki/Potato','Wikipedia','web content');
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
INSERT INTO `work` VALUES ('Assassin\'s Creed Unity','2014',NULL,'video game',0,1,NULL),('Avatar: The Last Airbender','2003',NULL,'animation',2,1,NULL),('Avengers: Age of Ultron','2015',NULL,'movie',0,1,''),('Better Call Saul','2015',NULL,'television',30,1,NULL),('Birdman','2014',NULL,'movie',1,1,NULL),('Bodacious Space Pirates','2012','covers/Bodacious Space Pirates.jpg','animation',1,1,NULL),('Breaking Bad','2008',NULL,'television',1,1,NULL),('Clannad: After Story','2008',NULL,'animation',0,0,NULL),('Community','2009',NULL,'television',1,1,NULL),('Crawling','2000',NULL,'music',0,0,NULL),('Death Note','2006',NULL,'animation',2,1,'Some guy gets a notebook. He writes your name; you die. End of story. Also, there\'s this guy called L. He\'s awesome, but he dies in episode 25 and then the show suck supreme balls after that... except for the finale... that was fucking awesome...'),('End of the Line','2014',NULL,'animation',0,1,NULL),('Fate/Zero','2011',NULL,'animation',6,1,NULL),('Fullmetal Alchemist: Brotherhood','2009',NULL,'animation',2,1,'ALCHEMY AND SHIT'),('Game of Thrones','2011',NULL,'television',92,1,'Seven families fight for the Iron Throne of Westeros; a force in the North threatens to destroy everything in Westeros; and in the east, the refugee Daenerys Targaryen seeks to reclaim her family\'s throne. Amidst all this chaos, Winter is Coming.'),('Gotham','2014',NULL,'television',0,1,NULL),('Hamlet','0000',NULL,'theater',0,1,''),('House M.D.','2004',NULL,'television',1,1,NULL),('Hybrid Theory','2000',NULL,'album',0,1,NULL),('Hyperdimension Neptunia Re;Birth 2','2014',NULL,'video game',0,1,'CONSOLE WARS AND SHIT'),('In the End','2000',NULL,'music',0,0,NULL),('Interstellar','2014','covers/Interstellar.jpg','movie',15,1,'In a dying Earth, a farmer named Cooper seeks to save the human race by finding another planet through a wormhole by Saturn.'),('Jesus Christ Superstar','1970','covers/Jesus Christ Superstar.jpg','theater',3,1,NULL),('Kick-Ass','2010',NULL,'comic',1,1,NULL),('Mad Men','2007',NULL,'television',1,1,NULL),('Mass Effect 3','2012','covers/Mass Effect 3.jpg','video game',26,1,NULL),('Metal Gear Solid 4','2008',NULL,'video game',0,1,'Old Snake \"snakes\" around *wink* *wink*.'),('Metal Gear Solid V: The Phantom Pain','2015',NULL,'video game',0,1,NULL),('Mistborn: The Final Empire','2007',NULL,'book',1,1,'A Mistborn rebel, Kelsier, attempts to overthrow an oppressive government led by a godlike persona known as the Lord Ruler.'),('My Teen Romantic Comedy SNAFU','2013',NULL,'animation',2,0,NULL),('Parks and Recreation','2008',NULL,'television',0,1,NULL),('Pokemon AlphaSapphire','2014',NULL,'video game',0,1,'A remake of Pokemon Sapphire.'),('Potato','','covers/Potato.jpg','web content',1,1,NULL),('Puella Magi Madoka Magica','2011',NULL,'animation',1,1,NULL),('Ready Player One','2011',NULL,'book',0,0,NULL),('Save Rock and Roll','2013','covers/Save Rock and Roll.jpg','album',0,1,NULL),('Steins;Gate','2011',NULL,'animation',1,1,NULL),('The Killing Joke','1988',NULL,'graphic novel',1,1,NULL),('The Raid 2','2014',NULL,'movie',0,1,''),('The Shining','1980',NULL,'movie',0,1,'Jack Nicholson goes crazy.							\r\n						'),('The Walking Dead','2009',NULL,'television',0,1,NULL),('The Walking Dead','2013',NULL,'video game',0,0,NULL),('Transformers: Age of Extinction','2014',NULL,'movie',1,1,NULL),('V for Vendetta','1985',NULL,'graphic novel',1,1,NULL),('Watchmen','1987',NULL,'graphic novel',1,1,NULL);
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
  `titleclass` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`name`,`title`,`titleclass`),
  KEY `workcreatorfk_2` (`title`,`titleclass`),
  CONSTRAINT `workcreatorfk_1` FOREIGN KEY (`name`) REFERENCES `creator` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `workcreatorfk_2` FOREIGN KEY (`title`, `titleclass`) REFERENCES `work` (`title`, `class`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workcreator`
--

LOCK TABLES `workcreator` WRITE;
/*!40000 ALTER TABLE `workcreator` DISABLE KEYS */;
INSERT INTO `workcreator` VALUES ('Ai Yoshimura','My Teen Romantic Comedy SNAFU','Director',1,'animation'),('Akiyuki Shinbou','Puella Magi Madoka Magica','Director',1,'animation'),('Alan Moore','The Killing Joke','Writer',1,'graphic novel'),('Alan Moore','V for Vendetta','Writer',1,'graphic novel'),('Alan Moore','Watchmen','Writer',1,'graphic novel'),('Alejandro Gonzalez Inarritu','Birdman','Director',1,'movie'),('Bioware','Mass Effect 3','Developer',1,'video game'),('Christopher Nolan','Interstellar','Director',1,'movie'),('Ei Aoki','Fate/Zero','Director',1,'animation'),('Ernest Cline','Ready Player One','Author',1,'book'),('Fall Out Boy','Save Rock and Roll','Artist',1,'album'),('Hiroshi Hamasaki','Steins;Gate','Director',1,'animation'),('Hoyt Van Hoytema','Interstellar','Cinematographer',0,'movie'),('James McVinnie','End of the Line','Director',1,'animation'),('Kojima Productions','Metal Gear Solid V: The Phantom Pain','Developer',1,'video game'),('Linkin Park','In The End','Performer',1,'music'),('Mark Millar','Kick-Ass','Writer',1,'comic'),('Matthew Weiner','Mad Men','showrunner',1,'television'),('Michael Bay','Transformers: Age of Extinction','Director',1,'movie'),('Michael Schur','Parks and Recreation','showrunner',1,'television'),('Peter Gould','Better Call Saul','showrunner',1,'television'),('Tatsou Satou','Bodacious Space Pirates','Director',1,'animation'),('Tatsuya Ishihara','Clannad: After Story','Director',1,'animation'),('Ubisoft','Assassin\'s Creed Unity','Developer',1,'video game'),('Vince Gilligan','Better Call Saul','showrunner',1,'television'),('Vince Gilligan','Breaking Bad','showrunner',1,'television');
/*!40000 ALTER TABLE `workcreator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `all works`
--

/*!50001 DROP TABLE IF EXISTS `all works`*/;
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

/*!50001 DROP TABLE IF EXISTS `episodes`*/;
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

/*!50001 DROP TABLE IF EXISTS `home page`*/;
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

/*!50001 DROP TABLE IF EXISTS `proposals`*/;
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

--
-- Final view structure for view `recommendations`
--

/*!50001 DROP TABLE IF EXISTS `recommendations`*/;
/*!50001 DROP VIEW IF EXISTS `recommendations`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `recommendations` AS select `w`.`title` AS `title`,`wc2`.`name` AS `createdBy`,`re`.`workTo` AS `recommendationTo`,`re`.`workToClass` AS `recommendationToClassification`,`re`.`workFrom` AS `recommendationFrom`,`re`.`workFromClass` AS `recommendationFromClassification`,`re`.`isRec` AS `isRec`,`w`.`description` AS `description`,`w`.`class` AS `classification`,`w`.`cover` AS `cover`,ifnull(avg(`r`.`rating`),0) AS `rating`,`w`.`releaseYear` AS `releaseYear` from (((`recommendation` `re` left join `work` `w` on((`w`.`title` = `re`.`workFrom`))) left join `workcreator` `wc2` on(((`w`.`title` = `wc2`.`title`) and (`wc2`.`isMain` = 1)))) left join `rating` `r` on((`w`.`title` = `r`.`title`))) group by `w`.`title`,`re`.`workTo` order by `w`.`viewCount` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `unrecommendations`
--

/*!50001 DROP TABLE IF EXISTS `unrecommendations`*/;
/*!50001 DROP VIEW IF EXISTS `unrecommendations`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `unrecommendations` AS select `w`.`title` AS `title`,`wc2`.`name` AS `createdBy`,`re`.`workFrom` AS `unrecommendationFrom`,`w`.`description` AS `description`,`w`.`class` AS `classification`,`w`.`cover` AS `cover`,ifnull(avg(`r`.`rating`),0) AS `rating`,`w`.`releaseYear` AS `releaseYear`,count(`re`.`workFrom`) AS `unRecCtr` from (((`work` `w` left join `workcreator` `wc2` on(((`w`.`title` = `wc2`.`title`) and (`wc2`.`isMain` = 1)))) left join `rating` `r` on((`w`.`title` = `r`.`title`))) join `recommendation` `re`) where ((`w`.`title` = `re`.`workTo`) and (`re`.`isRec` = 0)) group by `w`.`title`,`re`.`workFrom` order by `w`.`viewCount` desc */;
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

-- Dump completed on 2015-04-27 16:29:52
