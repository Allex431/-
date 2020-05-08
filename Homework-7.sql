use shop;
-- 0 готовлю данные для задания 3
DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  fl_from VARCHAR(255),
  fl_to VARCHAR(255)
  );
  
INSERT INTO flights
  (fl_from, fl_to)
 VALUES
  ('moscow','tomsk'),
  ('novgorod','kazan'),
  ('irkutsk', 'moscow'),
  ('omsk','irkutsk'),
  ('moscow','kazan');

DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
  label VARCHAR(255),
  name VARCHAR(255)
  );
  
 INSERT INTO cities
  (label, name)
 VALUES
  ('moscow','Москва'),
  ('novgorod','Новгород'),
  ('irkutsk', 'Иркутск'),
  ('omsk','Омск'),
  ('kazan','Казань');
 
 -- 1) Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине

SELECT DISTINCT name 
  FROM users 
  INNER JOIN orders  
    ON users.id = orders.user_id;
    
-- 2) Выведите список товаров products и разделов catalogs, который соответствует товару
   
SELECT products.name AS products_name, catalogs.name AS product_type
  FROM products
  LEFT JOIN catalogs
    ON products.catalog_id = catalogs.id;
    
-- 3)  Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). Поля from, to и label содержат английские названия городов, поле name — русское. Выведите список рейсов flights с русскими названиями городов
   
SELECT flights.id, flights.fl_from, flights.fl_to AS r_name
  FROM flights
  LEFT JOIN cities
    ON cities.label = flights.fl_from
    LEFT JOIN cities as c
    ON c.name = flights.fl_to;
  
 
 
