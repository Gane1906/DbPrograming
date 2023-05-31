select * from Students;
select * from Employees;
select * from Customer;

---CTE examples

with cteDemo As
(select StudentId,StudentName,Grade from Students where Grade>70.0)
select StudentId,Grade from cteDemo;

with cte_in_Employees As
(select * from Employees where salary in(30000,55000))
select name,department,salary from cte_in_Employees;

with cte_Customers_inMaharashtra As
(select UserName,state,MobileNumber from Customer where state='Maharastra')
select * from cte_Customers_inMaharashtra;

with cte_AverageGrade As
(select StudentName,Grade from Students where Grade>(select avg(Grade) from Students))
select * From cte_AverageGrade;

--multiple cte

with customers_in_Maharastra As
(select UserName,state,MobileNumber from Customer where state='Maharastra'),
customers_in_Telangana As
(select UserName,state,MobileNumber from Customer where state='Telangana')
select * from customers_in_Maharastra 
union All
select * from customers_in_Telangana;

--recursive cte




with Students_in_DepartmentCse As
(select s.StudentName,s.grade,d.DepartmentName from Students s
inner join Department d on s.DeptId=d.DepartmentId where d.DepartmentName='CSE'),
Students_withMaxGrade As
(select s.StudentName,s.max(grade),d.DepartmentName from Students s
inner join Department d on s.DeptId=D.DepartmentId group by s.DeptId)
select * from Students_in_DepartmentCse
INTERSECT
select * from Students_withMaxGrade;
