
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

insert into students11 values
(4,'DD');
savepoint sp1;
rollback to spl;