Select * from Products;

Create Function GetName(@ID int)
returns varchar(30)
Begin
Declare @name varchar(30);
select @name=ProductName from Products where ProductId=@ID;
if @name is not null
begin
return @name
end
return 'No Product exists with such Id'

End

select ProductId,dbo.GetName(ProductId) from Products where ProductId=7;


Create Procedure SPProducts
@ProductId int,
@ProductName varchar(20),
@CatogeryId int,
@SupplierId int,
@UnitPrice float
As

Begin

if exists(Select ProductId from Products where ProductId=@ProductId)
begin
Update Products set ProductName=@ProductName,CatogeryId=@CatogeryId,
SupplierId=@SupplierId,UnitPrice=@UnitPrice 
where ProductId=@ProductId;
end
else
begin
Insert into Products values(@ProductId,@ProductName,@CatogeryId,@SupplierId,@UnitPrice);
end

End

Execute SPProducts @productId=5,@ProductName='Panasonic 2.0',@catogeryId=3,@SupplierId=25,
@UnitPrice=14999.99;

Execute SPProducts @productId=8,@ProductName='Realme narzo',@catogeryId=2,@SupplierId=20,
@UnitPrice=12999.99;


