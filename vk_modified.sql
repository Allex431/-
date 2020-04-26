use vk;

show tables;

select * from users limit 50;

UPDATE users SET updated_at = CURRENT_TIMESTAMP WHERE created_at > updated_at; 

DESC profiles;

select * from profiles limit 50;

ALTER TABLE profiles ADD COLUMN photo_id INT UNSIGNED;

ALTER TABLE profiles ADD COLUMN updated_at DATETIME DEFAULT NOW() ON UPDATE NOW();

select * from messages limit 50;

SELECT COUNT(*) FROM users;

SELECT FLOOR(1+ RAND() * 100);

UPDATE messages SET 
  from_user_id = FLOOR(1+ RAND() * 100),
  to_user_id = FLOOR(1+ RAND() * 100);
  
 DESC media;
 

SELECT * from media_types;

delete from media_types;

INSERT INTO media_types (name) VALUES
  ('photo'),
  ('video'),
  ('audio');
  
 TRUNCATE media_types;

 select * from media limit 50;


UPDATE media SET 
  media_type_id = FLOOR(1+ RAND() * 3);
 
UPDATE media SET 
  user_id = FLOOR(1+ RAND() * 100); 
 
CREATE TEMPORARY TABLE exts (name VARCHAR(10));

INSERT INTO exts VALUES ('jpeg'), ('avi'), ('mpg'), ('png');

SELECT * FROM exts;
 
UPDATE media SET filename = CONCAT('https://dropbox/vk/',
  filename,
  '.',
  (SELECT name FROM exts ORDER BY RAND() LIMIT 1)
);

select * from media;

UPDATE media SET size = FLOOR(100000 + (RAND() * 1000000)) WHERE size < 60000;

UPDATE media SET metadata = CONCAT('{"owner":"', 
  (SELECT CONCAT(first_name, ' ', last_name) FROM users WHERE id = user_id),
  '"}');  
  
 ALTER TABLE media MODIFY COLUMN metadata JSON;
 
select * from friendship limit 50;

UPDATE friendship SET 
  user_id = FLOOR(1 + RAND() * 200),
  friend_id = FLOOR(1 + RAND() * 200);
 
UPDATE friendship SET requested_at = DATE(NOW()) + INTERVAL -5 YEAR + INTERVAL RAND()*4*365.25 DAY;
 
UPDATE friendship SET confirmed_at = DATE(NOW()) + INTERVAL -4 YEAR + INTERVAL RAND()*3*365.25 DAY;

UPDATE friendship SET confirmed_at = CURRENT_TIMESTAMP() WHERE confirmed_at < requested_at;

select * from friendship_statuses limit 50;

TRUNCATE friendship_statuses; 

INSERT INTO friendship_statuses (name) VALUES
  ('Requested'),
  ('Confirmed'),
  ('Rejected');
 
 UPDATE friendship SET status_id = FLOOR(1 + RAND() * 3);

DESC communities;

select * from communities;

DELETE FROM communities WHERE id > 15;

SELECT * FROM communities_users;

UPDATE communities_users SET community_id = FLOOR(1 + RAND() * 15);


