# Exercise 3 :  Optimize Performance

# As the accommodation database grows,some operations have started to slow down ,affecting user experience .To optimize the system's performance ,you need to analyze the nature of common queries and decide where to create indexes for efficient data retrieval.

# Operations Observerd:

# 1.Booking Management : Finding upcoming reservations within a specfic date range is taking longer,than expected.

CREATE INDEX idx_booking_check_in_date 
ON booking (check_in_date);

SELECT * FROM booking 
WHERE check_in_date BETWEEN '2025-06-15' AND '2025-06-30';


# 2.Property Search : Users often search for properties in specific cities ,but these seareches are sluggish,especially in metropolitan areas.

CREATE INDEX idx_property_location 
ON property (location);

SELECT * FROM property 
WHERE location = 'Mumbai';

# 3 Review analysis: Filtering reviews based on customer feedback and rating is becoming slower as more reviews as more reviews are added.
CREATE INDEX idx_review_rating 
ON review (rating);

SELECT * FROM review 
WHERE rating = 5;

SELECT * FROM review 
WHERE MATCH(feedback) AGAINST ('clean' IN NATURAL LANGUAGE MODE);


# Task : Write SQL queries to create appopriate indexes that optimize performance.