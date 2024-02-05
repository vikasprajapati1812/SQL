-- JOINS

USE EmpDB
GO

GO
CREATE TABLE Employee_Personal_Info
(
ID				INT NOT NULL PRIMARY KEY,
HEIGHT			DECIMAL(4,1),			-- 999.9
WEIGHT			INT
)
GO
DELETE FROM Employee_Personal_Info
GO
INSERT INTO Employee_Personal_Info
VALUES 
(10001, 5.7, 72),
(10002,6.2, 91),
(10004, 5.5, 64),
(10005, 5.8, 83),
(11111,6,100)

-- Employee Table
SELECT	* 
FROM	Employee -- Main Employee Table

GO
SELECT	* 
FROM	Employee_Personal_Info

-- List all Male Employee's name who have provided their height and weight information.

-- INNER JOIN

SELECT	Employee.ID, Employee.Name, Employee_Personal_Info.HEIGHT, Employee_Personal_Info.Weight						-- SELECT CLAUSE
FROM	Employee  JOIN	Employee_Personal_Info		-- JOINING TABLES
ON		Employee_Personal_Info.ID	= Employee.ID	-- JOIN CONDITION

-- Table Alias

SELECT	E.Name, EP.HEIGHT , EP.Weight
FROM	Employee_Personal_Info EP		-- Table Alias is an alternate short name we can give to refer in the query for ease of usage
JOIN	Employee E
ON		EP.ID = E.ID

-- Multiple JOINs

SELECT	*
FROM	Employee E				-- Database Name Schema/Object Owner/Object Name
JOIN	Employee1 E1
ON		E.ID	= E1.ID
JOIN	Employee_Updated EU
ON		E.ID	= EU.ID

-- List all employees who has given weith & height

 -- INNER JOIN with WHERE Condition

SELECT	E.Name, EP.HEIGHT, EP.Weight						
FROM	Employee E JOIN	Employee_Personal_Info EP
ON		E.ID = EP.ID						-- JOIN Condition
WHERE	E.Gender = 'Male'					-- WHERE CONDITION
AND		E.Country = 'INDIA'


-- List all employees who has given weigth & height and who have not given

-- LEFT JOIN

SELECT	*
-- E.Name, EP.HEIGHT, EP.Weight						
FROM	Employee E LEFT JOIN	Employee_Personal_Info EP
ON		E.ID = EP.ID

SELECT	*
FROM	Employee -- Database Name Schema/Object Owner/Object Name

SELECT	*
FROM	Empdb.dbo.Employee -- Database Name Schema/Object Owner/Object Name

-- List all employees who have not given Height and Weight Information

SELECT	E.Name, EP.HEIGHT, EP.Weight
FROM	Employee E LEFT JOIN	Employee_Personal_Info EP
ON		E.ID = EP.ID		-- JOIN Condition
WHERE	EP.Height IS NULL	-- Addition WHERE Condition to filter the records who have given the weight & height

-- RIGHT JOIN

SELECT	* 
FROM	Employee E	RIGHT JOIN	Employee_Personal_Info EP -- RIGHT JOIN is vice versa of LEFT JOIN
ON	EP.ID = E.ID				-- JOIN CONDITION

-- List of Employee Records in Personal Info Table for which we don't have a valid employee record in the employee table

SELECT	* 
FROM	Employee E	RIGHT JOIN	Employee_Personal_Info EP -- RIGHT JOIN is vice versa of LEFT JOIN
ON	EP.ID = E.ID				-- JOIN CONDITION
WHERE	E.Name IS NULL

-- This will bring matching records from both the table + Extra records from them. 

SELECT	E.ID, E.Name, EP.ID, EP.HEIGHT, EP.Weight						
FROM	Employee E FULL JOIN	Employee_Personal_Info EP
ON		E.ID = EP.ID

-- You will notice 11111 Employee ID record exists only in the personal info table also gets listed in the full join query
