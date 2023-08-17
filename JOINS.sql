CREATE DATABASE company;

USE company;

CREATE TABLE employee (
	id INT PRIMARY KEY,
    fname VARCHAR(30),
    lname VARCHAR(30),
    age INT,
    email CHAR(50),
    phoneNo INT,
    city VARCHAR(50)
);

INSERT INTO employee (id, fname, lname, age, email, phoneNo, city)
VALUES (1, 'Aman', 'Proto',22,'aman@gmail.com',898, 'Delhi'),
	   (2, 'Yagya','Narayan', 44, 'yagya@gmail.com', 222, 'Palam'),
       (3, 'Rahul', 'BD', 22, 'rahul@gmail.com',444, 'Kolkata'),
       (4, 'Jatin','Harmit',31, 'jatin@gmail.com',666, 'Raipur'),
       (5, 'PK','Pandey',21, 'pk@gmail.com',555, 'Jaipur');
       
SELECT * FROM employee;

CREATE TABLE Client(
	id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    email VARCHAR(50),
    phoneNo INT,
    city VARCHAR(50),
    empID Int,
    FOREIGN KEY(empID) REFERENCES employee(id) ON DELETE CASCADE
);

INSERT INTO Client(id, first_name, last_name, age, email, phoneNo, city, empID)
VALUES (1, 'Mac', 'Rogers', 47, 'mac@hotmail.com', 333, 'Kolkata', 3);

INSERT INTO Client
VALUES (2, 'Max','Poirier', 27, 'max@gmail.com', 222, 'Kolkata', 3),
	   (3, 'Peter','Jain', 24, 'peter@abc.com',111, 'Delhi', 1),
       (4, 'Sushant', 'Aggarwal', 23, 'shushant@yahoo.com', 45454, 'Hyderabad', 5),
       (5, 'Pratap', 'Singh', 36, 'p@xyz.com',77767, 'Mumbai', 2);
       
SELECT * FROM Client;

CREATE TABLE Project(
	id INT PRIMARY KEY,
    empID INT,
    name VARCHAR(50),
    start_date DATE,
    clientID INT,
    FOREIGN KEY(empID) REFERENCES employee(id) ON DELETE CASCADE,
    FOREIGN KEY(clientID) REFERENCES Client(id) ON DELETE CASCADE
);

INSERT INTO Project(id, empID, name, start_date, clientID)
VALUES (1, 1, 'A', '2021-04-21', 3),
	   (2, 2, 'B', '2021-03-12', 1),
       (3, 3, 'C','2021-01-16', 5),
       (4, 3, 'D', '2021-04-27', 2),
       (5, 5, 'E', '2021-05-01', 4);

SELECT * FROM Project;

-- INNER JOIN
-- Enlist all the employees ID's, names along with the project allocated to them.
SELECT e.fname, e.lname, e.city, p.id, p.name FROM employee AS e INNER JOIN project AS p ON e.id = p.empID;

-- Fetch out all the employee ID's and their contact details who have been working 
-- from Jaipur with the clients name working in Hyderabad.
SELECT e.id, e.fname, e.email, e.city, c.first_name, c.age, c.email, c.city FROM employee AS e 
INNER JOIN client AS c ON e.id = c.empID WHERE e.city = 'Jaipur' AND c.city = 'Hyderabad';

-- LEFT JOIN
-- Fetch out each project allocated to each employee. 
SELECT * FROM employee AS e LEFT JOIN project AS p ON p.empID = e.id;

-- RIGHT JOIN
-- List out all the projects along with the employee's name and their respective allocated email ID.
SELECT p.id, p.name, e.fname, e.lname, e.email FROM employee AS e RIGHT JOIN project AS p ON e.id = p.empID;

-- CROSS JOIN
-- List out all the possible combinations for the employee's name and projects that can exist.
SELECT e.fname, e.lname, p.id, p.name FROM employee AS e CROSS JOIN project AS p;

-- Using joins without using JOIN Keyword.(For INNER JOIN)
SELECT * FROM employee, client WHERE employee.id = client.empID;