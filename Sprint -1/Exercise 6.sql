
# Exercise 6 : Combining Filters and Functions 

# A Customer wants a list of villas priced above  ₹ 2000 that were added  in the current month .

# Task :  Write a query to find such properties, displaying propert_name,price_per_night, and created_at.

select property_name,price_per_night,
created_at from property
WHERE price_per_night > 2000
  AND MONTH(created_at) = MONTH(CURRENT_DATE)
  AND YEAR(created_at) = YEAR(CURRENT_DATE);