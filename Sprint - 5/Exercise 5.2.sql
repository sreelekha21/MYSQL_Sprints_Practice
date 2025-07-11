# Exercise 2 : Update Data Efficiently 
 
# Task 1 : Update the status column in the booking table to 'COMPLETED' for confirmed bookings where the check-out date is before today's date.

select * from booking;

UPDATE booking 
SET status = 'COMPLETED' 
WHERE status = 'CONFIRMED' 
  AND check_out_date < CURDATE();

# Task 2 : Adjust Property Prices Based on Ratings.If a property has received at least one view with a rating of 5,increase its price by 10%.

UPDATE property
SET price_per_night = price_per_night * 1.10
WHERE property_id IN (
    SELECT DISTINCT property_id
    FROM property_view
    WHERE rating = 5
);


# Task 3: A customer has request an update to their contact details. You need to find the customer's ID by name using a subquery and update their email and phone number.
# Find customer id for customer whose name is 'Amit Patil'.
# Update their email to 'amit_patil_90@gmail.com'.
# Update their phone number to '9988877776'.

UPDATE customer
SET email = 'amit_patil_90@gmail.com',
    phone_number = '9988877776'
WHERE customer_id = (
    SELECT customer_id
    FROM (
        SELECT customer_id
        FROM customer
        WHERE CONCAT(first_name, ' ', last_name) = 'Amit Patil'
    ) AS temp
);
