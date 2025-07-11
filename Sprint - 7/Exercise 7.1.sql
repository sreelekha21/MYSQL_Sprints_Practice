# Exercise 1 :  Create Schemas Using DDL Commands

# A new accommdation platform feature requires tacking promotions for properties.
# Promotions include details like promotion ID ,promotion title ,discount percentage,start date,and end date. 

# Task : 

# 1.Write the SQL commands to:
# Create a new table promotion with the following structure:

-- promotion_id (Primary Key,INT,Auto-Increment)
-- promotion_title(VARCHAR(100),NOTNULL)
-- discount_percentage(DECIMAL(5,2),CHECK between 0 and 100)
-- start_date(DATE,NOT NULL)
-- end_date(DATE,NOT NULL)

CREATE TABLE PROMOTION(PROMOTION_ID INT  PRIMARY KEY AUTO_INCREMENT,
             PROMOTION_TITLE VARCHAR(100) NOT NULL,
             DISCOUNT_PERCENTAGE DECIMAL(5,2)CHECK (DISCOUNT_PERCENTAGE BETWEEN 0 AND 100),
             START_DATE DATE NOT NULL,
             END_DATE DATE NOT NULL);
                        

-- 2. Add a foregin key property_id (from the property table) to the promotion table.
ALTER TABLE PROMOTION
ADD COLUMN PROPERTY_ID INT;

ALTER TABLE PROMOTION
ADD CONSTRAINT fk_property
FOREIGN KEY (PROPERTY_ID) REFERENCES PROPERTY(PROPERTY_ID);

