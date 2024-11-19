create database lab8;

--1
create database lab8;

--2
CREATE TABLE salesman
(
    salesman_id INT PRIMARY KEY,
    name        VARCHAR(50),
    city        VARCHAR(50),
    commission  DECIMAL(4, 2)
);

CREATE TABLE customers
(
    customer_id INT PRIMARY KEY,
    cust_name   VARCHAR(50),
    city        VARCHAR(50),
    grade       INT,
    salesman_id INT,
    FOREIGN KEY (salesman_id) REFERENCES salesman (salesman_id)
);

CREATE TABLE orders
(
    ord_no      INT PRIMARY KEY,
    purch_amt   DECIMAL(10, 2),
    ord_date    DATE,
    customer_id INT,
    salesman_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
    FOREIGN KEY (salesman_id) REFERENCES salesman (salesman_id)
);


INSERT INTO salesman (salesman_id, name, city, commission)
VALUES (5001, 'James Hoog', 'New York', 0.15),
       (5002, 'Nail Knite', 'Paris', 0.13),
       (5005, 'Pit Alex', 'London', 0.11),
       (5006, 'Mc Lyon', 'Paris', 0.14),
       (5003, 'Lauson Hen', NULL, 0.12),
       (5007, 'Paul Adam', 'Rome', 0.13);


INSERT INTO customers (customer_id, cust_name, city, grade, salesman_id)
VALUES (3002, 'Nick Rimando', 'New York', 100, 5001),
       (3005, 'Graham Zusi', 'California', 200, 5002),
       (3001, 'Brad Guzan', 'London', NULL, 5005),
       (3004, 'Fabian Johns', 'Paris', 300, 5006),
       (3007, 'Brad Davis', 'New York', 200, 5001),
       (3009, 'Geoff Camero', 'Berlin', 100, 5003),
       (3008, 'Julian Green', 'London', 300, 5002);

INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id)
VALUES (70001, 150.50, '2012-10-05', 3005, 5002),
       (70009, 270.65, '2012-09-10', 3001, 5005),
       (70002, 65.26, '2012-10-05', 3002, 5001),
       (70004, 110.50, '2012-08-17', 3009, 5003),
       (70007, 948.50, '2012-09-10', 3005, 5002),
       (70005, 2400.60, '2012-07-27', 3007, 5001),
       (70008, 5760.00, '2012-09-10', 3002, 5001);


--3
create role junior_dev login;

--4
    create view  new_york_salaesmen as select * from salesman where city='New York';
select * from new_york_salaesmen;
--5
create view names as select s.name,c.cust_name from salesman As s inner join customers as c using(salesman_id);
grant all privileges  on names to junior_dev;

select * from  names;
--6
create view only_high as select * from customers where grade=(select max(grade )from customers);
grant select   on only_high to junior_dev;

select * from only_high;
--7
create view count as select city,count(salesman_id) from salesman group by city ;
select * from count;

--8
create view salesman_with_multiple_customers as select s.salesman_id, s.name, s.city, s.commission, count(c.customer_id) AS customer_count
from salesman s join customers c ON s.salesman_id = c.salesman_id
group by s.salesman_id, s.name, s.city, s.commission having count(c.customer_id) > 1;

select * from salesman_with_multiple_customers;

--9
create role intern;
grant junior_dev to intern;


