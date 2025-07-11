# Exercise 2  :  Construct tabular Subqueries (cond)

# 1. Find the properties that have booked atleast 2 times .Write a query to retrieve the property_id,property_name and location for such properties.

SELECT p.property_id, p.property_name, p.location
FROM property p
WHERE p.property_id IN (
    SELECT property_id
    FROM booking
    GROUP BY property_id
    HAVING COUNT(*) >= 2
);

# 2. Find locations with total revenue exceeding ₹ 2,00,000 Using tabular subqueries.

SELECT location
FROM property
WHERE property_id IN (
    SELECT property_id
    FROM booking
    GROUP BY property_id
    HAVING SUM(total_amount) > 200000
);

# 3. Find the properties whose price per night is higher than ALL properties that have been booked.Write a query to retrieve property_id,property_name,location,price_per_night for such properties.

SELECT p.property_id, p.property_name, p.location, p.price_per_night
FROM property p
WHERE p.price_per_night > ALL (
    SELECT p2.price_per_night
    FROM property p2
    WHERE p2.property_id IN (
        SELECT DISTINCT property_id
        FROM booking
    )
);


# 4. Find customers whose total booking amount is higher than ANY customer who has made more than 2 bookings.Write a query to retrieve the customer_id,first_name and last_name for such customers.

SELECT c.customer_id, c.first_name, c.last_name
FROM customer c
JOIN (
    SELECT customer_id, SUM(total_amount) AS total_spent
    FROM booking
    GROUP BY customer_id
) AS all_customers ON c.customer_id = all_customers.customer_id
WHERE all_customers.total_spent > ANY (
    SELECT SUM(total_amount)
    FROM booking
    GROUP BY customer_id
    HAVING COUNT(*) > 2
);

