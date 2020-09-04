-- Создайте двух пользователей которые имеют доступ к базе данных shop.
-- Первому пользователю shop_read должны быть доступны только запросы на чтение данных,
-- второму пользователю shop — любые операции в пределах базы данных shop.



use shop;

create user 'user1'@'localhost';
grant select on * to user1; -- доступны только запросы на чтение данных

create user 'user2'@'localhost';
grant usage on * to user2; -- любые операции в пределах базы данных shop
