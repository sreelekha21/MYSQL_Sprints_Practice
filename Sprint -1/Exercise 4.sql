--  Exercise 4 : Using String Functions

-- The Platform admin wants to create a feature that shows the first 5 characters of property names as a short code.

-- Task :

-- Write a query to display the property_id and the  first 5 characters of property_name  as short_code

use accommodation;
select property_id,substr(property_name,1,5) as short_code from property;