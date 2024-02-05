
-- TOP Operator will restrict the output record count

-- Interview Question: List the top 3 most experienced employee



SELECT	TOP 3 Name, Department, Experience
FROM	Employee
ORDER BY Experience DESC


-- Employee with Minimum Experience Using a Variable needs both TOP and ORDER BY

DECLARE @MinExperience INT, @Name VARCHAR(20)

SELECT	TOP 1 @MinExperience = Experience, @Name = Name
FROM	Employee
WHERE	Department = 'Sales'
ORDER BY Experience

SELECT	@MinExperience , @Name
go


DECLARE	@MinExperience int
SELECT	ID, Name, Experience
FROM	Employee
ORDER BY Experience

SELECT	@MinExperience 




DECLARE @5thExperience INT	-- Declaration
SELECT	TOP 5  @5thExperience  = Experience	-- Assignment
FROM	Employee
ORDER BY Experience DESC

SELECT	@5thExperience		-- Output

--

DECLARE @7thExperience INT	-- Declaration
SELECT	TOP 7 @7thExperience  = Experience	-- Assignment     
FROM	Employee
ORDER BY Experience DESC

SELECT	@7thExperience		-- Output                    



DECLARE @7thNAME VARCHAR(20)	-- Declaration
SELECT	TOP 7 @7thNAME = Name	-- Assignment     
FROM	Employee
ORDER BY Experience DESC

SELECT	@7thNAME		-- Output                    



DECLARE @7thNAME VARCHAR(20)	-- Declaration
SELECT	TOP 7 @7thNAME = Name	-- Assignment     
FROM	Employee
ORDER BY Name DESC

SELECT	@7thNAME		-- Output                    



DECLARE @TotalRecords INT
SELECT @TotalRecords = Experience FROM Employee
SELECT @TotalRecords

SELECT *
FROM Employee
ORDER BY Name DESC