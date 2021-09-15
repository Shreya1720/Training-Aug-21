---1 QUE Write a SQL statement to change the Email column of Employees table with ‘not available’ for all employees.
select * from Employees
ALTER TABLE Employees DROP CONSTRAINT ukEmail
UPDATE Employees SET Email='not available'
---2 QUE Write a SQL statement to change the Email and CommissionPct column of employees table with ‘not available’ and 0.10 for all employees.
select * from Employees
UPDATE Employees SET Email='not available' , CommissionPct =0.10

--3 QUE Write a SQL statement to change the Email and CommissionPct column of employees table with ‘not available’ and 0.10 for those employees whose DepartmentID is 110.

SELECT * FROM Employees where DepartmentID=110

UPDATE Employees SET Email='not availableQue3' , CommissionPct =0.100 WHERE DepartmentID=110

--4 que Write a SQL statement to change the Email column of employees table with ‘not available’ for those employees whose DepartmentID is 80 and gets a commission is less than 20%

UPDATE Employees SET Email='not availableQue4' , CommissionPct =0.100 WHERE DepartmentID=80 AND CommissionPct<0.2


--5 QUE Write a SQL statement to change the Email column of employees table with ‘not available’ for those employees who belongs to the ‘Accouning’ department.
UPDATE Employees SET email='not availableQue5' WHERE DepartmentID=(SELECT DepartmentID 
FROM Departments WHERE DepartmentName='Accounting');


SELECT * FROM Employees
--6 QUE Write a SQL statement to change salary of employee to 8000 whose ID is 105, if the existing salary is less than 5000.

SELECT * FROM Employees

UPDATE Employees SET Salary=8000 where EmployeeID=105 AND Salary<5000

/*7 QUE Write a SQL statement to change job ID of employee which ID is 118, to SH_CLERK if the employee belongs to department, 
which ID is 30 and the existing job ID does not start with SH.*/

UPDATE Employees SET JobId='SH_CLERK' WHERE EmployeeID=118
AND DepartmentID=30 AND JobId NOT LIKE 'SH%'


/*8 QUE Write a SQL statement to increase the salary of employees under the department 40, 90 and 110 according to the company rules that, 
salary will be increased by 25% for the department 40, 15% for department 90 and 10% for the department 110 and the rest of the departments will remain same.*/

UPDATE Employees SET Salary =(CASE
DepartmentID WHEN 40 THEN Salary+(Salary*0.25) 
WHEN 90 THEN Salary+(Salary*0.15)
WHEN 110 THEN Salary+(Salary*0.10)
ELSE Salary END)
WHERE DepartmentID=40 OR DepartmentID=90 OR DepartmentID=110


----------
UPDATE Employees SET Salary += Salary*0.25 where DepartmentID = 40 
UPDATE Employees SET Salary += Salary*0.15 where DepartmentID = 90
UPDATE Employees SET Salary += Salary*0.10 where DepartmentID = 110 


