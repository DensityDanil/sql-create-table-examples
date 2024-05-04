-- create_and_delete_scenario3 - FK наявний - видаляємо дані з users 
-- Тут ми задаємо питання
-- Чи видаляються залежні дані після видалення чи вони залишаються у бд?
-- Тут також в нас буде юзер з ід=2 - Robert Plant

CREATE TABLE users (
    user_id int PRIMARY KEY
);

CREATE TABLE user_profile (
    id int PRIMARY KEY,
    name varchar(255),
    second_name varchar(255),
    FOREIGN KEY (id) REFERENCES users(user_id)
);

INSERT INTO users (user_id) VALUES (1), (2);

INSERT INTO user_profile (id, name, second_name) 
VALUES 
  (1, 'Noel', 'Gallagher')
, (2, 'Robert', 'Plant');

-- видаляємо юзера з ід=2
DELETE FROM users 
where user_id = 2;

-- робимо два селекти до таблиць щоб подивитися зміни
select * 
from users;

select * 
from user_profile;

-- Output
-- CREATE TABLE
-- CREATE TABLE
-- INSERT 0 2
-- INSERT 0 2

-- psql:commands.sql:20: ERROR:  update or delete on table "users" violates foreign key constraint "user_profile_id_fkey" on table "user_profile"

-- DETAIL:  Key (user_id)=(2) is still referenced from table "user_profile".
-- тут ми могли б зробити так:

-- DELETE FROM user_profile 
-- where id = 2;
-- select * 
-- from user_profile;

-- але яякщо є помилка в коді то після цієї помилки далі код не буде виконано, тож є сенс розділити на 2 файли