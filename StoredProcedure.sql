STORED PROCEDURE

/*--A stored procedure is a prepared SQL code that you can save, so the code can be reused over and over again.
So if you have an SQL query that you write over and over again, save it as a stored procedure,
and then just call it to execute it.
You can also pass parameters to a stored procedure, 
so that the stored procedure can act based on the parameter value(s) that is passed
*/


USE vikass
-- View is a Predefined SQL Query
GO

CREATE PROC SP_Employee_List @Department VARCHAR(20), @Location VARCHAR(20)		-- Procedure name with Parameters with data types
AS
BEGIN
	-- Logic is written inside the BEGIN & END block

	SELECT	ID, Name, Department, Location
	FROM	Employee
	WHERE	Department	= @Department		-- Parameters are referred in the inside queries
	AND		Location	= @Location

END

GO

EXEC SP_Employee_List 'SALES', 'Mumbai'	-- Execute the procedure by passing the parameters


DROP PROC SP_Employee_List
GO

CREATE PROC SP_Employee_List @Department VARCHAR(20), @Location VARCHAR(20) = 'chennai'		-- You can create a procedure with optional parameter by passing default value
AS
BEGIN
	
	IF @Location NOT IN ('Mumbai','Chennai','Bengaluru')		-- Error handling can be done inside a procedure
		BEGIN
			SELECT 'Invalid Location'
			RETURN												-- RETURN statement will terminate the stored procedure execution.
		END

	SELECT	ID, Name, Department, Location
	FROM	Employee
	WHERE	Department	= @Department
	AND		Location	= @Location

END

EXEC SP_Employee_List 'Delivery'		-- Here 2nd parameter default value of mumbai will be used

EXEC SP_Employee_List 'Delivery', 'Bengaluru121212'		-- Since 2nd parameter is passing a junk value, the error handling block we have written inside the procedure will throw error message and the exit the proceure execution


