# Exercise 1 : Add JSON Column 

-- In the property table of Accommodation database, the database design team has decided to add an additional column named property_details to store the following details about the properties in JSON format.
-- Year Built
-- Room Types
-- Accessibility

-- Task:
-- Modify the design of poperty table add the property_details column of type JSON. 

ALTER TABLE property
ADD COLUMN property_details JSON;


UPDATE property
SET property_details = '{
  "year_built": 2010,
  "room_types": ["single", "double", "suite"],
  "accessibility": "wheelchair accessible"
}'
WHERE property_id = 1;
