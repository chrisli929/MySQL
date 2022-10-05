/*
select *
from EMP
where DEPTNO = 10
	and SAL > 3000
    
select *
from EMP
where DEPTNO = 10 or DEPTNO = 20

select *
from EMP
where 
	#SAL >= 1000 and SAL <= 2000
	SAL between 1000 and 2000
#查出薪水1000~2000


select * from EMP
where 
	# DEPTNO = 10 or DEPTNO = 20
	# DEPTNO in(10,20)
    # DEPTNO != 10 and DEPTNO != 20
    DEPTNO not in(10,20)


select * from EMP
where COMM is not null
#null 空值 要用is not


select * from EMP
where ENAME like '__L%'

select * from EMP
where 
	ENAME like '%@%' escape '@'

select *
from EMP
order by SAL + IFNULL(COMM, 0)  不要打數字

select *
from EMP
order by SAL desc

select deptno, count(*), max(sal)
from EMP
group by DEPTNO
	 with rollup


select char_length('abc中文字')

select ename, left(ename,1)
from emp

select curdate(), curtime(),  now()

select hiredate, month(hiredate)
from emp #作業2

select DEPTNO, count(*), max(sal), min(sal), sum(Sal), avg(sal)
from EMP
group by DEPTNO

select DEPTNO, count(*), count(ENAME)
from EMP

select  DEPTNO, count(distinct JOB) 
from EMP  #幾種職稱
group by DEPTNO

select DEPTNO, COUNT(*)
from EMP
group by DEPTNO
having count(*) >= 5 

select *
from
	EMP natural join DEPT #兩個表格都要一樣
#版本不一樣
# SQL92
select *  # e.*, d.* 也可以
from
	EMP e
    join DEPT d
		on e.DEPTNO = d.DEPTNO
# SQL89
select *
from
	EMP e, DEPT d
where
    e.DEPTNO = d.DEPTNO
*/