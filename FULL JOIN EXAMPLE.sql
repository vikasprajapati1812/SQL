use model
GO


-- FULL JOIN EXAMPLE

CREATE TABLE Customer
(
CustomerNo		INT IDENTITY, -- IDENTITY COLUMN for Auto Increment
CustomerName	Varchar(40)
)
GO
INSERT INTO Customer
VALUES ('David'),
('Edwin'),
('Durai'),
('Revathy')
GO
SELECT * FROM Customer
GO

DROP TABLE Customer
DROP TABLE SalesOrder
CREATE TABLE SalesOrder
(
OrderNo		VARCHAR(10),
CustomerNo	INT,
OrderQty	INT,
OrderAmount	Decimal(10,2)
)
GO
INSERT INTO SalesOrder
VALUES ('SO001', 3, 10, 1000),
('SO002', 1, 5, 80),
('SO003', 4, 15, 100),
('SO004', 5, 10, 10)
GO
SELECT * FROM SalesOrder
GO
select * from Customer

-- List Orders with customers, Orders without Customer and Customers without any Order

SELECT	C.CustomerName, SO.OrderNo
FROM	Customer C
FULL JOIN SalesOrder SO
ON		C.CustomerNo = SO.CustomerNo
Where	C.CustomerNo IS NULL OR SO.OrderNo IS NULL

GO

----CHECK THE BELOW CODES WITH TABLE

SELECT	C.CustomerName, SO.OrderNo
FROM	Customer C
JOIN SalesOrder SO
ON		C.CustomerNo = SO.CustomerNo
GO

SELECT	C.CustomerName, SO.OrderNo
FROM	Customer C
RIGHT JOIN SalesOrder SO
ON		C.CustomerNo = SO.CustomerNo
GO

SELECT	C.CustomerName, SO.OrderNo
FROM	Customer C
LEFT JOIN SalesOrder SO
ON		C.CustomerNo = SO.CustomerNo
GO
