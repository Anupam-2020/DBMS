-- DATABASE USED IS company. 
-- TABLES used are project, employee, client.
USE company;

-- SUB QUERIES
-- WHERE Clause with same table.
-- employees with age > 30
SELECT * FROM employee WHERE age IN (SELECT age FROM employee WHERE age > 30);

-- WHERE Clause with different table.
-- employee details working in more than 1 project. 
SELECT * FROM employee WHERE id IN (SELECT empID FROM project GROUP BY empID HAVING COUNT(empID) > 1);

-- single value subquery.
-- emp details having age > avg(age)
SELECT * FROM employee WHERE age > (SELECT AVG(age) FROM employee);
-- SELECT AVG(age) FROM employee; 

-- FROM Clause - derived table
-- select max age person whose first name has 'a'.
SELECT MAX(age) FROM (SELECT * FROM employee WHERE fname LIKE '%a%') as temp;

-- Co-related sub-queries
-- Get the 3rd oldest employee.
SELECT * FROM employee AS e1 WHERE 3 = (SELECT COUNT(e2.age) FROM employee AS e2 WHERE e1.age >= e2.age);
