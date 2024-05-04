-- create_and_constraints_scenario7
CREATE TABLE Country(
    country_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Capital(
     capital_id INT PRIMARY KEY
    ,name VARCHAR(100)
    ,country_id  INT UNIQUE -- (3)
    ,CONSTRAINT fk_country_capital FOREIGN KEY (country_id) REFERENCES Country(country_id)
    
);

INSERT INTO Country (country_id, name) VALUES (52,'China');
INSERT INTO Country (country_id, name) VALUES (99, 'United Kingdom');

INSERT INTO Capital (capital_id, name, country_id) VALUES (15,'Beijing',52);
INSERT INTO Capital (capital_id, name, country_id) VALUES (16,'BRRRR',NULL); --  (3) вставляємо дані але з Null-значенням - і цю вставку можна зробити
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
--         16 | BRRRR   |       -- ось вона
--         23 | London  |   99
-- (3 rows)
