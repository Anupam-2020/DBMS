CREATE DATABASE department;
USE department;

CREATE TABLE dept1 (
	empID INT PRIMARY KEY,
    name VARCHAR(255),
    role VARCHAR(255) 
);

-- DROP TABLE dept1; 

INSERT INTO dept1 
VALUES (1, 'A', 'engineer'),
	   (2, 'B', 'salesman'),
       (3, 'C', 'manager'),
       (4, 'D', 'salesman'),
       (5, 'E', 'engineer');
       
SELECT * FROM dept1;

CREATE TABLE dept2 (
	empID INT PRIMARY KEY,
    name VARCHAR(255),
    role VARCHAR(255)
);

-- DROP TABLE dept2;

INSERT INTO dept2 
VALUES (3, 'C', 'manager'),
	   (6, 'F', 'marketing'),
       (7, 'G','salesman');
       
SELECT * FROM dept2;

-- SET OPERATIONS

-- List out all the employees in the company.
SELECT * FROM dept1 
UNION 
SELECT * FROM dept2;

-- List out all the employees in all departments who work as salesman.
SELECT * FROM dept1 WHERE role = 'salesman' 
UNION 
SELECT * FROM dept2 WHERE role = 'salesman';

-- List out all the employees who work in all departments. (Intersection using INNER JOIN)
SELECT dept1.*, dept2.* FROM dept1 INNER JOIN dept2 USING(empID);

-- List out all the employees who work in dept1 and not in dept2. (Minus using LEFT JOIN)
SELECT dept1.*, dept2.* FROM dept1 
LEFT JOIN dept2 
ON dept1.empID = dept2.empID 
WHERE dept2.empID IS NULL;

-- DROP DATABASE derpartment;