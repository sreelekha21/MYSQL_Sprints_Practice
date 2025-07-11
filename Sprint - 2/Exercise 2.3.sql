# Exercise 3 : Using INNER JOIN 

#  A customer feeback team wants to review ratings  for each  property  to identify  areas  of improvement .

# Task : Write a query to display property_name,rating,and review_text by combining the property and reviews tables.


SELECT 
    property.property_name, 
    review.rating, 
    review.review_text
FROM 
    review
INNER JOIN 
    booking ON review.booking_id = booking.booking_id
INNER JOIN 
    property ON booking.property_id = property.property_id;

