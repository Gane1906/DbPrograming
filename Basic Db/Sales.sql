Create database Sales;
Use Sales;

Create table Customers
(
CustomerId int identity(1,1) primary key,
CustomerName varchar(20),
Phone bigint check(Len(phone)=10),
Email varchar(30),
address varchar(30) not null
);

Insert into Customers values('Ram',8799966543,'ram@gmail.com','76/98 Street A Hydrebad');
Insert into Customers values('Sita',9877754321,'sita54@gmail.com','6/980 Street I Banglore');
Insert into Customers values('Laxman',9154841109,'laxman123@gmail.com','6/432 Street K Delhi');
Insert into Customers values('Arjun',9754321675,'arjun.ar@gmail.com','7/85 Street Z Noida');
Insert into Customers values('Krishna',7765465432,'krisnakrish@gmail.com','8/765 Street P Vizag');

select * from Customers;

Create table Stores
(
StoreId int identity(1,1) primary key,
StoreName varchar(20) not null,
Phone bigint check(Len(phone)=10),
Address varchar(20)
);
Alter table Stores alter column Address varchar(40);
Insert into Stores values('Apple store',9988776655,'Shop num:3 Banjara hills Hyd');
Insert into Stores values('Redmi store',9126126126,'Shop num 3 2nd floor Marthali banglore');
Insert into Stores values('One plus',9123456126,'Main building near hotel taj Mumbai');
Insert into Stores values('Real me',9922399223,'Real me top floor T nagar Chennai');
Insert into Stores values('Samsung',9126123456,'Samsung Office Vizag');

select * from Stores;

Create table Staff
(
StaffId int primary key,
StaffName varchar(20) not null,
Email varchar(30),
Phone bigint check(Len(phone)=10),
StoreId int foreign key references Stores(StoreId)
);

Alter table Staff add ManagerId int;

Insert into Staff values(101,'Arun','arun123@gmail.com',9876543215,3,101);
Insert into Staff values(102,'Arvind','arvind.ar@gmail.com',9876543212,8,101);
Insert into Staff values(103,'Sruthi','sruti@gmail.com',9877765432,7,102);
Insert into Staff values(104,'Sravani','Sravanis@gmail.com',9154863220,4,102);
Insert into Staff values(105,'Srinu','srinuy@gmail.com',9876543210,5,104);

select * from Staff;

Create table Orders
(
OrderId int identity(1000,1) primary key,
CustomerId int foreign key references Customers(CustomerId),
OrderStatus varchar(10),
OrderDate date,
ShippingDate date,
StoreId int foreign key references Stores(StoreId),
StaffId int foreign key references Staff(StaffId)
);

Insert into Orders values(1,'Ordered','2023-05-23','2023-05-30',3,101);
Insert into Orders values(3,'Shipping','2023-05-20','2023-05-23',7,102);
Insert into Orders values(4,'Delivered','2023-05-17','2023-05-23',4,105);
Insert into Orders values(2,'Deliver','2023-05-16','2023-05-24',5,104);
Insert into Orders values(5,'Delivered','2023-05-10','2023-05-23',8,103);

select * from Orders;



