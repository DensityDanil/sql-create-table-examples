-- create_and_delete_scenario4 - FK наявний - видаляємо дані з user_profile

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

DELETE FROM user_profile 
where id = 2;

select * 
from users;

select * 
from user_profile;

-- Output
-- CREATE TABLE
-- CREATE TABLE
-- INSERT 0 2
-- INSERT 0 2
-- DELETE 1
--  user_id 
-- ---------
--        1
--        2
-- (2 rows)

--  id | name | second_name 
-- ----+------+-------------
--   1 | Noel | Gallagher
-- (1 row)

