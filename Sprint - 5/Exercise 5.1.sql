# Exercise 1 : Insert Records

# Task 1 : Insert a new customer with the following details.

DESCRIBE customer;
INSERT INTO customer (
    Username, first_name, last_name, email, Phone_number, Password_hash, Created_at, Updated_at
) 
VALUES (
    'John_doe', 'John', 'Doe', 'John@example.com', 9876543210, 'pass@123', NOW(), NOW()
);

# Task 2 : Insert two new records for the property table at once using bulk insertion :

# property 1: Ocean View Apartment,Mumbai,India,Apartment,4500,owed by owner with ID 9.
# property 2 : Moutain Cabin,Manali,India,Homestay,3500,owned by owner with ID 5.

describe property;

INSERT INTO property (
    owner_id, property_name, location, property_type, price_per_night
)
VALUES 
    (9, 'Ocean View Apartment', 'Mumbai', 'Apartment', 4500),
    (5, 'Moutain Cabin', 'Manali', 'Homestay', 3500);


# Task 3:  Duplicate all bookings for customer_id =3,applying a 10% discount on total_amount set the new bookings 'status'to'pending'and update created_at and updated_at with the current timestamp.

describe customer;

describe booking;

INSERT INTO booking (
    customer_id,
    property_id,
    check_in_date,
    check_out_date,
    total_amount,
    status,
    created_at,
    updated_at
)
SELECT 
    customer_id,
    property_id,
    check_in_date,
    check_out_date,
    total_amount * 0.9 AS total_amount,  -- 10% discount
    'PENDING' AS status,
    NOW() AS created_at,
    NOW() AS updated_at
FROM booking
WHERE customer_id = 3;


