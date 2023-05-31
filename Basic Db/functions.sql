select * from Customers;

select * from Orders;

Create table StudentMarks
(
StudentId int primary key,
StudentName varchar(10),
Maths int,
Physics int,
Chemistry int 
);

Create procedure InsertStudentMarks
@StudentId int,
@StudentName varchar(10),
@Maths int,
@Physics int,
@Chemistry int

As
begin
Insert into StudentMarks values(@StudentId,@StudentName,@Maths,@Physics,@Chemistry)
end

Execute InsertStudentMarks
@StudentId=5,
@StudentName='Krishna',
@Maths=80,
@Physics=81,
@Chemistry=85;

select * from StudentMarks;


--Functions

--Inbuilt function

--Single valued functions.

Select CONCAT(CustomerName,'a') from Customers where CustomerId=5;

Select CustomerName,DATALENGTH(CustomerName) As Length from Customers;
--can use len function also here.

Select Substring(CustomerName,1,2) As Substring from Customers;

Select CustomerName,Lower(Reverse(CustomerName)) As Reverse from Customers;

--Aggregate functions.

select count(*) As Number_Of_Customers from Customers;

select sum(CustomerId) from Customers;

select max(maths) from StudentMarks;

select min(chemistry) from StudentMarks;

--System Defined Functions

select GetDATE();

select ISDATE('2023-05-29');

select DAY('2020-02-19');


--User Defined Functions

--Scalar functions

create Function GetTotal(@StudentId int)
returns int
Begin
Declare @total int;
select @total=(Maths+Physics+Chemistry) from StudentMarks where StudentId=@StudentId;
return @total
End

select StudentName,dbo.GetTotal(StudentId) As TotalMarks from Studentmarks;

------------------------------------

Create Function GetAverage(@RollNo int)
returns float
Begin
Declare @Avg int;
select @Avg=((Maths+Physics+chemistry)/3) from Studentmarks where StudentId=@RollNo;
return @Avg
End

Select StudentName,dbo.GetAverage(StudentId) from StudentMarks;

----------------------------------

--Tabular functions.

Create function GetList(@avg int)
returns Table
return select * from StudentMarks where (Maths+Physics+Chemistry)/3>@avg;

select *,dbo.GetTotal(StudentId) As Total,dbo.GetAverage(StudentId)As Average 
from dbo.GetList(75);



