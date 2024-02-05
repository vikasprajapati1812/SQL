
SELECT	*
FROM	Employee


CREATE TABLE Employee_Leave			-- creating a new employee leave table
(
Employee_ID	INT,
Leave_Date	DATE,
Leave_Type	VARCHAR(20)
)

-- Grain		-- Level at which the data/records are stored in a table
-- Granularity	

-- employee Table				-- Employee is the grain
-- Employee_Leave	table		-- employee & date	-- is the grain

-- Employee Table Vs Employee Leave Table	--> Relationship	One:Many	(One employee -> Many employee leave records)


INSERT INTO Employee_Leave				-- Inserting records into leave table
VALUES
(10001, '2022-08-01','Sick Leave'),
(10001, '2022-08-02','Sick Leave'),
(10001, '2022-08-16','Casual Leave'),
(10004, '2022-08-10','Casual Leave'),
(10006, '2022-08-11','Sick Leave'),
(10006, '2022-08-12','Sick Leave'),
(10006, '2022-08-13','Sick Leave'),
(10009, '2022-08-08','Sick Leave'),
(10009, '2022-08-11','Sick Leave'),
(10010, '2022-08-21','Causal Leave'),
(10006, '2022-08-20','Causal Leave')



SELECT	ID, Name, EL.*
FROM	Employee E
JOIN	Employee_Leave EL ON E.ID = EL.Employee_ID


-- Regular Subquery

-- List the employees who have taken atleast one sick leave

SELECT	ID, Name		-- DISTINCT can help us solve the duplicate result set problem in some cases. But, it is costly. Instead we should use Sub Query
FROM	Employee E
JOIN	Employee_Leave EL ON E.ID = EL.Employee_ID		-- Normal JOIN will create problem if we join two tables of different GRAIN. 
WHERE	Leave_Type	= 'Sick Leave'








-- Regular Subquery for getting List the employees who have taken atleast one sick leave

SELECT	*
FROM	Employee E
WHERE	E.ID IN 
		(
		SELECT	Employee_ID						-- Subquery to get the list of employee leave records
		FROM	Employee_Leave EL
		WHERE	Leave_Type	= 'Sick Leave'
		)











SELECT	*
FROM	Employee E
WHERE	ID IN 
		(
		'10001',			-- This is how SQL will internally first generate the subquery result set from the INNER query which will be used in OUTER Query
		'10001',
		'10006',
		'10006',
		'10006',
		'10009',
		'10009')






-- Same functionality can be written using correlated sub-query as well

SELECT	*
FROM	Employee E		
WHERE	EXISTS (
		SELECT	Employee_ID 
		FROM	Employee_Leave EL
		WHERE	Leave_Type		= 'Sick Leave'
		AND		EL.Employee_ID	= E.ID				-- Correlated Subquery is like a Look up. for each record of the OUTER query, inner query will be evaluated
		)

OUTER Query intermediate result set is shown for your reference.
10001
10002
10003
10004
10005
10006
10007
10008
10009
10010




-- List the Employees and their total leaves taken

SELECT	ID, 
		Name, 
		(SELECT COUNT(*) FROM Employee_Leave EL WHERE EL.Employee_ID = E.ID) 'Total Leaves Taken'	-- Inline Sub-Query
FROM	Employee E


-- List all the employees who are residing in Mumbai

SELECT	*
FROM	Employee_Leave EL
JOIN	(
		SELECT	ID, Department, Salary + Bonus 'Sales with Bonus'
		FROM	Employee
		WHERE	Location		= 'Mumbai'
		) E										-- Derived Table using a Subquery. This can be used in complex SQL queries where you want to first derive the required dataset before JOINING/USING
ON	E.ID	= EL.Employee_ID
WHERE	E.Department = 'Delivery'


-- List all the employees who have taken both casual leave and sick leave

SELECT	*
FROM	Employee
WHERE	ID IN 
		(SELECT	Employee_ID
		FROM	Employee_Leave
		WHERE	Leave_Type = 'Sick Leave'
		AND		Employee_ID IN							-- Nested Subquery
				(
				SELECT	Employee_ID
				FROM	Employee_Leave
				WHERE	Leave_Type = 'Casual Leave'
				)
		)
