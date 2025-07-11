-- Exercise 4 : Add JSON Document 

-- Design and implement a NOSQL collection in MySQL to manage customer support tickets.
-- The collection should track ticket details like customer information,issue type,status,and timestamp,allowing for efficient updates ,resolutions,and queries to ensure timely follow-up and resolution.

-- Task details are given in the next slide.	

--  Exercise 4: Add JSON Document (MongoDB-style in MySQL)
-- Tasks:
-- Create a collection customer_support_ticket in the accommodation database.
CREATE TABLE customer_support_ticket (
    ticket_id INT PRIMARY KEY,
    ticket_data JSON
);


-- Insert the given data as JSON documents into that collection.

INSERT INTO customer_support_ticket (ticket_id, ticket_data) VALUES
(301, JSON_OBJECT(
    'customer_name', 'Rohit Sharma',
    'issue_type', 'Refund',
    'description', 'Refund for canceled booking not processed',
    'status', 'Open',
    'created_at', '2025-01-05T14:30:00Z',
    'resolved_at', NULL
)),
(302, JSON_OBJECT(
    'customer_name', 'Priya Gupta',
    'issue_type', 'Payment',
    'description', 'Payment not reflecting in account',
    'status', 'Resolved',
    'created_at', '2025-01-05T15:45:00Z',
    'resolved_at', '2025-01-06T10:00:00Z'
)),
(303, JSON_OBJECT(
    'customer_name', 'Aman Khan',
    'issue_type', 'Service',
    'description', 'Room not ready at check-in time',
    'status', 'In Progress',
    'created_at', '2025-01-05T16:00:00Z',
    'resolved_at', NULL
)),
(304, JSON_OBJECT(
    'customer_name', 'Neha Desai',
    'issue_type', 'Booking',
    'description', 'Unable to book room through website',
    'status', 'Open',
    'created_at', '2025-01-06T09:00:00Z',
    'resolved_at', NULL
)),
(305, JSON_OBJECT(
    'customer_name', 'Ramesh Kumar',
    'issue_type', 'Refund',
    'description', 'Partial refund issue for group booking',
    'status', 'Resolved',
    'created_at', '2025-01-04T11:30:00Z',
    'resolved_at', '2025-01-05T08:00:00Z'
)),
(306, JSON_OBJECT(
    'customer_name', 'Simran Yadav',
    'issue_type', 'Payment',
    'description', 'Charged twice for the same booking',
    'status', 'Open',
    'created_at', '2025-01-06T14:15:00Z',
    'resolved_at', NULL
));
