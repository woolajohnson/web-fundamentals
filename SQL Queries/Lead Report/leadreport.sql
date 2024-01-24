-- 1.
SELECT
    sites.domain_name AS website,
    sites.client_id
FROM
    sites
JOIN
    clients ON sites.client_id = clients.client_id
WHERE
    clients.client_id = 15;

-- 2.
SELECT
    DATE_FORMAT(sites.created_datetime, '%M') AS month,
    COUNT(*) AS total_count
FROM
    sites
WHERE
    DATE_FORMAT(sites.created_datetime, '%Y-%m') = '2011-06'
GROUP BY
    month;

-- 3.
SELECT
    DATE_FORMAT(billing.charged_datetime, '%Y-%m-%d') AS date,
    SUM(billing.amount) AS revenue
FROM
    billing
WHERE
    DATE_FORMAT(billing.charged_datetime, '%Y-%m-%d') = '2012-11-19';

-- 4.
SELECT
    client_id,
    SUM(amount) AS total_revenue,
    MONTHNAME(charged_datetime) AS month,
    EXTRACT(YEAR FROM charged_datetime) AS year
FROM
    billing
WHERE
    client_id = 1
GROUP BY
    client_id, year, month
ORDER BY
    year, MONTH(charged_datetime);

-- 5.
SELECT
    CONCAT(clients.first_name, ' ', clients.last_name) AS client_name,
    SUM(billing.amount) AS total_revenue,
    MONTHNAME(billing.charged_datetime) AS month_charged,
    EXTRACT(YEAR FROM billing.charged_datetime) AS year_charged
FROM
    clients
JOIN
    billing ON clients.client_id = billing.client_id
GROUP BY
    clients.client_id, year_charged, month_charged
ORDER BY
    clients.client_id, year_charged, MONTH(billing.charged_datetime);

-- 6.
SELECT
    sites.domain_name AS website,
    COUNT(leads.leads_id) AS number_of_leads
FROM
    sites
JOIN
    leads ON sites.site_id = leads.site_id
WHERE
    leads.registered_datetime BETWEEN '2011-03-15' AND '2011-04-15'
GROUP BY
    website;

-- 7.
SELECT
    CONCAT(clients.first_name, ' ', clients.last_name) AS client_name,
    sites.domain_name,
    COUNT(leads.leads_id) AS num_leads
FROM
    clients
JOIN
    sites ON clients.client_id = sites.client_id
LEFT JOIN
    leads ON sites.site_id = leads.site_id
GROUP BY
    client_name, sites.domain_name
ORDER BY
    client_name, num_leads;

-- 8.
SELECT
    CONCAT(clients.first_name, ' ', clients.last_name) AS client,
    COUNT(leads.leads_id) AS number_of_leads
FROM
    clients
JOIN
    sites ON clients.client_id = sites.client_id
LEFT JOIN
    leads ON sites.site_id = leads.site_id
WHERE
    YEAR(leads.registered_datetime) = 2012
GROUP BY
    client
HAVING
    number_of_leads > 0
ORDER BY
    client;

-- 9.
SELECT
    CONCAT(clients.first_name, ' ', clients.last_name) AS client,
    COUNT(leads.leads_id) AS number_of_leads,
    MONTHNAME(leads.registered_datetime) AS month
FROM
    clients
JOIN
    sites ON clients.client_id = sites.client_id
LEFT JOIN
    leads ON sites.site_id = leads.site_id
WHERE
    YEAR(leads.registered_datetime) = 2012
    AND MONTH(leads.registered_datetime) BETWEEN 1 AND 6
GROUP BY
    client, month
ORDER BY
    MONTH(leads.registered_datetime), client;

-- 10.
SELECT
    CONCAT(clients.first_name, ' ', clients.last_name) AS client_name,
    COUNT(sites.site_id) AS number_of_sites,
    GROUP_CONCAT(sites.domain_name) AS sites
FROM
    clients
JOIN
    sites ON clients.client_id = sites.client_id
GROUP BY
    client_name
ORDER BY
    client_name;

