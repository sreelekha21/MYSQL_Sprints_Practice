# Exercise 7 : Applying RIGHT OUTER JOIN 

# The data analytics team wants  to identify customers who have bookings but do not have complete information about their properties.

# Task : Write a query to display the booking_id,check_in_date,check_out_date,and property_name,including bookings without matched property details.

describe booking;
describe property;

SELECT property.property_name,
booking.booking_id,
booking.check_in_date,
booking.check_out_date
 FROM property
 RIGHT OUTER JOIN booking
 ON booking.property_id = property.property_id;
