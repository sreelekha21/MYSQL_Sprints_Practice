# Exercise 4 : Debugging SQL Queries

# some has attempted to write SQL queries to retrieve specific results.

# However, the queries are returning errors or producing incorrect results.

# Task : Idnetify the mistakes and correct the query 

# Problem 1 : The analyst wants to shows customers who spends more than ₹ 20,000 on bookings ,but the query isn't working

SELECT 
    customer_id, 
    SUM(total_amount) AS total_spend
FROM 
    booking
GROUP BY 
    customer_id
HAVING 
    SUM(total_amount) > 20000;


# Problem 2 : A developer is trying to fetch property names with their average review rating, but the query throws an error or produces incorrect averages.alter

SELECT 
    p.property_name,
    AVG(r.rating) AS average_rating
FROM 
    property p
INNER JOIN 
    booking b ON p.property_id = b.property_id
INNER JOIN 
    review r ON b.booking_id = r.booking_id
GROUP BY 
    p.property_id, p.property_name;













