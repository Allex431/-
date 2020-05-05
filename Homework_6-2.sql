-- Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей

SELECT COUNT(id) FROM likes WHERE user_id IN (
  SELECT * FROM (
    SELECT id FROM profiles ORDER BY birthday DESC LIMIT 10
    ) as smth
);

-- Определить кто больше поставил лайков (всего) - мужчины или женщины?

SELECT IF(
	(SELECT COUNT(id) FROM likes WHERE user_id IN (
		SELECT id FROM profiles WHERE gender="m")
	) 
	> 
	(SELECT COUNT(id) FROM likes WHERE user_id IN (
		SELECT id FROM profiles WHERE gender="f")
	), 
   'male', 'female');
   
  -- Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.


SELECT user_id, COUNT(*) AS count
FROM likes
GROUP BY user_id
ORDER BY count LIMIT 10;

SELECT user_id, COUNT(*) AS count
FROM media
GROUP BY user_id
ORDER BY count LIMIT 10;

SELECT from_user_id, COUNT(*) AS count
FROM messages
GROUP BY from_user_id
ORDER BY count LIMIT 10;