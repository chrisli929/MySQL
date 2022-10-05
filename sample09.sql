/*
with test as (select * from EMP where DEPTNO = 30)

select * from test;

#---------- 遞迴

with recursive test as (
	select 1 as n   #初始查詢
    union all
    select n + 1 as n  #遞迴查詢
    from test
    where n < 100
);

select * from test
*/
#------------

with recursive test as (
		select 1 as LEVEL, ENAME, EMPNO
		from ENP
		where MGR is null
    union all
		select t.LEVEL + 1 as LEVEL, e.ENAME, e.EMPNO
		from 
			EMP e
			join test t
				on e.MGR = t.EMPNO
)

select * from test

