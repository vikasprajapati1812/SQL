USE vikass
GO

drop table Customer
create table Customer
(
Customer_id int primary key,
first_name varchar(25)not null,
last_name varchar(25),
email varchar(40)not null,
address varchar(60)not null,
city varchar(20),
state varchar(20),
zip int not null
)
GO

select *
from customer

select customer_id ,first_name,email
from customer

insert into customer            -- inserting records to customer table--DML
(customer_id, first_name,last_name,email,address,city,state,zip)  --list of the columns for which values to be displayed
VALUES(1,'David','warner','davidwarner@yahoo.com','qwertryuiop','San JOSE','California',845121),
(2,'Govind','sharma','Govindsharma@gmail.com','asdfghjkl','Ghaziabad','UttarPradesh',201009),
(3,'Vijay','Kumar','vijaykumarpr','lalkuanghaziabad','hyderabad','Karnataka',464655),
(4,'Vikas','prajapati','vikasprajapativi@rediff.com','ttftfutffy','trombay','Mumbai',986444),
(5,'Ayush','verma','ayushvermami@yahoo.com','zxcvbnm','idduki','kerala',454543)

select *
from Customer

select first_name,last_name
from customer

select first_name,city
from customer
where first_name like 'G%' 
or city='san jose'


select first_name,city
from customer
where first_name like 'G%' 
or city='san jose'
or address='asdfghjkl'


select first_name,city
from customer
where first_name like 'G%' 
or city='san jose'
or address='lalkuanghaziabad'

select first_name,city
from customer
where first_name like 'G%' 
and city='san jose'           -- doesnot show any result as there is 'and' written that means when both conditions are true then it shows result





select *
from Customer

select first_name,city
from customer
where first_name like 'G%' 
or city='san jose'
or address='lalkuanghaziabad'  --here we have written or thats help us to withdraw all the data  so it will give all 3 results
GO


select *
from Customer


select first_name,city
from customer
where first_name like 'G%' 
OR( city='san jose'
AND address='qwertyuiop')  --here we have written or thats help us to withdraw all the data  so it will give all 3 results
