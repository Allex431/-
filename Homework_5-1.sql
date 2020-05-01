use shop;

# Задание 1. Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.

UPDATE users SET created_at = CURRENT_TIMESTAMP();

UPDATE users SET updated_at = CURRENT_TIMESTAMP();

# Задание 2. Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате "20.10.2017 8:10". Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения

ALTER TABLE users MODIFY COLUMN created_at DATETIME;

ALTER TABLE users MODIFY COLUMN updated_at DATETIME;

# Задание 3. В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, если товар закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. Однако, нулевые запасы должны выводиться в конце, после всех записей.

select * from storehouses_products order by value > 0 DESC;

# Задание 4. Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. Месяцы заданы в виде списка английских названий ('may', 'august')

SELECT * FROM users WHERE DATE_FORMAT(birthday_at,'%M') in ('may', 'august');

# Задание 5. Из таблицы catalogs извлекаются записи при помощи запроса. SELECT * FROM catalogs WHERE id IN (5, 1, 2); Отсортируйте записи в порядке, заданном в списке IN.

SELECT * FROM catalogs WHERE id IN (5, 1, 2) ORDER BY FIELD(id, 5, 1, 2);

#Практическое задание теме “Агрегация данных”
#Задание 1. Подсчитайте средний возраст пользователей в таблице users

ALTER TABLE users ADD column age INT;

UPDATE users SET age = (FLOOR(TO_DAYS(NOW()) - TO_DAYS (birthday_at))/ 365.25);

SELECT AVG(age) FROM users;

#Задание 2. Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. Следует учесть, что необходимы дни недели текущего года, а не года рождения 

SELECT COUNT(*) as stats from (SELECT DAYOFWEEK(CONCAT(YEAR(NOW()),'-',MONTH(birthday_at),'-',DAYOFMONTH(birthday_at))) as date from users) as stats where date=1;

