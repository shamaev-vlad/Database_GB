DROP DATABASE IF EXISTS netflix_db;
CREATE DATABASE netflix_db;
USE netflix_db;

-- Режиссёры --

DROP TABLE IF EXISTS directors;
CREATE TABLE directors ( 
	id       INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
	name     VARCHAR(100),
	birthday DATE,
	gender   CHAR(1),
	
	INDEX (name)
);

-- Фильмы --

DROP TABLE IF EXISTS movies;
CREATE TABLE movies (
	id           INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
	title        VARCHAR(100),
	release_date DATE,
	director_id  INT UNSIGNED,
	budget INT,
	rating DECIMAL(2,1),

	FOREIGN KEY (director_id) REFERENCES directors(id) ON DELETE SET NULL,
	INDEX (title)
);


-- Жанры --

DROP TABLE IF EXISTS genres;
CREATE TABLE genres (
	id       INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
	name     VARCHAR(100) NOT NULL UNIQUE
);

-- Жанр фильма --

DROP TABLE IF EXISTS movies_genres; 
CREATE TABLE movies_genres (
	movie_id INT UNSIGNED,
	genre_id INT UNSIGNED,

	PRIMARY KEY (movie_id, genre_id),
	FOREIGN KEY (movie_id) REFERENCES movies(id) ON DELETE CASCADE,
	FOREIGN KEY (genre_id) REFERENCES genres(id) ON DELETE CASCADE
);


-- Актёры --

DROP TABLE IF EXISTS actors;
CREATE TABLE actors (
	id       INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
	name     VARCHAR(100),
	gender   CHAR(1),
	birthday DATE,
	
	INDEX (name)
);

-- В каких фильмах играли актёры --

DROP TABLE IF EXISTS casts; 
CREATE TABLE casts ( 
	actor_id INT UNSIGNED,
	movie_id INT UNSIGNED,
	role     VARCHAR(100),

	PRIMARY KEY (actor_id, movie_id),
	FOREIGN KEY (actor_id) REFERENCES actors(id) ON DELETE CASCADE,
	FOREIGN KEY (movie_id) REFERENCES movies(id) ON DELETE CASCADE,
	INDEX (role)
);


-- Пользователи -- 

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id       INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
	login    VARCHAR(100) NOT NULL UNIQUE,
	email    VARCHAR(100) NOT NULL UNIQUE,
	pwd_hash CHAR(40)     NOT NULL,
	banned   BOOLEAN,
	favorite_director_id INT UNSIGNED,
	registration_date    DATETIME DEFAULT CURRENT_TIMESTAMP,
	last_activity_date   DATETIME DEFAULT CURRENT_TIMESTAMP,
	
	FOREIGN KEY (favorite_director_id) REFERENCES directors(id) ON DELETE SET NULL
);



-- Фильмы понравившиеся пользователю -- 

DROP TABLE IF EXISTS user_favorite_movies;
CREATE TABLE user_favorite_movies (
	user_id      INT UNSIGNED,
	movie_id     INT UNSIGNED,
	favorited_at DATETIME DEFAULT CURRENT_TIMESTAMP,

	PRIMARY KEY (user_id, movie_id),
	FOREIGN KEY (user_id)  REFERENCES users(id)  ON DELETE CASCADE,
	FOREIGN KEY (movie_id) REFERENCES movies(id) ON DELETE CASCADE
);


-- Фильмы, которые посмотрел пользователь --

DROP TABLE IF EXISTS user_movie_reviews; 
CREATE TABLE user_movie_reviews (
	user_id  INT UNSIGNED,
	movie_id INT UNSIGNED,
	title    VARCHAR(100),
	body     TEXT,
	moderator_approved BOOLEAN,
	created_at         DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at         DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 

	PRIMARY KEY (user_id, movie_id),
	FOREIGN KEY (user_id)  REFERENCES users(id),
	FOREIGN KEY (movie_id) REFERENCES movies(id),
	INDEX (title)
);


-- Оценки, которые поставил пользователь --

DROP TABLE IF EXISTS user_movie_scores;
CREATE TABLE user_movie_scores (
	user_id    INT UNSIGNED,
	movie_id   INT UNSIGNED,
	score      TINYINT,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 

	PRIMARY KEY (user_id, movie_id),
	FOREIGN KEY (user_id)  REFERENCES users(id),
	FOREIGN KEY (movie_id) REFERENCES movies(id)
);