CREATE DATABASE company_window;
USE company_window;

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

#Display:Employee Name,Salary,Row Number
SELECT emp_name,
		salary,
        ROW_NUMBER()OVER(
        ORDER BY department_id) AS rn
        FROM employee;

#Display:Employee Name,Salary,Rank
SELECT emp_name,
		salary,
        RANK()OVER(
        ORDER BY salary)AS rn
        FROM employee;
        
#Display:Employee Name,Salary,Dense Rank()
SELECT emp_name,
		salary,
        DENSE_RANK() OVER(
        ORDER BY salary DESC)AS rn
        FROM employee;
        
#Display:Emp_Name,Dept_Id,Salary,Row number within each department
SELECT emp_name,
       department_id,
       salary,
       ROW_NUMBER() OVER (
           PARTITION BY department_id
           ORDER BY salary DESC
       ) AS rn
FROM employee;

#Display:Emp_Name,Dept_Id,Salary,Rank within each department
SELECT emp_name,
		department_id,
        salary,
        RANK() OVER(
        PARTITION BY department_id
        ORDER BY SALARY DESC
	)AS rn
FROM employee;

#Display:Emp_Name,Dept_Id,Salary,Dense_Rank within each department
SELECT emp_name,
		department_id,
        salary,
        DENSE_RANK() OVER(
        PARTITION BY department_id
        ORDER BY SALARY DESC
	)AS rn
FROM employee;

#Display the highest-paid employee from each department.
SELECT*FROM (
SELECT emp_name,
		salary,
        ROW_NUMBER()OVER(
        PARTITION BY department_id
        ORDER BY SALARY DESC
	)AS rn
FROM employee
) t
WHERE rn=1;

#Display the second-highest-paid employee from each department.
SELECT*FROM (
SELECT emp_name,
		salary,
        ROW_NUMBER()OVER(
        PARTITION BY department_id
        ORDER BY SALARY DESC
	)AS rn
FROM employee
) t
WHERE rn=2;

#Display emp_name,salary,previous employee_salary
SELECT emp_name,
		salary,
        LAG(salary)OVER(ORDER BY salary DESC)AS previous_salary
        FROM employee;
        
#Dsiplay emp_name,salary,next_salary
SELECT emp_name,
		salary,
        LEAD(salary)OVER(ORDER BY salary DESC)AS next_salary
        FROM employee;
	
#Dsiplay emp_name,salary,first_salary
SELECT emp_name,
       salary,
       FIRST_VALUE(salary) OVER (
           ORDER BY salary DESC
       ) AS highest_salary
FROM employee;

#Dsiplay emp_name,salary,last_salary
SELECT emp_name,
       salary,
       LAST_VALUE(salary) OVER (
           ORDER BY salary DESC
       ) AS last_salary
FROM employee;

