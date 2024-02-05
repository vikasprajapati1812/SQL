
DROP INDEX Employee.idx_employee_ci					-- Syntax to DROP an index

CREATE CLUSTERED INDEX idx_employee_ci				-- Name of the Index
ON Employee											-- On Which Table this index to be created
(ID)												-- On whcih column this index to be created
GO

SELECT *
FROM	Employee
Where	ID	= '10005'

CREATE NONCLUSTERED INDEX idx_employee_nc1
ON Employee (location)

GO
CREATE NONCLUSTERED INDEX idx_employee_nc2
ON Employee (department, name)						-- Multiple columns can be specified
GO



DROP INDEX emplpoyee.idx_employee_nc2


--THERE MAY BE ONLY ONE CLUSTERED INDEX FOR A TABLE 
-- AND THERE MAY BE N NO. OF THE NONCLUSTERED INDEX FOR A TABLE 
