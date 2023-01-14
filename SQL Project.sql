--dim #1
create table products (
  productID int primary key,
  name TEXT,
  price int
);

insert into products values
  (1, 'pizza hub', 250),
  (2, 'McDonut', 190),
  (3, 'Kay FC', 200),
  (4, 'PlanetBucks', 300);

--dim #2
create table customers (
  customerID int primary key,
  firstname TEXT,
  age int,
  gender int
);

insert into customers values
  (1, 'James', 22, 'M'),
  (2, 'Earn', 23, 'F'),
  (3, 'Jane', 20, 'F'),
  (4, 'John', 25, 'M'),
  (5, 'Natcha', 23, 'F');

--dim #3
create table branches (
  branchID int primary key,
  location TEXT
);

insert into branches values
  (1, 'The Mall'),
  (2, 'Central'),
  (3, 'Drive Thru');

--dim #4
create table payment (
  paymentID int primary key,
  type TEXT
);

insert into payment values
  (1, 'Cash'),
  (2, 'Mobile Banking');

--fact #5
create table orders (
  orderID int primary key,
  productID int,
  customerID int,
  branchID int,
  paymentID int,
  orderTime TEXT,
  foreign key (productID) references products(productID),
  foreign key (customerID) references customers(customerID),
  foreign key (branchID) references branches(branchID),
  foreign key (paymentID) references payment(paymentID)
);

insert into orders values
  (1, 4, 1, 2, 2, '2022-12-12'),
  (2, 2, 3, 1, 1, '2022-10-12'),
  (3, 1, 4, 3, 2, '2022-04-11'),
  (4, 4, 2, 3, 2, '2022-08-05'),
  (5, 3, 2, 2, 2, '2022-06-06'),
  (6, 3, 1, 1, 2, '2022-08-21'),
  (7, 2, 5, 3, 1, '2022-12-13'),
  (8, 1, 3, 3, 2, '2022-04-30'),
  (9, 1, 5, 1, 2, '2022-06-07'),
  (10, 1, 2, 2, 1, '2022-06-15');

.mode markdown
.header on

--1. all order
/*
select * from (
  select
    o.orderID,
    o.orderTime,
    pr.name,
    pr.price,
    c.firstname,
    c.age,
    p.type
  from orders o
  join products pr
  on pr.productID = o.productID
  join customers c
  on c.customerID = o.customerID
  join payment p
  on p.paymentID = o.paymentID
)
*/
--2. month that have the most order
/*
with monthly as (
  select
    count(*) as amount,
    strftime('%m',o.orderTime) as months,
    sum(p.price) price
  from orders o
  join products p
  on p.productID = o.productID
  group by months
)

select
  amount,
  months,
  max(price) income
from monthly
*/

--3. customers most orders
/*
with promo as (
  select
    o.orderID ID,
    o.orderTime,
    c.firstname,
    o.amount,
    p.price spend
  from orders o, customers c, products p
  where o.customerID = c.customerID
  and o.productID = p.productID
)

select
  firstname topspender,
  max(amount) total,
  maximum
from (
  select
    firstname,
    count(firstname) amount,
    sum(spend) maximum
  from promo
  group by firstname
  order by amount desc
)
*/

--4. most payment type
/*
select
  paymentID,
  count(*),
  case
    when paymentID = 1 then 'Cash'
  else 'Mobile banking'
  end as payment
from orders
group by paymentID
*/
/*  
--5. profit in each branch
select
  b.location,
  sum(p.price) profit
from orders o, products p, branches b
where o.productID = p.productID
and o.branchID = b.branchID
group by location
*/
/*
--6. branch most profit
select
  location,
  max(profit)
from (
  select
    b.location,
    sum(p.price) profit
  from orders o, products p, branches b
  where o.productID = p.productID
  and o.branchID = b.branchID
  group by location
)
*/
/*
--7. popular menu
with coop as (
  select
    o.branchID,
    p.name name,
    p.price price
  from orders o
  join products p
  on o.productID = p.productID
)

select
  name,
  max(price)
from (
  select
    name,
    sum(price) price
  from coop
  group by name
)
*/
/*
--8. profit in each month
select
  strftime('%m',o.orderTime) Dates,
  sum(p.price) Profit
from orders o
join products p
  on o.productID = p.productID
group by strftime('%m',o.orderTime)
order by Profit desc
*/