/*
In this assignment, you will be working with a fictional database of a company named "XYZ Corp." The database contains two tables, employees and departments. Your task is to write SQL commands to retrieve and manipulate data from these tables.

employees: id, name, age, salary, department_id
departments: id, name, manager

*/

CREATE DATABASE xyz_crop;
USE xyz_crop;

CREATE TABLE departments(
id INT AUTO_INCREMENT PRIMARY KEY,
department_id INT NOT NULL UNIQUE,
`name` VARCHAR(150) NOT NULL,
manager VARCHAR(120) NOT NULL
);

INSERT INTO departments(department_id, `name`,manager)
VALUES('203231','Marketing','M M I Pavel'),('203232','Finance','Alamgir Bhuyan'),('203233','IT','MR Hoque');


CREATE TABLE employees(
id INT AUTO_INCREMENT PRIMARY KEY,
employee_id INT NOT NULL UNIQUE,
`name` VARCHAR(150) NOT NULL,
salary VARCHAR(255) NOT NULL,
age VARCHAR(10) NOT NULL,
department_id INT NOT null
);

INSERT INTO employees(employee_id, `name`,salary, age, department_id)
VALUES(1001,'M Riju',50000, 25,203232),(1002,'M Hoque',30000, 25,203231),(1003,'Nayon Sarker',20000, 25,203231),(1004,'Mostafizer Rahman',40000, 25,203233),(1005,'Manjurul Hoque',70000, 26,203233);

/*

a. Write a query to select all columns and rows from the employees table.
*/

SELECT * FROM employees;


/*
b. Write a query to select only the name and salary columns of all employees with a salary greater than 50000.
*/

SELECT employees.name,employees.salary FROM employees WHERE employees.salary > 50000;

/*
c. Write a query to calculate the average salary of all employees.
*/

SELECT AVG(employees.salary) AS 'Average Salary', COUNT(*) 'Total' FROM employees;

/*
d. Write a query to count the number of employees who work in the "Marketing" department.
*/


SELECT employees.name,employees.salary, departments.name 'departmenst' FROM employees JOIN departments ON employees.department_id = departments.department_id 
WHERE departments.name = 'Marketing';

SELECT COUNT(*) 'Total' FROM employees JOIN departments ON employees.department_id = departments.department_id 
WHERE departments.name = 'Marketing';
/*

e. Write a query to update the salary column of the employee with an id of 1001 to 60000.
*/
UPDATE employees SET employees.salary = 60000 WHERE employees.employee_id = 1001;


/*
f. Write a query to delete all employees whose salary is less than 30000.
*/

DELETE FROM employees WHERE employees.salary < 30000;

/*
Use the departments table to answer the following questions:


a. Write a query to select all columns and rows from the departments table.
*/
SELECT * FROM departments;

/*
b. Write a query to select only the name and manager columns of the "Finance" department.
*/
SELECT departments.name, departments.manager FROM departments WHERE departments.name = 'Finance';

/*
c. Write a query to calculate the total number of employees in each department.
*/

SELECT departments.name,COUNT(employees.employee_id) 'Total' FROM employees JOIN departments ON employees.department_id = departments.department_id GROUP BY departments.name;

/*
d. Write a query to insert a new department called "Research" with a manager named "John Doe".
*/
INSERT INTO departments(department_id, `name`,manager)
VALUES(203234,'Research','John Doe')


/*
A text file containing all SQL commands written to answer the above questions.
SELECT, COUNT,GROUP BY, INSERT, UPDATE, JOIN, AVG

A brief explanation of each SQL command and its purpose.
SELECT - SELECT use to retrive data form table.
COUNT- COUNT use to count values from row/ no of row.
GROUP BY - GROUP BY use to give result of same values into summary rows.
INSERT - INSERT use to insert data into table.
UPDATE - UPDATE use to update data of table.
JOIN - JOIN use to combine rows from two or more tables, based on a related column between them.
AVG - AVG use to calculate the average value of a numeric column.
*/
