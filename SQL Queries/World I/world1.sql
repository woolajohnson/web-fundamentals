-- 1.
SELECT * FROM country WHERE continent = 'Europe';

-- 2.
SELECT * FROM country WHERE continent IN ('North America', 'Africa');

-- 3.
SELECT country.Code AS country_code, country.Name AS country_name, country.Continent AS continent, country.Population AS country_population, city.Name AS city FROM country LEFT JOIN city ON country.Code = city.CountryCode WHERE country.Population > 100000000;

-- 4.
SELECT country.Name AS country, countrylanguage.Language FROM country LEFT JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language = 'Spanish';

-- 5.
SELECT country.Name AS country, countrylanguage.Language AS language, countrylanguage.IsOfficial AS isofficial FROM country LEFT JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language = 'Spanish' AND countrylanguage.IsOfficial = 'T';

-- 6.
SELECT country.Name AS country, countrylanguage.Language FROM country LEFT JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language IN ('Spanish', 'English') AND countrylanguage.IsOfficial = 'T';

-- 7.
SELECT country.Name AS country, countrylanguage.Language AS language, countrylanguage.Percentage AS percentage, countrylanguage.IsOfficial AS isofficial FROM country LEFT JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language = 'Arabic' AND countrylanguage.Percentage > 30 AND countrylanguage.IsOfficial = 'F';

-- 8.
SELECT country.Name AS country, countrylanguage.Language AS language, countrylanguage.IsOfficial AS isofficial, countrylanguage.Percentage AS percentage FROM country LEFT JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language = 'French' AND countrylanguage.IsOfficial = 'T' AND countrylanguage.Percentage < 50;

-- 9.
SELECT country.Name AS country, countrylanguage.Language AS language, countrylanguage.IsOfficial AS isofficial FROM country LEFT JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.IsOfficial = 'T' ORDER BY language;

-- 10.
SELECT country.Name AS country, city.Name AS city, countrylanguage.Language AS language, countrylanguage.IsOfficial AS isofficial FROM city LEFT JOIN country ON city.CountryCode = country.Code LEFT JOIN countrylanguage ON city.CountryCode  = countrylanguage.CountryCode WHERE countrylanguage.IsOfficial = 'T' ORDER BY city.Population DESC LIMIT 100;

-- 11.
SELECT country.Name AS country, country.LifeExpectancy AS lifeexpectancy, city.Name AS city, city.Population AS population FROM city LEFT JOIN country ON city.CountryCode = country.Code WHERE country.LifeExpectancy < 40 ORDER BY population DESC LIMIT 100;

-- 12.
SELECT country.Name AS country, city.Name AS city, country.LifeExpectancy AS lifeexpectancy FROM country LEFT JOIN city ON country.Code = city.CountryCode LEFT JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language = 'English' ORDER BY lifeexpectancy DESC LIMIT 100;