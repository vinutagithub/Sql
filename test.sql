create database customer;

use customer;
create table persons(id int,name varchar(20),course char(10),primary key(id));

# DML inser,update,select,delete
insert into persons value(10,'john','QA');
insert into persons value(11,'john A','QA');
insert into persons value(12,'john B','QA');

#
select * from persons;

#update course to UI with id=11

update persons set course='UI' where id=11;

#DCL -Data Control Language
# grant - ,
# revoke
#------------------------------------------------



#TCL Transaction control language --commands
#commit
#rollback
#savepoint
#--------------------------------------------------------
#savepoint A 
#Q1
#Q2
#q3
#savepoint B 
#Q4
#Q5
#Q6
#savepoint cache index
#savepoint 
/*
Set autocommit=1;#if autocommit =1 it will directly update in table
insert into persons values(15,'joe','UI');
rollback;
commit;*/
# describe <table name> - structure of the table;

SELECT  name + ',' + course as course(char)
FROM persons;

