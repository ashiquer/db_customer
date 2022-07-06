-- 01 Create a database named class_one_assignment
CREATE DATABASE class_one_assignment;

-- use DB 
USE class_one_assignment;

-- deleting a database
DROP DATABASE class_one_assignment ;

-- 02 create a table named customers
CREATE TABLE customers (
  id INT AUTO_INCREMENT,
  First_Name VARCHAR (20) NOT NULL,
  last_name VARCHAR (20) NOT NULL,
  Date_of_Birth DATE NOT NULL,
  Phone VARCHAR (10) NOT NULL,
  Address VARCHAR (250) NOT NULL,
  City VARCHAR (10) NOT NULL,
  State VARCHAR (10) NOT NULL,
  Points INT NOT NULL,
  PRIMARY KEY (id)
);

-- 03  insert the following customer data into table
INSERT INTO customers (First_Name, last_name, Date_of_Birth, Phone, Address, City, State, Points) VALUES
    ('Babara','MacCaffrey','1986-03-28','781-932-9754','0 Sage Terrace','Waltham','MA','2273'),
    ('Ines','Brushfield','1986-04-13','804-427-9456','14187 Commercial Trail','Hampton','VA','947'),
    ('Freddi','Boagey','1985-02-07','719-724-7869','251 Springs Junction','Colorado Springs','CO','2967'),
    ('Ambur','Roseburgh','1974-04-14','407-231-8017','30 Arapahoe Terrace','Orlando','FL','457'),
    ('Clemmie','Betchley','1973-11-07','','5 Spohn Circle','Arlington','TX','3675')
    ;
    
 -- show customer table
SELECT * FROM customers

-- 04 Show only 2 members whose points are more than 1000
SELECT * FROM customers WHERE Points > 1000 LIMIT 2;

-- 05 Find the customers whose age is in 1980 to 1990 or points less than 1000
SELECT * FROM customers WHERE Date_of_Birth BETWEEN '1980-01-01' AND '1990-12-31' OR Points < 1000;

-- 06 Order the customers by points in ascending and descending order
SELECT * FROM Customers ORDER BY Points ASC;
SELECT * FROM customers ORDER BY Points DESC;

-- 07 Find the customer whose name contains 'burgh' using like and regexp

SELECT * FROM Customers WHERE Last_Name LIKE '%burgh';
SELECT * FROM Customers WHERE Last_Name REGEXP 'burgh';

-- 08 Find the customer who does not have phone number
SELECT * FROM customers WHERE Phone = ' ';

-- 09 Change the 'Date of Birth' column name into 'dob'
ALTER TABLE customers CHANGE Date_of_Birth dob DATE;

-- 10 Find the max point holder customer
SELECT MAX(Points), First_Name, Last_Name FROM Customers;

-- 11. Execute a query for the following scenario
-- If customers have points less than 1000, they are bronze member
-- If customers have points more than 1000 and less than 2000, they are silver member
-- If customers have points more than 2000 and less than 3000, they are gold member
-- If customers have points more than 3000, they are platinum member
SELECT  First_Name, Last_Name, Points,
CASE
	WHEN Points<1000 THEN 'they are bronze member.'
	WHEN Points>1000 && Points<2000 THEN 'they are silver member.'
	WHEN Points>2000 && Points<3000 THEN 'they are gold member.'
	ELSE 'they are platinum member.'
	END AS Points FROM Customers;