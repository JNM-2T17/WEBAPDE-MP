SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0;
SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0;
SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `tmi`;
USE `tmi`;

--- ----------------------------------------------------------------------------
--- Creates table for all works in the database
--- ----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS work (
	title VARCHAR(100),
	releaseYear CHAR(4) NOT NULL,
	cover VARCHAR(100),
	class VARCHAR(45),
	viewCount INT DEFAULT 0,
	isVerified BOOLEAN NOT NULL DEFAULT FALSE,
    description VARCHAR(255),
	PRIMARY KEY (title, class)
)engine = innoDB;

--- ----------------------------------------------------------------------------
--- Creates table for all keywords
--- ----------------------------------------------------------------------------

CREATE TABLE keyword (
	keyword VARCHAR(50),
    work VARCHAR(100),
	workclass VARCHAR(45),
    isVerified BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (keyword, work, workclass),
    CONSTRAINT keywordfk_1
		FOREIGN KEY (work,workclass)
        REFERENCES work(title,workclass)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) engine = innoDB;

--- ----------------------------------------------------------------------------
--- Creates table for all genres
--- ----------------------------------------------------------------------------

CREATE TABLE genre (
	genre VARCHAR(50),
    work VARCHAR(100),
    workclass VARCHAR(45),
    isVerified BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (genre, work, workclass),
    CONSTRAINT genrefk_1
		FOREIGN KEY (work,workclass)
        REFERENCES work(title,class)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) engine = innoDB;

--- ----------------------------------------------------------------------------
--- Creates table for all creators in the database
--- ----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS creator (
	name VARCHAR(70) PRIMARY KEY,
	bio VARCHAR(255),
	trivia VARCHAR(255),
    isVerified BOOLEAN NOT NULL DEFAULT FALSE
)engine = innoDB;

--- ----------------------------------------------------------------------------
--- Creates table for assignment of a creator to a work
--- ----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS workcreator (
	name VARCHAR(70),
	title VARCHAR(100),
    titleclass VARCHAR(45)
	role VARCHAR(45) NOT NULL,
	isMain BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY( name, title, titleclass ),
	CONSTRAINT workcreatorfk_1
		FOREIGN KEY (name)
		REFERENCES creator(name)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	CONSTRAINT workcreatorfk_2
		FOREIGN KEY (title,titleclass)
		REFERENCES work(title,class)
		ON UPDATE CASCADE
		ON DELETE CASCADE
)engine = innoDB;

--- ----------------------------------------------------------------------------
--- Creates table for users of the site
--- ----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS user (
	username VARCHAR(20) PRIMARY KEY,
	fname VARCHAR(30) NOT NULL,
	lname VARCHAR(30) NOT NULL,
	gender CHAR NOT NULL,
	email VARCHAR(50) NOT NULL,
	password VARCHAR(30) NOT NULL,
	profpic VARCHAR(45),
	description VARCHAR(255),
    isFlagged BOOLEAN NOT NULL DEFAULT FALSE
)engine = innoDB;

--- ----------------------------------------------------------------------------
--- Creates table for administrators of the site
--- ----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS admin (
	username VARCHAR(20) PRIMARY KEY,
	CONSTRAINT adminfk_1
		FOREIGN KEY (username)
		REFERENCES user(username)
		ON UPDATE CASCADE
		ON DELETE CASCADE
)engine = innoDB;

--- ----------------------------------------------------------------------------
--- Creates table for works marked as favorites
--- ----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS favorites (
	username VARCHAR(20),
	title VARCHAR(100),
    titleclass VARCHAR(45),
	PRIMARY KEY (username,title, titleclass),
	CONSTRAINT favoritesfk_1
		FOREIGN KEY (username)
		REFERENCES user(username)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	CONSTRAINT favoritesfk_2
		FOREIGN KEY (title,titleclass)
		REFERENCES work(title,class)
		ON UPDATE CASCADE
		ON DELETE CASCADE
)engine = innoDB;

--- ----------------------------------------------------------------------------
--- Creates table for user ratings
--- ----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS rating (
	username VARCHAR(20),
	title VARCHAR(100),
    titleclass VARCHAR(45)
	rating INT NOT NULL,
	PRIMARY KEY (username,title,titleclass),
	CONSTRAINT ratingfk_1
		FOREIGN KEY (username)
		REFERENCES user(username)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	CONSTRAINT ratingfk_2
		FOREIGN KEY (title,titleclass)
		REFERENCES work(title,class)
		ON UPDATE CASCADE
		ON DELETE CASCADE
)engine = innoDB;

--- ----------------------------------------------------------------------------
--- Creates table for user reviews
--- ----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS review (
	username VARCHAR(20),
	title VARCHAR(100),
    titleclass VARCHAR(45),
	review VARCHAR(2500) NOT NULL,
    isFlagged BOOLEAN NOT NULL DEFAULT FALSE,
	PRIMARY KEY (username,title,titleclass),
	CONSTRAINT reviewfk_1
		FOREIGN KEY (username)
		REFERENCES user(username)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	CONSTRAINT reviewfk_2
		FOREIGN KEY (title,titleclass)
		REFERENCES work(title,class)
		ON UPDATE CASCADE
		ON DELETE CASCADE
)engine = innoDB;

--- ----------------------------------------------------------------------------
--- Creates table for user recommendation
--- ----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS recommendation (
	username VARCHAR(20),
	workFrom VARCHAR(100),
    workFromClass VARCHAR(45),
	workTo VARCHAR(100),
    workToClass VARCHAR(45),
	isRec BOOLEAN,
	PRIMARY KEY (username,workFrom, workFromClass, workTo, workToClass, isRec),
	CONSTRAINT recommendationfk_1
		FOREIGN KEY (username)
		REFERENCES user(username)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	CONSTRAINT recommendationfk_2
		FOREIGN KEY (workFrom, workFromClass)
		REFERENCES work(title,class)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	CONSTRAINT recommendationfk_3
		FOREIGN KEY (workTo, workToClass)
		REFERENCES work(title,class)
		ON UPDATE CASCADE
		ON DELETE CASCADE
)engine = innoDB;

--- ----------------------------------------------------------------------------
--- Creates table for movies and tv
--- ----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS liveactionanimation (
	title VARCHAR(100),
    class VARCHAR(45)
    PRIMARY KEY(title,class),
	CONSTRAINT liveactionanimationfk_1
		FOREIGN KEY (title,class)
		REFERENCES work(title,class)
		ON UPDATE CASCADE
		ON DELETE CASCADE
)engine = innoDB;

--- ----------------------------------------------------------------------------
--- Creates table for television shows
--- ----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS television (
	title VARCHAR(100),
	class VARCHAR(45)
	network VARCHAR(45),
    PRIMARY KEY(title,class),
	CONSTRAINT televisionfk_1
		FOREIGN KEY (title,class)
		REFERENCES work(title,class)
		ON UPDATE CASCADE
		ON DELETE CASCADE
)engine = innoDB;

--- ----------------------------------------------------------------------------
--- Create table for animated television shows
--- ----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS animation (
	title VARCHAR(100),
	class VARCHAR(45)
	studio VARCHAR(100),
    PRIMARY KEY(title,class),
	CONSTRAINT animationfk_1
		FOREIGN KEY (title,class)
		REFERENCES work(title,class)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	CONSTRAINT animationfk_2
		FOREIGN KEY (studio)
		REFERENCES creator(name)
		ON UPDATE CASCADE
		ON DELETE CASCADE
)engine = innoDB;

--- ----------------------------------------------------------------------------
--- Create table for television episodes
--- ----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS episode (
	title VARCHAR(100),
	class VARCHAR(45),
    season INT,
	noInSeason INT,
	epTitle VARCHAR(50),
	airdate DATE,
	PRIMARY KEY(title,class,season,noInSeason),
	CONSTRAINT episodefk_1
		FOREIGN KEY (title,class)
		REFERENCES television(title,class)
		ON UPDATE CASCADE
		ON DELETE CASCADE
)engine = innoDB;

--- ----------------------------------------------------------------------------
--- Create table for web content
--- ----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS webcontent (
	title VARCHAR(100),
	class VARCHAR(45)
    URL VARCHAR(100) NOT NULL,
	org VARCHAR(45),
    PRIMARY KEY(title,class),
	CONSTRAINT webcontentfk_1
		FOREIGN KEY (title)
		REFERENCES work(title)
		ON UPDATE CASCADE
		ON DELETE CASCADE
)engine = innoDB;

--- ----------------------------------------------------------------------------
--- Create table for books
--- ----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS book (
	title VARCHAR(100),
    class VARCHAR(45)
	publisher VARCHAR(45),
	wordcount INT,
    PRIMARY KEY(title,class),
	CONSTRAINT bookfk_1
		FOREIGN KEY (title,class)
		REFERENCES work(title,class)
		ON UPDATE CASCADE
		ON DELETE CASCADE
)engine = innoDB;

--- ----------------------------------------------------------------------------
--- Create table for graphic novels
--- ----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS graphicnovel (
	title VARCHAR(100),
    class VARCHAR(45),
	illustrator VARCHAR(45),
    PRIMARY KEY(title,class),
	CONSTRAINT graphicnovelfk_1
		FOREIGN KEY (title,class)
		REFERENCES book(title,class)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	CONSTRAINT graphicnovelfk_2
		FOREIGN KEY (illustrator)
		REFERENCES creator(name)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	INDEX graphicnovelidx_1 (illustrator ASC)
)engine = innoDB;

--- ----------------------------------------------------------------------------
--- Create table for comic book series and manga
--- ----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS comicsmanga (
	title VARCHAR(100),
	class VARCHAR(45),
    illustrator VARCHAR(45),
    PRIMARY KEY(title,class),
	CONSTRAINT comicsmangafk_1
		FOREIGN KEY (title,class)
		REFERENCES book(title,class)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	CONSTRAINT comicsmangafk_2
		FOREIGN KEY (illustrator)
		REFERENCES creator(name)
		ON UPDATE CASCADE
		ON DELETE CASCADE
)engine = innoDB;

--- ----------------------------------------------------------------------------
--- Create table for a manga or comic issue
--- ----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS comicissue (
	comic VARCHAR(100),
	class VARCHAR(45),
    issue INT,
	title VARCHAR(50),
	PRIMARY KEY (comic,comicclass,issue),
	CONSTRAINT comicissuefk_1
		FOREIGN KEY (comic,class)
		REFERENCES comicsmanga(title,class)
		ON UPDATE CASCADE
		ON DELETE CASCADE
)engine = innoDB;

--- ----------------------------------------------------------------------------
--- Create a table for a theatrical work
--- ----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS theater (
	title VARCHAR(100),
    class VARCHAR(45),
    PRIMARY KEY(title,class),
	datePremiered DATE,
	CONSTRAINT theaterfk_1
		FOREIGN KEY (title,class)
		REFERENCES work(title,class)
		ON UPDATE CASCADE
		ON DELETE CASCADE
)engine = innoDB;

--- ----------------------------------------------------------------------------
--- Create a table for a song
--- ----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS music (
	title VARCHAR(100)
    class VARCHAR(45)
	album VARCHAR(70),
	recordingStudio VARCHAR(45),
    PRIMARY KEY(title,class),
	CONSTRAINT musicfk_1
		FOREIGN KEY (title,class)
		REFERENCES work(title,class)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	CONSTRAINT musicfk_2
		FOREIGN KEY (album)
		REFERENCES album(title)
		ON UPDATE CASCADE
		ON DELETE CASCADE
)engine = innoDB;

--- ----------------------------------------------------------------------------
--- Create a table for an album
--- ----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS album (
	title VARCHAR(100),
    class VARCHAR(45),
	CONSTRAINT albumfk_1
		FOREIGN KEY (title,class)
		REFERENCES work(title,class)
		ON UPDATE CASCADE
		ON DELETE CASCADE
)engine = innoDB;

--- ----------------------------------------------------------------------------
--- Create a table for a video game
--- ----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS videogame (
	title VARCHAR(100),
    class VARCHAR(45),
    PRIMARY KEY(title,class),
	CONSTRAINT videogamefk_1
		FOREIGN KEY (title,class)
		REFERENCES work(title,class)
		ON UPDATE CASCADE
		ON DELETE CASCADE
)engine = innoDB;

--- ----------------------------------------------------------------------------
--- Create a table for a gaming console
--- ----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS console (
	name VARCHAR(45) PRIMARY KEY,
	developer VARCHAR(45)
)engine = innoDB;

--- ----------------------------------------------------------------------------
--- Create a table for registering games to their consoles
--- ----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS consolegame (
	title VARCHAR(100),
	console VARCHAR(45),
	PRIMARY KEY (title,console),
	CONSTRAINT consolegamefk_1
		FOREIGN KEY (title)
		REFERENCES videogame(title)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	CONSTRAINT consolegamefk_2
		FOREIGN KEY (console)
		REFERENCES console(name)
		ON UPDATE CASCADE
		ON DELETE CASCADE
)engine = innoDB;

CREATE VIEW `Proposals` AS
SELECT W.title, WC2.name AS `Created By`, description, cover, isVerified,
	   class, releaseYear, viewCount, network, studio, 
	   publisher, wordcount, datePremiered, GN.illustrator AS `Graphic Novel Illustrator`, 
       CM.illustrator AS `Comic/Manga Illustrator`, URL, org, 
       album, recordingStudio 
FROM work W 
	 LEFT JOIN liveactionanimation LAA ON W.title = LAA.title 
	 LEFT JOIN television T ON W.title = T.title 
     LEFT JOIN animation A ON T.title = A.title 
     LEFT JOIN book B ON W.title = B.title 
     LEFT JOIN graphicnovel GN ON B.title = GN.title 
     LEFT JOIN comicsmanga CM ON B.title = CM.title 
     LEFT JOIN webcontent WC ON W.title = WC.title 
     LEFT JOIN theater TH ON W.title = TH.title 
     LEFT JOIN videogame V ON W.title = V.title 
     LEFT JOIN music M ON W.title = M.title 
     LEFT JOIN album AL ON W.title = AL.title
     LEFT JOIN workCreator WC2 ON W.title = WC2.title AND WC2.isMain = TRUE
WHERE isVerified = FALSE
ORDER BY viewCount DESC 

CREATE VIEW `All Works` AS
SELECT W.title, WC2.name AS `Created By`, description, class, cover,IFNULL(AVG(rating),0) rating,
	   releaseYear, viewCount, isVerified, network, studio, publisher, 
       wordcount, datePremiered, GN.illustrator AS `Graphic Novel Illustrator`, 
       CM.illustrator AS `Comic/Manga Illustrator`, URL, org, 
       album, recordingStudio 
FROM work W 
	 LEFT JOIN liveactionanimation LAA ON W.title = LAA.title 
	 LEFT JOIN television T ON W.title = T.title 
     LEFT JOIN animation A ON T.title = A.title 
     LEFT JOIN book B ON W.title = B.title 
     LEFT JOIN graphicnovel GN ON B.title = GN.title 
     LEFT JOIN comicsmanga CM ON B.title = CM.title 
     LEFT JOIN webcontent WC ON W.title = WC.title 
     LEFT JOIN theater TH ON W.title = TH.title 
     LEFT JOIN videogame V ON W.title = V.title 
     LEFT JOIN music M ON W.title = M.title 
     LEFT JOIN album AL ON W.title = AL.title
     LEFT JOIN workCreator WC2 ON W.title = WC2.title AND WC2.isMain = TRUE
     LEFT JOIN rating R ON W.title = R.title
GROUP BY W.title
ORDER BY viewCount DESC 

CREATE VIEW `Home Page` AS
SELECT W.title, WC2.name AS `Created By`, description, class, IFNULL(AVG(rating),0) rating,
	   cover, releaseYear, viewCount, isVerified, network, studio, 
	   publisher, wordcount, datePremiered, GN.illustrator AS `Graphic Novel Illustrator`, 
       CM.illustrator AS `Comic/Manga Illustrator`, URL, org, 
       album, recordingStudio 
FROM work W 
	 LEFT JOIN liveactionanimation LAA ON W.title = LAA.title 
	 LEFT JOIN television T ON W.title = T.title 
     LEFT JOIN animation A ON T.title = A.title 
     LEFT JOIN book B ON W.title = B.title 
     LEFT JOIN graphicnovel GN ON B.title = GN.title 
     LEFT JOIN comicsmanga CM ON B.title = CM.title 
     LEFT JOIN webcontent WC ON W.title = WC.title 
     LEFT JOIN theater TH ON W.title = TH.title 
     LEFT JOIN videogame V ON W.title = V.title 
     LEFT JOIN music M ON W.title = M.title 
     LEFT JOIN album AL ON W.title = AL.title
     LEFT JOIN workCreator WC2 ON W.title = WC2.title AND WC2.isMain = TRUE
     LEFT JOIN rating R ON W.title = R.title
WHERE isVerified = TRUE
GROUP BY W.title
ORDER BY viewCount DESC 
LIMIT 10


SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS;
SET SQL_MODE = @OLD_SQL_MODE;