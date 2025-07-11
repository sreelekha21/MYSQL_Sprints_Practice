 # Exercise 5 : Using Date Functions
 
 #The Platform tracks when properties were added. you need to display the properties added today.
 
 #Task : Write a query to retrieve the property_name and  created_ at for properties added today.
 
 show databases;
 
 use accommodation;

SELECT property_name, created_at
FROM property
WHERE DATE(created_at) = CURDATE();