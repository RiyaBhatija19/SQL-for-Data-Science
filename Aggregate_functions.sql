CREATE DATABASE sql_practice;
USE sql_practice;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary INT,
    age INT,
    city VARCHAR(30)
);
INSERT INTO employees VALUES
(101, 'Riya', 'HR', 50000, 22, 'Mumbai'),
(102, 'Aman', 'IT', 70000, 25, 'Delhi'),
(103, 'Neha', 'IT', 80000, 28, 'Mumbai'),
(104, 'Rahul', 'HR', 60000, 26, 'Pune'),
(105, 'Priya', 'Sales', 45000, 23, 'Delhi'),
(106, 'Karan', 'Sales', 55000, 24, 'Mumbai'),
(107, 'Sneha', 'IT', 90000, 29, 'Pune'),
(108, 'Arjun', 'HR', 52000, 27, 'Delhi'),
(109, 'Meera', 'Sales', 48000, 25, 'Mumbai'),
(110, 'Rohit', 'IT', 75000, 26, 'Pune');
SELECT * FROM employees;
SELECT COUNT(emp_id)
FROM employees
#This works because emp_id is the Primary Key, so it can never be NULL. 
#Therefore, COUNT(emp_id) returns the total number of employees.
#This works because emp_id is the Primary Key, so it can never be NULL.
#Therefore, COUNT(emp_id) returns the total number of employees.
SELECT SUM(salary)
FROM employees;
SELECT AVG(salary)
FROM employees;
SELECT MAX(salary)
SELECT department,COUNT(*)AS total_employees
FROM employees
GROUP BY department;
SELECT department,AVG(salary) FROM employees group by department;
SELECT department,MAX(salary)FROM employees GROUP BY department;
SELECT department,SUM(salary)FROM employees GROUP BY department;
SELECT department, COUNT(*) 
FROM employees
GROUP BY department
HAVING COUNT(*) > 3;
SELECT department ,AVG(salary) FROM employees GROUP BY (department) HAVING AVG(salary)>60000; 
SELECT city,COUNT(emp_id) FROM employees GROUP BY(city);
SELECT city, COUNT(*) AS total_employees FROM employees
GROUP BY city ORDER BY total_employees DESC
LIMIT 1
SELECT department,AVG(salary) FROM employees group by(department)ORDER BY AVG(salary) DESC LIMIT 2 OFFSET 1;
-- Interview Qs Practice-- 
SELECT COUNT(emp_id) FROM employees;
SELECT SUM(salary)FROM employees;
SELECT AVG(salary)FROM employees;
SELECT MAX(salary)FROM employees;
SELECT MIN(salary)FROM employees;
SELECT department,COUNT(emp_id) FROM employees GROUP BY(department);
SELECT department,AVG(salary) FROM employees GROUP BY(department);
SELECT department,MAX(salary) FROM employees GROUP BY(department);
SELECT department,SUM(salary) FROM employees GROUP BY(department);
SELECT city,COUNT(emp_id) FROM employees GROUP BY(city);

SELECT department,COUNT(*) FROM employees GROUP BY(department) HAVING COUNT(*)>2;
SELECT department,AVG(salary) FROM employees GROUP BY (department) HAVING AVG(salary)>60000;
SELECT department, COUNT(*) FROM employees GROUP BY department HAVING COUNT(*) > 3;

-- Interview qs practice 
SELECT department,COUNT(emp_id) FROM employees GROUP BY(department);
SELECT department,AVG(salary) FROM employees GROUP BY (department) HAVING AVG(salary)>50000;
SELECT MAX(salary)FROM employees;
SELECT salary FROM employees ORDER BY salary DESC LIMIT 1 OFFSET 1;
SELECT department ,COUNT(*) FROM employees GROUP BY(department) HAVING COUNT(*)>5;
SELECT department, COUNT(*) FROM employees GROUP BY department HAVING COUNT(*) > 5 
ORDER BY COUNT(*) DESC;
SELECT salary FROM employees ORDER BY salary DESC LIMIT 1 OFFSET 2;


