-- Class test
create database A;
use A;
create table A(A_ID int,Name_s varchar(20),City varchar(20),Date_ date,salary int);
insert into A values
('AA','BB','2001-01-01',50000),
('CC','DD','2002-01-01',50000),
('EE','FF','2003-01-01',50000),
('GG','HH','2004-01-01',50000),
('II','JJ','2005-01-01',50000);
desc A ;



-- Home Work

create database C;
use C;
create table D(C_ID int ,C_name varchar(20),Location varchar(20),Date_ date);
insert into D values
(1,'AA','BB','2001-01-01'),
(2,'CC','DD','2002-02-02'),
(3,'EE','FF','2003-03-03'),
(4,'GG','HH','2004-04-04'),
(5,'KK','JJ','2005-05-05');
desc D;

-- Class Third

select * from customers;
drop table customers;
create table customers
(customer_id int ,
customer_name varchar(20), 
performance varchar(20), 
salary int , 
Date_of_joining date); 
 insert into customers values
 (1,'AA','Good',40000,'2001-01-01'),
(2,'CC','Bad',20000,'2002-02-02'),
(3,'EE','Excellent',50000,'2003-03-03'),
(4,'GG','Very Good',60000,'2004-04-04'),
(5,'KK','Good',24000,'2005-05-05');

select * from customers;

select * from customers
-- where performance='good';
where performance='bad';

select * from customers 
where performance='good' and salary >= 20000;

select * from customers
where customer_id > 2 and salary > 20000;
select * from customers 
where customer_id > 2 or salary > 50000;

select * from customers
where salary  between 20000 and 40000;

select customer_name from customers 
where performance is null;

select customer_name from customers 
where performance is not null;


-- first me 'a' letter ana chahiye
select * from customers 
where customer_name like 'a%';

-- select * from customers 
-- where customer_name  not like 'a%';

select * from customers 
where customer_name like '%a';

select * from customers 
where customer_name like 'g%';

-- Second no. per 'o' letter ana chahiye
select * from customers 
where customer_name like '_o%';

-- 'd' 4th no. pr aa rha hai
select * from customers 
where customer_name like '___d%';


select * from customers 
where performance='good' or customer_name like 'a%';

select * from customers 
where customer_name like 'a%' and salary > 20000;