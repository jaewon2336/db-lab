CREATE TABLE myUser (
  id number primary key,
  username varchar2(100),
  password varchar2(100),
  email varchar2(100)
);

CREATE SEQUENCE SEQ_MYUSER INCREMENT BY 1 START WITH 1;

INSERT INTO myUser(id, username, password, email) VALUES(seq_myUser.nextval, 'ssar', '1234', 'ssar@nate.com');
INSERT INTO myUser(id, username, password, email) VALUES(seq_myUser.nextval, 'cos', '1234', 'cos@nate.com');
INSERT INTO myUser(id, username, password, email) VALUES(seq_myUser.nextval, 'love', '1234', 'love@nate.com');
commit;

SELECT * FROM myUser;