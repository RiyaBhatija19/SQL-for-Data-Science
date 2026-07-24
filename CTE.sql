CREATE DATABASE Practice_CTE;
USE Practice_CTE;

CREATE TABLE department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2),
    city VARCHAR(50),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES department(department_id)
);

INSERT INTO department VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Sales'),
(4, 'Finance');

INSERT INTO employee VALUES
(101, 'Alice',   50000, 'Mumbai', 1),
(102, 'Bob',     75000, 'Pune',   2),
(103, 'Charlie', 62000, 'Mumbai', 3),
(104, 'David',   80000, 'Delhi',  2),
(105, 'Eva',     50000, 'Pune',   1),
(106, 'Frank',   68000, 'Mumbai', 2),
(107, 'Grace',   62000, 'Delhi',  3),
(108, 'Henry',   75000, 'Chennai',2),
(109, 'Ivy',     90000, 'Mumbai', 4),
(110, 'Jack',    80000, 'Delhi',  4);

SELECT * FROM department;
SELECT * FROM employee;

#Write a CTE named EmployeeData that
#Select all columns from employee
#Display all rows from CTE

WITH EmployeeData AS(
	SELECT emp_id,
			emp_name,
            salary,
            city,
			ROW_NUMBER()OVER(
				ORDER BY salary DESC 
			)AS rn
            FROM employee
)
SELECT*
FROM employee

#Write a CTE to display:
#Employee name and salary of employees whose salary is greater than 60000.
#Use:
#CTE name: HighSalaryEmployees
#Table: employee

WITH HighestSalary AS (
    SELECT MAX(salary) AS max_salary
    FROM employee
)
SELECT emp_name,
       salary
FROM employee
WHERE salary = (
    SELECT max_salary
    FROM HighestSalary
);

#Display the top 3 highest-paid employees in the company.
#CTE name: TopEmployees
#Use ROW_NUMBER()
#Filter rn <= 3

WITH TopEmployees AS (
    SELECT emp_name,
           department_id,
           salary,
           ROW_NUMBER() OVER(
               PARTITION BY department_id
               ORDER BY salary DESC
           ) AS rn
    FROM employee
)
SELECT *
FROM TopEmployees
WHERE rn <= 3;

#Display the second highest salary in each department using CTE.
#Use ROW_NUMBER()
#Use PARTITION BY department_id
#Filter rn = 2
WITH SecondHighestEmployee AS(
	SELECT emp_id,
			salary,
            ROW_NUMBER() OVER(
            PARTITION BY department_id
            ORDER BY salary DESC
		)AS rn
	FROM employee
)
SELECT * 
FROM SecondHighestEmployee
WHERE rn=2;

#Find the employees whose salary is greater than the average salary of their department
# using CTE

WITH DepartmentAverage AS (
    SELECT department_id,
           AVG(salary) AS avg_salary
    FROM employee
    GROUP BY department_id
)

SELECT e.emp_name,
       e.department_id,
       e.salary,
       d.avg_salary
FROM employee e
JOIN DepartmentAverage d
ON e.department_id = d.department_id
WHERE e.salary > d.avg_salary;