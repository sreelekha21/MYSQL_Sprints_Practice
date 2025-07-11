-- Exercise : Inset JSON Data

-- There are three properties that need to be added in the property table with given data.

-- Task:

-- Insert the data given below in the property table

INSERT INTO property (
    property_id, owner_id, property_name, location, price_per_night, property_details
)
VALUES
(
    101, 1, 'Coral Reef Resort', 'Goa', 5000,
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
    102, 2, 'Hilltop Retreat', 'Mussorie', 4000,
    JSON_OBJECT(
        'Room_type', JSON_ARRAY('Single', 'Double', 'Penthouse'),
        'Accessibility', JSON_OBJECT(
            'Wheelchair Accessible', FALSE,
            'Elevator', TRUE
        )
    )
),
(
    103, 3, 'Riverside Lodge', 'Kerala', 7000,
    JSON_OBJECT(
        'Year_built', 2021,
        'Room_type', JSON_ARRAY('Studio', 'Cottage')
    )
);
