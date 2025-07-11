-- Exercise 3 : Temporary Tables and Views

-- The management wants to analyze property performance by creating a report showing total bookings and revenue per property.
-- However, this should be done without altering the existing database struture.

-- Tasks:

-- 1. Create a temporary table to store property-wise booking summary.
-- 2. Use a view to display total bookings and revenue for each property.
-- 3. Query the view to generate a report.

-- Existing tables
CREATE TABLE property (
    property_id INT PRIMARY KEY,
    property_name VARCHAR(100),
    nightly_rate DECIMAL(10,2)
);

CREATE TABLE booking (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100),
    check_in_date DATE,
    check_out_date DATE,
    property_id INT
);


CREATE TEMPORARY TABLE temp_property_summary (
    property_id INT,
    total_bookings INT,
    total_revenue DECIMAL(12,2)
);


INSERT INTO temp_property_summary (property_id, total_bookings, total_revenue)
SELECT 
    p.property_id,
    COUNT(b.booking_id) AS total_bookings,
    SUM(DATEDIFF(b.check_out_date, b.check_in_date) * p.nightly_rate) AS total_revenue
FROM 
    property p
JOIN 
    booking b ON p.property_id = b.property_id
GROUP BY 
    p.property_id;


CREATE OR REPLACE VIEW property_performance_view AS
SELECT 
    p.property_id,
    p.property_name,
    t.total_bookings,
    t.total_revenue
FROM 
    property p
JOIN 
    temp_property_summary t ON p.property_id = t.property_id;


SELECT * FROM property_performance_view;
