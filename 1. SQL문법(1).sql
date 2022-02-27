SELECT *
FROM emp;

SELECT *
FROM student
WHERE jumin LIKE '__12%';

SELECT LOWER('Ssar') 소문자
FROM dual;

-- 길이 4 = 4자
SELECT length('ABCD')
FROM dual;

-- 가나다라
-- ABCD
-- 길이 4 = 4자
SELECT length('가나다라')
FROM dual;

-- 영어 1Byte (UTF-8)
SELECT lengthb('ABCD')
from dual;

-- 한글 3Byte (UTF-8)
SELECT lengthb('가나다라')
from dual;

SELECT '가나다라'
FROM dual;

SELECT substr('가나다라', 1, 2)
FROM dual;

SELECT name, substr(jumin, 1, 6)
FROM student;

-- 주민번호 751023-1******
SELECT name, substr(jumin, 1, 6) || '-' || substr(jumin, 7, 1) || '******' JUMIN
FROM student;

-- 지역번호 추출하기
SELECT name, tel
FROM student;

SELECT '-)$' 
from dual;

SELECT instr('-)$', '$')
from dual;

SELECT instr(tel, ')')-1
FROM student;

SELECT name, substr(tel, 1, instr(tel, ')')-1) 지역번호, tel
FROM student;






