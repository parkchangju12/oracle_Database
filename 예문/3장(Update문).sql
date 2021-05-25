--3. Update 문

--테이블 확인
SELECT *
FROM EX3_1;

--Update 컬럼의 내용을 변경해주는 함수
UPDATE  ex3_1
SET     col2 = 50;

--where를 써 조건의 범위를 정해준다
--''를 쓰면 다른 DBMS는 IS NULL로 인식
UPDATE  ex3_1
SET     col3 = SYSDATE
WHERE   col3 = '';

--빈 테이블 공간에 오라클은 IS NULL로 입력해줘야한다.
UPDATE  ex3_1
SET     col1 = 'PCJ'
WHERE   col1 IS NULL;

