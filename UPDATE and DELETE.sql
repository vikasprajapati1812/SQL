-- UPDATE

USE EmpDB
GO

SELECT * 
FROM Employee
WHERE Name = 'David'	-- Select with WHERE Condition
GO

-- David is relocating to Mumbai

UPDATE	Employee				-- Updating a table record(s)
SET		Location	= 'Mumbai'	-- Field whose value is getting modified
WHERE	Name		= 'David'	-- With a where condition
AND		ID			= 10002		-- Multiple filter condition with AND operator

GO
SELECT	* 
FROM	Employee
WHERE	ID = 10002		-- Note: It is always better to apply filter on Primary key column ID then using name column which can contain same value for two employees and might cause an issue
GO

-- ID = 10002

-- All Employees in Pune are moving to Mumbai. Change their location

SELECT	* 
FROM	Employee
WHERE	Location = 'Pune';

UPDATE	Employee			-- Table to be MODIFIED
SET		Location = 'Mumbai'	-- New Value
WHERE	Location = 'Pune'	-- Affected Records

-- Update weight to 60 for the employee Chitra 

SELECT	E.Name, E.location, EP.HEIGHT, EP.Weight						
FROM	Employee_Personal_Info EP
JOIN	Employee E
ON		EP.ID = E.ID
GO

UPDATE	Employee_Personal_Info		-- Table in Which the Records to be modified
SET		Weight	= 60,					-- New Value
		Height	= 5.6
FROM	Employee_Personal_Info EP	-- Main table
JOIN	Employee E					-- Joining Table
ON		EP.ID = E.ID				-- JOIN condition
WHERE	E.Name = 'Chitra'			-- WHERE Condition



-- Removing an employee record

SELECT	*
FROM	Employee
WHERE	Name	= 'uma'

DELETE	
FROM	Employee
WHERE	ID	= '10006'

INSERT INTO Employee		-- How we can INSERT new record into the table again
(ID,Name,Department,Gender,DOJ,Location,Role,Experience,Salary)
VALUES(10006,'Uma','Delivery','Female','2020-01-01','Pune','Manager - Delivery',5,30000.00)

-- DELETE	FROM	Employee	-- This will delete all the records from the table

-- TRUNCATE TABLE Employee		-- All the records. I can't put a WHERE Condition.

-- Removal of Records with DELETE Statement
GO
DELETE	Employee_Personal_Info		-- REcords to be deleted
FROM	Employee_Personal_Info EP	
JOIN	Employee E
ON		EP.ID = E.ID
WHERE	EP.Weight BETWEEN 70 AND 80	-- where condition with RANGE operator

-- Modify Contact type of employee David with 'Landline' Value
GO
 SELECT Name, ContactNumber, ContactType
 FROM Employee_Contact
 JOIN Employee
 ON Employee_Contact.EmployeeID = Employee.ID
 Where Name = 'David'
 GO
 -- UPDATE with JOINING two tables

 UPDATE Employee_Contact
 SET ContactType = 'LandLine'
 FROM Employee_Contact
 JOIN Employee
 ON Employee_Contact.EmployeeID = Employee.ID
 Where Name = 'David'
 GO
 
 -- UPDATE with JOINING two tables and using Alias

 UPDATE EC
 SET EC.ContactType = 'Mobile'
 FROM Employee_Contact EC
 JOIN Employee E
 ON EC.EmployeeID = E.ID
 Where E.Name = 'David'
