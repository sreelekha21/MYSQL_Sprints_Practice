# Exercise 3 :  Applied Correlated Subqueries

# 1. Identify properties where the price per night is higher than the average price per night for properties in the same location .Retrieve the property_id,property_name,location,and price_per_night.

SELECT property_id, property_name, location, price_per_night
FROM property p
WHERE price_per_night > (
    SELECT AVG(price_per_night)
    FROM property
    WHERE location = p.location
);


# 2. Identify the least expensive property in each location and include the owner's first and last name along with the property details like property_id,property_name,location,and price_per_night

SELECT p.property_id, p.property_name, p.location, p.price_per_night,
       o.first_name, o.last_name
FROM property p
JOIN owner o ON p.owner_id = o.owner_id
WHERE price_per_night = (
    SELECT MIN(price_per_night)
    FROM property
    WHERE location = p.location
);
