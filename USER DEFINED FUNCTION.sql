
-- Definition of User Defined Function

-- SCALAR FUNCTION

CREATE FUNCTION UDF_exp_level(@exp INT)
RETURNS VARCHAR(10)
AS
BEGIN
	DECLARE @exp_Level VARCHAR(10)							-- Declaring Variable

	SELECT @exp_Level = CASE WHEN @exp < 2 THEN 'FRESHER'  -- Assigning a Value to the variable based on the CASE 
			WHEN @exp < 5 THEN 'ENGINEER' 
			WHEN @exp < 10 THEN 'MANAGER' 
			ELSE 'LEADER' END 

			RETURN @exp_Level
END




-- Call of User Defined Function


SELECT dbo.UDF_exp_level(6)	-- we can separately call the function


SELECT Name, experience, dbo.UDF_exp_level(experience) exp_level -- We can pass a column as a parameter to the Function 
FROM Employee



-- TABLE VALUED FUNCTION

CREATE FUNCTION Dept_Employees (@Dept VARCHAR(40))
RETURNS TABLE
AS
RETURN (SELECT name, Gender, Location from Employee where Department = @Dept)


SELECT	*
FROM	dbo.Dept_Employees('Sales') -- Use the table valued function (Result set) as a table in a FROM clause



CREATE FUNCTION Total_Amount(@Price Decimal(5,2), @Qty INT)  -- user defined function with two paramters
RETURNS Decimal(20,2)
AS
BEGIN
	DECLARE @Total_Amount Decimal(20,2)

	SELECT @Total_Amount  = @Price * @Qty
	
	RETURN @Total_Amount 
END

SELECT dbo.Total_Amount(4.2, 5), dbo.Total_Amount(6, 50) -- Calling function twice in a single select statement

DECLARE @Age INT						-- Declaration
SELECT @Age = 10						-- Initialization/Assignment
SELECT @Age								-- Printing output
SELECT @Age = Experience FROM Employee	-- Assigning value from a table result set
SELECT @Age								-- Printing output	



select	TOP 3 * -- Control the number of records in the result set 
FROM	Employee 
ORDER BY Salary, Gender -- Order by Ascending Order

select	* -- Control the number of records in the result set 
FROM	Employee 

select	TOP 3 * 
FROM	Employee 
ORDER BY Salary DESC	-- Descending Order










CREATE FUNCTION MULTIPLY(@NUM1 INT,@NUM2 INT)
RETURNS int ---Print Output
as
Begin 
declare @result int               --creating the variable to store the value 
set @result=@NUM1 *@NUM2
return @result  -- taking out the value from the block
end

select dbo.multiply(10,10) as Result   -- calling function 
select *,dbo.multiply(Quantity,Price) as 'Total Amount' from Orderdetails











--instead of creating you can alter the fn if already created use

--CREATE  OR ALTER FUNCTION MULTIPLY(@NUM1 INT,@NUM2 INT)