SELECT *
FROM userTbl
ORDER BY id;

-- 트랜잭션 (insert, insert) = 서비스

INSERT INTO userTbl(id, username, password, gender)
VALUES(4, 'hong', '1234', '남');

commit;

INSERT INTO userTbl(id, username, password, gender)
VALUES(4, 'yang', '1234', '여');

-- 트랜잭션 시작 (insert, insert) = 서비스

INSERT INTO userTbl(id, username, password, gender)
VALUES(5, 'yang', '1234', '여');

INSERT INTO userTbl(id, username, password, gender)
VALUES(6, 'kong', '1234', '여');

-- if 만약에 둘다 성공하면
commit;

-- else if 둘중에 하나라도 실패하면
rollback;