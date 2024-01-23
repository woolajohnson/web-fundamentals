-- 1.
SELECT * FROM customer;

-- 2.
SELECT CONCAT(first_name, ' ', last_name) AS customer_name, address.address FROM customer LEFT JOIN address ON customer.address_id = address.address_id;

-- 3.
SELECT CONCAT(first_name, ' ', last_name) AS customer_name, address.address, city.city FROM customer LEFT JOIN address ON customer.address_id = address.address_id LEFT JOIN city ON address.city_id = city.city_id;

-- 4.
SELECT CONCAT(first_name, ' ', last_name) AS customer_name, address.address, city.city, country.country FROM customer LEFT JOIN address ON customer.address_id = address.address_id LEFT JOIN city ON address.city_id = city.city_id LEFT JOIN country ON city.country_id = country.country_id;

-- 5.
SELECT CONCAT(first_name, ' ', last_name) AS customer_name, address.address, city.city, country.country FROM customer LEFT JOIN address ON customer.address_id = address.address_id LEFT JOIN city ON address.city_id = city.city_id LEFT JOIN country ON city.country_id = country.country_id WHERE country.country = 'Bolivia';

-- 6.
SELECT CONCAT(first_name, ' ', last_name) AS customer_name, address.address, city.city, country.country FROM customer LEFT JOIN address ON customer.address_id = address.address_id LEFT JOIN city ON address.city_id = city.city_id LEFT JOIN country ON city.country_id = country.country_id WHERE country.country IN ('Bolivia', 'Germany', 'Greece');

-- 7.
SELECT CONCAT(first_name, ' ', last_name) AS customer_name, address.address, city.city, country.country FROM customer LEFT JOIN address ON customer.address_id = address.address_id LEFT JOIN city ON address.city_id = city.city_id LEFT JOIN country ON city.country_id = country.country_id WHERE city.city = 'Baku';

-- 8.
SELECT CONCAT(first_name, ' ', last_name) AS customer_name, address.address, city.city, country.country FROM customer LEFT JOIN address ON customer.address_id = address.address_id LEFT JOIN city ON address.city_id = city.city_id LEFT JOIN country ON city.country_id = country.country_id WHERE city.city IN ('Baku', 'Beira', 'Bergamo');

-- 9.
SELECT CONCAT(first_name, ' ', last_name) AS customer_name, country.country, LENGTH(country.country) AS country_name_length FROM customer LEFT JOIN address ON customer.address_id = address.address_id LEFT JOIN city ON address.city_id = city.city_id LEFT JOIN country ON city.country_id = country.country_id WHERE LENGTH(country.country) < 5 ORDER BY LENGTH(customer_name) DESC;

-- 10.
SELECT CONCAT(first_name, ' ', last_name) AS customer_name, country.country, city.city, LENGTH(city.city) AS city_name_length FROM customer LEFT JOIN address ON customer.address_id = address.address_id LEFT JOIN city ON address.city_id = city.city_id LEFT JOIN country ON city.country_id = country.country_id WHERE LENGTH(city.city) > 10 ORDER BY country.country, city_name_length DESC;

-- 11.
SELECT CONCAT(first_name, ' ', last_name) AS customer_name, city.city FROM customer LEFT JOIN address ON customer.address_id = address.address_id LEFT JOIN city ON address.city_id = city.city_id WHERE city.city LIKE '%ba%';

-- 12.
SELECT CONCAT(first_name, ' ', last_name) AS customer_name, city.city, LENGTH(city.city) AS city_name_length FROM customer LEFT JOIN address ON customer.address_id = address.address_id LEFT JOIN city ON address.city_id = city.city_id WHERE city.city LIKE '% %' ORDER BY city_name_length DESC;

-- 13.
SELECT CONCAT(first_name, ' ', last_name) AS customer_name, city.city, country.country, LENGTH(city.city) AS city_name_length, LENGTH(country.country) AS country_name_length FROM customer LEFT JOIN address ON customer.address_id = address.address_id LEFT JOIN city ON address.city_id = city.city_id LEFT JOIN country ON city.country_id = country.country_id WHERE LENGTH(country.country) > LENGTH(city.city);