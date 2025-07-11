-- Exercise 2 : Locking Mechanisms for Concurrent Operations

-- Two customers are trying to book the same property at the same time.
-- The system should ensure that only one booking gets confirmed while the other waits.

-- Tasks:

-- Use the SELECT...FOR UPDATE statement to lock a property's avaliability.
-- Simulate two transactions trying to book the same property.
-- Release the lock once the booking is confirmed.

CREATE TABLE property (
    property_id INT PRIMARY KEY,
    property_name VARCHAR(100),
    is_available BOOLEAN
);

CREATE TABLE booking (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100),
    check_in_date DATE,
    check_out_date DATE,
    property_id INT
);

-- Session 1: Ramesh starts booking
START TRANSACTION;

-- Locks property_id = 101 for update
SELECT * FROM property
WHERE property_id = 101 AND is_available = TRUE
FOR UPDATE;

-- Simulate user input delay (application side)

-- Proceed with booking
INSERT INTO booking (customer_name, check_in_date, check_out_date, property_id)
VALUES ('Ramesh', '2025-07-15', '2025-07-20', 101);

-- Update property status
UPDATE property SET is_available = FALSE
WHERE property_id = 101;

-- Commit — releases the lock
COMMIT;

-- Session 2: Suresh attempts to book the same property
START TRANSACTION;

-- This SELECT will wait until Transaction A commits
SELECT * FROM property
WHERE property_id = 101 AND is_available = TRUE
FOR UPDATE;

-- No row will be returned if property is no longer available
-- So, check if result exists before proceeding (application logic required)

-- IF property is no longer available:
ROLLBACK;  -- Or notify user "Booking failed, property already booked."
