CREATE DATABASE temp;
SHOW DATABASES;
USE temp;

CREATE TABLE accounts (
	id INT PRIMARY KEY,
    name VARCHAR(255) UNIQUE,
    balance INT NOT NULL DEFAULT 1001,
    CONSTRAINT acc_balance_chk CHECK(balance > 1000)
);

INSERT INTO accounts(id, name, balance)
	VALUES (1, 'A', 10000);

INSERT INTO accounts(id, name, balance)
	VALUES (2, 'B', 22000);


INSERT INTO accounts(id, name) VALUES (3, 'C');

-- ADD new column to existing table
ALTER TABLE accounts ADD interest FLOAT NOT NULL DEFAULT 0;

-- MODIFY
ALTER TABLE accounts MODIFY interest DOUBLE NOT NULL DEFAULT 0;

-- CHANGE COLUMN - RENAME THE COLUMN
ALTER TABLE accounts CHANGE COLUMN interest saving_interest FLOAT NOT NULL DEFAULT 0;

-- DROP COLUMN
ALTER TABLE accounts DROP COLUMN saving_interest;

-- RENAME THE TABLE
ALTER TABLE accounts RENAME TO account_details;

-- describe attributes of table
DESC account_details;

SELECT * FROM account_details;

-- DROP TABLE accounts; 