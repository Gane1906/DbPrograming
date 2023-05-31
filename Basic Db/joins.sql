Create table Department
(
DepartmentId int primary key,
DepartmentName varchar(20),
HOD varchar(10),
Location varchar(15) 
);

Create table Students
(
StudentId int primary key,
StudentName varchar(20),
Grade float,
DeptId int foreign key references Department(DepartmentId)
);

Insert into Department values(1,'CSE','Ram','Block1');
Insert into Department values(2,'ECE','Laxman','Block2');
Insert into Department values(3,'EEE','Radha','Block3');
Insert into Department values(4,'Mech','Krishna','Block4');
Insert into Department values(5,'Civil','Sita','Block5');
Insert into Department values(6,'Chemical','Kalyan','Block6');
Insert into Department values(7,'BioTech','Keshav','Block7');

select * from Department;

Insert into Students values(120,'Harsha',76.5,2);
Insert into Students values(122,'Hari',80.2,3);
Insert into Students values(143,'Aravinda',75.0,4);
Insert into Students values(145,'Pooja',90.4,1);
Insert into Students values(111,'Priya',66.2,5);
Insert into Students values(123,'Swathi',67.22,4);
Insert into Students values(140,'Karthik',87.4,2);
Insert into Students values(150,'Tarak',76.8,1);
Insert into Students values(113,'Sarath',65.9,1);
Insert into Students values(118,'Kaushal',87.9,3);
Insert into Students values(130,'Arun',65.6,4);
Insert into Students values(129,'Kedarnath',77.2,5);
Insert into Students values(127,'Shivam',66.2,5);
Insert into Students values(125,'Ravan',79.0,5);
Insert into Students values(139,'Kiran',70.23,1);
--Insert into Students values(138,'Rama',66.4,10);

select * from Students;

---Joins

--Inner Join

select s.StudentId,s.StudentName,d.DepartmentName from Students as s
Inner Join
Department as d on s.DeptId=d.DepartmentId;

Select count(*),d.DepartmentName from Students as s
Inner join
Department as d on s.DeptId=d.DepartmentId group by d.DepartmentName;

select d.DepartmentName as Department,max(s.grade) as'Maximum_Grade' from Students as s
Inner join
Department as d on s.DeptId=d.DepartmentId group by d.DepartmentName;

---Left Join

select s.StudentId,s.StudentName,D.DepartmentId,d.DepartmentName from Department as d
left join Students as s
on s.DeptId=d.DepartmentId;

---Right Join

select s.StudentId,s.StudentName,D.DepartmentId,d.DepartmentName from Department as d
right join Students as s
on s.DeptId=d.DepartmentId;

--Outer join

select s.StudentName,d.DepartmentName from Students as s
full join Department as d 
on s.DeptId=d.DepartmentId;

--Cross Join
select s.StudentId,s.StudentName,d.DepartmentName from Students as s
cross join Department d;

---SubQueries

select StudentName,grade from Students where grade=
(select max(grade) from Students);

select StudentName,grade from Students where grade>
(select avg(grade) from Students);

select StudentName,grade from Students where StudentName in
(select StudentName from Students where grade>80.0);

select StudentName from Students where DeptId=
(Select DepartmentId from Department where DepartmentName='CSE');

Select StudentId,StudentName from Students where DeptId=
(Select DepartmentId from Department where Location='Block3');

