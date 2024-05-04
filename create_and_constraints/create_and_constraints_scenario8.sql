-- create_and_constraints_scenario8
CREATE TABLE Country(
    country_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Capital(
     capital_id INT PRIMARY KEY
    ,name VARCHAR(100)
    ,country_id INT UNIQUE NOT NULL -- (4) тепер вже обмежання з NOT NULL
    ,CONSTRAINT fk_country_capital FOREIGN KEY (country_id) REFERENCES Country(country_id)
    
    
);

INSERT INTO Country (country_id, name) VALUES (52,'China');
INSERT INTO Country (country_id, name) VALUES (99, 'United Kingdom');

INSERT INTO Capital (capital_id, name, country_id) VALUES (15,'Beijing',52);
INSERT INTO Capital (capital_id, name, country_id) VALUES (16,'BRRRR',NULL); -- (4) І такий запис вставити не вийде
INSERT INTO Capital (capital_id, name, country_id) VALUES (23,'London',99);

select *
from Capital

-- Output:

-- CREATE TABLE
-- CREATE TABLE
-- INSERT 0 1
-- INSERT 0 1
-- INSERT 0 1

-- psql:commands.sql:19: ERROR:  duplicate key value violates unique constraint "capital_country_id_key"
-- DETAIL:  Key (country_id)=(52) already exists.
