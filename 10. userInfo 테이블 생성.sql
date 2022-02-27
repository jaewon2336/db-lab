INSERT INTO userInfo(id, name, phone) VALUES(SEQ_USERINFO.nextval, 'È«±æµ¿', '01011112222');
INSERT INTO userInfo(id, name, phone) VALUES(SEQ_USERINFO.nextval, 'ÀÓ²©Á¤', '01033334444');
INSERT INTO userInfo(id, name, phone) VALUES(SEQ_USERINFO.nextval, 'Àåº¸°í', '01055556666');

CREATE SEQUENCE SEQ_USERINFO INCREMENT BY 1 START WITH 1;

SELECT * FROM userInfo;