-- TCL
select @@autocommit;
-- set autocommit = 0;
delete from EMP;
delete from DEPT;
delete from SAL_LEVEL;

select * from EMP;
select * from DEPT;
select * from SAL_LEVEL;

rollback;

-- 儲存點 savepoint