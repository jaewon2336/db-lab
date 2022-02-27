-- PIVOT ★★★★★
-- 데이터를 컬럼으로 끌어올리는 기술
-- 세로 데이터를 가로 데이터로 변환

SELECT *
FROM cal;

-- 가짜 컬럼에 날짜(NUM_DAY)만 붙여넣으면 끝
SELECT week, 
1 일,
2 월,
3 화,
4 수,
5 목,
6 금,
7 토
FROM cal
GROUP BY week
ORDER BY week;

-- 일요일이면 num_day 뿌리고 아니면 null 뿌려
SELECT week,
decode(day, '일', num_day),
decode(day, '월', num_day),
decode(day, '화', num_day),
decode(day, '수', num_day),
decode(day, '목', num_day),
decode(day, '금', num_day),
decode(day, '토', num_day)
FROM cal;

-- 데이터를 컬럼으로 끌어올리기 위해 별칭 사용
-- PIVOT의 원리는 decode
-- 그룹별 짜부!
SELECT week,
sum(decode(day, '일', num_day)) 일,
sum(decode(day, '월', num_day)) 월,
sum(decode(day, '화', num_day)) 화,
sum(decode(day, '수', num_day)) 수,
sum(decode(day, '목', num_day)) 목,
sum(decode(day, '금', num_day)) 금,
sum(decode(day, '토', num_day)) 토
FROM cal
GROUP BY week
ORDER BY week;

SELECT * 
FROM emp;

SELECT 
sum(DECODE(job, 'MANAGER', sal)) MANAGER,
sum(DECODE(job, 'ANALYST', sal)) ANALYST,
sum(DECODE(job, 'CLERK', sal)) CLERK,
sum(DECODE(job, 'SALESMAN', sal)) SALESMAN,
sum(DECODE(job, 'PRESIDENT', sal)) PRESIDENT
FROM emp;

SELECT job, sum(sal)
FROM emp
GROUP BY job;

-- PIVOT 함수사용
-- PIVOT (짜부시킬것 FOR 칼럼에 올릴 데이터 in (칼럼 값))
SELECT *
FROM cal
PIVOT (sum(num_day) FOR day in ('일', '월', '화', '수', '목', '금', '토'))
ORDER BY week;

SELECT *
FROM (
    SELECT job, sal FROM emp
    )
PIVOT (sum(sal) FOR job in ('MANAGER', 'ANALYST', 'CLERK', 'SALESMAN', 'PRESIDENT'));

SELECT *
FROM (
    SELECT deptno, sal FROM emp
    )
PIVOT (avg(sal) FOR deptno in (10, 20, 30));


-- ★★★★★ 디비정리 ★★★★★
-- 쿼리실행순서

-- 스칼라 서브쿼리
-- 인라인뷰
-- 서브쿼리

-- PIVOT
-- 함수 사용법, decode 사용법

-- UNION ALL 기억

-- rownum과 인라인뷰로 순위 구하기

-- GROUP BY ★