-- CASE STUDY------------

CREATE DATABASE HANDSON

CREATE TABLE Location(location_Id INT PRIMARY KEY,City VARCHAR(30))
INSERT INTO Location
VALUES
(122,'New York'),
(123,'Dallas'),
(124,'Chicago'),
(167,'Boston')


SELECT *
FROM Location

DROP TABLE Location


DROP TABLE Department

CREATE TABLE Department (department_Id INT PRIMARY KEY,Name VARCHAR(30),DLocation_ID INT
FOREIGN KEY(DLocation_ID) references location(Location_Id))
-- only primary key column can be a foreign key

INSERT INTO Department 
VALUES
(10,'Accounting',122),
(20,'SAles',124),
(30,'Reserch',123),
(40,'Operation',167)
GO

SELECT *
FROM Department


DROP TABLE Job

CREATE TABLE Job(Job_ID int PRIMARY KEY,Designation VARCHAR(30))
INSERT INTO Job 
VALUES
(667,'Clerk'),
(668,'Staff'),
(669,'Analyst'),
(670, 'Sales Person'),
(671,'Manager'),
(672,'President')
GO


SELECT *
FROM Job
DROP TABLE Job


DROP TABLE Employe
CREATE TABLE Employe (employee_Id INT PRIMARY KEY, Last_name VARCHAR(30),First_name VARCHAR(30),
Middle_name VARCHAR(30),eJob_ID INT,Manager_Id INT, Hire_Date DATE, Salary INT,Comm INT,
eDepartment_Id INT,
foreign key(ejob_ID) references Job(Job_ID),
foreign key (edepartment_ID) references department(department_Id))

INSERT INTO Employe
VALUES
(7369, 'SMITH', 'JOHN', 'Q',667, 7902, '1984/12/17' ,800, NULL, 20),
(7499, 'ALLEN', 'KEVIN', 'J', 670 ,7698, '1985/02/20', 1600, 300, 30),
(7505 ,'DOYLE', 'JEAN' ,'K' ,671 ,7839 ,'1985/04/04' ,2850 ,NULL ,30),
(7506, 'DENNIS', 'LYNN', 'S', 671, 7839, '1985/05/15',2750 ,NULL ,30),
(7507, 'BAKER', 'LESLIE', 'D', 671, 7839, '1985/06/10 ',2200 ,NULL ,40),
(7521 ,'WARK' ,'CYNTHIA' ,'D' ,670 ,7698 ,'1985/02/22' ,1250 ,500 ,30)
GO

SELECT * 
FROM Employe




dbo-- database object 

-- TO RENAME th column (IT SHOULD BE NOT IN PRACTISE AS IT WARNS)

sp_rename 'Location.location_Id','loc_Id','column'
select * from Location
sp_rename 'location.loc_id','location_id','column'
