1

SELECT region, SUM(population) AS total_population
FROM cities
GROUP BY region;

2

SELECT region, SUM(population) as total_population
FROM cities
GROUP BY region
HAVING COUNT(*) >= 10;

3

SELECT name, population
FROM cities
WHERE region IN 
(
  SELECT region
  FROM cities
  GROUP BY region
  HAVING COUNT(DISTINCT name) >= 5
)
ORDER BY population DESC
LIMIT 5 OFFSET 2;

4

SELECT region, SUM(population) as total_population
FROM cities
WHERE population > 300000
GROUP BY region;

5

SELECT name, population
FROM cities
WHERE region IN 
(
    SELECT region
    FROM cities
    GROUP BY region
    HAVING COUNT(DISTINCT name) <= 5
)
AND population NOT BETWEEN 150000 AND 500000;0) * 100 DESC;