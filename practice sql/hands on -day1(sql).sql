--create databse
CREATE DATABASE Sample;
--use the database created
USE Sample;
--table creation
create table details(name varchar(20) not null, age int, address varchar(50));
--insert the values in the created table 
insert into details(name,age,address) values('aaron',20,'madurai'),('mickey',20,'madurai'),('chokki',20,'madurai');
--add additional column in the table created
ALTER TABLE details ADD  email VARCHAR(50);
--to remove the column from the table
alter table details drop column email;
--delete the specific record from table
delete from details where name='mickey'
--retrive all the record from table
select * from details;
go
update details set age=21 where name='mickey';
go
declare @ageid int
set @ageid=20
select name,age,address from details where age=@ageid;

select name from details;
select *from details;