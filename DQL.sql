CREATE DATABASE org;
SHOW DATABASES;
USE org;

CREATE TABLE Worker (
	worker_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	first_name CHAR(25),
    last_name CHAR(25),
    salary INT(15),
    joining_date DATETIME,
    department CHAR(25)
);

INSERT INTO Worker
	(worker_id, first_name, last_name, salary, joining_date, department) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
        (002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
        (003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
        (004, 'Amitabh', 'Singh', 500000, '14-06-11 08.00.30', 'Admin'),
        (005, 'Vivek', 'Bharti', 500000, '14-06-20 09.00.00', 'Admin'),
        (006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
        (007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
        (008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin'
	);

SELECT * FROM Worker;

CREATE TABLE Bonus (
	worker_ref_id INT,
    bonus_amount INT(10),
    bonus_date DATETIME,
    FOREIGN KEY (worker_ref_id)
		REFERENCES Worker(worker_id)
        ON DELETE CASCADE
);

INSERT INTO Bonus
	(worker_ref_id, bonus_amount, bonus_date) VALUES
    (001, 5000, '16-02-20 09.09.00'),
    (002, 3000, '16-06-11'),
    (003, 4000, '16-02-20'),
    (001, 4500, '16-02-20'),
    (002, 3500, '16-06-11');

SELECT * FROM Bonus;

CREATE TABLE Title (
	worker_ref_id INT,
    worker_title char(25),
    affected_from DATETIME,
    FOREIGN KEY (worker_ref_id)
		REFERENCES Worker(worker_id)
        ON DELETE CASCADE
);

INSERT INTO Title
	(worker_ref_id, worker_title, affected_from) VALUES
    (001, 'Manager', '2016-02-20 00:00:00'),
    (002, 'Executive', '2016-06-11 00:00:00'),
    (008, 'Executive', '2016-06-11 00:00:00'),
    (005, 'Manager', '2016-06-11 00:00:00'),
    (004, 'Asst. Manager', '16-06-11 00:00:00'),
    (007, 'Executive', '2016-06-11 00:00:00'),
    (006, 'Lead','2016-06-11'),
    (003, 'Lead', '2016-06-11 00:00:00');
    
SELECT * FROM Title;

SELECT * FROM Worker;
-- DQL(Data Query Language) -> 
SELECT * FROM Worker WHERE Salary > 100000;

SELECT * FROM Worker WHERE department = 'HR';

SELECT * FROM worker WHERE salary BETWEEN 80000 AND 300000;

SELECT * FROM worker WHERE department = 'HR' OR department = 'admin';

SELECT * FROM worker WHERE department IN ('HR', 'Admin');

SELECT * FROM worker WHERE department NOT IN ('hr', 'admin');

INSERT INTO worker(first_name, last_name, salary, joining_date, department) VALUES
	('Anupam', NULL, 100000, '2020-09-10 09:09:09', NULL);

SELECT * FROM worker;

SELECT first_name FROM worker WHERE last_name IS NULL;

-- wild cards
SELECT * FROM worker WHERE first_name LIKE '%a%'; -- Returns all names which contain `a`.

SELECT * FROM worker WHERE first_name LIKE '_a%'; -- Returns all names whose 2nd character is `a`. 

SELECT * FROM worker ORDER BY salary DESC;

-- distinct keyword.
SELECT DISTINCT department FROM worker;

-- data grouping.
-- aggregation function -> COUNT, SUM, AVG, MIN, MAX...

-- GROUP BY
SELECT department, COUNT(DEPartment) AS count FROM worker GROUP BY department;

SELECT department, AVG(Salary) AS average FROM worker GROUP BY department;

SELECT department, MIN(Salary) FROM worker GROUP BY department;

SELECT department, MAX(Salary) FROM worker GROUP BY department;

SELECT department, SUM(salary) FROM worker GROUP BY department;

-- GROUP BY HAVING... 
SELECT department, COUNT(department) FROM worker GROUP BY department HAVING COUNT(department) > 3;
