use vk;
-- 1) Проанализировать какие запросы могут выполняться наиболее часто в процессе работы приложения и добавить необходимые индексы

-- часто встречаются запросы на поиск и фильтрацию пользователей по дате рождения и городу проживания
CREATE INDEX profiles_birthday_idx ON profiles(birthday);
CREATE INDEX profiles_hometown_idx ON profiles(city);

-- можно искать по тексту сообщений и постов
CREATE INDEX messages_body_idx ON messages(body(10));
CREATE INDEX posts_body_idx ON posts(body(10));

-- если у пользователя много документов он ищет их по имени + есть глобальный поиск документов по имени
CREATE INDEX media_filename_idx ON media(filename);