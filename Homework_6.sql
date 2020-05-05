use vk;

DROP TABLE IF EXISTS posts;
CREATE TABLE posts (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  community_id INT UNSIGNED,
  head VARCHAR(255),
  body TEXT NOT NULL,
  media_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


DROP TABLE IF EXISTS likes;
CREATE TABLE likes (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  target_id INT UNSIGNED NOT NULL,
  target_type_id INT UNSIGNED NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS target_types;
CREATE TABLE target_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO target_types (name) VALUES 
  ('messages'),
  ('users'),
  ('media'),
  ('posts');
 
select * from target_types;
  
INSERT INTO likes 
  SELECT 
    id, 
    FLOOR(1 + (RAND() * 100)), 
    FLOOR(1 + (RAND() * 100)),
    FLOOR(1 + (RAND() * 4)),
    CURRENT_TIMESTAMP 
  FROM messages;

select * from likes limit 20;

ALTER TABLE profiles 
  ADD CONSTRAINT profiles_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id),
  ADD CONSTRAINT profiles_photo_id_fk
    FOREIGN KEY (photo_id) REFERENCES media(id);
    
ALTER TABLE messages 
  ADD CONSTRAINT messages_from_user_id_fk
    FOREIGN KEY (from_user_id) REFERENCES users(id),
  ADD CONSTRAINT messages_to_user_id_fk
    FOREIGN KEY (to_user_id) REFERENCES users(id);
   
ALTER TABLE communities_users
  ADD CONSTRAINT communities_users_community_id_fk
    FOREIGN KEY (community_id) REFERENCES communities(id),
  ADD CONSTRAINT communities_users__user_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id);
    
ALTER TABLE media 
  ADD CONSTRAINT media_type_id_fk
    FOREIGN KEY (media_type_id) REFERENCES media_types(id),
  ADD CONSTRAINT media_type_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id);
   
 ALTER TABLE friendship 
   ADD CONSTRAINT friendship_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id),
   ADD CONSTRAINT friendship_friend_id_fk
    FOREIGN KEY (friend_id) REFERENCES users(id),
  ADD CONSTRAINT friendship_status_id_fk
    FOREIGN KEY (status_id) REFERENCES friendship_statuses(id);
   
ALTER TABLE likes 
  ADD CONSTRAINT likes_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id),
  ADD CONSTRAINT posts_user_id_fk
    FOREIGN KEY (user_id) REFERENCES posts(user_id),
  ADD CONSTRAINT target_type_id_fk
    FOREIGN KEY (target_type_id) REFERENCES target_types(id);
