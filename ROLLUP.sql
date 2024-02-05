USE vikass
  GO
DROP VIEW Employeetableview
CREATE VIEW Employeetableview
AS
SELECT *																	-- employee and employeetableview both will be same
from Employee
GO

SELECT *
FROM Employeetableview
GO



-- ROLLUP Example

-- Rollup for department alone

  SELECT	department AS Department,
			SUM(salary) AS Salary_Sum
  FROM		employee
  GROUP BY department
  GO


  SELECT department AS Department,
		SUM(salary) AS Salary_Sum
  FROM	employee
  GROUP BY ROLLUP (department)		-- ROLLUP and the Group up column can be given inside
  GO


  
  SELECT	department AS Department,
			SUM(salary) AS Salary_Sum
  FROM		employee
  GROUP BY ROLLUP (SUM(salary))                       -- it wont work 




-- Rollup for department with Coalesce to avoid NULL

  SELECT ISNULL(department, 'All Departments') AS Department,			-- as in output 'NULL' is replace by 'ALL Departments' 
		 SUM(salary) AS Salary_Sum
  FROM	employee
  GROUP BY ROLLUP (department)                       
  GO


-- Rollup for department, location

	SELECT	COALESCE(department, 'All') AS Department,
			COALESCE(location,'All') AS location,
			SUM(salary) AS Salary_Sum
  FROM	employee
  GROUP BY ROLLUP (department, location)
  GO


 -- compare reult with above

  SELECT ISNULL(department, 'All Departments') AS Department,			-- as in output 'NULL' is replace by 'ALL Departments' 
		 SUM(salary) AS Salary_Sum,
		 Location
  FROM	employee
  GROUP BY ROLLUP (Location,Department)
  GO
 
 
 
 
 
 
 -- COALESCE Vs ISNULL

  SELECT	Name, 
			Bonus, 
			ISNULL(Bonus, 0) 'ISNULL VALUE',
			COALESCE(NULL, Bonus, NULL, 0) 'COALESCE VALUE'           --ISNULL and COALESCE gives same results
  FROM		Employee												--but the COALECSE can use multiple options as shown

