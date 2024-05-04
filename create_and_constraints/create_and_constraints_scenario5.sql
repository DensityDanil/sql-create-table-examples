-- create_and_constraints_scenario5
-- тут відмітив попри обмеження можна робити INSERT

CREATE TABLE Country(
    country_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Capital(
    capital_id INT PRIMARY KEY,
    name VARCHAR(100),
    country_id  INT, -- (1) Тут просто колонка в схемі таблиці типу даних INTEGER. в postgresql можливе значення в діпазоні -2147483648 to +2147483647 (від -2**31 до 2**31 - 1)
    CONSTRAINT fk_country_capital FOREIGN KEY (country_id) REFERENCES Country(country_id)
);

INSERT INTO Country (country_id, name) VALUES (52,'China'); -- Китай зможемо знайти за country_id=52
INSERT INTO Country (country_id, name) VALUES (99, 'United Kingdom');

INSERT INTO Capital (capital_id, name, country_id) VALUES (15,'Beijing',52);
INSERT INTO Capital (capital_id, name, country_id) VALUES (16,'BRRRR',52); -- (1) додаємо ще нову столицю для Китаю з capital_id=16
INSERT INTO Capital (capital_id, name, country_id) VALUES (23,'London',99);

select *
from Capital
-- Output:

-- CREATE TABLE
-- CREATE TABLE
-- INSERT 0 1
-- INSERT 0 1
-- INSERT 0 1
-- INSERT 0 1
-- INSERT 0 1
-- capital_id |  name   | country_id 
-- ------------+---------+------
--         15 | Beijing |   52
--         16 | BRRRR   |   52
--         23 | London  |   99
-- (3 rows)

