-- 1.
SELECT
  continent,
  COUNT(country.Name) AS total_countries,
  AVG(country.LifeExpectancy) AS lifeexpectancy
FROM
  country
WHERE
  country.LifeExpectancy > 70
GROUP BY
  continent;

-- 2.
SELECT
  continent,
  COUNT(country.Name) AS total_countries,
  AVG(country.LifeExpectancy) AS lifeexpectancy
FROM
  country
WHERE
  country.LifeExpectancy BETWEEN 60 AND 70
GROUP BY
  continent;

-- 3.
SELECT
  country.Name AS country,
  country.LifeExpectancy AS lifeexpectancy
FROM
  country
WHERE
  country.LifeExpectancy > 75;

-- 4.
SELECT
  country.Name AS country,
  country.LifeExpectancy AS lifeexpectancy
FROM
  country
WHERE
  country.LifeExpectancy < 40;

-- 5.
SELECT
  country.Name AS country,
  country.Population AS populations
FROM
  country
ORDER BY
  country.Population DESC
LIMIT 10;

-- 6.
SELECT 
    SUM(country.Population) AS total_population
FROM
    country;

-- 7.
SELECT
    country.Continent AS continent, SUM(country.Population) AS total_population
FROM
    country
GROUP BY
    country.Continent
HAVING
    SUM(country.Population) > 500000000;

-- 8.
SELECT
    country.Continent AS continent, 
    COUNT(country.Name) AS country, 
    SUM(country.Population) AS total_population, 
    AVG(country.LifeExpectancy) AS life_expectancy
FROM
    country
GROUP BY
    country.Continent
HAVING
    AVG(country.LifeExpectancy) < 71;


-- Now that you've used the group by a bit, let's now have you use this together with other records that were joined from multiple tables. Write a SQL query to obtain answers to the following questions:

-- 1.
SELECT 
    country.Name AS country,
    COUNT(city.CountryCode) AS number_of_cities
FROM
    country
LEFT JOIN
    city ON country.Code = city.CountryCode
GROUP BY
    country;

-- 2.
SELECT
    country.Name AS country,
    countrylanguage.Language AS language,
    (
        SELECT COUNT(CountryCode)
        FROM countrylanguage cl
        WHERE cl.Language = countrylanguage.Language
    ) AS number_of_countries
FROM
    country
JOIN
    countrylanguage ON country.Code = countrylanguage.CountryCode;

-- 3.
SELECT
    countrylanguage.Language AS language,
    COUNT(*) AS total_countries,
    'T' AS isofficial
FROM
    countrylanguage
WHERE
    countrylanguage.IsOfficial = 'T'
GROUP BY
    countrylanguage.Language;

-- 4.
SELECT
    country.Continent AS continent,
    COUNT(city.ID) AS total_cities,
    AVG(city.Population) AS average_cities_population
FROM
    country
JOIN
    city ON country.Code = city.CountryCode
GROUP BY
    country.Continent;

-- 5.
SELECT
    countrylanguage.Language AS language,
    SUM(countrylanguage.Percentage * country.Population / 100) AS total_population
FROM
    countrylanguage
JOIN
    country ON countrylanguage.CountryCode = country.Code
GROUP BY
    countrylanguage.Language
ORDER BY
    total_population DESC;


