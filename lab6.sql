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
CREATE TABLE stations 
    (
    station INT PRIMARY KEY,
    name VARCHAR(255),
    latitude DECIMAL(10, 8),
    longitude DECIMAL(11, 8)
);

CREATE TABLE metro_lines 
    (
    line INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE stations_on_line 
    (
    station INT,
    line INT,
    sequence_number INT,
    PRIMARY KEY (station, line),
    FOREIGN KEY (station) REFERENCES stations(station),
    FOREIGN KEY (line) REFERENCES metro_lines(line)
);

CREATE TABLE station_connections 
    (
    connection INT PRIMARY KEY,
    station_1 INT,
    station_2 INT,
    FOREIGN KEY (station_1) REFERENCES stations(station),
    FOREIGN KEY (station_2) REFERENCES stations(station)
);

CREATE TABLE line_description 
    (
    line INT PRIMARY KEY,
    color VARCHAR(50),
    length DECIMAL(10, 2),
    travel_time TIME,
    description TEXT,
    FOREIGN KEY (line) REFERENCES metro_lines(line)
);
