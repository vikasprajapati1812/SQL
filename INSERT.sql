
-- INSERT STATEMENT
DROP TABLE Employee_personal_info
Go

DROP TABLE Employee_personal_info1
Go
DROP TABLE Employee_personal_info2
Go


SELECT *
FROM	Employee_Personal_Info


CREATE TABLE Employee_Personal_Info
(ID int , height FLOAT ,weight DECIMAL(5,2))
-- Single Record Insertion

INSERT INTO Employee_Personal_Info
VALUES(10006, 6.1, 100)

-- Multiple Records Insertion

INSERT INTO Employee_Personal_Info
VALUES
(10007, 6.1, 100),
(10008, 5.9, 92)

-- INSERTING only selected Fields

INSERT INTO Employee_Personal_Info
(ID, Height)
VALUES
(10009, 6.1),
(10010, 5.9)



-- INSERT using SELECT statement

INSERT INTO Employee_Personal_Info     -- Using SELECT  we can also insert data instead of using VALUES
SELECT	10013,5.7,92





-- INSERT records from exists records from a table
create table Employee_Personal_Info1
(eid int , eweight decimal(5,2))
go

INSERT INTO Employee_Personal_Info1		-- to use insert into first the table has to be created 
SELECT	id ,weight						-- ONLY SPECIFIED COLUMN TO COPY
FROM	Employee_Personal_Info
go

create table Employee_Personal_Info2
(id INT ,height FLOAT, weight DECIMAL(5,2))
GO



INSERT INTO Employee_Personal_Info2
SELECT	*													-- to use insert into first the table has to be created 
FROM	Employee_Personal_Info
GO







-- to DELETE  A SPECIFIED RECORD 
DELETE   
from Employee_Personal_Info
WHERE ID=10013					-- IF SUpposed there are 2 ids of 10013 it will delete the both records


SELECT * FROM Employee_Personal_Info1

SELECT * FROM Employee_Personal_Info2




-- COPYING ALL TABLE TO THE ANOTHER TAABLE IN SAME DATABASE

SELECT * INTO Employee_Personal_Info1
FROM Employee_Personal_Info
go


select * from Employee_Personal_Info1

