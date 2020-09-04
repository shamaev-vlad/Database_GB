-- Задание 1.
-- В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных.
-- Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.


truncate table sample.users; -- очистил таблицу sample.users
select * from sample.users; -- проверил, что такблица sample.users пустая

start transaction; -- начал транзакцию
insert into sample.users select * from shop.users where id = 1; -- вставил в таблицу sample.users первую строку shop.users
select * from sample.users; -- проверил, что данные перенесены

rollback; -- отменил осуществление транзакции
select * from sample.users; -- проверил корректно ли отработана отмена транзакции.

-- Задание 2.
-- Создайте представление, которое выводит название name товарной позиции из таблицы products и
-- соответствующее название каталога name из таблицы catalogs.


use shop;
drop view if exists view_of_prod;
create view view_of_prod as
select products.name 'Продукт', catalogs.name 'Каталог'
from products
left join catalogs
on products.catalog_id = catalogs.id
order by catalogs.name, products.name;

select * from view_of_prod;
