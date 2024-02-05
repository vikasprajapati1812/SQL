-- FUNCTIONS

--AGGREGATE FUNCTIONS

SELECT	*
FROM	Employee


SELECT	COUNT(E.ID) 'No_of_Employees', SUM(E.Salary) 'Total Salary', -- with Column name in the result set
		AVG(E.Salary)avgsalary, Max(E.Salary)maxsalary, MIN(E.Salary)minsalary 
FROM	Employee E
WHERE	E.Location	= 'Mumbai'





SELECT	 STDEV(Salary)standarddeviation
FROM	Employee
















-- DATE TIME FUNCTIONS

SELECT	CURRENT_TIMESTAMP, GETUTCDATE(), GETDATE(), SYSDATETIMEOFFSET()





SELECT DATENAME(ww,'2022-09-11'), DATENAME(WEEKDAY,'2022-09-11'), DATENAME(mm,'2022-09-11'), DATENAME(dd,'2022-09-11')

SELECT DATENAME(ss,GETDATE()), DATENAME(mi,GETDATE())

, DATENAME(WEEKDAY,'2022-09-11'), DATENAME(mm,'2022-09-11'), DATENAME(dd,'2022-09-11')


SELECT DATEPART(mm,'2022-02-05'), DATEPART(WEEKDAY,'2022-09-11')



SELECT	Name, DOJ, DATENAME(weekday,DOJ), DATENAME(ww, DOJ)
FROM	Employee

SELECT	DATENAME(ww, GETDATE())



SELECT DAY('2022-02-05'), MONTH('2022-02-05'), YEAR('2022-02-05')


SELECT	DATENAME(Weekday,DOJ) , DAY(DOJ), MONTH(DOJ), YEAR(DOJ), DOJ
FROM	Employee


SELECT	DATEADD(yy,-5,'2022-01-01')
SELECT	DATEADD(yy,-5,GETDATE())
SELECT	DATEADD(yy,-5,DOJ)
FROM	Employee




-- SELECT CONVERT(DATETIME, '2022-27-05',103)


SELECT DATEDIFF(dd,'2022-01-01','2021-09-11'), DATEDIFF(mm,'2022-01-01','2022-09-11')







SELECT DATEADD(yyyy,-1,'2022-08-01')


SELECT DATEDIFF(dd,GETDATE(), EOMONTH(GETDATE()))



SELECT DATEFROMPARTS('2022','5','2'), DATEFROMPARTS(Joined_Year, Joined_Month, Joined_Date) FROM Employee



SELECT ISDATE('2022-05-02'), ISDATE('2022sds0230') 

SELECT	Name, UPPER(name), LOWER(Name), REVERSE(Name), SUBSTRING(name,2,3), LEN(name),
ISNULL(Alias_Name, 'No Alias') ISNULL_Value, IIF(Alias_Name IS NULL, 'TRUE - NULL','FALSE - VALIDA VALUE')
FROM	Employee

SELECT *
FROM	Employee


-- STRING FUNCTIONS

ALTER TABLE Employee
ADD Alias_Name VARCHAR(40)
GO

UPDATE	Employee
SET		Alias_Name	= 'Frank ' 
WHERE	name		= 'Franklin'
GO
-- STRING Functions

 -- String Function CHARINDEX will return the starting position of a character @


SELECT CHARINDEX('@','ravishanker@gmail.com')


SELECT CHOOSE(4,'India','China','USA')


-- CONVERT Functions

SELECT	CAST('0' AS INT) CAST_INT, TRY_CAST('8' AS INT) CAST_INT, CONVERT(VARCHAR(3), Experience) Exp_Char
FROM	Employee


-- CASE FUNCTION

SELECT	Name, Experience, Department, 
		CASE WHEN Experience < 2 THEN 'FRESHER' 
			WHEN Experience < 5 THEN 'ENGINEER' 
			WHEN Experience < 10 THEN 'MANAGER' 
			ELSE 'LEADER' END 'Exp Level'
FROM	Employee
