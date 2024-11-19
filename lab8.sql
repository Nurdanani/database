create database lab8;

create table salesman(
    salesman_id int PRIMARY KEY ,
    name varchar(200),
    city varchar(100),
    commission float


);

INSERT INTO salesman (salesman_id, name, city, commission)
VALUES
    (5001, 'James Hoog', 'New York', 0.15),
    (5002, 'Nail Knite', 'Paris', 0.13),
    (5005, 'Pit Alex', 'London', 0.11),
    (5006, 'Mc Lyon', 'Paris', 0.14),
    (5003, 'Lauson Hen', NULL, 0.12),
    (5007, 'Paul Adam', 'Rome', 0.13);

create table customers (
    customer_id int primary key ,
    cust_name varchar(100),
    city varchar(100),
    grade int,
    salesman_id int,
    FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)
);

INSERT INTO customers (customer_id, cust_name, city, grade, salesman_id)
VALUES
    (3002, 'Nick Rimando', 'New York', 100, 5001),
    (3005, 'Graham Zusi', 'California', 200, 5002),
    (3001, 'Brad Guzan', 'London', NULL, 5005),
    (3004, 'Fabian Johns', 'Paris', 300, 5006),
    (3007, 'Brad Davis', 'New York', 200, 5001),
    (3009, 'Geoff Camero', 'Berlin', 100, 5003),
    (3008, 'Julian Green', 'London', 300, 5002);

create table orders(
    ord_no int ,
    purch_amt float,
    ord_date Date,
    customer_id int,
    salesman_id int,
    foreign key (customer_id) references customers(customer_id),
    foreign key (salesman_id) references salesman(salesman_id)
);

INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id)
VALUES
    (70001, 150.5, '2012-10-05', 3005, 5002),
    (70009, 270.65, '2012-09-10', 3001, 5005),
    (70002, 65.26, '2012-10-05', 3002, 5001),
    (70004, 110.5, '2012-08-17', 3009, 5003),
    (70007, 948.5, '2012-09-10', 3005, 5002),
    (70005, 2400.6, '2012-07-27', 3007, 5001),
    (70008, 5760, '2012-09-10', 3002, 5001);

--3
create role junior_dev login ;

--4
create view New_York_salesman as
    select salesman_id, name, city, commission
from salesman
where city = 'New York';

--5
create view order_salesman_customer as
select o.ord_no, o.purch_amt, o.ord_date, s.name as salesman_name, c.cust_name as customer_name
from orders o
         JOIN customers c ON o.customer_id = c.customer_id
         JOIN salesman s ON o.salesman_id = s.salesman_id;


grant all privileges on order_salesman_customer to junior_dev;
--6
create view customer_highest_grade as
    select  customer_id  , cust_name, city , grade
from customers
where grade = (select max(grade) from customers);
grant select on customer_highest_grade to junior_dev;

--7
create view num_salesman as
    select city , count(salesman_id) as num_salesman
from salesman
group by city ;

--8
create view salesman_with_customers as
    select s.salesman_id, s.name
from salesman s
join customers c on s.salesman_id = c.salesman_id
group by s.salesman_id, s.name
having count(c.customer_id) >1;

--9
create role intern ;
grant junior_dev to intern;







