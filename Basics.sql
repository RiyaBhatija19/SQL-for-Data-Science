CREATE database IF NOT EXISTS COLLEGE;
USE COLLEGE;
CREATE TABLE Department(
	DeptID INT PRIMARY KEY,
	Dept_Name VARCHAR(50) NOT NULL
);
DROP TABLE IF EXISTS Student;
CREATE TABLE Student(
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Age INT CHECK (Age >= 18),
    City VARCHAR(50) DEFAULT 'Mumbai',
	DeptID INT,
	FOREIGN KEY(DeptID)
	REFERENCES Department(DeptId)
);
INSERT INTO Department (DeptId,Dept_Name)
VALUES
(101, 'Computer'),
(102, 'IT'),
(103, 'AI & DS');

SELECT*FROM Department;
INSERT INTO Student(Name,Email,Age,City,DeptID)
VALUES
('Riya', 'riya@gmail.com', 20, 'Mumbai', 103),
('Sakshi', 'sakshi@gmail.com', 19, 'Pune', 101),
('Rahul', 'rahul@gmail.com', 21, 'Mumbai', 102),
('Priya', 'priya@gmail.com', 20, 'Thane', 103),
('Amit', 'amit@gmail.com', 22, 'Nashik', 101);

SELECT*FROM Student;
SELECT email FROM Student;
SELECT Name,City FROM Student;
SELECT*FROM Student WHERE City="Mumbai";
SELECT*FROM Student WHERE age>20;
SELECT*FROM Student order by AGE;
SELECT*FROM Student order by AGE DESC;

-- Interview Qs practice
SELECT email FROM Student;
SELECT*FROM Student WHERE age=20;
SELECT*FROM Student where city="Pune";
SELECT Name,email FROM Student;
SELECT*From Student ORDER BY Name;
SELECT*FROM Student LIMIT 2;

-- Interview Practice 
SELECT*FROM Student where age>20;
SELECT*FROM Student where age>=18 AND age<=20;
SELECT*FROM Student where city!="MUMBAI";
SELECT*FROM Student order by AGE DESC;
SELECT*FROM Student LIMIT 3;