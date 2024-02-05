USE vikass
go				-- View is a Predefined SQL Query

--In SQL, a view is a virtual table based on the result set of an SQL statement.
--The CREATE VIEW command creates a view.



DROP VIEW V_Employee_List
GO
CREATE VIEW V_Employee_List									-- Name of the View
AS
	SELECT	E.ID, Name, Gender, EP.Height, EP.Weight		-- SQL Statement that will be encapsulated inside the view
	FROM	Employee E
	JOIN	Employee_Personal_Info EP 
	ON E.ID	= EP.ID
GO



CREATE VIEW Employeemdetails
AS
SELECT * FROM Employee 

SELECT * FROM Employeemdetails         -- whole table can be created for the view

DROP VIEW Employeemdetails





SELECT	* 
FROM	V_Employee_List		-- This View can be used like a virtual table in FROM clause.
Where	Weight	> 80		-- WHERE condition and all other operations can be performed on top of it.


CREATE VIEW V_Employee_List_Nested		-- Nested View can be created by referring another view inside in it.
AS
SELECT * FROM V_Employee_List_Mumbai

SELECT	* 
FROM	V_Employee_List_Nested