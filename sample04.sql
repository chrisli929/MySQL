-- 新增表格
select * from DEPT;

insert into DEPT(DNAME, DEPTNO)
values
	('軟體開發部(三)', '77'),
    ('軟體開發部(四)', '66');

-- 新增來自別的TABLE
insert into EMP
select 9999, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
from EMP 
where EMPNO = 7369;

-- 刪除 前面加備註避免刪除
select * from DEPT
-- delete from DEPT
where LOC is null;

select * from EMP
-- delete from EMP
where EMPNO = 9999;

-- 修改表格 只能放單欄單筆
select * from DEPT;
-- update DEPT
set
	DNAME = 'SoftwareDev',
	LOC = 'Taipei'
where DEPTNO = 99;


