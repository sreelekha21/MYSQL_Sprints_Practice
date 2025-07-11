
# Exercise  1 : Understand Foreign Keys 

# The manager of an accommodation management system wnats to understand how bookoings are linked to customers and properties in the database.

# Tasks : 

# Task1 : 1. Write a query to list all column from the booking table along with the corresponding customer_id and property_id 

SELECT booking.*, customer.customer_id, property.property_id
FROM booking
INNER JOIN customer ON booking.customer_id = customer.customer_id
INNER JOIN property ON booking.property_id = property.property_id;

 # Task2 : Explain the relationship between the booking table and the customer and property tables.
 
-- Database: accommodation
-- The database contains three main tables:

-- Booking

-- Customer

-- Property

-- 1. Booking Table
-- This table records each booking made by a customer.

-- Primary Key: Usually something like booking_id (not property_id as mentioned; property_id is a foreign key).

-- Foreign Keys:

-- customer_id: References the Customer table.

-- property_id: References the Property table.

-- These foreign keys establish relationships between bookings, customers, and properties.

-- 2. Customer Table
-- Stores details of customers.

-- Primary Key: customer_id.

-- 3. Property Table
-- Stores information about properties available for booking.

-- Primary Key: property_id.

-- Relationships Summary
-- Each booking is linked to one customer via customer_id.

-- Each booking is linked to one property via property_id.

-- This setup enforces referential integrity and allows joining the tables for analysis and reporting.