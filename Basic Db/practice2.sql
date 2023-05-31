select * from Employees;

Insert into Employees values('Ramu',26,'Developer',50000);
Insert into Employees values('Sita',26,'Hr',35000);
Insert into Employees values('Aravind',30,'Sales',28000);
Insert into Employees values('Archana',27,'Hr',35000);
Insert into Employees values('Ramya',25,'Developer',55000);
Insert into Employees values('Karthik',27,'Sales',28000);
Insert into Employees values('Charan',25,'Sales',30000);

update Employees set department='Developer' where employeeId=5;

--Sorting data

Select name,age from Employees order by age;

Select * from Employees order by name desc;

--Limiting rows

Select top 2 name,salary from Employees where salary>30000;

Select name,salary from Employees order by salary offset 5 rows;

select * from Employees order by salary;

Select name,salary from Employees order by salary offset 0 rows fetch first 5 rows only;

---Filtering data

select distinct salary,department from Employees;

select employeeId,name,salary from Employees where salary>29000 and department='Sales';

select employeeId,name,department from Employees where department='Sales' or department='Hr';

select employeeId,name,department from Employees where department in('Sales','Hr');

select * from Employees where age in(21,25,26);

select employeeId,name,age from Employees where age between 25 and 30;

select employeeId,name,salary from Employees where salary between 25000 and 35000 order by salary;

select employeeId as Id,name from Employees;

select employeeId,name from Employees where name like '%a%';

select employeeId,name from Employees where name like '_a%';

---Grouping data

select name,department from Employees group by department,name;

select count(*) as 'Total_Employees', department from Employees group by department;

select max(salary),department from Employees group by department;

select department,sum(salary) from Employees group by department;

select department,sum(salary) as 'Total_salary' from Employees group by department having sum(salary)>150000;

select department,count(*) as 'Total_Employees'  from Employees group by department having count(*)>3;

---Set Operations

select * from Employees where salary>40000 union
select * from Employees where department='Hr';

select * from Employees where salary<40000 intersect
select * from Employees where department='Hr';

select * from Employees where salary>30000 except
select * from Employees where department='Hr';

