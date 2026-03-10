create database Companydb;
use companydb;

-- First Class
create table Employee
(e_id int,
e_name varchar(20),
e_performance varchar(20),
e_salary int,
e_date_joining date
);

desc employee;
drop table employee;

insert into employee(e_id, e_name, e_performance,
e_salary, e_date_joining) values
(1,"AA", "Good", 10000, "2021-01-01"),
(2,"BB", "Bad", 20000, "2022-01-01"),
(3,"BB", "Average",30000, "2022-01-01");

select * from employee;
drop table employee;

select database();
show databases;

-- Second Class
select * from sales;

-- here where clause is used to apply the filter
select * from sales
where price > 25000;

select * from sales
where order_id>10;

-- use and operator for satisfying both the conditions
select * from sales
where city = "mumbai" and price > 25000;

-- use or operator for satisfying either of the conditions
select * from sales
where city = "mumbai" or price > 25000;

-- use between operator to set the limits
select * from sales
where price between 25000 and 35000;

-- USE is null operator to find the data related to null
select * from sales
where product is null;

select * from sales
where product is not null;

-- Like operator is used for the string related data
select * from sales
where customer_name like "a%";

-- now we want sales data in which customer name finishes with a
select * from sales
where customer_name like "%a";

-- Now we want the customer name in which at the third position i comes
select * from sales
where customer_name like "__i%";

-- To show the tables which all are existing in the used database
show tables;

-- We want only the Customer Name whose product = laptop and price>30000
select customer_name from sales
where product ="laptop" and price>30000;

-- We want the order_id, product where the quantity>2
select order_id, product from sales
where quantity>2;

-- We want the customer name where either c_name starts with A or city ="mumbai"
select customer_name from sales
where customer_name like "a%" or city ="mumbai";

-- Third Class
select * from sales;

-- We using order by clause to arrange the data in asc or desc price wise
select * from sales
order by price;

select * from sales
order by price desc;

-- Now we using limit clause to limit the rows
select * from sales
limit 4;

select * from sales
order by price desc
limit 3;

/* a short trick to remember the sequence
from
where
group by
having
select
order by
limit
offset
*/












-- Create Database
CREATE DATABASE join_practice_db;
USE join_practice_db;

-- Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO customers VALUES
(1,'Amit Sharma','Delhi'),
(2,'Neha Verma','Mumbai'),
(3,'Rahul Singh','Pune'),
(4,'Priya Patel','Ahmedabad'),
(5,'Karan Mehta','Delhi');

-- Employees Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50)
);

INSERT INTO employees VALUES
(101,'Rohit Kumar','Sales'),
(102,'Anjali Gupta','Sales'),
(103,'Vikas Jain','Support');

-- Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price INT
);
INSERT INTO products VALUES
(201,'Laptop',60000),
(202,'Mobile',20000),
(203,'Headphones',2000),
(204,'Keyboard',1500),
(205,'Mouse',800);

-- Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    emp_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

INSERT INTO orders VALUES
(301,1,101,'2025-01-10'),
(302,2,102,'2025-01-12'),
(303,3,101,'2025-01-15'),
(304,1,103,'2025-01-18'),
(305,5,102,'2025-01-20');

-- Order Details Table
CREATE TABLE order_details (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO order_details VALUES
(1,301,201,1),
(2,301,203,2),
(3,302,202,1),
(4,303,205,3),
(5,304,204,2),
(6,305,201,1),
(7,305,205,2);

-- Example Multiple JOIN Query
SELECT 
    c.customer_name,
    c.city,
    o.order_id,
    o.order_date,
    e.emp_name AS handled_by,
    p.product_name,
    p.price,
    od.quantity,
    (p.price * od.quantity) AS total_price
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN employees e ON o.emp_id = e.emp_id
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id;

-- class Fifth
select * from sales;
select order_id,product,price from sales
where price<50000 and product like '%p'
order by product asc;

select city , sum (quantity) from sales
group by city;


select product,sum(price) as Total_Sales from sales
group by product;

select product ,sum(quantity) as Total_quantity from sales
where product like '_%p' or product like '_%e'
group by product
order by sum(quantity) desc;

select product, sum(price) from sales
group by product 
having sum(price) > 100000;
show tables;

