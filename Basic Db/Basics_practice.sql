Select * from Customer;

--Sort data

Select * from Customer order by UserName;

--Limiting rows

Select top 3 * from Customer order by UserName;

select * from Customer order by UserName offset 5 rows;

select * from Customer order by UserName offset 0 rows Fetch first 5 rows only;

---Filtering data

select distinct UserName from Customer;

--select distinct * from Customer;

select UserId,UserName from Customer where UserId>100 and UserId<105;

select * from Customer where UserId in(100,105);

select * from Customer where UserId between 100 and 105;

select * from Customer where UserName Like 'A%'; 

select * from Customer where UserName Like '_A%';

select UserName as Name from Customer;


--Grouping data
select * from Customer group by State;

select * from Customer group by State having count(*)>2;

---Set Operations

select * from Customer where UserId<110 Union
Select * from Customer;

select * from Customer where UserId<110 Intersect
Select * from Customer;

Select * from Customer except
select * from Customer where UserId<110;

------------------------

select * from Employees;

Delete from Employees where age<21;

select name,max(salary) from Employees;
select * from Employees where name like 'A%';