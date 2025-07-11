# Exercise 2 : Enforce Data Integrity Using Constraints

 -- The platform's customer regristration form requires strict data validation.You need to ensure the following :
 
 -- Emails must be unique.
 
 describe customer;
 -- ALTER TABLE customer
-- ADD CONSTRAINT unique_email UNIQUE (email);

 -- Phone numbers must have exactly 10 digits.
 
 ALTER TABLE customer
ADD CONSTRAINT check_phone_length CHECK (CHAR_LENGTH(phone_number) = 10);

 -- Customer usernames cannot be left blank.
 ALTER TABLE customer
ADD CONSTRAINT check_username_not_empty CHECK (username <> '');

ALTER TABLE customer
DROP CHECK check_username_not_empty;


 -- Write the SQL command to add these constraints to the customer table.