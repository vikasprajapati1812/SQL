
-- UNION IS TO COMBINE TWO RESULT SETS INTO ONE

SELECT 1 ID ,'Ravi' Name
UNION
SELECT 2, 'Shanker' 
UNION
SELECT	3, 'RS'

SELECT '1' ID, 2, 'chennai' City -- Headers will be based on 1st select list
UNION
SELECT '2', 3, 'mumbai'			-- All select clause should have same number of fields... And, corresponding fields should have same datatype
ORDER BY City						-- Order by will be after all union statement



SELECT	Department, Name
FROM	Employee
WHERE	Department = 'Sales'
UNION
SELECT	Department, Name
FROM	Employee
WHERE	Department = 'Purchasing'
UNION
SELECT	Department, Name
FROM	Employee
WHERE	Department = 'Delivery'



-- UNION ALL

SELECT '1'
UNION ALL
SELECT '1'

SELECT '1'
UNION				-- UNION will eliminate duplicate records
SELECT '1'


-- EXCEPT STATEMENT

SELECT	DISTINCT Department
FROM	Employee
WHERE	Gender = 'Male'

SELECT	DISTINCT Department
FROM	Employee
WHERE	Gender = 'Female'
ORDER BY Department

 
SELECT	Department
FROM	Employee
WHERE	Gender = 'Male'
EXCEPT
SELECT	Department
FROM	Employee
WHERE	Gender = 'Female'
ORDER BY Department



-- INTERSECT STATEMENT

SELECT	Department
FROM	Employee
WHERE	Gender = 'Male'
INTERSECT
SELECT	Department
FROM	Employee
WHERE	Gender = 'Female'
ORDER BY Department





-- EXCEPT & INTERSECT IS DIFFERENT FROM LEFT/RIGHT JOIN WITH ISNULL CONDITION. 
-- JOIN RELIES ON KEY COLUMNS WHERE AS EXCEPT & INTERSECT REFERS ALL COLUMNS

