-- having은 group by되고 난 뒤에 조건절
SELECT job, max(sal)
FROM emp
GROUP BY job
HAVING max(sal) >= 2500;

SELECT *
FROM (
SELECT job, max(sal) money
FROM emp
GROUP BY job
)
WHERE money > 2500;


SELECT avg(point), g1
FROM(
    SELECT gname, point, ceil(rownum/5) g1
    FROM gogak
)
GROUP BY g1; -- 4행

SELECT avg(point), g1
FROM (
    SELECT gname, point, mod(rownum, 2) g1
    FROM gogak
)
GROUP BY g1;

-- student 테이블에서 교수가 관리하고 있는 학생들을 카운팅하시오.
SELECT profno, count(profno)
FROM student
WHERE profno is not null
GROUP BY profno
ORDER BY profno;

-- student 테이블에서 비만인 그룹의 몸무게 평균과 마른 그룹의 몸무게 평균을 구하시오
-- 60kg 이상 (비만), 60kg 미만(마른)
SELECT round(avg(weight), 2) 평균, decode(g1, 1, '비만', '마른') 비만도
FROM (
    SELECT name, weight, floor(weight/60) g1
    FROM student
    ORDER BY weight
)
GROUP BY g1;

-- CASE WHEN으로 다시 풀어보기
SELECT round(avg(weight), 2) 평균, 비만도
FROM (
    SELECT name, weight, case when weight >= 60 then '비만'
                            else '마름' end 비만도
    FROM student
    ORDER BY weight
)
GROUP BY 비만도;

-- 순위 구하기
-- rownum, 인라인뷰로 썼던 순위 구하기
-- rank() over()
-- sal이 중복되니까 공동 2등이 생김 3위가 없고 바로 4위가 나옴

SELECT ename, rank() OVER (ORDER BY sal DESC), sal 
FROM emp;

-- 공동 2등 이후 4등이 아닌 3등으로 나오게 하는 함수
-- dense_rank() over()
SELECT ename, dense_rank() OVER (ORDER BY sal DESC), sal 
FROM emp;


-- UNION ALL은 컬럼 개수가 같아야 합칠 수 있음
-- 통계 쿼리
SELECT deptno, sal, rank() OVER (ORDER BY sal DESC) 
FROM emp
WHERE deptno = 10
UNION ALL
SELECT null, sum(sal), null
FROM emp
WHERE deptno = 10
UNION ALL
SELECT deptno, sal, rank() OVER (ORDER BY sal DESC) 
FROM emp
WHERE deptno = 20
UNION ALL
SELECT null, sum(sal), null
FROM emp
WHERE deptno = 20
UNION ALL
SELECT deptno, sal, rank() OVER (ORDER BY sal DESC) 
FROM emp
WHERE deptno = 30
UNION ALL
SELECT null, sum(sal), null
FROM emp
WHERE deptno = 10
UNION ALL
SELECT null, sum(sal), null
FROM emp;

-- PARTITION BY (그룹핑) 오라클만 가지고 있음!
SELECT deptno, sal, rank() OVER (PARTITION BY deptno ORDER BY sal DESC) 부서별순위
FROM emp;

-- ROLL UP
-- 부서별 총계
SELECT deptno, sum(sal)
FROM emp
GROUP BY rollup(deptno);

-- group by rollup에 두개를 적으면 두개에 대한 접힘이 생김 DISTINCT
-- job과 deptno가 같은애가 rollup(압축)
-- 목적 : 소계와 총계
-- > 같은애들을 sum(sal)
-- 규칙 1. deptno, job으로 롤업한다. deptno와 job이 같은 애들을 롤업하여 합을 구함
-- 규칙 2. deptno(첫번째 인수)로 롤업한다. 롤업하여 소계를 구함(UNION ALL했던것)
-- 소계를 구해서 중간에 끼워넣을 수 없기때문에 UNION ALL을 사용했음
-- 규칙 3. 전체 소계를 구함
-- 만약 rollup(A, B, C, D)이면 ABCD로 롤업 -> ABC로 롤업 -> AB로 롤업 -> A로 롤업 -> 통계
SELECT deptno, job, sum(sal)
FROM emp
GROUP BY rollup(deptno, job);

-- PIVOT






