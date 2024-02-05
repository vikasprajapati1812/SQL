USE vikass
go


-- Order by Function

SELECT	*
FROM	Employee
ORDER BY Name DESC		-- Default is Ascending order and DESC needs to be mentioned for Descending Order

SELECT	*
FROM	Employee
ORDER BY DOJ DESC		-- Default is Ascending order and DESC needs to be mentioned for Descending Order

-- DESC, Date, Numeric fields

SELECT	*
FROM	Employee
ORDER BY Department ASC, Name DESC		-- Multiple columns can be given in the ORDER BY

-- Functions in the Order by 

SELECT	YEAR(DOJ) 'Joining Year', *
FROM	Employee
ORDER BY YEAR(DOJ)	-- System functions can be used for sorting in the ORDER BY

-- Simple numbering in the Order by 

SELECT	Location, Department, Name
FROM	Employee
ORDER BY Department

SELECT	Location, Department, Name  
FROM	Employee
ORDER BY Name		-- This will sort based on second column in the SELECT column List

SELECT	Department, Name
FROM	Employee
ORDER BY 3		-- This will throw error as there is no third column in the SELECT column List

SELECT	*
FROM	Employee
ORDER BY 3 DESC
