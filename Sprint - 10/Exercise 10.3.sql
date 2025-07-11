-- Exercise 3 : Retrieve JSON Data 

-- Retrieve property details from the property table that fulfils the following criteria:

-- Tasks:

-- 1. List all avaliable Room Type for each property.
-- 2. Retrieve Year Built for properties where the year is available.
-- 3. Find properties with a specific room type ("Deluxe").
-- 4. List properties without 'Year Built' details. 

DESCRIBE property;

ALTER TABLE property
ADD COLUMN property_details JSON;

INSERT INTO property (
    property_id, owner_id, property_name, location, property_type, price_per_night, property_details
)
VALUES
(
    201, 1, 'Coral Reef Resort', 'Goa', 'Hotel', 5000,
    JSON_OBJECT(
        'Year_built', 2018,
        'Room_type', JSON_ARRAY('Standard', 'Deluxe', 'Family suite'),
        'Accessibility', JSON_OBJECT(
            'Wheelchair Accessible', TRUE,
            'Elevator', TRUE
        )
    )
),
(
    202, 2, 'Hilltop Retreat', 'Mussorie', 'Villa', 4000,
    JSON_OBJECT(
        'Room_type', JSON_ARRAY('Single', 'Double', 'Penthouse'),
        'Accessibility', JSON_OBJECT(
            'Wheelchair Accessible', FALSE,
            'Elevator', TRUE
        )
    )
),
(
    203, 3, 'Riverside Lodge', 'Kerala', 'Homestay', 7000,
    JSON_OBJECT(
        'Year_built', 2021,
        'Room_type', JSON_ARRAY('Studio', 'Cottage')
    )
);


-- 1. List all avaliable Room Type for each property.

SELECT 
    property_id,
    property_name,
    JSON_UNQUOTE(JSON_EXTRACT(property_details, '$.Room_type')) AS room_types
FROM property;

-- 2. Retrieve Year Built for properties where the year is available.

SELECT 
    property_id,
    property_name,
    JSON_UNQUOTE(JSON_EXTRACT(property_details, '$.Year_built')) AS year_built
FROM property
WHERE JSON_EXTRACT(property_details, '$.Year_built') IS NOT NULL;

-- 3. Find properties with a specific room type ("Deluxe").

SELECT 
    property_id,
    property_name,
    property_details
FROM property
WHERE JSON_CONTAINS(
    JSON_EXTRACT(property_details, '$.Room_type'),
    JSON_QUOTE('Deluxe')
);

-- 4. List properties without 'Year Built' details. 

SELECT 
    property_id,
    property_name,
    property_details
FROM property
WHERE JSON_EXTRACT(property_details, '$.Year_built') IS NULL;



