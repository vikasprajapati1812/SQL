USE vikass
GO

CREATE TABLE Employee_Location_Count		-- Creating new summary table to stored the employee count for each location
(
Location	VARCHAR(20),
Emp_Count	INT
)
GO

INSERT INTO Employee_Location_Count			-- Populating the table with the aggregated data from the employee table
SELECT	Location, COUNT(*)
FROM	Employee
GROUP BY Location

SELECT * 
FROM	Employee_Location_Count;			-- Executing this query to check the current records in the summary table






-- Employee_Location_Count Needs to be updated whenever a new employee record is inserted into the employee table


CREATE TRIGGER tr_Employee_up				-- Trigger name
ON Employee									-- On which TABLE this will be triggered
AFTER INSERT, UPDATE, DELETE				--- When this will be triggered
AS
BEGIN

-- Deleting and Reinserting the aggregated data from the employee table which includes new employee record as well

	DELETE FROM Employee_Location_Count		

	INSERT INTO Employee_Location_Count
	SELECT	Location, COUNT(*)
	FROM	Employee
	GROUP BY Location

END
GO 

INSERT INTO Employee
(ID,Name,Department,Gender,DOJ,Location,Role,Experience,Salary) -- List of columns for which values will be provided
VALUES (10011,'Rani','Purchasing','Female','2021-05-12','Chennai','Executive - Purchase',5,20000.00)

SELECT	* 
FROM	Employee_Location_Count	-- Checking if it reflects the data with the new employee record
GO

DELETE FROM Employee
WHERE ID=10011
-- Below trigger is created to not allow any new employee record to get inserted into employee table. It is not allowed

GO

CREATE TRIGGER tr_Employee_cr
ON Employee					-- Table against which this trigger is created
INSTEAD OF INSERT			-- When this should be triggered. This trigger will get fired even before the record gets inserted
AS
BEGIN
	RAISERROR ('Cannot add New Employee Records', 16, 10)
END
GO 

-- Trying to insert a new employee record. But the result will be an error message

INSERT INTO Employee			
(ID,Name,Department,Gender,DOJ,Location,Role,Experience,Salary) 
VALUES (10012,'Raja','Purchasing','Male','2021-05-12','Chennai','Executive - Purchase',5,20000.00)


SELECT	* 
FROM	Employee			-- You will find that 10012 employee record will not present in the employee table