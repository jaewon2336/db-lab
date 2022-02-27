-- 복습해야함!

-- 서브쿼리 (인라인뷰, 스칼라(상수) 서브쿼리, 서브쿼리)
SELECT ename, 2 FROM emp;
-- 스칼라
-- 테이블 별칭가능!
-- 2 자체는 스칼라지만 데이터에 쭈욱 있는 것들은 벡터
-- 결과 데이터가 한줄있는것을 스칼라라고함
-- 행마다 바뀌지 않는 데이터를 스칼라라고함
-- 프로젝션은 행을 채워나가는 과정
-- SELECT안에 SELECT가 또 들어가있는 것 -> 서브쿼리
-- 이때 서브쿼리가 스칼라이면 스칼라 서브쿼리라고 함
-- SELECT로 서브쿼리를 넣으려면 항상 1행이여야 한다.
-- 그래서 보통 컬럼에 적어주는 서브쿼리를 스칼라 서브쿼리라고 한다.
SELECT ename, (SELECT '2' FROM emp)
FROM emp;

SELECT e.*, (SELECT avg(sal) FROM emp)
FROM emp e
ORDER BY deptno;

SELECT avg(sal)
FROM emp;

-- 행의 개수가 안맞음
SELECT max(sal) FROM emp;
-- 사람이 눈으로 보고 적어야하니까 프로그램이 아님
SELECT * FROM emp WHERE sal = 5000;

-- WHERE절에 붙어있는 서브쿼리는 그냥 서브쿼리
SELECT * FROM emp WHERE sal = (SELECT max(sal) FROM emp); 

SELECT sal FROM emp WHERE sal > 2000;

-- =은 같다이니까 in을 사용
SELECT * FROM emp WHERE sal in (SELECT sal FROM emp WHERE sal > 2000); 

-- 인라인뷰, 데이터베이스에서 뷰는 가짜를 의미함
SELECT ename, sal, rownum
FROM(SELECT ename, sal FROM emp ORDER BY sal desc);

-- 번호는 안붙어있지만 순위는 매겨져있음
SELECT ename, sal FROM emp ORDER BY sal desc;

-- 하나씩 꺼내기때문에 찾을 수 있음
SELECT ename, sal, rownum FROM emp WHERE rownum < 3;
-- rownum이 동작(번호 생성)하는 시점은 프로젝션 할 때이다.
-- 1, 2를 안셌으니까 3도 모르는 것이다.
-- 어차피 이렇게 쓰지도 않음 !!!
SELECT ename, sal, rownum FROM emp WHERE rownum > 3;

-- FROM이 들고있는 ROWNUM을 사용하려면 아래와 같이 별칭을 쓴다
SELECT ename, sal, R1
FROM(
    SELECT ename, sal, ROWNUM R1 FROM emp ORDER BY sal desc
    );

-- student 테이블에 키 순위를 구하고 5~8위 출력
SELECT name, height, rank
FROM(
    SELECT e1.*, rownum rank
    FROM(
        SELECT name, height 
        FROM student
        ORDER BY height desc
    ) e1
)
WHERE rank >= 5 AND rank <= 8;

-- GROUP 그룹 (세로 연산 - sum, avg, count, max, min)
-- 전체 sum이 아닌 직업별 sum
-- 이건 전체 sum
SELECT sum(sal)
FROM emp;
-- job은 DISTINCT 중복이 제거가 됨
-- 어떤걸로 그룹핑 할건지 정하는 것
SELECT sum(sal), job
FROM emp
GROUP BY job;

-- 같은 나이별(substr, 인라인뷰) 그룹으로 묶어서 키의 평균 구하기
SELECT year, avg(height)
FROM (
    SELECT substr(jumin, 1, 2) year, height
    FROM student
)
GROUP BY year
ORDER BY year;

-- 같은 지역별 최고 키 (인라인 뷰 활용) : student 테이블
SELECT 지역, max(height)
FROM (
    SELECT substr(tel, 1, instr(tel, ')')-1) 지역, height
    FROM student
)
GROUP BY 지역;

-- 순서대로 5명씩 끊어서 포인트의 평균을 구해주세요 : gogak 테이블
SELECT gname, point, rownum rank
FROM gogak;



SELECT avg(point), team+1
FROM(
    SELECT gname, point, TRUNC((rownum-1)/5) team
    FROM gogak
)
GROUP BY team+1
ORDER BY team+1;



SELECT avg(point)
FROM (
    SELECT t1.*, rownum rank
    FROM (
        SELECT gname, point
        FROM gogak
        ORDER BY point desc
    ) t1
    ORDER BY rank
) t2
WHERE rank <= 5;

