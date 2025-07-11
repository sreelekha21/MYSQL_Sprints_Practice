# Exercise 3 : Automate Tasks With Scheduled Events

-- Scheduled events help automate recurring database operations without manual intervention.
-- Analyze the requirements and create efficient scheduled events for the following scenarios:

-- Task 1: Daily Booking Summary Report 
-- Generate a daily report summarizing total bookings,total revenue,and the number of unique properties booked each day .
-- First,create a table to store this report ,ensuring it includes a column for the report date.
-- Then,set up an event to insert data into it automaticallly.

CREATE TABLE daily_booking_summary (
    report_date DATE,
    total_bookings INT,
    total_revenue DECIMAL(12,2),
    unique_properties_booked INT
);

DELIMITER $$

CREATE EVENT IF NOT EXISTS generate_daily_booking_summary
ON SCHEDULE EVERY 1 MINUTE -- Change to EVERY 1 DAY for production
DO
BEGIN
    INSERT INTO daily_booking_summary (report_date, total_bookings, total_revenue, unique_properties_booked)
    SELECT 
        CURDATE(),
        COUNT(*) AS total_bookings,
        IFNULL(SUM(amount_paid), 0) AS total_revenue,
        COUNT(DISTINCT property_id) AS unique_properties_booked
    FROM booking
    WHERE DATE(booking_date) = CURDATE(); -- Optional filter by today only
END $$

DELIMITER ;



-- Task 2: Inactive Property Cleanup : Periodically check for properties with no bookings in the last 6 months and mark their avaliablilty status as inactive to keep data relevant.
DELIMITER $$

CREATE EVENT IF NOT EXISTS cleanup_inactive_properties
ON SCHEDULE EVERY 1 MINUTE -- Change to EVERY 1 MONTH for production
DO
BEGIN
    UPDATE properties
    SET availability_status = 'inactive'
    WHERE property_id NOT IN (
        SELECT DISTINCT property_id
        FROM bookings
        WHERE booking_date >= DATE_SUB(NOW(), INTERVAL 6 MONTH)
    );
END $$

DELIMITER ;



-- Note : For testing,modify both evets to run every mintue.After execution,verify the affected tables for expected updates.