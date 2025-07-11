# Exercise 4 : Validate Schema Using GenAI

-- You've written the schema for a new table refunds to manage refund requests for	canceled bookings.

-- Use GenAI tools to review the schema and identity potential issues.

-- 1. Write an SQL script create the refund table :

-- refund_id (primary key,INT,Auto-Increment)
-- booking_id  (Foreign key ,INT)
-- refund_amount (DECIMAL(10,2))
-- refund_date (Date)

CREATE TABLE refunds (
    refund_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT,
    refund_amount DECIMAL(10,2),
    refund_date DATE,
    FOREIGN KEY (booking_id) REFERENCES booking(booking_id)
);

-- 2. Analyze the schema using a GenAI tool to check for:
-- Missing Constraints.
-- refund_amount has no validation	        ✅ Add a CHECK constraint to ensure it's non-negative
-- 🔸 refund_date can be NULL	            ✅ If every refund must have a date, use NOT NULL
-- 🔸 booking_id is nullable	            ✅ Add NOT NULL to ensure every refund is linked to a booking
-- 🔸 No UNIQUE constraint on booking_id	✅ Consider making it UNIQUE if each booking can only have one refund

-- Potential redundancy. 
-- No redundancy found in the current schema.

-- Each refund ties to a single booking; this is logically clean.

CREATE TABLE refunds (
    refund_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT NOT NULL UNIQUE,
    refund_amount DECIMAL(10,2) NOT NULL CHECK (refund_amount >= 0),
    refund_date DATE NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES booking(booking_id)
);
