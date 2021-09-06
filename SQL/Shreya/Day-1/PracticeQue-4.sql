/*Que:--1 You have been hired to create a relational database to support a car sales business. You need to store information on the business’s employees, inventory,
and completed sales. You also need to account for the fact that each salesperson receives a different percentage of their sales in commission. What tables and 
columns would you create in your relational database, and how would you link the tables?*/



CREATE TABLE employee (
Employee_Id INT PRIMARY KEY IDENTITY(1,1), 
FirstName VARCHAR(10),
LastName VARCHAR(10), 
Email VARCHAR(20) CONSTRAINT chkEmail CHECK (Email LIKE '%@%.___') , 
PhoneNumber NUMERIC(10) CONSTRAINT chkMobile CHECK (PhoneNumber BETWEEN 1000000000 AND 9999999999), 
Hire_Date DATE, 
Job_Id INT CONSTRAINT fkForeig REFERENCES Jobs(JobId) on update cascade, 
Salary MONEY, 
Commission INT , 
Manager_Id INT , 
Department_Id INT CONSTRAINT fkkForeig REFERENCES Department(Department_Id) on update cascade
)

CREATE TABLE Jobs (
JobId INT PRIMARY KEY,
JobTitle VARCHAR(20) DEFAULT ' ' NOT NULL, 
MinSalary INT DEFAULT 8000,
MaxSalary INT DEFAULT NULL
)

CREATE TABLE Department_1(
DepartmentId INT PRIMARY KEY IDENTITY(1,1),
DepartmentName VARCHAR(20) NOT NULL
)

select * from employee
INSERT INTO employee values('barkha','hagha','barkha@gmail.com',9870087829,'2021-08-02',1,2000,200,1,1)
