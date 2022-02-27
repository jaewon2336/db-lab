-- DDL(테이블 생성)
-- CREATE (테이블 생성, 유저 생성), DROP(삭제), ALTER(수정)

CREATE TABLE USERTBL2

(
    NO NUMBER, 
	USERNAME VARCHAR2(20 BYTE) NOT NULL, 
	PASSWORD VARCHAR2(13 BYTE) NOT NULL, 
	GENDER CHAR(3 BYTE), 
    CONSTRAINT "USERTBL2_PK" PRIMARY KEY ("NO")
);

-- PASSWORD 크기 20BYTE로 수정 -> ALTER
ALTER TABLE USERTBL2 MODIFY PASSWORD VARCHAR2(20);

-- 구조 확인
desc usertbl2;

DROP table usertbl2;

SELECT * FROM usertbl;

-- INSERT
INSERT INTO usertbl(no, username, password, gender) VALUES(1, 'ssar', 'ssar1234', '여');

INSERT INTO usertbl(no, username, password, gender) VALUES(2, 'cos', 'cos1234', '남');

INSERT INTO usertbl(no, username, password) VALUES(3, 'love', 'love1234');

INSERT INTO usertbl(no, username) VALUES(4, 'hello');

ALTER TABLE usertbl ADD UNIQUE (username);

INSERT INTO usertbl(no, username, password) VALUES(4, 'love', 'love1234');

-- DELETE
DELETE FROM usertbl
WHERE username = 'ssar';

DELETE FROM usertbl
WHERE no = 2;


-- UPDATE
UPDATE usertbl SET password = 'love5678'
WHERE no = 3;

UPDATE usertbl SET password = 'love1234', gender = '여'
WHERE no = 3;

-- 조인★★★★★
SELECT *
FROM emp;

SELECT *
FROM dept;

-- 우리가 배운선에서 'SMITH'의 부서번호가 몇번이니?
-- 하지만 결과에 SMITH의 이름은 출력되지 않는다.
SELECT *
FROM dept
WHERE deptno = 
(
    SELECT deptno
    FROM emp
    WHERE ename = 'SMITH'
);

-- INNER는 일단 넘기자 동일조인이라는 말임
-- 뭘로 JOIN할건지 ON에서 지정
SELECT e.ename, e.deptno, d.dname, d.loc
FROM emp e INNER JOIN dept d
ON e.deptno = d.deptno;










