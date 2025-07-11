# Exercise 1 : Use Scalar Subqueries

# 1. Find properties priced above the average price per night.Write a query to retrieve the property_id,property_name,and price_per_night for such properties.alter

SELECT property_id,
property_name,price_per_night
FROM property
WHERE price_per_night > (SELECT AVG(price_per_night) FROM property);


# 2. Identiffy Customers who have spent more than the average total amount on bookings.Write a query to retrieve the customer_id,first_name & last_name as single name for these customers.

describe customer;
 
 describe booking;

SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS name
FROM (
    SELECT customer_id, SUM(total_amount) AS total_spent
    FROM booking
    GROUP BY customer_id
) AS b
JOIN customer c ON c.customer_id = b.customer_id
WHERE b.total_spent > (
    SELECT AVG(total_spent)
    FROM (
        SELECT customer_id, SUM(total_amount) AS total_spent
        FROM booking
        GROUP BY customer_id
    ) AS avg_sub
);
