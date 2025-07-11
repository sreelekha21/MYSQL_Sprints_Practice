# Exercise 2 : Sorting Data With ORDER BY 

# The system admin wants to generate a list of properties sorted by their price  per night in descending order to identify the most expensive properties

# Task :  Write a query to retrive property_name and price_per_night from the property table and sort the results in descending order of price.

select property_name,price_per_night from property
 order by  price_per_night DESC;