-- 1) Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине

SELECT USER_NAME FROM USERS
WHERE ID IN (
  SELECT USER_ID FROM ORDERS
  GROUP BY USER_ID
);

-- 2) Выведите список товаров products и разделов catalogs, который соответствует товару.

SELECT P.NAME, C.NAME FROM PRODUCTS as P
JOIN CATALOGS as C
ON P.CATALOG_ID = C.ID;
