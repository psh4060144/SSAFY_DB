-- 01. Querying data
SELECT 
  LastName
FROM
  employees;

SELECT
  LastName, FirstName
FROM
  employees;

SELECT
  *
FROM
  employees;

SELECT
  FirstName AS '이름'
FROM
  employees;

SELECT
  Name, Milliseconds / 60000 AS '재생 시간(분)'
FROM
  tracks;

-- 02. Sorting data
SELECT 
  FirstName
FROM
  employees
ORDER BY
  FirstName

SELECT 
  FirstName
FROM
  employees
ORDER BY
  FirstName DESC

SELECT
  Country, City
FROM
  customers
ORDER BY
  Country DESC,
  City;

SELECT
  Name, Milliseconds / 60000 AS '재생 시간(분)'
FROM
  tracks
ORDER BY
  Milliseconds DESC;

-- NULL 정렬 예시
SELECT 
  postalCode
FROM
  customers
ORDER BY
  postalCode;

-- 03. Filtering data
SELECT DISTINCT
  Country
FROM
  customers
ORDER BY
  Country;

SELECT
  LastName, FirstName, City
FROM
  customers
WHERE
  City != 'Prague';

SELECT
  LastName, FirstName, Company, Country
FROM
  customers
WHERE
  Company IS NULL
  OR Country = 'USA';

SELECT
  Name, Bytes
FROM
  tracks
WHERE
  Bytes BETWEEN 100000 AND 500000;

SELECT
  Name, Bytes
FROM
  tracks
WHERE
  Bytes BETWEEN 100000 AND 500000
ORDER BY
  Bytes;

SELECT
  LastName, FirstName, Country
FROM
  customers
WHERE
  Country NOT IN ('Canada', 'Germany', 'France')

SELECT
  LastName, FirstName
FROM
  customers
WHERE
  LastName Like '%son';

SELECT
  TrackID, Name, Bytes
FROM
  tracks
ORDER BY
  bytes DESC
LIMIT 3, 4;

-- 04. Grouping data
SELECT
  Country, COUNT(Country) AS '고객 수'
FROM
  customers
GROUP BY
  Country;

SELECT
  Composer, AVG(Bytes)
FROM
  tracks
GROUP BY
  Composer
ORDER BY
  AVG(Bytes) DESC;

SELECT
  Composer, AVG(Bytes) AS avgOfBytes
FROM
  tracks
GROUP BY
  Composer
ORDER BY
  avgOfBytes DESC;

SELECT
  Composer, AVG(Milliseconds / 60000) AS avgOfMinute
FROM
  tracks
GROUP BY
  Composer
HAVING
  avgOfMinute < 10;