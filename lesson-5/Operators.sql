-- 1 задание. Пусть в таблице users поля created_at и updated_at оказались незаполненными.
--  Заполните их текущими датой и временем.

DROP TABLE IF EXISTS users;
CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  birthday DATE,
  created_at DATETIME DEFAULT NULL,
  updated_at DATETIME DEFAULT NULL
);

INSERT INTO users (name, birthday) VALUES
('Ivan', '1994-11-08')
,('Vasilii', '1997-02-10')
,('Petr', '1993-08-21')
,('Maria', '1998-08-17')
,('Elena', '1995-05-02')
;

UPDATE users SET created_at = CURRENT_TIMESTAMP, updated_at = CURRENT_TIMESTAMP;


-- 2 задание. Таблица users была неудачно спроектирована.
-- Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались
-- значения в формате 20.10.2017 8:10. Необходимо преобразовать поля к типу DATETIME,
-- сохранив введённые ранее значения.

DROP TABLE IF EXISTS users;
CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  birthday DATE,
  created_at VARCHAR(150),
  updated_at VARCHAR(150)
);

INSERT INTO users (created_at, updated_at) VALUES
('20.10.2017 8:10','20.10.2017 8:10')
,('21.10.2017 13:00','21.10.2017 13:00')
,('25.10.2017 22:05','25.10.2017 22:05')
,('27.10.2017 16:38','27.10.2017 16:38')
,('28.10.2017 9:50','28.10.2017 9:50')
;

UPDATE users SET created_at = STR_TO_DATE(created_at, '%d.%m.%Y %h:%i');
UPDATE users SET update_at = STR_TO_DATE(update_at, '%d.%m.%Y %h:%i');

ALTER TABLE users CHANGE created_at created_at DATETIME;
ALTER TABLE users CHANGE update_at update_at DATETIME;

-- 3 задание. В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры:
-- 0, если товар закончился и выше нуля, если на складе имеются запасы.
-- Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value.
-- Однако нулевые запасы должны выводиться в конце, после всех записей.

DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products(
  id SERIAL PRIMARY KEY,
  product_name VARCHAR(255) NOT NULL,
  product_quantity BIGINT UNSIGNED NOT NULL,
  product_price BIGINT UNSIGNED NOT NULL
);

INSERT INTO storehouses_products (product_name, product_quantity, product_price) VALUES
('',5,2500)
,('',0,1500)
,('',10,5000)
,('',0,500)
,('',3,3000)
;

SELECT * FROM storehouses_products ORDER BY CASE WHEN product_quantity = 0 THEN 999999999 ELSE product_quantity END;
