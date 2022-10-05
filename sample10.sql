-- 組內排序
select 
	DEPTNO,
    ENAME,
    SAL,
    RANK() over(
		partition by DEPTNO
        order by SAL desc
	)
from EMP