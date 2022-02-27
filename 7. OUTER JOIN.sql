DROP TABLE postTbl;

INSERT INTO usertbl(no, username, password, gender) VALUES (1, 'ssar', '1234', '남');
INSERT INTO usertbl(no, username, password, gender) VALUES (2, 'cos', '1234', '여');
INSERT INTO usertbl(no, username, password, gender) VALUES (3, 'love', '1234', '여');

CREATE TABLE postTbl
(
    ID NUMBER,
    TITLE VARCHAR2(100 BYTE) NOT NULL,
    CONTENT CLOB NOT NULL,
    USERID NUMBER,
    CONSTRAINT "PostTbl_PK" PRIMARY KEY ("ID"), 
    CONSTRAINT "PostTbl_FK" foreign key("USERID") references userTbl (id)
);



CREATE SEQUENCE SEQ_POSTTBL INCREMENT BY 1 START WITH 1;

INSERT INTO posttbl(id, title, content, userId) VALUES(SEQ_POSTTBL.nextval, '제목1', '내용1', 1);
INSERT INTO posttbl(id, title, content, userId) VALUES(SEQ_POSTTBL.nextval, '제목2', '내용2', 2);
INSERT INTO posttbl(id, title, content, userId) VALUES(SEQ_POSTTBL.nextval, '제목3', '내용3', 2);
INSERT INTO posttbl(id, title, content, userId) VALUES(SEQ_POSTTBL.nextval, '제목4', '내용4', 55);


ALTER TABLE usertbl RENAME COLUMN NO TO ID;

SELECT * FROM usertbl;
SELECT * FROM posttbl;

-- INNER JOIN
SELECT * 
FROM userTbl u INNER JOIN postTbl p
ON u.id = p.userId;

-- LEFT OUTER JOIN : love 까지 다 나오게
-- 왼쪽에 있는 테이블 다 보여달라
-- left outer join은 inner join과 결과가 같게 나올 수 있다.
SELECT * 
FROM userTbl u LEFT OUTER JOIN postTbl p
ON u.id = p.userId;

-- user(1), post(N) : 드라이빙, FK
-- 쿼리 튜닝(수행속도 향상)
SELECT * 
FROM postTbl p RIGHT OUTER JOIN userTbl u
ON p.userId = u.id;

-- 걸려있는 외래키때문에 DELETE 실패
DELETE FROM userTbl
WHERE id = 1;

SELECT *
FROM student;

-- 1. STUDENT (DEPTNO2 = FK) 테이블과 DEPARTMENT (DEPTNO = PK) 테이블 -> 동일 조인
SELECT *
FROM student s INNER JOIN department d
ON s.deptno2 = d.deptno;

-- 2. 모든 학생을 다 출력하고, 연관된 부전공 정보도 조인해서 보여주세요
SELECT *
FROM student s LEFT OUTER JOIN department d
ON s.deptno2 = d.deptno;

-- 3. 모든 학과를 다 출력하고, 연관된 학생 정보를 조인해서 보여주세요
SELECT *
FROM student s RIGHT OUTER JOIN department d
ON s.deptno2 = d.deptno;
