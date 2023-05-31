Select * from Customers where CustomerId=5;

--create clustered index IndexId on Customers(CustomerName);

create index IndexId on Customers(CustomerName);

Alter index IndexId on Customers rebuild;

Drop index IndexId on Customers;

