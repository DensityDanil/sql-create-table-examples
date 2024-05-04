-- create_and_delete_scenario1 - FK наявний - не можемо створити запис
-- тут ми не можемо вставити новий запис з ід=3 у таблиці user_profile, 
-- бо його немає в таблиці users
-- і у таблиці user_profile задано 
-- обмеження  FOREIGN KEY (id) REFERENCES users(user_id)


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
, (3, 'Thom', 'Yorke');

-- psql:commands.sql:19: ERROR:  insert or update on table "user_profile" violates foreign key constraint "user_profile_id_fkey"
-- DETAIL:  Key (id)=(3) is not present in table "users".
