# Exercise 2 : Automate Data Integrity With Triggers

-- Triggers help maintain data consistency and automate updates acorss related tables.
-- Analyze the requirements and create effective,automated triggers for the following scenarios :

-- Task 1 : Prevent Overbooking - Before adding a new booking,check if the property is avaliable.
-- If the avaliability status is 'unavaliable',prevent the booking form being inserted to maintain data integrity.
DELIMITER $$

CREATE TRIGGER prevent_overbooking
BEFORE INSERT ON booking
FOR EACH ROW
BEGIN
    DECLARE status VARCHAR(20);
    
    -- Check current availability
    SELECT availability_status INTO status
    FROM properties
    WHERE property_id = NEW.property_id;

    -- If unavailable, block booking
    IF status = 'unavailable' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Booking denied: Property is unavailable.';
    END IF;
END $$

DELIMITER ;


-- Task 2 : Update Avaliability on Booking - If the property is avaliable and the booking is added,automatically update its avaliablity status to 'unavaliable'.
DELIMITER $$

CREATE TRIGGER update_availability_after_booking
AFTER INSERT ON booking
FOR EACH ROW
BEGIN
    -- Update property to unavailable
    UPDATE properties
    SET availability_status = 'unavailable'
    WHERE property_id = NEW.property_id;
END $$

DELIMITER ;


-- Task 3: Log Property Price Changes - Track price updates by storing relevant details of each chnage.
-- First,create a price log table to capture key information,such as the property id ,its previous price ,the updated price ,and the timestamp of the change.
-- Then,set up a trigger to log price modifications automatically.Each log should have a unique identifier.
CREATE TABLE property_price_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    property_id INT,
    old_price DECIMAL(10,2),
    new_price DECIMAL(10,2),
    change_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$

CREATE TRIGGER log_price_change
BEFORE UPDATE ON properties
FOR EACH ROW
BEGIN
    -- Log only when price is changed
    IF OLD.price <> NEW.price THEN
        INSERT INTO property_price_log (property_id, old_price, new_price)
        VALUES (OLD.property_id, OLD.price, NEW.price);
    END IF;
END $$

DELIMITER ;


-- NOTE:Along with the trigger,submit an INSERT/UPDATE query to test its execution.