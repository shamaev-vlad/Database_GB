-- Задание 1.
-- В базе данных Redis подберите коллекцию для подсчета посещений с определенных IP-адресов.

SADD ip '127.0.0.1' '127.0.0.2' '127.0.0.3'
SADD ip '127.0.0.1' -- Невозможно добавить в коллекцию уже имеющиейся в ней ip адрес, только уникальные значения
SMEMBERS ip  -- просмотрим список уникальных ip
SCARD ip -- кол-во адресов в коллекции

-- Задание 2.
-- При помощи базы данных Redis решите задачу поиска имени пользователя по электронному адресу
-- и наоброт, поиск электронного адреса пользователя по его имени.

set example@gmail.com example
set example example@gmail.com

get example@gmail.com
get example

-- Задание 3.
-- Организуйте хранение категорий и товарных позиций учебной базы данных shop в СУБД MongoDB.
-- Так как в плане выбора структуры БД mongodb дает широкий выбор,
-- то оптимальных вариантов организации структуры БД может довольно много, все зависит от предметной области

use products
db.products.insert({"name": "iPhone X", "description": "Apple iPhone X, 256 ГБ, серебристый", "price": "55990.00", "catalog_id": "iPhone", "created_at": new Date(), "updated_at": new Date()})

db.products.insertMany([
	{"name": "iPhone XS", "description": "Apple iPhone XS, 256 ГБ, серебристый", "price": "65990.00", "catalog_id": "iPhone", "created_at": new Date(), "updated_at": new Date()},
	{"name": "iPhone 11", "description": "Apple iPhone 11, 256 ГБ, зеленый", "price": "73990.00", "catalog_id": "iPhone", "created_at": new Date(), "updated_at": new Date()}])

db.products.find().pretty()
db.products.find({name: "iPhone 11"}).pretty()

use catalogs
db.catalogs.insertMany([{"name": "iPhone"}, {"name": "Mac"}, {"name": "iPad"}])
