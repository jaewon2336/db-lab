-- 1번 문제 : 전화번호 가운데 부분 추출하기
SELECT substr(tel, instr(tel, ')')+1, instr(tel, '-')-instr(tel, ')')-1) 가운데, tel
FROM student;
--

SELECT avg(sal)
FROM emp;

-- ROUND 반올림. 두번째 인수는 소수점 자리수
SELECT ROUND(987.654, 2)
FROM dual;

--TRUNC 소수점 이하 버리기
SELECT TRUNC(987.654, 2)
FROM dual;

-- mod 나머지 구하기
SELECT mod(6,4)
FROM dual;

-- 날짜 sysdate 현재시간 출력
SELECT sysdate 
FROM dual;

SELECT * FROM emp;

-- 현재 시간과 사이의 개월 수
SELECT ENAME, TRUNC(MONTHS_BETWEEN(SYSDATE,hiredate)/12) 근속년수,
decode(TRUNC(MONTHS_BETWEEN(SYSDATE,hiredate)/12), 40, '금반지증정', '없음') 
FROM emp;

SELECT ADD_MONTHS(sysdate, 3)
FROM dual;

-- 마지막 날짜 출력
SELECT last_day(sysdate)
FROM dual;

-- 형변환 함수 to_number(), to_char(), to_date()
SELECT 2 + to_number('2')
FROM dual;

-- YYYY MM DD hh:mm:ss 규칙
SELECT ename, to_char(hiredate,'YYYY-MM-DD') HIREDATE
FROM emp;

-- 오라클 : DAY 요일
SELECT ename, to_char(hiredate,'DAY') HIREDATE
FROM emp;

SELECT to_date('2020/04/01')
FROM dual;

SELECT to_char(1530, '$9999') FROM dual;
SELECT to_char(1530, '$9,999') FROM dual;

-- REPLACE 퀴즈 1
SELECT ename, REPLACE(ename, substr(ename, 2, 2), '--') REPLACE
FROM emp;

-- REPLACE 퀴즈 2
SELECT name, jumin, REPLACE(jumin, substr(jumin, 7, 7), '-/-/-/-') REPLACE
FROM student
WHERE deptno1 = 101;

-- REPLACE 퀴즈 3
SELECT name, tel, REPLACE(tel, substr(tel, instr(tel, ')')+1, instr(tel, '-')-instr(tel, ')')-1), '***') REPLACE
FROM student
WHERE deptno1 = 102;

-- REPLACE 퀴즈 4
SELECT name, tel, REPLACE(tel, substr(tel, instr(tel, '-')+1, 4), '****') REPLACE
FROM student
WHERE deptno1 = 101;

-- mysql 문제 1번
SELECT empno, ename, sal
FROM emp
WHERE deptno = 10;

-- mysql 문제 2번
SELECT ename, hiredate, deptno
FROM emp
WHERE empno = 7369;

-- mysql 문제 3번
SELECT *
FROM emp
WHERE ename = 'ALLEN';

-- mysql 문제 4번
SELECT ename, deptno, sal
FROM emp
WHERE hiredate = '80/12/17';

-- mysql 문제 5번
SELECT *
FROM emp
WHERE job != 'MANAGER';

-- mysql 문제 6번
SELECT *
FROM emp
WHERE hiredate > '81/04/02';

-- mysql 문제 7번
SELECT ename, sal, deptno
FROM emp
WHERE sal >= 800;

-- mysql 문제 8번
SELECT *
FROM emp
WHERE deptno >= 20;

-- mysql 문제 9번
SELECT *
FROM emp
WHERE hiredate < '81/12/09';

-- mysql 문제 10번
SELECT empno, ename
FROM emp
WHERE empno <= 7698;

-- mysql 문제 11번?
SELECT ename, sal, deptno
FROM emp
WHERE hiredate > '81/04/02' AND hiredate < '82/12/09';

-- mysql 문제 12번
SELECT ename, job, sal
FROM emp
WHERE sal > 1600 AND sal < 3000;

-- mysql 문제 13번
SELECT *
FROM emp
WHERE empno > 7654 AND empno < 7782;

-- mysql 문제 14번?
SELECT *
FROM emp
WHERE ename BETWEEN 'B' and 'J';

-- mysql 문제 15번
SELECT *
FROM emp
WHERE substr(hiredate, 1, 2) != '81';

-- mysql 문제 16번
SELECT *
FROM emp
WHERE job in('MANAGER', 'SALESMAN');

-- mysql 문제 17번
SELECT ename, empno, deptno
FROM emp
WHERE deptno != 20 AND deptno != 30;

-- mysql 문제 18번
SELECT empno, ename, hiredate, deptno
FROM emp
WHERE ename LIKE 'S%';

-- mysql 문제 19번
SELECT *
FROM emp
WHERE substr(hiredate, 1, 2) = '81';

-- mysql 문제 20번
SELECT *
FROM emp
WHERE ename LIKE '%S%';

-- mysql 문제 21번
SELECT *
FROM emp
WHERE ename LIKE 'S%T';

-- mysql 문제 22번
SELECT *
FROM emp
WHERE ename LIKE '_A%';

-- mysql 문제 23번
SELECT *
FROM emp
WHERE comm is null;

-- mysql 문제 24번
SELECT *
FROM emp
WHERE comm is not null;

-- mysql 문제 25번
SELECT ename, deptno, sal
FROM emp
WHERE deptno = 30 AND sal >= 1500;

-- mysql 문제 26번
SELECT empno, ename, deptno
FROM emp
WHERE ename LIKE 'K%' OR deptno = 30;

-- mysql 문제 27번
SELECT *
FROM emp
WHERE sal >= 1500 AND deptno = 30 AND job = 'MANAGER';

-- mysql 문제 28번
SELECT *
FROM emp
WHERE deptno = 30
ORDER BY empno;

-- mysql 문제 29번
SELECT *
FROM emp
ORDER BY sal desc;

-- mysql 문제 30번
SELECT *
FROM emp
ORDER BY deptno, sal desc;

-- mysql 문제 31번
SELECT *
FROM emp
ORDER BY deptno desc, ename asc, sal desc;

-- mysql 문제 32번
SELECT ename, sal, comm, sal + comm sum
FROM emp
WHERE comm is not null
ORDER BY sum desc;

-- mysql 문제 33번
SELECT ename, sal, sal * 0.13 BONUS , deptno
FROM emp
WHERE deptno = 10;

-- mysql 문제 34번
SELECT ename, deptno, sal, (sal * 12) + (sal * 1.50) INCOME
FROM emp
WHERE deptno = 30;

-- mysql 문제 35번
SELECT ename, sal, sal * 0.15
FROM emp
WHERE sal >= 2000;

-- mysql 문제 36번
SELECT ename, sal, sal - (sal * 0.1)
FROM emp
ORDER BY sal desc;