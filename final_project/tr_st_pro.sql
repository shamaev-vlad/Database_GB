-- Триггер, который заново подсчитывает средний балл фильма --
-- при добавлении новой  оценки от пользователя --

DELIMITER //

DROP TRIGGER IF EXISTS average_score //
CREATE TRIGGER average_score AFTER INSERT ON user_movie_scores FOR EACH ROW
BEGIN
	UPDATE movies SET rating = (SELECT AVG(ums.score) FROM user_movie_scores ums WHERE movie_id = new.movie_id)
	WHERE id = new.movie_id;
END
//

-- Хранимая процедура, которая добавляет нового пользователя, --
-- проверяя на корректность входных данных и высчитывая --
-- хэш подаваемого на вход пароля --

DROP PROCEDURE IF EXISTS add_new_user //
CREATE PROCEDURE add_new_user (IN user_login VARCHAR(2000), IN user_email VARCHAR(2000), IN user_password VARCHAR(2000))
BEGIN
	IF CHAR_LENGTH(user_login) = 0 OR CHAR_LENGTH(user_email) = 0 OR CHAR_LENGTH(user_password) = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Input data isn\'t correct: either user_login, user_email or user_password is empty';
    END IF;

	IF CHAR_LENGTH (user_login) > 100 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'User login is too long';
    END IF;

	IF CHAR_LENGTH (user_email) > 100 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'User email is too long';
    END IF;

    INSERT INTO users(login, email, pwd_hash, banned, favorite_director_id)
        VALUES(user_login, user_email, SHA1(user_password), FALSE, NULL);
END
//

DELIMITER ;