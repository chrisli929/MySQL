-- DDL
create table EMP_TEST
as
select * from EMP where 1 = 2


select * from EMP_TEST

create table EMP_BAK like EMP;

select * from EMP_BAK