CREATE DATABASE testdb;
USE testdb;
CREATE TABLE IF NOT EXISTS datax
(id INT,
Name VARCHAR (20),
Cost INT

);

/*данные в таблицу "datax" добавил через опцию  "Table Data Import Wizard" 
- и импортировал данные из таблицы "test_db.csv"*/

-- Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов
CREATE  VIEW car25 AS
SELECT Id, Name, Cost
FROM datax;

SELECT *
FROM car25
WHERE Cost <= 25000; 

/* Изменить в существующем представлении порог для стоимости: 
пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW) 
*/

ALTER VIEW car25
AS
SELECT Id, Name, Cost	
FROM datax
WHERE Cost <= 30000;

SELECT *
FROM car25
ORDER BY Cost; 

/*
Создайте представление, 
в котором будут только автомобили марки “Шкода” и “Ауди”
*/

CREATE  VIEW Audi_Skoda AS
SELECT Id, Name, Cost
FROM datax;

SELECT * FROM Audi_Skoda
WHERE Name LIKE '%Audi%'  -- решил задачу через оператор LIKE потому что через оператор IN  никак не получилось
OR Name LIKE '%Skoda%';










