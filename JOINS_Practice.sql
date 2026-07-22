CREATE DATABASE company;
USE company;
CREATE TABLE department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);
CREATE TABLE employer(
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
(101, 'Alice', 50000, 'Mumbai', 1),
(102, 'Bob', 75000, 'Pune', 2),
(103, 'Charlie', 62000, 'Mumbai', 3),
(104, 'David', 80000, 'Delhi', 2),
(105, 'Eva', 55000, 'Pune', 1),
(106, 'Frank', 68000, 'Mumbai', 2),
(107, 'Grace', 45000, 'Delhi', 3),
(108, 'Henry', 72000, 'Chennai', 2);

SELECT * FROM department;
SELECT * FROM employer;

#Display:Employee Name,Salary,Department Name using the appropriate JOIN.
SELECT emp_name,
        salary,
        department_name
FROM employer e
INNER JOIN department d
ON d.department_id=e.department_id;

#Display:Employee Name,City,Department Name.Only show employees who work in the IT
#department.

SELECT e.emp_name,
       e.city,
       d.department_name
FROM employer e
INNER JOIN department d
ON e.department_id = d.department_id
WHERE d.department_name = 'IT';

#Display:Department Name,Number of employees
#Show all departments, even if they have no employees.
SELECT department_name,
		COUNT(emp_id)
FROM department d
LEFT JOIN employer e
ON e.department_id=d.department_id
GROUP BY department_name;

#Write a query to display:
#Department Name
#Average Salary
#Only show departments whose average salary is greater than 60,000.

SELECT department_name,
		AVG(salary)
FROM employer e
INNER JOIN department d
ON e.department_id=d.department_id
GROUP BY department_name
HAVING AVG(e.salary)>60000;

#Display:
#Department Name
#Employee Count
#Average Salary
#Show only departments that:have more than 2 employees.and whose average salary is
#greater than 60,000.Sort by average salary in descending order.
SELECT department_name,
		COUNT(emp_id),
        AVG(salary)
FROM employer e
INNER JOIN department d
ON e.department_id = d.department_id
GROUP BY department_name
HAVING AVG(e.salary)>60000 AND COUNT(emp_id)>2
ORDER BY AVG(e.salary) DESC;

#Find all employees who do not belong to any department.
#Display:
#Employee Name
#Salary
SELECT e.emp_name,
       e.salary
FROM employer e
LEFT JOIN department d
ON e.department_id = d.department_id
WHERE d.department_id IS NULL;

#Display all departments that currently have no employees.
SELECT d.department_name
FROM department d
LEFT JOIN employer e
ON d.department_id = e.department_id
WHERE e.emp_id IS NULL;

#Display Employee Name,Department Name,Salary
#Sort the results by:Department Name → Alphabetically (A–Z)
#Salary → Highest to Lowest within each department

SELECT emp_name,
		salary,
        department_name
FROM employer e
INNER JOIN department d
ON e.department_id = d.department_id
ORDER BY department_name ASC,
		salary DESC;
        
#Display: Department Name,Total Salary
#Find the department that pays the highest total salary.
SELECT d.department_name,
       SUM(e.salary)
FROM employer e
INNER JOIN department d
ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY total_salary DESC;
