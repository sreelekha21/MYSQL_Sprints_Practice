# Exercise 3 : Comprehensive Lodging Insights

# The operations team is analyzing property performance and customer activity to identify key trends.

# Write a query to provide a detailed report that includes:

# 1. The total number of bookings and the average revenue per booking for each proeprty.

SELECT 
    p.property_name,
    COUNT(b.booking_id) AS total_bookings,
    AVG(b.total_amount) AS average_revenue_per_booking
FROM 
    property p
LEFT JOIN 
    booking b ON p.property_id = b.property_id
GROUP BY 
    p.property_id, p.property_name;


# 2. Filter out properties with fewer than 3 bookings.

SELECT 
    p.property_name,
    COUNT(b.booking_id) AS total_bookings
FROM 
    property p
LEFT JOIN 
    booking b ON p.property_id = b.property_id
GROUP BY 
    p.property_id, p.property_name
HAVING 
    COUNT(b.booking_id) >= 3;


# 3. Include the name of the owner for each property.

SELECT 
    p.property_name,
    o.username AS owner_name
FROM 
    property p
INNER JOIN 
    owner o ON p.owner_id = o.owner_id;

