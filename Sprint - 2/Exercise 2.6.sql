# Exercise 6 : Applying LEFT OTER JOIN 

# The opertaion team wants a list of all amenities avaliable in the database,along with the properties that offer each amentity .
# If an amenity is not linked to any property,it should still be included in the report

# Task : Write a query to retrive the amenity_name and property_name,ensuring that all amenities are included,even if they are not linked to a property.

describe property; 

describe property_amenity;

describe amenity;

SELECT 
    amenity.amenity_name,
    property.property_name
FROM  
    amenity
LEFT JOIN 
    property_amenity ON amenity.amenity_id = property_amenity.amenity_id
LEFT JOIN 
    property ON property.property_id = property_amenity.property_id;

