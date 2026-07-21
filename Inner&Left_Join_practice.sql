CREATE DATABASE sql_join_practice;
USE sql_join_practice;
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT,
    department_id INT,
    FOREIGN KEY (department_id)
    REFERENCES departments(department_id)
);
INSERT INTO departments VALUES
(1,'HR'),
(2,'IT'),
(3,'Sales'),
(4,'Finance');
INSERT INTO employees VALUES
(101,'Alice',50000,1),
(102,'Bob',75000,2),
(103,'Charlie',45000,3),
(104,'David',90000,2),
(105,'Eva',60000,1);

SELECT e.emp_name, d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id;

SELECT e.emp_name,
       e.salary,
       d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id;

#Only for employees in the IT department.
SELECT e.emp_name 
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
WHERE department_name = 'IT';

#Write a query to display:
#emp_name	salary	department_name
#Only employees whose salary is greater than 60,000.
SELECT e.emp_name,
       e.salary,
       d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
WHERE e.salary > 60000;

#Show all employees who work in the HR department and have a salary greater than 50,000.
#emp_name
#salary
#department_name
SELECT e.emp_name,
	    e.salary,
        d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
WHERE e.salary>50000 AND d.department_name='HR';

#Display the department name and the number of employees in each department.

SELECT d.department_name,
       COUNT(e.emp_id) AS total_employees
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_name;

#Find the average salary of employees in each department.
SELECT d.department_name,
AVG(e.salary) 
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_name;

#Display the department name and the highest salary in each department, but only show 
#departments where the highest salary is greater than 70,000.


SELECT d.department_name,
MAX(e.salary)
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_name
HAVING MAX(e.salary)>70000;

#Show the department name and the total salary paid in each department, but display only
# departments where the total salary is greater than 100000.
SELECT d.department_name,
SUM(e.salary)
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_name
HAVING SUM(e.salary)>100000;

#Show all employees, even if they are not assigned to a department
SELECT e.emp_name,
		d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id;

#Find all employees who are NOT assigned to any department.
SELECT e.emp_name,
       d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_name IS NULL;

#Find all departments that have no employees.
SELECT e.emp_name,
		d.department_name
FROM departments d
LEFT JOIN employees e
ON e.department_id = d.department_id
WHERE e.emp_name is NULL;

