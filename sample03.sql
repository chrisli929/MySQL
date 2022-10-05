-- from子句
select * 
from EMP e
    join DEPT d
		on e.DEPTNO = d.DEPTNO;
        
select * from SAL_LEVEL;

-- 介於最大與最小值
select *
from
	EMP e
    join SAL_LEVEL s
		on e.SAL between s.SAL_MIN and s.SAL_MAX;

select *
from
	DEPT d
    left join EMP e
		on d.DEPTNO = e.DEPTNO;

select *# e.ENAME, e_2.ENAME
from EMP e
	left join EMP e_2
		on e.MGR = e_2.EMPNO;
        
#----------------------------
#公司金資前三高
-- limit
select * from EMP
order by SAL desc
limit 3;

#-----------------------
-- 子查詢
# 1.算出平均薪資
select avg(SAL) from EMP;
# 2.找出薪資低於公司平均薪資的員工
select * from EMP
where SAL < (select avg(SAL) from EMP);
#         < 2073.214286

#多
# 列出在NEW YORK上班的員工
# step1: 找出在NEW YORK的部門
select DEPTNO from DEPT where LOC = 'NEW YORK';

# step2: 找出在NEW YOUK上班的員工
select * from EMP where DEPTNO = 10;
#-------------------------------
select * 
from EMP 
where DEPTNO = (
	select DEPTNO 
    from DEPT 
    where LOC = 'NEW YORK');
# 單筆可以用= 多筆就用in

-- 多攔單筆
#列出跟員工編號7499的員工，同職稱、同主管的員工
#step1: 找出7499
select JOB, MGR from EMP where EMPNO = 7499;

#step2: xxx
select * from EMP
where JOB = 'SALESMAN' and MGR = 7968;
#---------------------------------------
select * from EMP
where
	(JOB, MGR) = (
    select JOB, MGR 
    from EMP 
    where EMPNO = 7499);

-- 多攔多筆
# 列出 職稱 跟 薪水 有重複的員工
select JOB, SAL
from EMP
group by JOB, SAL
having count(*) > 1;

#step2:
select *
from EMP
where 
	JOB = 'SALESMAN' and SAL = 1250
	or 
	JOB = 'ANALYST' and SAL = 3000;
#step3:
select *
from EMP
where (JOB, SAL) in (
	select JOB, SAL
    from EMP
    group by JOB, SAL
    having count(*) >1 );
    
-- 找出各部門薪資最高的人
select DEPTNO, MAX(SAL)
from EMP
group by DEPTNO;

select *
from EMP e
	join(
		select DEPTNO, MAX(SAL)
        from EMP
        group by DEPTNO) t # 子查詢如果用在主查詢的from子句 下面一定要加別名
        on e.DEPTNO = t.DEPTNO
where
	e.sal = t.`MAX(SAL)`;  #  `` 可以將函數當名稱

-- 範例-子查詢6-exists運算子
-- 列出沒有員工的部門
select *
from DEPT d
where
    not exists (
        select *
        from EMP
        where DEPTNO = d.DEPTNO)