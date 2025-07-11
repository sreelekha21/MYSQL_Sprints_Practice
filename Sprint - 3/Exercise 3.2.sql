# Exercise 2 : Customer and Booking Insights

# Write SQL queries to complete the followings tasks:

# 1. Write a query to calculate the total amount Ravi Kumar has spent on bookings.

select SUM(total_amount) AS "total amount"
FROM booking 
INNER JOIN  customer
ON booking.customer_id = customer.customer_id
WHERE customer.username = "ravi_kumar";

# 2.Identify the highest and lowest amounts he has spent on individual bookings.

SELECT MAX(total_amount) as "highest amount",
MIN(total_amount) as "lowest amount"
FROM booking
INNER JOIN customer
ON booking.customer_id=customer.customer_id
WHERE  customer.username = 'ravi_kumar';

# 3. Write a query to list all customers who registered but never made a booking.

select * from customer;

select * from booking;

SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email
FROM 
    customer c
LEFT JOIN 
    booking b ON c.customer_id = b.customer_id
WHERE 
    b.booking_id IS NULL;

# 4. Write a query to calculate the total number of bookings for each status.

SELECT status,
COUNT(booking_id) AS "total_bookings"
FROM booking
GROUP BY status;





