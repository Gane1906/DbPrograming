select * from Customers;

select * from Orders;

Select * from Stores;

----------------------------------

--Views

--UserDerfined views

create view CustomerView
As
select * from Customers where CustomerId<4;

select * from CustomerView;

----------------------

create view CustomerOrders
As
Select O.OrderId,c.CustomerName,c.Phone,O.OrderStatus from Customers c
inner join Orders o
on c.CustomerId=o.CustomerId;


select * from CustomerOrders;
-----------------

select co.OrderId,cv.CustomerId from CustomerOrders co
inner join CustomerView cv
on cv.CustomerName=co.CustomerName;

-------------------------------

create view CustomerView1
As
select * from Customers where CustomerName like '%m%';

select * from CustomerView1;

-------------------------------

create view CustomerView2
As
Select CustomerId,CustomerName,address from Customers;

select * from CustomerView2;

----------------

Create view OrderView
As
select StoreId, count(*) as Count from Orders group by StoreId

select * from Orderview

----------------------------

Create view OrderView1
As
Select * from Orders where ShippingDate='2023-05-23';

select * from OrderView1;

 Select ov.OrderId,c.CustomerName,c.Phone from OrderView1 ov
 inner join Customers c
 on ov.CustomerId=c.CustomerId;
 ------------------------

 Create view StudentView
 As
 select * from StudentMarks where physics>(select avg(physics) from StudentMarks);

 select StudentName,Physics from StudentMarks;

 -----------------------------

Drop view StudentView1;
-------------

 Create view StudentView1
 As
select distinct maths from StudentMarks;

select * from StudentView1;

---------------------






