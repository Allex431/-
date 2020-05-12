-- 1) Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей

SELECT CONCAT(first_name, " ", last_name) as user, TIMESTAMPDIFF(YEAR, birthday, NOW()) as age 
  FROM users as u
    JOIN profiles as p
      ON u.id = p.user_id
        ORDER BY age LIMIT 10;
        
SELECT COUNT(l.id)
  FROM users as u
    LEFT JOIN profiles as p
      ON u.id = p.user_id
	JOIN likes as l
      ON u.id = l.target_id
	ORDER BY TIMESTAMPDIFF(YEAR, birthday, NOW()) LIMIT 10;
	
-- 2) Определить кто больше поставил лайков (всего) - мужчины или женщины?
SELECT CASE(p.gender)
      WHEN 'm' THEN 'male'
      WHEN 'f' THEN 'female'
    END as gender, COUNT(*) as likes_count
  FROM profiles as p
    JOIN likes as l
      ON p.user_id = l.user_id
  GROUP BY gender;
  
 -- 3) Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.
SELECT CONCAT(first_name, ' ', last_name) as user, GREATEST(IFNULL(MAX(likes.created_at), 0), IFNULL(MAX(media.created_at),0), IFNULL(MAX(messages.created_at),0)) as activity
  FROM users
   JOIN likes
    ON likes.user_id = users.id
   JOIN media
    ON media.user_id = users.id
   JOIN messages
    ON messages.from_user_id = users.id
  ORDER BY activity
  LIMIT 10;