# Exercise 4 : Using INNER JOIN

# The customer support team needs to review which customers have  provided reviews for specific proerties to follow up on their feedack.

# Task : Write a query display the first_name,last_name,property_name,and rating by combining the customer,review,and property tables.

describe customer;

SELECT 
    customer.first_name,
    customer.last_name,
    property.property_name,
    review.rating
FROM 
    booking
INNER JOIN 
    customer ON booking.customer_id = customer.customer_id
INNER JOIN 
    review ON review.booking_id = booking.booking_id
INNER JOIN 
    property ON booking.property_id = property.property_id;

