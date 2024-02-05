
-- Conditional Statement

DECLARE @Dept VARCHAR(40) -- Declaring a Variable

SELECT @Dept = 'Purchasing' -- Initializing with a value

IF @Dept = 'Sales'	-- IF Condition
BEGIN				-- If Satisfied with the condition
	SELECT 'Sales Incentive'
END
ELSE IF @Dept = 'Purchasing'
BEGIN
	SELECT 'Purcase Incentive'
END
ELSE	-- If not Satisfied with the condition
BEGIN
	SELECT 'No Incentive'
END





IF NOT EXISTS (SELECT * FROM Employee Where Experience > 12)
BEGIN
	SELECT 'This company has experienced professionals'
END
ELSE
BEGIN
	SELECT 'This company does not have experienced professionals'
END
GO

-- WHILE LOOP STATEMENT

DECLARE @EMP_NUMBER_COUNTER INT		-- Declaration

SELECT @EMP_NUMBER_COUNTER = 10001	-- Initialization

WHILE (@EMP_NUMBER_COUNTER < 10005	)-- Loop Condition
BEGIN
	SELECT	ID, Name, Department
	FROM	Employee
	WHERE	ID <= @EMP_NUMBER_COUNTER

	SELECT  @EMP_NUMBER_COUNTER = @EMP_NUMBER_COUNTER + 1
END
