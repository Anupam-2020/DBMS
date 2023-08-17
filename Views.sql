USE company;

-- VIEW
SELECT * FROM employee;

-- creating a view.
CREATE VIEW employee_view AS SELECT fname, lname, age FROM employee;

-- Viewing a view table. 
SELECT * FROM employee_view;

-- alter the view
ALTER VIEW employee_view AS SELECT fname, lname FROM employee;

-- Dropping a view.
DROP VIEW IF EXISTS employee_view;