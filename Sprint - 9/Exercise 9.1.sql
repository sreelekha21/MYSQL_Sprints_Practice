# Exercies 1 :  Automate Repetitive Tasks 

-- Stored procedures streamline property management by automaking key tasks.

-- Analyze the requirements and create efficient,reusable stored procedures with error handling for the following:

-- Task 1: Revenue & Booking Insights -  Retrieve total revenue and booking count for a property within a given timeframe.Handle cases where no booking exists.

DELIMITER $$

CREATE PROCEDURE GetRevenueAndBookingCount (
    IN in_property_id INT,
    IN in_start_date DATE,
    IN in_end_date DATE
)
BEGIN
    DECLARE totalRevenue DECIMAL(10,2) DEFAULT 0;
    DECLARE bookingCount INT DEFAULT 0;

    -- Error handling for date input
    IF in_start_date > in_end_date THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Start date must be before end date.';
    END IF;

    -- Retrieve revenue and booking count into variables
    SELECT 
        IFNULL(SUM(amount_paid), 0),
        COUNT(*)
    INTO totalRevenue, bookingCount
    FROM bookings
    WHERE property_id = in_property_id
      AND booking_date BETWEEN in_start_date AND in_end_date;

    -- Return results
    SELECT totalRevenue AS revenue, bookingCount AS bookings;
END $$

DELIMITER ;


-- Task 2 : Customer Booking History - Fetch a customer's past bookings,including property deatils,dates and total amount paid.Ensure valid customer IDs.

DELIMITER $$

CREATE PROCEDURE GetCustomerBookingHistory (
    IN in_customer_id INT
)
BEGIN
    -- Check if customer exists
    IF NOT EXISTS (SELECT 1 FROM customers WHERE customer_id = in_customer_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid customer ID.';
    END IF;

    -- Retrieve booking history
    SELECT 
        b.booking_id,
        p.name AS property_name,
        p.location,
        b.booking_date,
        b.amount_paid
    FROM bookings b
    JOIN properties p ON b.property_id = p.property_id
    WHERE b.customer_id = in_customer_id
    ORDER BY b.booking_date DESC;
END $$

DELIMITER ;

-- Task 3: Top-Rated Properties - Identify proeprties with high ratings,allowing filters by location or property type.Handle cases where no matching properties exist.
DELIMITER $$

CREATE PROCEDURE GetTopRatedProperties (
    IN in_location VARCHAR(100),
    IN in_type VARCHAR(50)
)
BEGIN
    -- Retrieve top-rated properties based on optional filters
    SELECT 
        property_id,
        name,
        location,
        type,
        rating
    FROM properties
    WHERE (in_location IS NULL OR location = in_location)
      AND (in_type IS NULL OR type = in_type)
      AND rating >= 4.5
    ORDER BY rating DESC;

    -- Check if any results returned
    IF ROW_COUNT() = 0 THEN
        SIGNAL SQLSTATE '02000'
        SET MESSAGE_TEXT = 'No matching top-rated properties found.';
    END IF;
END $$

DELIMITER ;


-- NOte 
-- 1. Implement error handling to manage invalid inputs,inputs,missing data,or transaction failures.
-- 2. Along with the stored procedure,submit the query that calls it with sample inputs and retrieves the results.