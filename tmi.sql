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
	class VARCHAR(45) NOT NULL,
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
    isVerified BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (keyword, work),
    CONSTRAINT keywordfk_1
		FOREIGN KEY (work)
        REFERENCES work(title)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) engine = innoDB;

--- ----------------------------------------------------------------------------
--- Creates table for all genres
--- ----------------------------------------------------------------------------

CREATE TABLE genre (
	genre VARCHAR(50),
    work VARCHAR(100),
    isVerified BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (genre, work),
    CONSTRAINT genrefk_1
		FOREIGN KEY (work)
        REFERENCES work(title)
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
	role VARCHAR(45) NOT NULL,
	isMain BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY( name, title ),
	CONSTRAINT workcreatorfk_1
		FOREIGN KEY (name)
		REFERENCES creator(name)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	CONSTRAINT workcreatorfk_2
		FOREIGN KEY (title)
		REFERENCES work(title)
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
	PRIMARY KEY (username,title),
	CONSTRAINT favoritesfk_1
		FOREIGN KEY (username)
		REFERENCES user(username)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	CONSTRAINT favoritesfk_2
		FOREIGN KEY (title)
		REFERENCES work(title)
		ON UPDATE CASCADE
		ON DELETE CASCADE
)engine = innoDB;

--- ----------------------------------------------------------------------------
--- Creates table for user ratings
--- ----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS rating (
	username VARCHAR(20),
	title VARCHAR(100),
	rating INT NOT NULL,
	PRIMARY KEY (username,title),
	CONSTRAINT ratingfk_1
		FOREIGN KEY (username)
		REFERENCES user(username)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	CONSTRAINT ratingfk_2
		FOREIGN KEY (title)
		REFERENCES work(title)
		ON UPDATE CASCADE
		ON DELETE CASCADE
)engine = innoDB;

--- ----------------------------------------------------------------------------
--- Creates table for user reviews
--- ----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS review (
	username VARCHAR(20),
	title VARCHAR(100),
	review VARCHAR(2500) NOT NULL,
    isFlagged BOOLEAN NOT NULL DEFAULT FALSE,
	PRIMARY KEY (username,title),
	CONSTRAINT reviewfk_1
		FOREIGN KEY (username)
		REFERENCES user(username)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	CONSTRAINT reviewfk_2
		FOREIGN KEY (title)
		REFERENCES work(title)
		ON UPDATE CASCADE
		ON DELETE CASCADE
)engine = innoDB;

--- ----------------------------------------------------------------------------
--- Creates table for user recommendation
--- ----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS recommendation (
	username VARCHAR(20),
	workFrom VARCHAR(100),
	workTo VARCHAR(100),
	isRec BOOLEAN,
	PRIMARY KEY (username,workFrom, workTo, isRec),
	CONSTRAINT recommendationfk_1
		FOREIGN KEY (username)
		REFERENCES user(username)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	CONSTRAINT recommendationfk_2
		FOREIGN KEY (workFrom)
		REFERENCES work(title)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	CONSTRAINT recommendationfk_3
		FOREIGN KEY (workTo)
		REFERENCES work(title)
		ON UPDATE CASCADE
		ON DELETE CASCADE
)engine = innoDB;

--- ----------------------------------------------------------------------------
--- Creates table for movies and tv
--- ----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS liveactionanimation (
	title VARCHAR(100) PRIMARY KEY,
	CONSTRAINT liveactionanimationfk_1
		FOREIGN KEY (title)
		REFERENCES work(title)
		ON UPDATE CASCADE
		ON DELETE CASCADE
)engine = innoDB;

--- ----------------------------------------------------------------------------
--- Creates table for television shows
--- ----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS television (
	title VARCHAR(100) PRIMARY KEY,
	network VARCHAR(45),
	CONSTRAINT televisionfk_1
		FOREIGN KEY (title)
		REFERENCES liveactionanimation(title)
		ON UPDATE CASCADE
		ON DELETE CASCADE
)engine = innoDB;

--- ----------------------------------------------------------------------------
--- Create table for animated television shows
--- ----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS animation (
	title VARCHAR(100) PRIMARY KEY,
	studio VARCHAR(100),
	CONSTRAINT animationfk_1
		FOREIGN KEY (title)
		REFERENCES television(title)
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
	season INT,
	noInSeason INT,
	epTitle VARCHAR(50),
	airdate DATE,
	PRIMARY KEY(title,season,noInSeason),
	CONSTRAINT episodefk_1
		FOREIGN KEY (title)
		REFERENCES television(title)
		ON UPDATE CASCADE
		ON DELETE CASCADE
)engine = innoDB;

--- ----------------------------------------------------------------------------
--- Create table for web content
--- ----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS webcontent (
	title VARCHAR(100) PRIMARY KEY,
	URL VARCHAR(100) NOT NULL,
	org VARCHAR(45),
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
	title VARCHAR(100) PRIMARY KEY,
	publisher VARCHAR(45),
	wordcount INT,
	CONSTRAINT bookfk_1
		FOREIGN KEY (title)
		REFERENCES work(title)
		ON UPDATE CASCADE
		ON DELETE CASCADE
)engine = innoDB;

--- ----------------------------------------------------------------------------
--- Create table for graphic novels
--- ----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS graphicnovel (
	title VARCHAR(100) PRIMARY KEY,
	illustrator VARCHAR(45),
	CONSTRAINT graphicnovelfk_1
		FOREIGN KEY (title)
		REFERENCES book(title)
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
	title VARCHAR(100) PRIMARY KEY,
	illustrator VARCHAR(45),
	CONSTRAINT comicsmangafk_1
		FOREIGN KEY (title)
		REFERENCES book(title)
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
	issue INT,
	title VARCHAR(50),
	PRIMARY KEY (comic,issue),
	CONSTRAINT comicissuefk_1
		FOREIGN KEY (comic)
		REFERENCES comicsmanga(title)
		ON UPDATE CASCADE
		ON DELETE CASCADE
)engine = innoDB;

--- ----------------------------------------------------------------------------
--- Create a table for a theatrical work
--- ----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS theater (
	title VARCHAR(100) PRIMARY KEY,
	datePremiered DATE,
	CONSTRAINT theaterfk_1
		FOREIGN KEY (title)
		REFERENCES work(title)
		ON UPDATE CASCADE
		ON DELETE CASCADE
)engine = innoDB;

--- ----------------------------------------------------------------------------
--- Create a table for a song
--- ----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS music (
	title VARCHAR(100) PRIMARY KEY,
	album VARCHAR(70),
	recordingStudio VARCHAR(45),
	CONSTRAINT musicfk_1
		FOREIGN KEY (title)
		REFERENCES work(title)
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
	title VARCHAR(100) PRIMARY KEY,
	CONSTRAINT albumfk_1
		FOREIGN KEY (title)
		REFERENCES work(title)
		ON UPDATE CASCADE
		ON DELETE CASCADE
)engine = innoDB;

--- ----------------------------------------------------------------------------
--- Create a table for a video game
--- ----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS videogame (
	title VARCHAR(100) PRIMARY KEY,
	CONSTRAINT videogamefk_1
		FOREIGN KEY (title)
		REFERENCES work(title)
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

SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS;
SET SQL_MODE = @OLD_SQL_MODE;