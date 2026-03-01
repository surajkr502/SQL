-- First class
Create database company;
use company;
-- Now creating the table under the company database 
create table employee
(e_ID int,
e_name varchar(20),
e_performance varchar(20),
e_salary int,
e_joining_data date);
-- To see the detail of employee table 
desc employee;
-- Now we insert the data in the table
insert into employee






-- Second class
-- we use it to see the tables in existing database
-- create database company;

use company;
show tables;
CREATE TABLE sales (
    order_id INT,
    customer_name VARCHAR(50),
    product VARCHAR(50),
    city VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2),
    order_date DATE
);

-- Insert Sample Data (Including NULL Values)
INSERT INTO sales VALUES
(1, 'Amit', 'Laptop', 'Mumbai', 1, 55000, '2024-01-10'),
(2, 'Rahul', 'Mobile', 'Delhi', 2, 20000, '2024-01-12'),
(3, 'Sneha', 'Laptop', 'Mumbai', 1, 60000, '2024-01-15'),
(4, 'Priya', 'Tablet', 'Chennai', 3, 15000, '2024-01-18'),
(5, 'Amit', 'Mobile', 'Mumbai', 1, 18000, '2024-01-20'),
(6, 'Rahul', 'Laptop', 'Delhi', 2, 52000, '2024-01-25'),
(7, 'Sneha', 'Tablet', 'Mumbai', 1, 14000, '2024-01-28'),
(8, 'Priya', 'Mobile', 'Chennai', 2, 21000, '2024-02-02'),
(9, 'Amit', 'Tablet', 'Mumbai', 2, 16000, '2024-02-05'),
(10, 'Rahul', 'Mobile', 'Delhi', 1, 19000, '2024-02-08'),
(11, 'Karan', 'Laptop', 'Mumbai', 1, 58000, '2024-02-10'),
(12, 'Meena', 'Mobile', NULL, 2, 22000, '2024-02-12'),
(13, 'Rohit', NULL, 'Delhi', 1, 30000, '2024-02-15'),
(14, NULL, 'Tablet', 'Chennai', 3, 15000, '2024-02-18'),
(15, 'Anjali', 'Laptop', 'Mumbai', NULL, 62000, '2024-02-20'),
(16, 'Vikas', 'Mobile', 'Delhi', 2, NULL, '2024-02-22'),
(17, 'Neha', 'Tablet', NULL, 1, 14000, NULL),
(18, NULL, NULL, 'Mumbai', 2, 18000, '2024-02-25');
-- we using where clause to filter the table 
select * from sales;
select * from sales where prices> 2000;
select * from sales 
where city = "Mumbai" and price > 20000;
select * from sales
where city ="Mumbai" or price > 20000;

-- we using b/w operator here to set the limits 
select * from sales
where price between 25000 and 50000;
select * from sales 
where product is not null;
-- for arranging a data in accending or deceding by
select * from sales 
order by price;
select * from sales 
order by price desc;
-- what is rdms?
-- what is primary key:- It give unique identity to the key. 
-- forein key 
-- char vs varchat
-- we using  like operator to know the name staring with particular latter
select * from sales 
where customer_name like 'a';
select * from sales
where customer_name like '%a';
select * from sales 
where customer_name like '__i%';
-- we using under score to fix the positions 
select * from sales 
where customer_name like 'a%' and price > 20000;

-- Third Class 
-- we using order by clause to arrange the data in asc or desc price wise
select * from sales
order by price asc;

select * from sales 
order by price desc;
-- Now we using limit clause to limit the rows
select * from sales 
limit 4;
select * from sales 
order by price desc
limit 3;
/* -- A short trick to remember the sequence 
from 
where 
group by 
having 
select
order by 
limit
offset 
*/
-- Now we want a earlier case only but we want to skip the first row
select * from sales 
order by price desc
limit 3 offset 1;
/* -- where clause is used for the filter process
order by used for the shorting the data
limit clause is used to see the top and bottom n number of rows
why we call sql is dbms and rdms
Every rdms can be dbms 
1. because data must be in tabular format 
2. SQL lang to be use to manage the data 
But every dbms can't be rdms
1. In DBMS data can be in tabular or other format
2. SQL and any other lang can be used to manage data
*/
-- Now we need unique name from the city columns so we use distinct key word 
select * from sales;
select distinct(city) from sales;
-- Membership operator (In,NOt in )
select * from sales
where city in ('Mumbai','Delhi');
-- Rename the table name
rename table sales to sales2;
rename table sales2 to sales;


-- Add the comlumns frofit in sales tables
alter table sales add column profit int ;
desc sales;
-- Drop the comlumns frofit in sales tables
alter table sales drop column  profit;
-- Modify column changing the data type
alter table sales modify column price varchar(20);
alter table sales modify column price int;
-- Changing the column header name 
alter table sales rename column product to prod;
alter table sales rename column prod to product;
/* SQL in an declarative lang not a procedural lang
declarative lang means in sql we just tall the need to the database 
but in procedural lang complete process is defined stop by step which deon't happen in sql
*/
-- Truncate is used to supresed the the table
truncate sales;
select * from sales;
/* Under SQL are categarige into five types
DDL(data definition lang):- which works on the structure of the table or database
It contains the commands like 
1. Drop 
2. Rename
3. Create
4. Alter 
5. Truncate
 Shortcut to remember the commands under SQL is Dr Cat
 */
-- real life example of sql is E-Commerce website 
/*example- amazon suppose in amazon if i rearch for LED then at the backed the amazon 
sofware in amazon */
-- class fifth 
/* Constraits:- It is use to restrict the data taht what data should be alowed into the 
table .Actually we can conclude that it acts as a filter or guard.
there are six type of constraints:
1. Unique
2. Not Null
3. Primary key
4. Forein key 
5. Check 
6. Default
. Auto Increament
*/
-- We learning the use of unique and not null constraints
create database a;
create table students(
student_id int unique,
student_name varchar(20) not null
);
insert into students values
(1,'AA'),(2,'BB');
select * from students;
insert into students values
(1,null),(2,'BB');
insert into students values
(1,'AA'),(2,'BB');
/* Now we learn Primary key: Actualy it is compination of unique or not null
A table can consist the single primary key only
*/
create table students1(
students_id int primary key,
students_name varchar(20) not null);
desc students1;
insert into students1 values
(1,'AA'),(2,'BB');
-- Now due to Primary key the data will be not be inserted
/* insert into students1 values
(1,'AA'),(2,'BB');
*/
-- Now we going to use foreign key
create table orders(
order_id int primary key,
student_id int,
foreign key (student_id) references students1(students_id)
);
desc orders;
insert into orders
values
(1,1),(2,2);
-- Now we use check constraint for the age >18
create table students2(
student_id int primary key,
age int check (age>18)
);
insert into students2 values
(1,15),(2,21);
insert into students2 values
(1,20),(2,17);
create table students3(
student_marks int primary key,
marks int check (marks>230)
);
/* MySQL is an open source RDBMS because any one can download it at free of
cost, can install it and manage the data there.
So,the software we have to pay these are closed source RDBMS
example: Microsoft SQL Server
*/

-- class sixth




create table doctor(
doc_id int primary key,
doc_name varchar(20) not null,
doc_performance varchar(20) not null,
salary int check (salary>50000)
);
create table patient(
patient_id int primary key,
Patient_name varchar(20) not null,
doc_id int,
foreign key (doc_id) references doctor(doc_id)
);

desc patient;
desc  doctor;
-- Now we will use default constraint
create table country(
country_ID int primary key ,
country_name varchar(20) default 'Bharat');
desc country;
insert into country (country_ID)
value
(1),(2);
select * from country;
/* Now we use Auto increment which is not a constraint it is an 
column attribute
*/ 
create table students4(
students_id int primary key auto_increment,
students_name varchar(20) not null
);
desc students4;
insert into students4 (students_name)
values
('AA'),
('BB');
select * from students4;
-- Now we want the student_id to start from 100

create table students5(
students_id int primary key auto_increment,
students_name varchar(20) not null
)
auto_increment=100;

insert into students5 (students_name)
values
('AA'),
('BB');
select * from students5;







-- Now we use update 

update students10 set students_name='CC'
where students_id=2;
select * from students10;
update students10 set students_name='CC'
where students_id=3;
select *from students10;
-- Now we use delete
delete from students10
where students_id=2;
select * from students10;

-- DCL - Data Control Language(used at the admistrative side)
grant all on country 
to user_name;
grant select, insert on country 
to user_name;
revoke all on country 
to user_name;
revoke select, insert on country 
to user_name;
-- Here user_name = user_id

-/* TCL - Transaction Control Language
commit,rollback,savepoint */
set autocommit=0;
create table students11(
students_id int primary key,
students_name varchar(20)
);
insert into students11 value
(1,'AA'),(2,'BB');
select * from students11;
commit;
insert into students11 values
(3,'CC');
rollback;
/* Firstly we said autocommit = 0 it avoid the system from permanent store. 
leter we create a table inserted two rows under that after it 
now it set commit;
It will do the permanent store of the 3rd line after it if I do the rollback 
not it will again my table till 2nd row only.
Actually the rollback acts like undo(Ctr+z) only.
Even if I write 10 lines that and inserted also but if I rollback
again then again table will be in the statue of 2 rows only
*/

-- Now we use update 

update students10 set students_name='CC'
where students_id=2;
select * from students10;
update students10 set students_name='CC'
where students_id=3;
select *from students10;
-- Now we use delete
delete from students10
where students_id=2;
select * from students10;

-- DCL - Data Control Language(used at the admistrative side)
grant all on country 
to user_name;
grant select, insert on country 
to user_name;
revoke all on country 
to user_name;
revoke select, insert on country 
to user_name;
-- Here user_name = user_id

-/* TCL - Transaction Control Language
commit,rollback,savepoint */
set autocommit=0;
create table students11(
students_id int primary key,
students_name varchar(20)
);
insert into students11 value
(1,'AA'),(2,'BB');
select * from students11;
commit;
insert into students11 values
(3,'CC');
rollback;
/* Firstly we said autocommit = 0 it avoid the system from permanent store. 
leter we create a table inserted two rows under that after it 
now it set commit;
It will do the permanent store of the 3rd line after it if I do the rollback 
not it will again my table till 2nd row only.
Actually the rollback acts like undo(Ctr+z) only.
Even if I write 10 lines that and inserted also but if I rollback
again then again table will be in the statue of 2 rows only
*/

-- Class 8




-- Employees Dataset for practicing Text and Numeric Functions
create database employees;
USE employees;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    city VARCHAR(50),
    salary DECIMAL(10,2),
    bonus DECIMAL(10,2),
    age INT,
    experience_years INT
);

INSERT INTO employees VALUES
(101, 'Rahul', 'Sharma', 'IT', 'Delhi', 55000.75, 5000.50, 25, 2),
(102, 'Priya', 'Verma', 'HR', 'Mumbai', 48000.50, 4000.00, 28, 4),
(103, 'Amit', 'Singh', 'Finance', 'Kolkata', 62000.00, 6000.75, 32, 7),
(104, 'Neha', 'Gupta', 'IT', 'Bangalore', 71000.25, 7000.25, 30, 6),
(105, 'Rohit', 'Mehta', 'Sales', 'Pune', 45000.00, 3500.50, 26, 3),
(106, 'Anjali', 'Patel', 'Marketing', 'Ahmedabad', 52000.60, 4200.40, 29, 5),
(107, 'Vikas', 'Yadav', 'IT', 'Delhi', 68000.80, 6500.60, 31, 8),
(108, 'Sneha', 'Reddy', 'Finance', 'Hyderabad', 59000.45, 5000.00, 27, 4),
(109, 'Karan', 'Malhotra', 'Sales', 'Chennai', 47000.90, 3000.30, 24, 2),
(110, 'Pooja', 'Kapoor', 'HR', 'Delhi', 51000.00, 4500.75, 28, 5);














-- employees_dataset for Text & Numeric FN.sql
-- Displaying employees_dataset for Text & Numeric FN.sql.
select * from employees;
-- text fn
select upper(first_name) from employees;
select lower(first_name) from employees;
-- Trim remove the unnecessary spacing 
select trim (first_name) from employees;
select first_name from employees;
-- Now we use alias to rename the column header but it is temporary 
select first_name as First_name
from employees;
select frist_name, length(first_name) as Length
from employees;
select first_name, last_name,concat(first_name," ",last_name)
as New_Name from employees;
select department,replace(department,"IT","Information Technology")
As New_dept from employees;
select first_name from employees;
select first_name,mid(first_name,3,2)
as Mid_name from employees;
select first_name from employees;
select first_name , substr(first_name,1,4)
as sub_name
from employees;
select first_name from employees;
select first_name , substring(first_name,1,4)
as sub_name
from employees;
-- Aggregate Functions 
select count(emp_id) from employees;
select count(first_name) from employees;
select count( distinct first_name) as Distict_names
from employees;
select max(salary) from employees; 
select min(salary) from employees; 
select experience_years,power(experience_years,2)
as Square_of_It
from employees;
select salary from employees;
select salary ,truncate(salary,0)
as int_salary from employees;

select salary from employees;
select salary ,round(salary,0)
from employees;
--- floor
select salary,floor(salary)
from employees;
select salary,ceil(salary)
from employees;
select sum(salary) from employees;
select avg(salary) from employees;
select distinct(department) from employees;
select sqrt(experience_years)
from employees;

-- How to distiguish b/table
/* If we giving multiple rows and having multiple output rows than it will be a Numeric Function ex
round,ceil,sqrt 
If we giving multiple input rows and having output with single 
row than it is aggregate fn ex sum ,count,avg 

Numeric fn works on rows level gives the output row wise 
But Aggregate fn takes the group or set of rows as a input and 
gives the single output
*/
select department,salary from employees;
select department ,sum(salary) 
from employees
group by department
having sum(salary)>100000;
-- Group by clause is usually used with aggregate fn
select city,sum(bonus) 
from employees
group by city
having sum(bonus)>1000;


SHOW DATABASES;

-- class 9


select * from employees
where emp_id=110;

-- INDEX
show index from employees;
-- How to create the index?
create index dept_idx
on 
employees(department);
 drop index dept_idx 
 on employees;
 create index dept_idx
on 
employees(department);

create index sal_idx 
on employees(salary);
drop index sal_idx
on employees;
show index from employees;

drop index emp_id
on employees;

/* System created indexes like primary and unique key 
can't be droped directly .We must drop the constraint first which automatically removes the index


If we create a index on a column, the database stores the column values along with their locations. alter 
so, when we search using that required row instead of scanning the whole dable
Main resoan why creating the index is not always preferred?
Ans.- 1. When you insert,update or delete 
data the database must update the table and delete
Operations,
2. Use extra storage space 
3. NOt useful for  small tables database can quickly 
scan without indexes.
4. Too many indexes reduce overall performance. alter

* When index in preferred: 
1.for Larger table
2. Columns frequently used in where cluase
3. Columns used in forign key 
4. Primary key and forein key
clusterd index non clusterd index 
An index can be create on one or more column 
when an index involu multiple columns its called a composite 
key 
Used a composite index when quirest prefer  the condition 
where columns=?
and columns=?
They are frequantly used 
Involevs multiple columns  together 

*/
-- How to create composite index 
create index dept_inx2
on 
employees(department,city);

SHOW INDEX FROM employees;

DROP INDEX dept_inx2 ON employees;
-- CREATE INDEX dept_inx2 
-- ON employees(department, city);

-- CREATE INDEX dept_inx3 
-- ON employees(department, city);




-- Class 10  







create database joinclass;
use joinclass;

-- Customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    email VARCHAR(100));

-- DROP TABLE IF EXISTS employees_null_practice;

CREATE TABLE employees_null_practice (
emp_id INT,
emp_name VARCHAR(50),
department VARCHAR(50),
salary INT,
bonus INT,
manager_id INT
);

INSERT INTO employees_null_practice VALUES
(1, 'Amit', 'IT', 50000, 5000, NULL),
(2, 'Rahul', 'HR', NULL, 3000, 1),
(3, 'Sita', NULL, 45000, NULL, 1),
(4, 'Neha', 'Finance', 60000, NULL, 2),
(5, 'Vikas', 'IT', NULL, 4000, 2),
(6, 'Priya', NULL, 52000, 3500, 3),
(7, 'Ankit', 'HR', 48000, NULL, NULL),
(8, 'Pooja', 'Finance', NULL, 2000, 4),
(9, 'Rohit', NULL, 55000, NULL, NULL),
(10, 'Sneha', 'IT', NULL, NULL, 5);
 /* 
 We can directly change the name of the table by just right click 
 over the table and select alter table ,directly we can make changes there
 in the table Name
 */
 select * from null_practice;
 --  as Null_Exist from null_practice;

 select * from null_practice;
 select * ,isnull(department)

 from null_practice;
 
 select * , ifnull(department,2)
 from 
 null_practice;
 select * , ifnull(department,bonus)
 from 
 null_practice;
 -- Here ifnull is replaced by coalesce for putting condition.
 select *, coalesce(department,bonus,100)
 from null_practice;
 /* For checking of presence of null  we use Isnull and for 
 replacing the null in the new columns otherewise coalence*/
 
 
 -- Class 11
 
 
 -- Joints 

-- JOIN PRACTICE DATASET

/*
It don't insert the rows 
there are seven type of join inner join left right join full join self join natural join cross join 
The first three are basic join where remaining join are intermediate or advance level join 
in the place of inner join i can write join also because inner join is the byfault join my sql 
Inner Join - Its gives the common areas between the table 
Left Join - Its gives the left complete areas and also common areas 
Right Join - Its gives the common areas between both table and the right table remaining values with the 
left table (common areas) values.
NOw if i need to call some particulare are 
Iwould write a columns name in the colunms is confused more it is to pick up that column so it will show the ambigues error 
than instead of write a custumer_id we wright c.customer now system will under stand. 
*/

-- Full Join
select * from 
categories as c 
full join 
products as p 
on 
c.category_id = p.category_id;
/*
Full join is not supported by Mysql but it work other tool like oracal 
Full join:- Common areas between multi table and the remaining part with the right table remaining 
part
*/

create database joints;
use joints;

-- Inner Join

select * from 
categories as c 
inner join 
products as p 
on 
c.category_id = p.category_id;

-- Left Join
select * from 
categories as c 
left join 
products as p 
on 
c.category_id = p.category_id;

-- Right join
select * from 
categories as c 
right join 
products as p 
on 
c.category_id = p.category_id;

-- Now we need the  some particular columns
-- select category_id,product_name,
-- price from 
-- categories as c 
-- inner join 
-- products as p 
-- on 
-- c.category_id = p.category_id;

select c.category_id,p.product_name,
p.price from 
categories as c 
inner join 
products as p 
on 
c.category_id = p.category_id;


-- Customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    email VARCHAR(100)
);

INSERT INTO customers VALUES
(1,'Shubham','Delhi','shubham@gmail.com'),
(2,'Amit','Mumbai','amit@gmail.com'),
(3,'Neha','Pune','neha@gmail.com'),
(4,'Rohit','Delhi','rohit@gmail.com'),
(5,'Priya','Bangalore','priya@gmail.com');

-- Categories table
CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

INSERT INTO categories VALUES
(1,'Electronics'),
(2,'Clothing'),
(3,'Books');


-- Products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10,2),
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

INSERT INTO products VALUES
(101,'Laptop',50000,1),
(102,'Mobile',20000,1),
(103,'T-Shirt',500,2),
(104,'Jeans',1200,2),
(105,'SQL Book',700,3);

-- Orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO orders VALUES
(1001,1,'2024-01-10'),
(1002,2,'2024-01-12'),
(1003,1,'2024-01-15'),
(1004,3,'2024-01-18'),
(1005,5,'2024-01-20');

-- Order Items table
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO order_items VALUES
(1,1001,101,1),
(2,1001,103,2),
(3,1002,102,1),
(4,1003,105,3),
(5,1004,104,1),
(6,1005,101,1);

-- SAMPLE JOIN QUERY
SELECT customers.customer_name, products.product_name, order_items.quantity
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
JOIN order_items ON orders.order_id = order_items.order_id
JOIN products ON order_items.product_id = products.product_id;



-- Class 12

-- Self Join

-- Create Employee table 
CREATE TABLE employee ( employee_id INT PRIMARY
KEY, employee_name VARCHAR(50), job_title VARCHAR(50), manager_id INT,
salary INT );

-- Insert data 
INSERT INTO employee VALUES
 (1, 'Amit', 'CEO', NULL,100000); INSERT INTO employee VALUES (2, 'Neha', 'Manager', 1, 75000);
INSERT INTO employee VALUES (3, 'Raj', 'Manager', 1, 72000); INSERT INTO
employee VALUES (4, 'Priya', 'Team Lead', 2, 60000); INSERT INTO
employee VALUES (5, 'Vikas', 'Team Lead', 2, 58000); INSERT INTO
employee VALUES (6, 'Sneha', 'Developer', 4, 45000); INSERT INTO
employee VALUES (7, 'Arjun', 'Developer', 4, 43000); INSERT INTO
employee VALUES (8, 'Kavita', 'Developer', 5, 42000); INSERT INTO
employee VALUES (9, 'Rohit', 'Intern', 6, 25000); INSERT INTO employee
VALUES (10, 'Pooja', 'Intern', 7, 24000); INSERT INTO employee VALUES
(11, 'Manish', 'HR', 2, 50000); INSERT INTO employee VALUES (12,
'Simran', 'Accountant', 3, 52000);



CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO departments VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Sales'),
(4, 'Finance'),
(5, 'Marketing');

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    salary INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

INSERT INTO employees VALUES
(101, 'Amit', 30000, 1),
(102, 'Neha', 60000, 2),
(103, 'Rahul', 45000, 3),
(104, 'Priya', 80000, 2),
(105, 'Vikas', 50000, 4),
(106, 'Sneha', 75000, 2),
(107, 'Arjun', 40000, 5),
(108, 'Kavya', 90000, 4),
(109, 'Rohit', 55000, 3),
(110, 'Anjali', 65000, 1);


select * from employees;
select max(salary) from employees;
select max(salary) from employees
where salary <(select max(salary) from employees);

select max(salary) as Second_Highest_Salary from employees
where salary <(select max(salary) from employees);

select max(salary) as First_Highest_Salary,
(select max(salary) as Second_Highest_salary from employees
where salary <(select max(salary) from employees)) as 
Second_Highest_Salary from employees;

-- Case Statement



-- Derived TAble Subquary









create database Ranks;
CREATE TABLE Ranks (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO Ranks (emp_id, emp_name, department, salary) VALUES
(101, 'Amit', 'HR', 50000),
(102, 'Riya', 'IT', 60000),
(103, 'Sohan', 'IT', 60000),
(104, 'Priya', 'Finance', 75000),
(105, 'Rahul', 'HR', 50000),
(106, 'Neha', 'Finance', 75000),
(107, 'Karan', 'IT', 90000),
(108, 'Simran', 'HR', 50000),
(109, 'Vikas', 'Finance', 90000),
(110, 'Anjali', 'IT', 60000),
(111, 'Rohit', 'HR', 45000),
(112, 'Pooja', 'Finance', 75000),
(113, 'Arjun', 'IT', 90000),
(114, 'Kavya', 'HR', 45000),
(115, 'Manish', 'Finance', 60000);

select * from employees;
select * ,rank() over (order by salary desc) 
as Ranks 
from employees;
-- Dense Ranks
select * ,dense_rank() over (order by salary desc) 
as Ranks 
from employees;
window fn takes same no. of imput rows and in output 
it provides same number of output rows.
It takes multiple input rows but in output it provides the 
output


-- 15th class
select * from empoyees;
select * , rank()over(order by salary desc)as Ranks
from employees;
select *,percent_rank()over(order by salary desc) as Ranks 
from employees;

select *,ntile(4)over(order by salary desc) as Ranks 
from employees;

select *,row_number()over(order by salary desc) as 
Unique_Sequantial_Order
from employees;
-- Now we use Partition by
select *,rank()over(partition by department 
order by salary desc) as Ranks 
from employees;

-- Windows Aggregates function 
select *,sum(salary)over(order by salary desc) as salary 
from employees;

select *,avg(salary) over(order by salary desc) as salary 
from employees;

select *,min(salary)over(order by salary desc) as salary
from employees;

select *,max(salary)over(order by salary desc) as salary
from employees;

select *,count(salary)over(order by salary desc) as salary
from employees;
-- Values windows functions
select * ,lead(salary) over(order by salary desc) as salary 
from employees;

select *,lag(salary)over(order by salary desc) as salary
from employees;

select *,first_value(salary)over(order by salary desc) as salary
from employees;

select *,last_value(salary)over(order by salary desc) as salary
from employees;

-- windows fn takes n no. of input rows and provide n no. of 
/*output rows . The input rows and 

its works at row label provide the output for each rows 
so, we can say the windows is create for each row. 
In the query 
if the over clouse given then we will decide that it is window fn 
windows fns are categoriase into three types 
1. Rank
2. Aggregate windows fn 
3. Values fn
The rank fn in the condition of 
where the dense fn always provide the uniqu sequantial no. 
and divide the 
percent ranks provide 
rank -1/(no. of rows-1)
Its works for normal distribution data.
In the value fn the lead fn gives the coming values where the lag fn give the last values
the first value gives the first values of the column where the last value provides the last 
value of the data on the basic of partition.
Its all aggregate fn works on the row label 
If i perform the minimum It don't find the 
it find row by row

Over(): Its an identity fn of window fn 
Order by : In which column we are to perform the fn operation
partition in window fn the used it 
*/