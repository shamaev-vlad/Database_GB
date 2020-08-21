-- 1 задание. Подсчитайте средний возраст пользователей в таблице users.

DROP TABLE IF EXISTS users;
CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  birthday DATE
);

INSERT INTO users (name, birthday) VALUES
('Ivan', '1994-11-08')
,('Vasilii', '1997-02-10')
,('Petr', '1993-08-21')
,('Maria', '1998-08-17')
,('Elena', '1995-05-02')
;

SELECT ROUND(AVG((TO_DAYS(NOW()) - TO_DAYS(brithday_at))/365.25), 1) FROM users;
-- 24,7

SELECT FLOOR(AVG(TIMESTAMPDIFF(YEAR, brithday_at, NOW()))) FROM users;
-- 24

-- 2 задание. Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели.
-- Следует учесть, что необходимы дни недели текущего года, а не года рождения.

DROP TABLE IF EXISTS users;
CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  birthday DATE
);

INSERT INTO users (name, birthday) VALUES
('Ivan', '1994-11-08')
,('Vasilii', '1997-02-10')
,('Petr', '1993-08-21')
,('Maria', '1998-08-17')
,('Elena', '1995-05-02')
;

SELECT COUNT(*), DAYNAME(CONCAT(2020, SUBSTRING(birthday, 5, 6))) AS bd_now FROM users GROUP BY bd_now;

-- 3 задание. Подсчитайте произведение чисел в столбце таблицы.

DROP TABLE IF EXISTS composition;
CREATE TABLE composition(
value INT
);

INSERT INTO composition (value) VALUES
(1)
,(2)
,(3)
,(4)
,(5)
;

SELECT * FROM composition;

SELECT exp(SUM(log(value))) FROM composition; -- 120
