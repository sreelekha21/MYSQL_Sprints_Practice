# Exercise 3 : Assign Permissions and Roles to Manage Database Access

-- As a database administrator, you want to ensure secure access to the system.

-- 1. Create a new role data_analyst with SELECT permissions on all tables.
CREATE ROLE data_analyst;
GRANT SELECT ON accommodation.* TO data_analyst;


-- 2. Assign the role to a user named analyst_user.
CREATE USER 'analyst_user'@'localhost' IDENTIFIED BY 'securepassword';
GRANT data_analyst TO 'analyst_user'@'localhost';
SET DEFAULT ROLE data_analyst TO 'analyst_user'@'localhost';

-- 3. Revoke DELETE permissions from analyst_user.alter
REVOKE DELETE ON accommodation.* FROM 'analyst_user'@'localhost';

-- Write the SQL commands to implements this access control.