1
SELECT cities.name AS city_name, regions.name AS region_name
FROM cities
JOIN regions ON cities.region = regions.uuid
WHERE cities.population > 350000;

2
SELECT cities.name AS city_name, regions.name AS region_name
FROM cities
JOIN regions ON cities.region = regions.uuid
WHERE regions.name = 'Nord';

3
Вставка даних в таблицю "Countries"
INSERT INTO Countries (country_id, country_name) VALUES
  (1, 'Україна'),
  (2, 'Сполучені Штати Америки'),
  (3, 'Франція'),
  ;

Створення таблиці "Cities"
CREATE TABLE Cities 
  (
    city_id INT PRIMARY KEY,
    city_name VARCHAR(255) NOT NULL,
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES Countries(country_id)
  );

Вставка даних в таблицю "Cities"
INSERT INTO Cities (city_id, city_name, country_id) VALUES
  (1, 'Київ', 1),  
  (2, 'Нью-Йорк', 2),  
  (3, 'Париж', 3);  
Створення таблиці "MetroSystems"
CREATE TABLE MetroSystems 
  (
    system_id INT PRIMARY KEY,
    system_name VARCHAR(255) NOT NULL,
    city_id INT,
    FOREIGN KEY (city_id) REFERENCES Cities(city_id)
  );

Вставка даних в таблицю "MetroSystems"
INSERT INTO MetroSystems (system_id, system_name, city_id) VALUES
  (1, 'Київський метрополітен', 1),   
  (2, 'Нью-Йоркський метрополітен', 2),   
  (3, 'Паризький метрополітен', 3);   

Створення таблиці "MetroLines"
CREATE TABLE MetroLines 
  (
    line_id INT PRIMARY KEY,
    line_name VARCHAR(255) NOT NULL,
    system_id INT,
    FOREIGN KEY (system_id) REFERENCES MetroSystems(system_id)
  );

Вставка даних в таблицю "MetroLines"
INSERT INTO MetroLines (line_id, line_name, system_id) VALUES
  (1, 'Червона лінія', 1),   
  (2, 'Лінія А', 2),   
  (3, 'Лінія 1', 3);   

Створення таблиці "Stations"
CREATE TABLE Stations 
  (
    station_id INT PRIMARY KEY,
    station_name VARCHAR(255) NOT NULL,
    line_id INT,
    latitude DECIMAL(10, 6),
    longitude DECIMAL(10, 6),
    FOREIGN KEY (line_id) REFERENCES MetroLines(line_id)
  );

Вставка даних в таблицю "Stations"
INSERT INTO Stations (station_id, station_name, line_id, latitude, longitude) VALUES
  (1, 'Хрещатик', 1, 50.4501, 30.5234),  
  (2, 'Times Square', 2, 40.7589, -73.9851),   
  (3, 'Louvre', 3, 48.8606, 2.3376);   
