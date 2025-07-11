
-- Exercise 3 : Filtering with WHERE  and Comparison  Operators

-- TASK   

--  A Customer wants to see the properties in Goa with a nightly price less than  ₹ 300

-- Write a query to find properties in Goa that meet this condition, displaying  property_name  and price_per_night.

select  property_name, price_per_night from property
  where price_per_night < 300 and location = 'Goa';