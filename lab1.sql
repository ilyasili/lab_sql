-1/
SELECT * 
FROM cities
ORDER BY population DESC
LIMIT 10 OFFSET 10;
2/
SELECT *
FROM cities
ORDER BY name DESC
LIMIT 30 OFFSET 0
3/
SELECT *
FROM cities 
ORDER BY region, population 
4/
SELECT region
FROM cities
5/
SELECT * FROM cities
ORDER BY region DESC, name DESC;