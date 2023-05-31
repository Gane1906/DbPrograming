Create database Practice;
Use Practice;

Create table Product
(
ProductId int primary key,
ProductName varchar(20),
ProductBrand varchar(20),
);

Insert into Product values(100,'Iphone14','Apple');
Insert into Product values(102,'AC','Marq');
Insert into Product values(104,'Laptop','HP');
Insert into Product values(106,'Fridge','LG');
Insert into Product values(108,'Washing Machine','LG')

select * from Product;

Create table UserLocation
(
LocationId int primary key,
Address varchar(30)
);

Insert into UserLocation values(1,'Hyderabad,Telanagana');
Insert into UserLocation values(2,'Banglore,Karnataka');
Insert into UserLocation values(3,'Vizag,Ap');
Insert into UserLocation values(4,'Thiruvananthapur kerala');
Insert into UserLocation values(5,'Chennai TN');

select * from UserLocation;

Create table Inventory
(
InventoryId int primary key,
ProductId int foreign key references Product(ProductId),
Quantity int,
LocationId int foreign key references UserLocation(LocationId)
);

Insert into Inventory values(1,102,2,1);
Insert into Inventory values(2,100,1,3);
Insert into Inventory values(3,104,1,4);
Insert into Inventory values(4,108,2,5);
Insert into Inventory values(5,106,2,2);

select * From Inventory;

select i.InventoryId,p.ProductName,P.ProductBrand,i.Quantity,l.Address from Inventory i
inner join  Product p
on i.ProductId=p.ProductId
inner join UserLocation l 
on i.LocationId=l.LocationId;

------------------------------------

Create table Catogery
(
CatogeryId int primary key,
CatogeryName varchar(20)
);

Insert into Catogery values(1,'Mobile Phones')
Insert into Catogery values(2,'Home Appliances')
Insert into Catogery values(3,'Air Conditioners')

select * from Catogery;

Create table Suppliers
(
SuppliersId int primary key,
SupplierName varchar(20),
Address varchar(30)
);

Insert into Suppliers values(10,'Shop no1','Shop no1 Street A hyd');
Insert into Suppliers values(15,'Shop no2','Shop no2 Street B bglr');
Insert into Suppliers values(20,'Shop no3','Shop no3 Street C chn');
Insert into Suppliers values(25,'Shop no4','Shop no4 Street D mum');

select * From Suppliers;

create table Products
(
ProductId int primary key,
ProductName varchar(20),
CatogeryId int foreign key references Catogery(CatogeryId),
SupplierId int foreign key references Suppliers(SuppliersId),
);

Alter table Products add UnitPrice float;

Insert into Products values(1,'Iphone 14',1,10);
Insert into Products values(2,'Fridge',2,15);
Insert into Products values(3,'One plus nord',1,20);
Insert into Products values(4,'LG Machine',2,20);
Insert into Products values(5,'panasonic 1.0',3,25);
Insert into Products values(6,'Samsung galaxy',1,20);
Insert into Products values(7,'Marq Ac version 3',3,15);

Update Products set UnitPrice=79999.98 where ProductId=1;
Update Products set UnitPrice=49999.99 where ProductId=2;
Update Products set UnitPrice=30000.99 where ProductId=3;
Update Products set UnitPrice=31999.98 where ProductId=4;
Update Products set UnitPrice=14999.99 where ProductId=5;
Update Products set UnitPrice=15999.00 where ProductId=6;
Update Products set UnitPrice=33999.98 where ProductId=7;

select * From Products;

select p.ProductName,p.UnitPrice,c.CatogeryName,s.SupplierName from Products p
inner join Catogery c 
on p.CatogeryId=c.CatogeryId
inner join Suppliers s
on s.SuppliersId=p.SupplierId;

------------------------------------------

Create table Orders
(
OrderId int primary key,
CustomerName varchar(20),
Address varchar(20),
OrderDate date,
TotalAmount float
);

Insert into Orders values(1,'Aruna','Strret A Hyd','2023-05-19',14999.99);
Insert into Orders values(2,'Aruna','Strret A Hyd','2023-05-20',19999.99);
Insert into Orders values(3,'Karthik','Street B Bglr','2023-04-30',19999.99);
Insert into Orders values(4,'Sangeetha','Stret c chn','2023-05-25',25999.98);
Insert into Orders values(5,'Sangeetha','Strret c chn','2023-05-19',15000.99);

select * from Orders;

Create table Customers
(
CustomerID int primary key,
CustomerName varchar(20),
Address varchar(30)
);

Insert into Customers values(1,'Aruna','Stret A Hyd');
Insert into Customers values(2,'Karthik','Stret B Bglr');
Insert into Customers values(3,'Sangeeta','Stret c chn');

select * from Customers;

Alter table Orders drop column CustomerName,Address;

Alter table Orders add CustomerId int foreign key references Customers(CustomerID);

Update Orders set CustomerId=1 where OrderId=1;
Update Orders set CustomerId=1 where OrderId=2;
Update Orders set CustomerId=2 where OrderId=3;
Update Orders set CustomerId=3 where OrderId=4;
Update Orders set CustomerId=3 where OrderId=5;

select * from Orders;

select o.OrderId,c.CustomerName,o.TotalAmount from Orders o
inner join Customers c 
on o.CustomerId=c.CustomerID;

-------------------------------------

Create table OrderDetails
(
OrderId int primary key,
CustomerName varchar(10),
CustomerEmail varchar(30),
CustomerPhone bigint,
OrderItem varchar(20),
OrderDate date,
Price float
);

Insert into OrderDetails values(1,'Aruna','aruna@gmail.com',986669145,'Iphone','2023-05-16',129999.98);
Insert into OrderDetails values(2,'Aruna','aruna@gmail.com',986669145,'Fridge','2023-05-20',29999.98);
Insert into OrderDetails values(3,'Karthik','karthik@gmail.com',9154841990,'Ac','2023-05-23',39999.98);
Insert into OrderDetails values(4,'Sangeetha','sangeetha@gmail.com',9908908942,'WashingMachine','2023-05-15',24999.98);
Insert into OrderDetails values(5,'Sangeetha','sangeetha@gmail.com',9908908942,'Iphone','2023-05-22',129999.98);

Select * from OrderDetails;

create table CustomerDetails
(
CustomerId int primary key,
CustomerName varchar(10),
Email varchar(30),
Phone bigint
);

Insert into CustomerDetails values(1,'Aruna','aruna@gmail.com',986699145);
Insert into CustomerDetails values(2,'Karthik','karthik@gmail.com',9154841990);
Insert into CustomerDetails values(3,'Sangeetha','sangetha@gmail.com',9908908942);

select * from CustomerDetails;

Alter table OrderDetails drop column CustomerName,CustomerEmail,CustomerPhone;

Alter table OrderDetails add CustomerId int foreign key references CustomerDetails(CustomerId);

Update OrderDetails set CustomerId=1 where OrderId=1;
Update OrderDetails set CustomerId=1 where OrderId=2;
Update OrderDetails set CustomerId=2 where OrderId=3;
Update OrderDetails set CustomerId=3 where OrderId=4;
Update OrderDetails set CustomerId=3 where OrderId=5;

select c.CustomerName,o.OrderItem,o.Price from OrderDetails o
inner join CustomerDetails c
on o.CustomerId=c.CustomerId;

-----------------------------------------------


--cte Assignment

with CTE_Manager as
(select e.EmployeeName,m.ManagerName from Employees e
inner join Manager m 
on e.ManagerId=m.ManagerId)
select * From CTE_Manager;

with  cte as
(select 1 as num,1 as fact 
union all
select num+1,(num+1)*fact from cte where num<10)
select fact from cte where num=8;

with DifferenceCTE as
(select * from CustomerDetails
except Select * from Customers)
select * from DifferenceCTE;