CREATE DATABASE company_subqueries;
USE company_subqueries;
CREATE TABLE department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);
CREATE TABLE employer (
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
(4, 'Finance'),
(5, 'Marketing');
INSERT INTO employer VALUES
(101, 'Alice',   50000, 'Mumbai', 1),
(102, 'Bob',     75000, 'Pune',   2),
(103, 'Charlie', 62000, 'Mumbai', 3),
(104, 'David',   80000, 'Delhi',  2),
(105, 'Eva',     55000, 'Pune',   1),
(106, 'Frank',   68000, 'Mumbai', 2),
(107, 'Grace',   45000, 'Delhi',  3),
(108, 'Henry',   72000, 'Chennai',2),
(109, 'Isha',    90000, 'Mumbai', 4),
(110, 'Jack',    40000, 'Pune',   4),
(111, 'Kevin',   58000, 'Delhi',  NULL);
SELECT * FROM department;
SELECT * FROM employer;
#Write a query to display:Employee Name,Salary
#for employees who earn the highest salary in the company.
SELECT emp_name,
		salary
FROM employer e
WHERE salary=(
		SELECT MAX(salary)
        FROM employer
);
#Write a query to display:Employee Name,Salary
#for employees who earn the more than average salary in the company
SELECT emp_name,
		salary
FROM employer e
WHERE salary>(
	SELECT AVG(salary)
    FROM employer 
);
#Write a query to display:Employee Name,Salary
#for employees who earn less than the highest salary in the company
SELECT emp_name,
		salary
FROM employer e
WHERE salary<(
		SELECT MAX(salary)
        FROM employer
);
#Write a query to display:Employee Name,Salary
#for employees who earn the less than average salary in the company
SELECT emp_name,
		salary
FROM employer e
WHERE salary<(
	SELECT AVG(salary)
    FROM employer 
);
#Write a qquery to display emp_name,salary,department_name
#Show department who workd either in HR ,FINANCE department.
SELECT e.emp_name,
       e.salary,
       d.department_name
FROM employer e
INNER JOIN department d
ON e.department_id = d.department_id
WHERE e.department_id IN (
    SELECT department_id
    FROM department
    WHERE department_name IN ('HR', 'Finance')
);
#Write a qquery to display emp_name,salary
#Show department who workd either in IT or Sales.
SELECT e.emp_name,
		e.salary
FROM employer e
INNER JOIN department d
ON e.department_id = d.department_id
WHERE e.department_id IN(
	SELECT department_id
    FROM department
    WHERE department_name IN ('IT','Sales')
);
#Display:Employee Name,Salary of employees who do not work in:HR,Finance
SELECT emp_name,
       salary
FROM employer
WHERE department_id NOT IN (
    SELECT department_id
    FROM department
    WHERE department_name IN ('HR', 'Finance')
);
#Display:Employee Name,Salary of employees whose salary is freater than the salary of Bob
SELECT emp_name,
		salary
FROM employer
WHERE salary>(
	SELECT salary
    FROM employer
    WHERE emp_name='Bob'
);

#Display:Employee Name,Salary of employees whose salary is freater than the salary of David
SELECT emp_name,
		salary
FROM employer
WHERE salary>(
	SELECT salary
    FROM employer
    WHERE emp_name='David'
);

#Display:Employee Name,Salary of employees who work in the same department as Bob
SELECT emp_name,
		salary
FROM employer
WHERE department_id=(
SELECT department_id
FROM employer
WHERE emp_name = 'Bob'
);

#Write a query to display employee name,salary of employees who earn more than Alice and works in same department as Alice
SELECT emp_name,
       salary
FROM employer
WHERE salary > (
    SELECT salary
    FROM employer
    WHERE emp_name = 'Alice'
)
AND department_id = (
    SELECT department_id
    FROM employer
    WHERE emp_name = 'Alice'
);

#Display emp_name,salary of employees who earn more than the average salary of their own department.
SELECT e.emp_name,
       e.salary
FROM employer e
WHERE e.salary > (
    SELECT AVG(salary)
    FROM employer
    WHERE department_id = e.department_id
);

#Display emp_name,salary of employees whose salary is equal to the minimum salary in the company
SELECT emp_name,
	   salary
FROM employer e
WHERE salary=(
	SELECT MIN(salary)
    FROM employer 
);
#Display emp_name,salary of employees whose salary is not the highest salary in the company
SELECT emp_name,
	   salary
FROM employer e
WHERE salary NOT IN(
	SELECT MAX(salary)
    FROM employer
);

#Display emp_name,salary of employees ewhose salary is between the average salary and maximum salary.
SELECT emp_name,
		salary
FROM employer e
WHERE salary BETWEEN(
	SELECT AVG(salary)
    FROM employer
)
AND (
	SELECT MAX(salary)
    FROM employer
);

#Display the department names that have at least one employee.
SELECT d.department_name
FROM department d
WHERE EXISTS (
    SELECT 1
    FROM employer e
    WHERE e.department_id = d.department_id
);

#Display the names of departments that do not have any employees.
SELECT department_name
FROM department d
WHERE NOT EXISTS(
	SELECT 1
    FROM employer e
    WHERE e.department_id=d.department_id
);

#Display Employee name,salary of employees who belong to valid department
SELECT emp_name,
		salary
FROM employer e
WHERE EXISTS(
	SELECT 1
    FROM department d
    WHERE e.department_id=d.department_id
);

#Display Employee_name,salary of employees whose salary is greater than ANY salary in 
#the HR department.
SELECT emp_name,
       salary
FROM employer
WHERE salary > ANY (
    SELECT salary
    FROM employer
    WHERE department_id = (
        SELECT department_id
        FROM department
        WHERE department_name = 'HR'
    )
);

#Display Employee_name,salary of the employee(s) having the second highest salary
SELECT emp_name,
       salary
FROM employer
WHERE salary = (
    SELECT MAX(salary)
    FROM employer
    WHERE salary < (
        SELECT MAX(salary)
        FROM employer
    )
);
#Display Employee_name,salary of the employee(s) having the third highest salary
SELECT emp_name,
       salary
FROM employer
WHERE salary = (
    SELECT MAX(salary)
    FROM employer
    WHERE salary < (
        SELECT MAX(salary)
        FROM employer
        WHERE salary < (
            SELECT MAX(salary)
            FROM employer
        )
    )
);