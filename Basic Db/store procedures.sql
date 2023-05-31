Select * from Customers;

select * From StudentMarks

Update StudentMarks set StudentName='Krishna' where StudentId=5;
---CRUD Operations 

--Create Procedure.

Create Procedure SpCustomers
@CustomerName varchar(20),
@Phone bigint,
@Email varchar(30),
@Address varchar(30)
As
Begin 
Insert into Customers values(@CustomerName,@Phone,@Email,@Address)
End

Execute SpCustomers
@CustomerName='Keshav',
@Phone=9866699145,
@Email='Kesav@gmail.com',
@Address='765 Street K Mumbai'

--Retrive

Create Procedure ReadCustomers
@CustomerId int
As
Begin
select CustomerId,CustomerName,Phone from Customers
where Customerid=@CustomerId;
End

Execute ReadCustomers @CustomerId=5;

--Update Customer

Create procedure Update_Customers
@CustomerId int,
@Email varchar(30)
As
Begin
Update Customers set Email=@Email 
where CustomerId=@CustomerId
End

execute Update_Customers @CustomerId=6,@Email='keshav@gmail.com';

--Delete

Create Procedure DeleteCustomer
@CustomerId int
As
Begin
Delete from Customers
where CustomerId=@CustomerId;
End

Execute DeleteCustomer @CustomerId=6;

----------------------

--Control flow Statements:

--If statment

Begin

Declare @id int;
select @id=sum(CustomerId) from Customers; 
select @id
if @id>10
begin
print 'You have more than 4 members in Customer table';
end

End;


Begin

Declare @Id1 int;
select @Id1=sum(CustomerId) from Customers; 
select @Id1
if @Id1>=21
begin
print 'You have more than 5 members in Customer table';
end
else
begin
print 'Oops You have less than 6 cutomers in Customer table';
end

End

--While loop

Begin

Declare @Id2 int=1;
while @Id2<6
begin
if @Id2=3
continue;
select CustomerId,CustomerName,Phone from Customers where CustomerId=@Id2;
set @Id2=@Id2+1;
end

End

--------------------

--Try Catch
Begin

begin try
execute SpCustomers
@CustomerName='ABCDEFGHIJKLMNOPQRSTUVWXYZ',
@Phone='9154841990',
@Email='a@gmail.com',
@Address='768 Strret Z Hyd'
end try

begin catch

select ERROR_MESSAGE() As ErrorMessage
end catch

end

------------------------------------

--output Parameters

select * From StudentMarks;

Create Procedure GetNumber
@Marks int,
@Count int output
 
As
Begin

select StudentName,maths from StudentMarks where Maths>@Marks;

select @Count=@@ROWCOUNT;

End

Declare @Result int

Execute GetNumber @Marks=70,@Count=@Result output;

select @Result as 'Number_of_Students';

-------------------------

select * from Orders

Create Procedure GetCustomerWrtOrderId
@OrderId int,
@OrderStatus varchar(20) output,
@CustomerName varchar(30) output,
@Phone bigint output

As
Begin

select @CustomerName=c.CustomerName,@Phone=c.Phone,@OrderStatus=OrderStatus from Orders o 
inner join Customers c
on c.CustomerId=o.CustomerId where o.OrderId=@OrderId;

End

Declare @Name varchar(20)
Declare @Mobile bigint
Declare @Status varchar(15)

Execute GetCustomerWrtOrderId @OrderId=1005,@OrderStatus=@Status output,
@CustomerName=@Name output,@Phone=@Mobile output;

select @Name as Customer,@Mobile as 'Mobile_Number',@Status as 'Order_Status';

-------------------------------

Create procedure GetTotalMarks
@StudentId int,
@Total int output

As
Begin

select @Total=sum(maths+physics+chemistry) from StudentMarks where StudentId=@StudentId;

End

Declare @TotalMarks int

Execute GetTotalMarks @StudentId=4,@Total=@TotalMarks output;

Select StudentName,@TotalMarks as 'Total_Marks' from StudentMarks where StudentId=4;

------------------------------

Create Procedure TotalConditions
@Total int
As
Begin

if exists(select * from StudentMarks having sum(maths+physics+chemistry)>@Total)
begin
select StudentName,sum(maths+physics+chemistry) as Total from StudentMarks group by StudentName
having sum(maths+physics+chemistry)>@Total;
end

else
begin
print 'No students total is greater';
end

End

Execute TotalConditions @Total=300;

--------------------------

Create Procedure UpdatesWithExceptions
@StudentId int,
@StudentName varchar(20)

As
Begin

Begin Try
Update StudentMarks set StudentName=@StudentName where StudentId=@StudentId;
if @@ROWCOUNT=0
Throw 5001,'Product not found',1;
end try
Begin catch
if ERROR_NUMBER()=5001
print 'Error: '+ Error_Message();
else
print Error_Message();
end catch

End

Execute UpdatesWithExceptions @StudentId=6,@StudentName='Hari';
 