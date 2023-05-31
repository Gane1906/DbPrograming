---DDL QUERIES
Create table Customer
(
UserId int identity(100,1) primary key,
UserName varchar(20) unique,
Address varchar(20) not null,
state varchar(20),
CountryCode varchar(3) default '+91',
MobileNumber bigint check(len(MobileNumber)=10)
);

Alter table Customer add City varchar(10);

Alter table Customer drop column City;

Truncate table Customer;

Drop table Customer;

---DQL QUERY

select * from Customer;

select UserId,UserName from Customer where UserId>105;

select * from Customer where UserId=105;

---- DML QUERIES

Insert into Customer values('Ram@123','5/98 street A','Telengana','+91',9866699145);
---Insert into Customer values('Ram@123','5/98 street B','Andhra','+91',9766544321);
Insert into Customer values('Sita@123','654 street B','Andhra','+91',9755543216);
---Insert into Customer values('Laxman@1876','76-09 Street C','Maharastra','+91',915467866);
Insert into Customer values('Laxman@1876','76-09 Street C','Maharastra','+91',9154678668);
Insert into Customer values('Arjun@134','765 Street I','Karnataka','+91',9976576543);
Insert into Customer values('Krishna@143','76 Street Z','Delhi','+91',7654327123);
Insert into Customer values('Radha@1976','65-4 Street F','Kerala','+91',8765432198);
Insert into Customer values('Radhika@345','9/876 Street J','Kolkota','+91',9877754323);
Insert into Customer values('Aravind@765','76/45 Street S','TN','+91',9866655432);
Insert into Customer values('Gokul@1876','76-9 Street G','Maharastra','+91',8765498732);
Insert into Customer values('Rama$32','5/448 Street P','Rajasthan','+91',9876598765);

Update Customer set UserName='Sita@1305' where UserId=103;

Update Customer set state='Tamil Nadu' where UserId=109;


Insert into Customer values('Raju@1876','76-9 Street H','Maharastra','+91',9877766542);
Insert into Customer values('Ravi$3','5/448 Street K','Rajasthan','+91',9123456789);

Delete from Customer where UserId=113;



