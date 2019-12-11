-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
select productname, categoryname,
* from product
join category as c
on categoryid = c.id
-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
select o.Id, c.CompanyName
from
    [Order] as o
join
    Customer as c
    on o.CustomerId = c.Id
where
    o.OrderDate < '2012-08-09';
-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
select product.productname, od.quantity
from orderdetail as od
join product on product.id = od.productid
where od.OrderId = 10251
order by product.productname asc
-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
select (e.lastname) as soldby
, o.id
, c.CompanyName as OrderBy
from [order] as o

join employee as e on o.EmployeeId = e.id
join customer as c on o.CustomerId = c.id;