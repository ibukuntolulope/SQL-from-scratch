/*LESSON 1*/

Create DATABASE myDB;
Use myDB;
Drop DATABASE myDB;
ALTER DATABASE myDB READ ONLY = 1; /*To set on read only mode*/
ALTER DATABASE myDB READ ONLY = 0; /*To reove from read only mode*/


/*Project Starting*/
CREATE TABLE employees (
   employee_id INT,
   first_name VARCHAR(50),
   last_name VARCHAR(50),
   hourly_pay DECIMAL(5, 2),
   hire_date DATE
   );

/*To Select a table*/
SELECT * FROM employees;

/*To Rename a Table*/
RENAME TABLE workers TO employees;

/*To Alter a Table*/
ALTER TABLE employees
ADD phone_number VARCHAR(15);
SELECT * FROM employees;

/*To Alter a Coulmn in Table*/
ALTER TABLE employees
RENAME COLUMN phone_number TO email;

/*To Alter variable type in Coulmn on Table*/
ALTER TABLE employees
MODIFY COLUMN email VARCHAR(100);

/*To change position of column in a table*/
ALTER TABLE employees
MODIFY email VARCHAR(100)
AFTER last_name;

/*To change position of column in a table to be first*/
ALTER TABLE employees
MODIFY email VARCHAR(100)
FIRST;

/*To Drop column in a table*/
ALTER TABLE employees
DROP COLUMN email;

SELECT * FROM employees;


/*LESSON 2*/

/*To insert Row into table*/
INSERT INTO employees
VALUES (1, "Eugene", "Krabs", 25.50, "2023-01-02");

/*To insert many Rows into table at a time*/
INSERT INTO employees
VALUES (2, "Squidward", "Tantacles", 15.00, "2023-01-03"), 
	   (3, "Spongebob", "Squarepants", 12.50, "2023-01-04" ), 
       (4, "Patrick", "Star", 12.50, "2023-01-05"), 
       (5, "Sandy", "Cheeks", 17.25, "2023-01-06");
       
/*Inserting Values into Row in table, where all column not complete, just identify the columns*/
INSERT INTO employees (employee_id, first_name, last_name)
VALUES (6, "Sheldon", "Plankton");

SELECT * FROM employees;


/*LESSON 3*/

/*How to Select Data from Table*/
SELECT * FROM employees; /*This gives all data in a table*/

/*To select Specific date*/
SELECT first_name, last_name
FROM employees;

/*To change output order*/
SELECT last_name, first_name 
FROM employees;

/*Using WHERE- Specific result*/
SELECT *
FROM employees
WHERE employee_id = 1;

SELECT *
FROM employees
WHERE first_name = "Spongebob";

SELECT *
FROM employees
WHERE hourly_pay >= 15;

SELECT *
FROM employees
WHERE hire_date <= "2023-01-03";

/*13/05/2024*/

SELECT *
FROM employees
WHERE employee_id != 1;

SELECT *
FROM employees
WHERE hire_date IS NULL;

SELECT *
FROM employees
WHERE hire_date IS NOT NULL;


/*LESSON 4*/
/*To update data in a table*/

UPDATE employees
SET hourly_pay = 10.25,
    hire_date = "2023-01-07"
WHERE employee_id = 6;
  
UPDATE employees
SET hire_date = NULL
WHERE employee_id = 6; /* To update entire row in a table, you need to remove the where clause*/
  
SELECT * FROM employees;

/*To delete Row from Table, make sure you add the where clause*/
DELETE FROM employee
WHERE employee_id = 6;

SELECT * FROM employees;


/*LESSON 5*/
/*AUTOCOMMIT, COMMIT, ROLLBACK*/
SET AUTOCOMMIT = OFF; /*Means will have to manually save our work*/
ROLLBACK; /*This is used to Undo an action*/
COMMIT; /*Manually Saving changes on work*/


/*LESSON 6*/
/*CURRENT_DATE() & CURRENT_TIME()*/
CREATE TABLE test(
       my_date DATE,
       my_time TIME,
       my_datetime DATETIME
);       

INSERT INTO test
VALUES (CURRENT_DATE(), CURRENT_TIME(), NOW());

INSERT INTO test
VALUES (CURRENT_DATE() +1, NULL, NULL);

INSERT INTO test
VALUES (CURRENT_DATE() -1, NULL, NULL);
SELECT * FROM test;

DROP TABLE test;


/*LESSON 7*/
/*UNIQUE Constriant ensures that all values in a column are all different. Can add constraint once we create a table or after*/
CREATE TABLE products (
       product_id INT,
       product_name VARCHAR(25) UNIQUE,
       price DECIMAL (4,2)
); /*Add UNIQUE constraint when the table was create*/

/*Add UNIQUE constraint after table has been create*/
ALTER TABLE products
ADD CONSTRAINT
UNiQUE (product_name);

SELECT * FROM products;

INSERT INTO products
VALUES (100, "hamburger", 3.99),
	   (101, "fries", 1.89),
       (102, "soda", 1.00),
       (103, "ice cream", 1.49);
       
SELECT * FROM products;


/*LESSON 8*/
/*NOT NULL constriant*/
CREATE TABLE products (
       product_id INT,
       product_name VARCHAR(25) UNIQUE,
       price DECIMAL (4,2) NOT NULL /*For products I dont want to have the NULL value in when creating a new table*/
);       

/*To add 'NOT NULL' to an existing table*/
ALTER TABLE products
MODIFY price DECIMAL (4,2) NOT NULL;

INSERT INTO products
VALUES (104, "cookie", NULL);

INSERT INTO products
VALUES (104, "cookie", 0);

SELECT * FROM products;


/*LESSON 9*/
/*CHECK constriant is used to limit values in a column*/
SELECT * FROM employees;

CREATE TABLE employees (
   employee_id INT,
   first_name VARCHAR(50),
   last_name VARCHAR(50),
   hourly_pay DECIMAL(5, 2),
   hire_date DATE
   CONSTRAINT chk_hourly_pay CHECK (hourly_pay >= 10.00)
   ); /*New Table*/
   
/*To add CHECK CONSTRIANT to existing table*/
ALTER TABLE employees
ADD CONSTRAINT chk_hourly_pay CHECK (hourly_pay >= 10.00);
   
INSERT INTO employees
VALUES (6, "Sheldon", "Plankton", 10.00, "2023-01-07");

/*To delete a CHECK constraint*/
ALTER TABLE employees
DROP CHECK chk_hourly_pay;


/*LESSON 10*/
/*DEFAULT constraint- default values to ZERO automatically in a row*/
SELECT * FROM products;

INSERT INTO products
VALUES (104, "straw", 0.00),
	   (105, "napkin", 0.00),
       (106, "fork", 0.00),
       (107, "spoon", 0.00);

DELETE FROM products
WHERE product_id >= 104;

/*Creating table with default constraint*/
CREATE TABLE products (
       product_id INT,
       product_name VARCHAR(25),
       price DECIMAL (4,2) DEFAULT 0
);

/*To add DEFAULT Constraint to existing table*/
ALTER TABLE products
ALTER price SET DEFAULT 0;

INSERT INTO products (product_id, product_name)
VALUES (104, "straw"),
	   (105, "napkin"),
       (106, "fork"),
       (107, "spoon");
       
CREATE TABLE transactions (
     transaction_id INT,
     amount DECIMAL (5, 2),
     transaction_date DATETIME DEFAULT NOW()
);     
     
INSERT INTO transactions (transaction_id, amount)
VALUES (3, 8.37);     

SELECT * FROM transactions;

DROP TABLE transactions;


/*15/05/2024

LESSON 11*/
/*Primary Key Constriant- applied to a column in a table, where values has to be unique with no NULL. A table can only have one primary key*/

CREATE TABLE transactions (
     transaction_id INT PRIMARY KEY,
     amount DECIMAL (5, 2)
);

/*To add Primary Key Constraint to existing table*/
ALTER TABLE transactions
ADD CONSTRAINT
PRIMARY KEY (amount);

INSERT INTO transactions
VALUES (1003, 4.99);

SELECT amount FROM transactions
WHERE transaction_id = 1000;

SELECT * FROM transactions;

/*LESSON 12*/
/*AUTO_INCREMENT Constraint- This can be applied to column that has the primary key, utomatically gives a unique key to primary key*/
CREATE TABLE transactions (
     transaction_id INT PRIMARY KEY AUTO_INCREMENT,
     amount DECIMAL (5, 2)
);

SELECT * FROM transactions;

INSERT INTO transactions (amount)
VALUES (2.89),
	   (3.38),
       (4.99);
       
/*To determine where AUTO_INCREMENT starts, we need to alter table*/
ALTER TABLE transactions
AUTO_INCREMENT = 1000;

DELETE FROM transactions;
SELECT * FROM transactions;


CREATE TABLE transactions (
     transaction_id INT PRIMARY KEY AUTO_INCREMENT,
     amount DECIMAL (5, 2));

INSERT INTO transactions (amount)
VALUES (4.99),
       (2.89),
	   (3.38),
       (4.99);
       
 
/*LESSON 13*/ 
/*Foreign Key constraint- cross referencing data across table/ helps with link between table*/       







