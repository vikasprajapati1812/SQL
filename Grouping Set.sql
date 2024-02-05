  USE EmpDB
  GO
 
  -- Grouping Sets

  SELECT	department, location,
			SUM(salary) AS Salary_Sum
  FROM		employee
  GROUP BY	GROUPING SETS (department,location)
  
  SELECT	department, location,
			SUM(salary) AS Salary_Sum
  FROM		employee
  GROUP BY	GROUPING SETS (department,())
  