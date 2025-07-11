-- Exercise 1 :  Managing Transancations

-- A Customer, Ramesh,is  trying to book a property.However,midway through the process,he realizes he selected the wrong dates.

-- The system should allow him to either confirm the booking or roll back changes if he cancels before committing the transacion.

-- Tasks :

-- 1.Start a transaction and insert a new booking for Ramesh into the booking table.

-- Create a SAVEPOINT after inserting the booking.

-- update the booking's check-in and check-out dates.

-- Implement a condition: If Ramesh confirms,COMMIT;if he cancels,ROLLBACK to the SAVEPOINT.

-- Step 1: Start the transaction
START TRANSACTION;

-- Step 2: Insert a new booking for Ramesh and capture the inserted ID
INSERT INTO booking (customer_name, check_in_date, check_out_date, property_id)
VALUES ('Ramesh', '2025-07-10', '2025-07-15', 101);

-- Store the last inserted booking_id for precise reference
SET @last_booking_id = LAST_INSERT_ID();

-- Step 3: Create a SAVEPOINT after the insert
SAVEPOINT after_insert;

-- Step 4: Ramesh changes the dates — update using the captured booking ID
UPDATE booking
SET check_in_date = '2025-08-01',
    check_out_date = '2025-08-05'
WHERE booking_id = @last_booking_id;

-- -----------------------------
-- Manual simulation of decision:
-- If Ramesh confirms the booking:
-- COMMIT;

-- If Ramesh cancels:
-- ROLLBACK TO SAVEPOINT after_insert;
-- COMMIT;  -- commit the original insert only
-- -----------------------------
