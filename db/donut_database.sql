DROP TABLE IF EXISTS donut_database;

CREATE TABLE donut_list(
id SERIAL PRIMARY KEY,
brand CHAR(255),
name CHAR(255),
dairy_free BOOLEAN,
calories INT
);