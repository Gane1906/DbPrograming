Create table Product
(
ProductId int identity(1000,1) primary key,
ProductName varchar(20),
ProductBrand varchar(20),
Price real
);

Alter table Product add ProductColor varchar(10);

Alter table Product alter column Price float;

Alter table Product add unique(ProductName);

Alter table Product drop column ProductColor;

Insert into Product values('Refrigrator','LG',24999.99);
Insert into Product values('Washing Machine','Panasonic',27999.99);
Insert into Product values('Air Conditioner','Marq',30999.99);
Insert into Product values('Smart Tv','Redmi',35999.98);
Insert into Product values('Iphone14','Iphone',124999.99);

select * from Product;

Update Product set Price=78999.98 where ProductName='Iphone14';

Delete from Product where productId=1003;

Truncate table Product;