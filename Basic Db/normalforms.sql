Create a table with  orders
Order ID
Customer Name
Customer Email
Product 1
Quantity 1
Product 2
Quantity 2


Then normaize this.
->Do join on normalized table
Create a table Employee with

Employee ID
Employee Name
Department
Salary

Then normalize this

Create table Orders
(OrderId int primary key,
CustomerName varchar(15),
CustomerEmail varchar(30) not null,
Product1 varchar(20),
Quanitity1 int,
Product2 varchar(20),
Quanitity2 int
);

Insert into Orders values(1,'Ram','ram@gmail.com','Fridge',1,'Mobile',2);
Insert into Orders values(2,'Sita','sita@gmail.com','AC',2,'WashingMchine',1);
Insert into Orders values(3,'Laxman','laxman@gmaio.com','AC',2,'Mobile',2);
Insert into Orders values(4,'Arjun','arjuna@gmail.com','WashingMachine',1,'Frige',1);
Insert into Orders values(5,'Krishna','krishna@gmail.com','Fridge',1,'Mobile',2);

select * from Orders;

Create table Products
(
ProductId int primary key,
ProductName varchar(20),
Quantity int
);

Insert into Products values(100,'Fridge',1);
Insert into Products values(101,'Mobile',2);
Insert into Products values(102,'AC',2);
Insert into Products values(103,'WashingMachine',1);

select * from Products;

Alter table Orders add productId1 int;
Alter table Orders add ProductId2 int;

Alter table Orders drop column Product1;
Alter table Orders drop column Product2;
Alter table Orders drop column Quanitity1;
Alter table Orders drop column Quanitity2;

Update Orders set productId1=100,productId2=101 where OrderId=1;
Update Orders set productId1=101,productId2=103 where OrderId=2;
Update Orders set productId1=102,productId2=101 where OrderId=3;
Update Orders set productId1=103,productId2=100 where OrderId=4;
Update Orders set productId1=100,productId2=101 where OrderId=5;

select o.CustomerName,p.ProductName,p.Quantity from Orders o
inner join Products p
on o.productId1=p.ProductId;

-----------------------------

Create table Employes
(
EmployeeId int primary key,
EmployeeName varchar(20),
Department varchar(10),
Salary bigint
);

Insert into Employes values(1,'Pooja','Hr',35000);
Insert into Employes values(2,'Kishore','Developer',50000);
Insert into Employes values(3,'Simran','Sales',30000);
Insert into Employes values(4,'Sastri','Developer',55000);
Insert into Employes values(5,'Sita','Sales',30000);
Insert into Employes values(6,'Karan','Hr',35000);

select * from Employes;

Create table Department
(
DeptId int primary key,
DepartmentName varchar(20)
)

Insert into Department values(1,'Sales');
Insert into Department values(2,'Hr');
Insert into Department values(3,'Developer');

select * from Department;

Alter table Employes drop column Department;

Alter table Employes add DeptId int foreign key references Department(DeptId);

update Employes set DeptId=2 where EmployeeId=1;
update Employes set DeptId=3 where EmployeeId=2;
update Employes set DeptId=1 where EmployeeId=3;
update Employes set DeptId=3 where EmployeeId=4;
update Employes set DeptId=1 where EmployeeId=5;
update Employes set DeptId=2 where EmployeeId=6;