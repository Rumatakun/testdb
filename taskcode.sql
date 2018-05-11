CREATE DATABASE IF NOT EXISTS test;
USE test;

CREATE TABLE collection(
    id int(11) NOT NULL AUTO_INCREMENT,
    `type` enum('cd','dvd') NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ;

CREATE TABLE music(  
    `musicid` int(11) NOT NULL AUTO_INCREMENT,
    `musician` varchar(255) NOT NULL,
    `album` varchar(255) NOT NULL,
    `song` varchar(255) NOT NULL,
    `realese_date` date NOT NULL, 
    PRIMARY KEY (musicid)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

CREATE TABLE cinema(
    `filmid` int(11) NOT NULL AUTO_INCREMENT, 
    `name` varchar(255) NOT NULL,
    `director` varchar(255) NOT NULL,
    PRIMARY KEY (`filmid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

CREATE TABLE film_content( 
    `collectionid` int(11) NOT NULL,
    `filmid` int(11) NOT NULL,
    KEY `collectionid` (`collectionid`),
    KEY `filmid` (`filmid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

CREATE TABLE music_content(
    `collectionid` int(11) NOT NULL,
    `musicid` int(11) NOT NULL,
    KEY `collectionid` (`collectionid`),
    KEY `musicid` (`musicid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE actors(
    `actorid` int(11) NOT NULL,
    `actor` varchar(255) NOT NULL,
    PRIMARY KEY (`actorid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE actor_list(`filmid` int(11) NOT NULL,
  `actorid` int(11) NOT NULL,
  KEY `filmid` (`filmid`),
  KEY `actorid` (`actorid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE music_genre(
    `musicid` int(11) NOT NULL,
    `genreid` int(11) NOT NULL,
    KEY `musicid` (`musicid`),
    KEY `genreid` (`genreid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE music_genre_list( 
    `genreid` int(11) NOT NULL,
    `genre_name` varchar(255) NOT NULL,
    PRIMARY KEY (`genreid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE film_genre_list(
    `genreid` int(11) NOT NULL,
    `genre_name` varchar(255) NOT NULL,
    PRIMARY KEY(genreid)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE film_genre(
    `filmid` int(11) NOT NULL,
    `genreid` int(11) NOT NULL,
    KEY `filmid` (`filmid`),
    KEY `genreid` (`genreid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE music_content
 ADD CONSTRAINT `music_content_ibfk_1` FOREIGN KEY (`collectionid`) REFERENCES `collection` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
 ADD CONSTRAINT `music_content_ibfk_2` FOREIGN KEY (`musicid`) REFERENCES `music` (`musicid`) ON DELETE CASCADE ON UPDATE CASCADE;
 
 ALTER TABLE film_content
ADD CONSTRAINT `film_content_ibfk_1` FOREIGN KEY (`collectionid`) REFERENCES `collection` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `film_content_ibfk_2` FOREIGN KEY (`filmid`) REFERENCES `cinema` (`filmid`) ON DELETE CASCADE ON UPDATE CASCADE;
    
ALTER TABLE music_genre
ADD CONSTRAINT `music_genre_ibfk_1` FOREIGN KEY (`musicid`) REFERENCES `music` (`musicid`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `music_genre_ibfk_2` FOREIGN KEY (`genreid`) REFERENCES `music_genre_list` (`genreid`) ON DELETE CASCADE ON UPDATE CASCADE;
  
 ALTER TABLE actor_list
 ADD CONSTRAINT `actor_list_ibfk_1` FOREIGN KEY (`filmid`) REFERENCES `cinema` (`filmid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `actor_list_ibfk_2` FOREIGN KEY (`actorid`) REFERENCES `actors` (`actorid`) ON DELETE CASCADE ON UPDATE CASCADE;
     
  ALTER TABLE music_genre_list
ADD  CONSTRAINT `music_genre_list_ibfk_1` FOREIGN KEY (`genreid`) REFERENCES `music_genre` (`genreid`) ON DELETE CASCADE ON UPDATE CASCADE;

 ALTER TABLE film_genre
ADD CONSTRAINT `film_genre_ibfk_1` FOREIGN KEY (`filmid`) REFERENCES `cinema` (`filmid`) ON DELETE CASCADE ON UPDATE CASCADE, 
ADD CONSTRAINT `film_genre_ibfk_2` FOREIGN KEY (`genreid`) REFERENCES `film_genre_list` (`genreid`) ON DELETE CASCADE ON UPDATE CASCADE;