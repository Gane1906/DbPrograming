select * from Employees;

--1
select * from Employees where department in
(select department from Employees group by department having sum(salary)>100000);

--2
select name,salary from Employees where salary in
(select max(Salary) from Employees);

--3
select name,age,department from Employees where department=
(select department from Employees where name='Laxmana');

--4
select name,salary,department from Employees e1 where salary>
(select avg(salary) from Employees e2 where e1.department=e2.department);

--5
select name,age from Employees where name in
(select name from Employees where age>25);

--Joins

--2
select s.*,d.DepartmentName,d.Location from Students as s
inner join Department as d
on s.DeptId=d.DepartmentId;

--3
select s.StudentName,d.Location from Students as s
inner join Department as d
on s.DeptId=d.DepartmentId;

--4
select s.*,d.HOD from Students as s
inner join Department as d
on s.DeptId=d.DepartmentId;

--1
Create table Orders
(
OrderId int primary key,
OrderName varchar(20),
OrderPrice int,
);

Alter table Orders add Brand varchar(20);

Insert into Orders values(101,'Refridgrator',65000,'LG');
Insert into Orders values(103,'Washing machine',39999,'Panasonic');
Insert into Orders values(104,'Smart Tv',40000,'One plus');
Insert into Orders values(105,'AirConditioner',39999,'Marq');
Insert into Orders values(106,'Mobile',149999,'Apple');

select * from Orders;

Create table Customers
(
CustomerId int Primary key,
CustomerName varchar(10),
Address varchar(30),
OrderId int foreign key references Orders(OrderId)
);

Insert into Customers values(1,'Pooja','768 Main street Mumbai',104);
Insert into Customers values(2,'Kajal','87/2 Street c Hydrebad',103);
Insert into Customers values(3,'Nitya','874 Street A Banglore',101);
Insert into Customers values(4,'Agarwal','987 Street S Vizag',105);

select * from Customers;

select o.*,c.CustomerName from Orders o
inner join Customers as c
on o.OrderId=c.OrderId;


---5

Create table Product
(
ProductId int primary key,
ProductName varchar(20),
Brand varchar(15),
price float
);
Insert into Product values(1000,'Air Cooler','Bosche',29999.99);
Insert into Product values(1005,'Mattress','SleepWell',14999.98);
Insert into Product values(1010,'SofaSeat','Nilkamal',20999.99);
Insert into Product values(1015,'Washingh machine','Whirlpool',29999.99);

Alter table Customers add ProductId int foreign key references Product(ProductId);

Update Customers set ProductId=1005 where CustomerId=1;
Update Customers set ProductId=1000 where CustomerId=2;
Update Customers set ProductId=1015 where CustomerId=3;
Update Customers set ProductId=1010 where CustomerId=4;

select c.CustomerName,c.Address,p.ProductName from Customers c
inner join Product p
on p.ProductId=c.ProductId;