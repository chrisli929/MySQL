-- 01.請新增以下資料至資料表DEPT 50, 'Software', 'Taipei'
insert into DEPT(DEPTNO, DNAME, LOC)
values (50, 'Sofware', 'Taipei');

-- 02.請新增以下資料至資料表EMP的欄位 EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO
-- 9999, 'William', 'PG', null, NOW(), 2500, 50
-- 8888, 'Lee', 'PM', null, NOW(), 3500, 50
insert into EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO)
values 
	(9999, 'William', 'PG', null, NOW(), 2500, 50),
    (8888, 'Lee', 'PM', null, NOW(), 3500, 50);

-- 03.請修改資料表EMP的資料..
-- 員工8888的主管改為7839
-- 員工9999的主管改為8888
-- 提示: 可配合case運算式，將2個敘述合併成1個敘述！
update EMP
set	MGR = 7839
where EMPNO = 8888;

update EMP
set	MGR = 8888
where EMPNO = 9999;

-- 04.請刪除員工編號為8888的員工之資料
select * from EMP
-- delete from EMP
where EMPNO = 8888;

-- 05.請修改資料表EMP的資料.. 員工9999的主管改為7839，薪水改為4000
update EMP
set 
	MGR = 7839,
    SAL = 4000
where EMPNO = 9999
