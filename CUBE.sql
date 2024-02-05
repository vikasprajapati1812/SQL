USE vikass
GO
-- CUBE Example

-- Group by with CUBE sub clause
  
	SELECT	COALESCE(department, 'All') AS Department,
			COALESCE(location,'All') AS location,
			SUM(salary) AS Salary_Sum
	FROM	employee
	GROUP BY CUBE (location, department)
	ORDER BY department, location				-- Cube will generate subtotals for all combinations and grandtotal as well.






--COMPARE below both

-- Rollup for department, location

	SELECT	COALESCE(department, 'All') AS Department,
			COALESCE(location,'All') AS location,
			SUM(salary) AS Salary_Sum
  FROM	employee
  GROUP BY ROLLUP (department, location)

  SELECT	COALESCE(department, 'All') AS Department,
			COALESCE(location,'All') AS location,
			SUM(salary) AS Salary_Sum
  FROM	employee
  GROUP BY ROLLUP (location, department)



SELECT	COALESCE(department, 'All'),  -- since fn use over column so have to give the column name else shows no column name
		COALESCE(location,'All'),
		SUM(salary) AS Salary_Sum	--since we use aggregate fn in column we have to give colun name else it shows no column name 
FROM	employee
GROUP BY ROLLUP (location, department)
  
  
SELECT	Department,				
		location,
		SUM(salary) AS Salary_Sum	-- if dont use aggregate fn ,it shows the existing column name
FROM	employee
GROUP BY ROLLUP (location, department)
