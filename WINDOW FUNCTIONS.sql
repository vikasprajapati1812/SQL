
-- WINDOW FUNCTIONS


SELECT	Department,
		ID,
		name
FROM	Employee

-- RANK Employees for each department

SELECT	Department,
		ID,
		name,
		RANK() OVER (ORDER BY Department) Rank_No -- RANK Function
FROM	Employee



-- DENSE RANK Employees for each department

SELECT	Department,
		ID,
		name,
		DENSE_RANK() OVER (ORDER BY Department) Rank_No
FROM	Employee




-- Row Number for each department

SELECT	Department,
		ID,
		name,
		ROW_NUMBER() OVER (ORDER BY Department) Row_No
FROM	Employee




-- Percent Rank Based on Salary amount

SELECT	Department,
		ID,
		name,
		Salary,
		FORMAT(PERCENT_RANK() OVER (ORDER BY Salary),'P') Rank_No
FROM	Employee




-- Partition bu department

SELECT	Department,
		ID,
		name,
		RANK() OVER (PARTITION BY Department ORDER BY Name DESC) Rank_No
FROM	Employee




-- FIRST VALUE and Last Value functions

SELECT	Department,
		Name,
		Experience,
		FIRST_VALUE(name) OVER (Partition by Department ORDER BY experience) Young_Employee,
		LAST_VALUE(name) OVER (Partition by Department ORDER BY experience RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) Most_Experienced
FROM	Employee

