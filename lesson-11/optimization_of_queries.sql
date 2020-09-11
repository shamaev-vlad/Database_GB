-- Задание 1. Создайте таблицу logs типа Archive.
-- Пусть при каждом создании записи в таблицах users, catalogs и products
-- в таблицу logs помещается время и дата создания записи, название таблицы, идентификатор первичного ключа
-- и содержимое поля name

DROP TABLE IF EXISTS logs;

CREATE TABLE logs (
	created_at DATETIME NOT NULL, -- время и дата создания записи
	target_id BIGINT NOT NULL, -- идентификатор первичного ключа
	table_name ENUM('users', 'catalogs' ,'products') NOT NULL, -- название таблицы
	name VARCHAR(255) -- содержимое поля name
) ENGINE = Archive;


DELIMITER //

DROP TRIGGER IF EXISTS trg_users_logs_create//
CREATE TRIGGER trg_users_logs_create AFTER INSERT ON users
FOR EACH ROW
BEGIN
	INSERT INTO logs SET created_at = NOW(),
   						target_id = NEW.id,
   						table_name = 'users',
   						name = NEW.name;
END//

DROP TRIGGER IF EXISTS trg_catalogs_logs_create//
CREATE TRIGGER trg_catalogs_logs_create AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN
	INSERT INTO logs SET created_at = NOW(),
   						target_id = NEW.id,
   						table_name = 'catalogs',
   						name = NEW.name;
END//


DROP TRIGGER IF EXISTS trg_products_logs_create//
CREATE TRIGGER trg_products_logs_create AFTER INSERT ON products
FOR EACH ROW
BEGIN
	INSERT INTO logs SET created_at = NOW(),
   						target_id = NEW.id,
   						table_name = 'products',
   						name = NEW.name;
END//

DELIMITER ;



INSERT INTO products
  (name, description, price, catalog_id)
VALUES
  ('iPhone X', 'Apple iPhone X, 256 ГБ, серебристый', 55990.00, 1),
  ('iPhone XS', 'Apple iPhone XS, 256 ГБ, серебристый', 65990.00, 1),
  ('iPhone 11', 'Apple iPhone 11, 256 ГБ, зеленый', 73990.00, 1);

INSERT INTO users (name, birthday_at) VALUES
  ('Петр', '1992-10-11'),
  ('Виктория', '1998-12-03'),
  ('Евгений', '1988-05-01');

INSERT INTO catalogs (name) VALUES
  ('1iPhone'),
  ('1Mac'),
  ('1iPad');


SELECT * FROM logs;
