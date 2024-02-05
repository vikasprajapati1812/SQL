USE vikass


-- Group by Department

SELECT	*
FROM	Employee

-- List Department wise total salary

SELECT	Department, SUM(Salary) Total_Salary		-- Aggregate Fucntion
FROM	Employee
GROUP BY Department									-- Group by column

COUNT	-- Count the records
SUM		-- Add the values
AVG		-- Average of the values
MIN		-- Min of the values
MAX		-- Max of the values


SELECT	Department, SUM(Salary)
FROM	Employee
GROUP BY 1						-- 1 will not work in group like how it works in Order by

-- List down the Department wise Total Experience, Max Experience, etc FOR 'Delivery' & 'Sales' Department

SELECT	Department, 
		SUM(Experience) 'Total Experience',
		MAX(Experience) 'Max Experience', 
		MIN(Experience) 'Min Experience', 
		AVG(Salary) 'Average Salary', 
		COUNT(*) Total_Headcount		-- Multiple aggregate functions can be performed in a single GROUP BY statement
FROM	Employee
GROUP BY Department
ORDER BY Department DESC

GO

-- Creating a new table called location to show the grouping can be done on another table's column

SELECT * FROM Location

CREATE TABLE Location
(
Location_City	VARCHAR(40),
Location_State	VARCHAR(40)
)
GO
INSERT INTO Location
Values ('Mumbai','Maharastra'),
('Pune','Maharastra'),
('Bengaluru','Karnataka'),
('Hyderabad','Telengana'),
('Chennai','Tamilnadu')

-- Group by Joining with another table with Hierarchy

SELECT	L.Location_State, COUNT(1) 'Head Count',			-- Group by table L column with aggregate functions on E table fields are possible as long as there is a relationship between them
		MAX(Experience) 'Max Experience', AVG(Salary) 'Average Salary'
FROM	Employee E JOIN Location L
ON E.Location = L.Location_City
GROUP BY L.Location_State


-- Group by Having Clause

-- List the Departments which has more than 2 employees

SELECT	Department, COUNT(*), COUNT(Alias_Name), COUNT(1) Head_Count
FROM	Employee
WHERE	Department IN ('Sales','Delivery')			-- WHERE Condition will be performed before aggregation
GROUP	BY Department


SELECT	Department, COUNT(1) Head_Count
FROM	Employee
WHERE	Department IN ('Sales','Delivery')			-- WHERE Condition will be performed before aggregation
GROUP	BY Department
HAVING COUNT(1)> 2			-- Having clause will be performed after aggregation. This is how it is different from WHERE condition



SELECT	Location, SUM(Salary)
FROM	Employee
GROUP BY Location


SELECT	Location, SUM(Salary)
FROM	Employee
GROUP BY Location 
HAVING (SUM(Salary)> 50000 AND COUNT(*) > 3)		-- Multiple conditions can be given in a HAVING Clause





-- Mathematical Operator inside SUM Function of GROUP BY Clause


ALTER TABLE Employee				-- Adding a new column to the employee table to showcase how a calculation can be done inside an aggregation fucntion
ADD Bonus DECIMAL(10,2)

UPDATE	Employee
SET		Bonus	= 3000.00
WHERE	Name	= 'Janani'

UPDATE	Employee
SET		Bonus	= 5000.00
WHERE	Name	= 'Farook'

UPDATE	Employee
SET		Bonus	= 4000.00
WHERE	Name	= 'David'

SELECT	* FROM Employee

-- List down the Departments where the total Salary + Bonus is greater than 50000

SELECT	Department, SUM(Salary + ISNULL(Bonus,0))sumsalary		-- Two column addition happens inside the SUM aggregate function.
FROM	Employee
GROUP	BY Department 
HAVING	SUM(Salary + ISNULL(Bonus,0)) >= 50000			-- Having caluse is being applied using the same aggregate function



-- GROUP BY HAVING WITH TWO CONDITION












SELECT	Department, SUM(Salary + ISNULL(Bonus,0)), COUNT(1)		-- ISNULL is being used to handle the NULL records with default value
FROM	Employee
GROUP	BY Department 
HAVING	(SUM(Salary + ISNULL(Bonus,0)) >= 50000 AND COUNT(1) > 1)




-- Splitting into two columns (with CASE Statement)

SELECT	Name,
		Gender,
		CASE Gender WHEN 'Male' THEN 1 ELSE 0 END 'Male',
		CASE Gender WHEN 'Female' THEN 1 ELSE 0 END 'Female'
FROM	Employee

-- Show me the number of employees Male & Female Department wise in a separate column

SELECT	Department, 
		SUM(CASE Gender WHEN 'Male' THEN Salary ELSE 0 END) 'Male Salary',			-- Case statement can be used to split columns based on record values
		SUM(CASE Gender WHEN 'Female' THEN Salary ELSE 0 END) 'Female Salary'
FROM	Employee
GROUP	BY Department

SELECT	Department, 
		COUNT(CASE Gender WHEN 'Male' THEN 1 ELSE NULL END) 'Male Headcount',			-- Case statement can be used to split columns based on record values
		COUNT(CASE Gender WHEN 'Female' THEN NULL ELSE 1 END) 'Female Headcount'
FROM	Employee
GROUP	BY Department



SELECT	SUM(CASE Department WHEN 'Sales' THEN Salary ELSE 0 END) 'Sales Dept Salary',
		SUM(CASE Department  WHEN 'Purchasing' THEN Salary ELSE 0 END) 'Purchasing Dept Salary'
FROM	Employee


SELECT	Department, 
		Gender,				-- This will show gender wise aggregate values record wise whereas the CASE statement example above will show in separate columns
		SUM(Salary)	
FROM	Employee
GROUP	BY Department, Gender		
ORDER BY Department, Gender
