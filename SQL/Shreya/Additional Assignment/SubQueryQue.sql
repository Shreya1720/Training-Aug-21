SELECT * FROM Countries
SELECT * FROM Departments
SELECT * FROM Employees
SELECT * FROM JobHistory
SELECT * FROM Locations

---1---
SELECT (FirstName+' '+ LastName) 'NAME',Salary FROM Employees WHERE 
Salary > (SELECT Salary FROM Employees WHERE LastName='BULL')

---2---
SELECT (FirstName+' '+LastName) FROM Employees WHERE DepartmentID 
IN(SELECT DepartmentID FROM Departments WHERE DepartmentName='IT') 

--using join

SELECT (e.FirstName+' '+e.LastName) , d.DepartmentName 'Departmentname'
FROM Employees e JOIN Departments d ON e.DepartmentID=d.DepartmentID
WHERE d.DepartmentName='IT'


SELECT * FROM Employees

---3---
SELECT (FirstName+' '+LastName) 'NAME' FROM Employees WHERE ManagerID
IN (SELECT EmployeeID FROM Employees WHERE DepartmentID 
IN (SELECT DepartmentID FROM Departments WHERE LocationID
IN(SELECT LocationID FROM Locations WHERE CountryID='US')
))



---4---
SELECT (mgr.FirstName+' '+mgr.LastName) 'Manager Name' 
FROM Employees e JOIN Employees mgr ON
e.ManagerID = mgr.EmployeeID  GROUP BY (mgr.FirstName+' '+mgr.LastName)

SELECT(FirstName+' '+LastName) 'Manager Name'  FROM Employees
WHERE EmployeeID IN
(SELECT ManagerID FROM Employees)

---5---
SELECT AVG(Salary)  FROM Employees

SELECT FirstName+' '+LastName AS 'NAME',Salary
FROM Employees WHERE Salary > (SELECT AVG(Salary) FROM Employees)

---6---
SELECT MIN(Salary) FROM Employees

SELECT FirstName+' '+LastName AS 'NAME',Salary ,JobId
FROM Employees AS Emp
WHERE Salary = (SELECT MIN(Salary) FROM Employees
WHERE JobId = Emp.JobId)
 
---7---

SELECT FirstName+' '+LastName AS 'NAME',Salary
FROM Employees WHERE Salary > 
(SELECT AVG(Salary) FROM Employees) AND DepartmentID IN
(SELECT DepartmentID FROM Departments WHERE DepartmentName ='IT')


---8---
SELECT FirstName+' '+LastName AS 'NAME',Salary
FROM Employees WHERE Salary >(SELECT Salary FROM Employees WHERE LastName='BeLL')

---9---

SELECT FirstName+' '+LastName AS 'NAME',Salary
FROM Employees e
WHERE Salary = (SELECT MIN(Salary) FROM Employees WHERE DepartmentID = e.DepartmentID )


---10---

SELECT FirstName+' '+LastName AS 'NAME',Salary , DepartmentID
FROM Employees WHERE Salary > (SELECT AVG(Salary) FROM Employees
WHERE DepartmentID IN
(SELECT DepartmentID FROM Departments))


---11---

SELECT FirstName+' '+LastName AS 'NAME', Salary FROM Employees WHERE Salary >
ALL(SELECT Salary FROM Employees WHERE JobId='SH_CLERK') ORDER BY Salary ASC


---12---

SELECT(FirstName+' '+LastName) 'Manager Name'  FROM Employees
WHERE EmployeeID NOT IN
(SELECT ManagerID FROM Employees)


---13---
SELECT  e.EmployeeID,(e.FirstName+' '+e.LastName) 'Name',d.DepartmentName FROM Employees e 
JOIN Departments d ON e.DepartmentID=d.DepartmentID


---14---
SELECT EmployeeID,FirstName,LastName, Salary FROM Employees e WHERE Salary >
(SELECT AVG(Salary) FROM Employees  WHERE DepartmentID=e.DepartmentID)


---15---

SELECT * FROM Employees WHERE EmployeeID % 2 =0

--using raw_number function


SELECT * FROM
(SELECT  ROW_NUMBER() OVER (ORDER BY EmployeeID) 'EvenRecord',* FROM Employees)a 
WHERE EvenRecord %2=0

---16---
SELECT * FROM (SELECT DENSE_RANK() OVER (ORDER BY Salary desc)AS drank , salary FROM Employees) tmp 
	WHERE drank=5

SELECT salary from Employees e WHERE 5 =
(SELECT COUNT(Salary) from Employees y where y.Salary>e.Salary)

---17---
SELECT * FROM (SELECT DENSE_RANK() OVER (ORDER BY Salary ASC)AS drank , salary FROM Employees) tmp 
	WHERE drank=4 

---18---

SELECT * FROM
(SELECT TOP 10 FirstName+' '+LastName 'NAME',EmployeeID  FROM Employees ORDER BY EmployeeID DESC )tmp
ORDER BY EmployeeID  ASC

---19---

SELECT DepartmentID,DepartmentName FROM Departments WHERE DepartmentID NOT IN 
(SELECT DepartmentID FROM Employees)

---20---

SELECT * FROM(
SELECT DENSE_RANK() over (order by salary desc) sal_rank,EmployeeID,FirstName,LastName,
Salary 
FROM Employees)EMP
WHERE SAL_RANK<=3

----21----

SELECT * FROM(
SELECT DENSE_RANK() over (order by salary ) sal_rank,EmployeeID,FirstName,LastName,Salary 
FROM Employees)EMP
WHERE SAL_RANK<=3


---22----

