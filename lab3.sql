1
SELECT * FROM cities WHERE name LIKE '%ськ'; 


2
SELECT * FROM cities WHERE name LIKE '%донец%'; -

3
SELECT CONCAT(name, ' (', region, ')')
FROM cities 
WHERE population >= 100000
ORDER BY name ASC 

4
SELECT name AS 'Назва міста', population AS 'Населення', (population / 40000.0) * 100 AS 'Відсоток населення'
FROM cities 
ORDER BY population DESC
LIMIT 10;

5
SELECT CONCAT(name, ' - ', (population / 40000000.0) * 100, '%') AS 'Змішана Інформація'
FROM cities 
WHERE (population / 40000000.0) * 100 >= 0.1 
ORDER BY (population / 40000000.0) * 100 DESC;