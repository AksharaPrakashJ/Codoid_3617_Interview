
SELECT * FROM Employees

--1. Scalar function example
SELECT UPPER(Firstname) AS Firstname, LOWER(Lastname) AS Lastname FROM Employees

--3. Rename a Column in a table
EXEC sp_rename 'Employees.Hometown', 'City'

--4. Find duplicate records
SELECT Salary, COUNT(Salary) AS TotalCount FROM Employees
GROUP BY Salary
HAVING COUNT(Salary)>1

--5. Using distinct
SELECT Distinct(Salary) FROM Employees

--7. Print max salary for a particular department
SELECT MAX(Salary) FROM Employees WHERE Department='CSE'

--9. Display first 5 records from the table
SELECT TOP(5) * FROM Employees

--10. Display last 5 records from the table
SELECT TOP(5) * FROM Employees ORDER BY Id DESC

--11. Fetch 3rd highest salary using RANK function
SELECT * FROM
(SELECT *, RANK() OVER(ORDER BY Salary DESC) AS Ranking FROM Employees)
AS Result WHERE Ranking=3

--12. Create table with same structure with data of employee table
SELECT * INTO EmployeesNew1
FROM Employees

SELECT * FROM EmployeesNew1

--13. Query to get information of employee where Employee is not assigned to the department
SELECT * FROM Employees WHERE Department is NULL