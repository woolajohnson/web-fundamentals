-- 1.
SELECT
    country.country,
    COUNT(customer.customer_id) AS total_number_of_customers
FROM
    country
JOIN
    city ON country.country_id = city.country_id
JOIN
    address ON city.city_id = address.city_id
JOIN
    customer ON address.address_id = customer.address_id
GROUP BY
    country.country;

-- 2.
SELECT
    city.city AS city,
    country.country AS country,
    COUNT(customer.customer_id) AS total_number_of_customers
FROM
    country
JOIN
    city ON country.country_id = city.country_id
JOIN
    address ON city.city_id = address.city_id
JOIN
    customer ON address.address_id = customer.address_id
GROUP BY
    city.city, country.country
ORDER BY
    total_number_of_customers DESC;


-- Now, look at the payment table where it has information about the customer as well as how much the customer paid to rent the item.  Based on this,

-- 1.
SELECT
    DATE_FORMAT(payment.payment_date, '%b-%Y') AS month_and_year,
    SUM(payment.amount) AS total_rental_amount,
    COUNT(*) AS total_transactions,
    AVG(payment.amount) AS average_rental_amount
FROM
    payment
GROUP BY
    month_and_year;

-- 2.
SELECT
    DATE_FORMAT(payment.payment_date, '%h %p') AS hour_of_the_day,
    SUM(payment.amount) AS total_amount_received
FROM
    payment
GROUP BY
    hour_of_the_day
ORDER BY
    total_amount_received DESC, hour_of_the_day
LIMIT
    10;

