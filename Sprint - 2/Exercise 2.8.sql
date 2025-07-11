# Exercise 8: Combining joins with ORDER BY 

# The sales team wants a report showing the most frequently booked properties along with their booking details ,sorted by price_per_night in descending order.

# Task : Write a query to display the proeprty_name,price_per_night,booking_id,and status for all proerties with bookings,sorted by the highest price per night.

describe property;

describe booking;

SELECT 
    property.property_name,
    property.price_per_night,
    booking.booking_id,
    booking.status
FROM 
    property
INNER JOIN 
    booking ON booking.property_id = property.property_id
ORDER BY 
    property.price_per_night DESC;
