SELECT * FROM hospital;

SELECT sidocdnm, sggucdnm, yadmnm, addr
FROM hospital
WHERE sidocdnm = '서울' AND sggucdnm = '강남구' AND pcrpsblyn = 'Y';

DELETE 
FROM hospital;

SELECT PCRPSBLYN, yadmnm, sidocdnm, sggucdnm, addr
FROM hospital
WHERE addr LIKE '%부전동%';



