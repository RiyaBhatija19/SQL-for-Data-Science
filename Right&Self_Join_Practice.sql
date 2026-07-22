CREATE DATABASE company_db;
USE company_db;
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
INSERT INTO departments VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Sales'),
(4, 'Finance');
INSERT INTO employees VALUES
(101, 'Alice', 50000, 1),
(102, 'Bob', 75000, 2),
(103, 'Charlie', 62000, 3),
(104, 'David', 80000, 2),
(105, 'Eva', 55000, 1);
SELECT * FROM departments;
SELECT * FROM employees;


#Write a query to display:Employee Name,Department Name using a RIGHT JOIN.
SELECT e.emp_name,
	   d.department_name
FROM employees e
RIGHT JOIN departments d
ON e.department_id = d.department_id

#Display all departments along with the number of employees in each department using RIGHT JOIN
SELECT d.department_name,
       COUNT(e.emp_id) AS total_employees
FROM employees e
RIGHT JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_name;

#Write a query to display avg salary for the finance department.
SELECT d.department_name,
       AVG(e.salary)
FROM employees e
RIGHT JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_name;

CREATE TABLE employees_manager (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    manager_id INT
);
INSERT INTO employees_manager VALUES
(101,'Alice',NULL),
(102,'Bob',101),
(103,'Charlie',101),
(104,'David',102),
(105,'Eva',102);
SELECT * FROM employees_manager;

#Write the query that displays:
#Employee name
#Manager name

SELECT e.emp_name AS employee,
       m.emp_name AS manager
FROM employees_manager e
LEFT JOIN employees_manager m
ON e.manager_id = m.emp_id;

