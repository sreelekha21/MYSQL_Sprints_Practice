# Exercise 5 : Applying LEFT OUTER JOIN 

# The  operations team needs a list of all properties ,including those without any bookings ,to identify underutilized properties.

# Task : Write a query  to retrieve property_name, location,and booking_id for all properties,even if they don't have a booking .

describe property;

describe booking;

select property.property_name,
property.location,
booking.booking_id

from property

LEFT OUTER JOIN  booking

ON booking.property_id = property.property_id;