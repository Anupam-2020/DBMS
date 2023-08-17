SHOW DATABASES;
USE TEMP;
CREATE TABLE Customer(
	id INT PRIMARY KEY,
    cname VARCHAR(225),
    Address VARCHAR(225),
    Gender CHAR(2),
    City VARCHAR(225),
    Pincode INTEGER
);

INSERT INTO Customer 
	VALUES (1251, 'Ram Kumar', 'Dilbagh Nagar', 'M', 'Jalandhar', 144002),
		   (1300, 'Shyam Singh', 'Ludhiana H.O', 'M', 'Jalandhar', 141001),
           (245, 'Neelabh Shukla', 'Ashok Nagar', 'M', 'Jalandhar', 144003),
           (210, 'Barkha Singh', 'Dilbagh Nagar', 'F', 'Jalandhar', 144002),
           (500, 'Rohan Arora', 'Ludhiana H.O','M', 'Ludhiana', 141001);

INSERT INTO Customer (id, cname) VALUES (1221, 'Anupam');

-- UPDATE
UPDATE Customer SET Address = 'Mumbai', Gender = 'M' WHERE id = 1221;

-- UPDATE MULTIPLE ROWS
-- When we update multiple rows at once, mySQL considers it as unauthorised access. To prevent it we use below command.
SET SQL_SAFE_UPDATES = 1;  -- <=This need to be 0... Currnetly it's 1.
UPDATE Customer SET Pincode = 800001;

UPDATE Customer SET Pincode = Pincode + 1;

-- DELETE
DELETE FROM Customer WHERE id = 1221;

DELETE FROM Customer; -- deletes all entries from Customer table... 

SELECT * FROM customer;

-- REPLACE
REPLACE INTO Customer(id, city)
VALUES (1251, 'Colony');

REPLACE INTO customer(id,cname, city)
VALUES (1333, 'Anupam', 'Patna');

REPLACE INTO customer SET id = 1300, cname = 'Mac', city = 'Bhagalpur';

REPLACE INTO customer (id, cname, city)
SELECT id, cname, city
FROM customer WHERE id = 500;

CREATE TABLE Order_details (
	Order_id INTEGER PRIMARY KEY, 
    Delivery_date DATE,
    cust_id INT,
    -- FOREIGN KEY(cust_id) REFERENCES Customer(id) ON DELETE CASCADE -- ON DELETE CASCADE erases data of attribute present in child relation as well.
    FOREIGN KEY(cust_id) REFERENCES Customer(id) ON DELETE SET NULL -- ON DELETE SET NULL will not delete the data of parent attribute in child but will set to null.
);

INSERT INTO Order_details VALUES
	(1, '2019-03-11', 245);

SELECT * FROM Order_details;

-- ON DELETE CASCADE / ON DELETE SET NULL
INSERT INTO customer VALUES (1, 'Ram Kumar Sharma', 'Dilbagh Nagar','M', 'Patna', NULL);
INSERT INTO order_details (Order_id, Delivery_date, cust_id) 
	VALUES (2, '2023-03-11',1);

INSERT INTO order_details
VALUES (3, '2023-03-12',1);

DELETE FROM customer WHERE id = 1;


DROP TABLE Order_details;