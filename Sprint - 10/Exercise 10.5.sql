-- Exercise 5 : Retrieve JSON Documents 

-- You are tasked with retrieving add managing customer support tickets from the customer_support_ticket collection.

-- Tasks:


-- 1. Retrieve all records from the customer_support_ticket collection.
SELECT * FROM customer_support_ticket;
-- SELECT *
-- FROM customer_support_ticket
-- WHERE JSON_UNQUOTE(ticket_data->'$.status') = 'Open';

-- 2. Filter the records to retrieve tickets that are still open
SELECT *
FROM customer_support_ticket
WHERE JSON_UNQUOTE(ticket_data->'$.status') = 'Open';

-- 3. Sort the filtered records by ticket creation timestamp in ascending order
SELECT *
FROM customer_support_ticket
WHERE JSON_UNQUOTE(ticket_data->'$.status') = 'Open'
ORDER BY JSON_UNQUOTE(ticket_data->'$.created_at') ASC;

-- 4. Retrieve tickets raised by a specific customer (e.g.; Customer Name priya Gupta).
SELECT *
FROM customer_support_ticket
WHERE JSON_UNQUOTE(ticket_data->'$.customer_id') = '101';

-- 5. Filter the records to retrieve tickets related to refund issues.
SELECT *
FROM customer_support_ticket
WHERE JSON_UNQUOTE(ticket_data->'$.issue_type') = 'Refund';

-- 6. Retrieve tickets that were resolved between 2025-01-05 and 2025-01-06.

SELECT *
FROM customer_support_ticket
WHERE JSON_UNQUOTE(ticket_data->'$.resolved_at') BETWEEN '2025-01-05T00:00:00Z' AND '2025-01-06T23:59:59Z';

-- 7. Retrieve the last 2 records, sorted by customer name and filtered by the year 2025.	
SELECT *
FROM customer_support_ticket
WHERE JSON_UNQUOTE(ticket_data->'$.created_at') LIKE '2025%'
ORDER BY JSON_UNQUOTE(ticket_data->'$.customer_name') ASC
LIMIT 2;
	
