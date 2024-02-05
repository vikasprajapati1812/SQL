
-- MERGE STATEMENT
DROP TABLE Employee1
DROP TABLE Employee_Updated

CREATE TABLE Employee1
(
ID			INT NOT NULL PRIMARY KEY,
Name		Varchar(40),
Department	Varchar(40)
)
GO
INSERT INTO Employee1
Values (10001,'Rama','Human Resource'),
(10002,'David','Purchasing'),
(10003,'Sharma','Sales'),
(10005,'Sheik','Delivery'),
(10006,'Uma','Delivery'),
(10007,'Franklin','Sales'),
(10008,'Dinesh','Leadership'),
(10009,'Farook','Delivery'),
(10010,'Jeniffer','Purchasing')
GO
SELECT	* 
FROM	Employee1
GO

-- New Input Table with the changes
CREATE TABLE Employee_Updated
(
ID			INT NOT NULL,
Name		Varchar(40),
Department	Varchar(40)
)
GO
INSERT INTO Employee_Updated
Values (10001,'Rama','Human Resource'),
(10002,'David','Purchasing'),
(10003,'Sharma','Sales'),
(10004,'Chitra','Human Resource'),
(10005,'Sheik','Support'),
(10006,'Uma','Delivery'),
(10007,'Franklin','Sales'),
(10008,'Dinesh','Leadership'),
(10010,'Jeniffer','Purchasing'),
(10011,'Mohammad','Delivery')
GO
SELECT	* 
FROM	Employee_Updated
GO


-- DONT Execute the BELOW INSERT, DELETE and UPDATE STATEMENTS. This is just to show How the below three statements can be combined and executed using MERGE Statement

-- Inserting New Records

INSERT INTO Employee1
SELECT	* 
FROM	Employee_Updated EU
LEFT JOIN Employee1 E
ON E.ID = EU.ID
WHERE E.ID IS NULL

-- Deleting Exited Employee Records

DELETE Employee1
FROM Employee1 E
LEFT JOIN Employee_Updated EU
ON E.ID = EU.ID
WHERE EU.ID IS NULL

-- Updating the Modified Department Value 

UPDATE	Employee1 
SET		Department	= EU.Department
FROM	Employee1 E1
JOIN	Employee_Updated EU
ON		E1.ID = EU.ID
WHERE	E1.Department <> EU.Department

GO
SELECT *
FROM Employee1 
GO


SELECT *
FROM Employee_Updated

-- Instead of 3 separate queries for INSERT, UPDATE and DELETE, we can execute a single MERGE statement


-- MERGE SYNTAX. Don't Execute. This is just for Syntax 
 
MERGE <target_table> [AS TARGET]
USING <table_source> [AS SOURCE]
ON <search_condition>
[WHEN MATCHED 
   THEN <merge_matched> ]
[WHEN NOT MATCHED [BY TARGET]
   THEN <merge_not_matched> ]
[WHEN NOT MATCHED BY SOURCE
   THEN <merge_matched> ];


   -- Actual MERGE Statement

MERGE Employee1 AS TARGET
USING Employee_Updated AS SOURCE 
ON (TARGET.ID = SOURCE.ID)   -- JOIN CONDITION
--When records are matched, update the records if there is any change

WHEN MATCHED AND (TARGET.Department <> SOURCE.Department) -- ID Matching But Values are different
THEN UPDATE SET TARGET.Department = SOURCE.Department

--When no records are matched, insert the incoming records from source table to target table
WHEN NOT MATCHED BY TARGET 
THEN INSERT (ID, Name, Department) VALUES (SOURCE.ID, SOURCE.Name, SOURCE.Department)

--When there is a row that exists in target and same record 
-- does not exist in source then delete this record target

WHEN NOT MATCHED BY SOURCE 
THEN DELETE 

--$action specifies a column of type nvarchar(10) in the OUTPUT clause that returns 
--one of three values for each row: 'INSERT', 'UPDATE', or 'DELETE' 
-- according to the action that was performed on that row
OUTPUT $action, 
DELETED.ID AS TargetID, 
DELETED.Name AS TargetName, 
DELETED.Department AS TargetDepartment, 
INSERTED.ID AS SourceID, 
INSERTED.Name AS SourceName, 
INSERTED.Department AS SourceDepartment; 
GO

-- The above MERGE statement will also display the impacted records. 
