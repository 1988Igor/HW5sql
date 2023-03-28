CREATE DATABASE hw5Task2;
USE hw5Task2;
CREATE TABLE train_station
( trains_id INT,
  station character varying(20),
  station_time time
  
  
);

INSERT INTO train_station (trains_id, station, station_time)
VALUES
  (110, 'San Francisco', '10:00:00'),
  (110, 'Redwood City', '10:54:00'),
  (110, 'Palo Alto', '11:02:00'),
  (110, 'San Jose', '12:35:00'),
  (120, 'San Francisco', '11:00:00'),
  (120, 'Palo Alto', '12:49:00'),
  (120, 'San Jose', '13:30:00');

SELECT * 
FROM train_station;


ALTER TABLE train_station ADD COLUMN time_to_next_station numeric(10,2);

UPDATE train_station AS t1
JOIN (
  SELECT trains_id, station, station_time,
         LEAD(station_time) OVER (PARTITION BY trains_id ORDER BY station_time) AS next_station_time
  FROM train_station
) t2 ON t1.trains_id = t2.trains_id AND t1.station = t2.station AND t1.station_time = t2.station_time
SET t1.time_to_next_station = COALESCE(TIMESTAMPDIFF(MINUTE, t1.station_time, t2.next_station_time), 0); 
-- Если следующей станции нет, то мы присваиваем значение 0 столбцу "time_to_next_station" с помощью функции COALESCE().

SELECT trains_id, station,  station_time,
 SEC_TO_TIME(time_to_next_station * 60) AS time_to_next_station   
FROM train_station;
/*выбираем все строки из таблицы "train_station" и конвертируем значения столбца 
"time_to_next_station" в формат времени с помощью функции SEC_TO_TIME().
*/















