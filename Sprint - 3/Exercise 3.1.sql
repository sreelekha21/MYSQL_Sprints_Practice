#Exercise 1:  Reveue Insights

# Write SQL queries to complete the following tasks :

# 1. Write a query to calculate the total revenue generated from  all bookings

select sum(total_amount) As "total revenue "
from booking;

# 2. Identify the booking with the highest revenue.

-- select max(total_amount) As "highest revenue"
-- from booking;

SELECT *
FROM booking
ORDER BY total_amount DESC
LIMIT 1;



# 3. Write a query to calculate the total revenue from bookings with check-in dates in December

select sum(total_amount) as "total revenue in December" 
from booking 
where  MONTH(check_in_date) =12;

# 4. Determine the number of CONFIRMED bookings in December;

select count(*) as "confirmed bookings in December"
from booking
where MONTH(check_in_date) = 12
AND status = 'CONFIRMED';

