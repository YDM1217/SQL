-- 1. 아래와 같이 USER_TEST 테이블을 만들고, 데이터를 삽입하시오.

DROP TABLE USER_TEST;

CREATE TABLE USER_TEST (
	ID NUMBER,
	Name VARCHAR2(10),
	ReserveDate DATE,
	RoomNum NUMBER
);

INSERT INTO USER_TEST(ID, Name, ReserveDate, RoomNum) VALUES(1, '홍길동', '2016-01-05', 2014);
INSERT INTO USER_TEST(ID, Name, ReserveDate, RoomNum) VALUES(2, '임꺽정', '2016-02-12', 918);
INSERT INTO USER_TEST(ID, Name, ReserveDate, RoomNum) VALUES(3, '장길산', '2016-01-16', 1208);
INSERT INTO USER_TEST(ID, Name, ReserveDate, RoomNum) VALUES(4, '홍길동', '2016-03-17', 504);
INSERT INTO USER_TEST(ID, Name) VALUES(6, '김유신');

SELECT * FROM USER_TEST;

-- 2. USER_TEST 테이블을 UPDATE/DELETE 구문을 사용하여 아래와 같이 수정하시오.
UPDATE USER_TEST SET
RoomNum = 2002
WHERE ID = 1;

UPDATE USER_TEST SET 
RoomNum = 2002
WHERE ID = 4;

SELECT * FROM USER_TEST;

DELETE FROM USER_TEST 
WHERE ID = 6;

SELECT * FROM USER_TEST;

-- 3. USER_TEST 테이블을 UPDATE 구문을 사용하여 아래와 같이 수정하시오.
UPDATE USER_TEST SET 
RoomNum = 2002
WHERE ID = 2;

UPDATE USER_TEST SET 
RoomNum = 2002
WHERE ID = 3;

SELECT * FROM USER_TEST;

-- 4. EMPLOYEE4 테이블을 EMPLOYEE 테이블과 같이 생성하기

DROP TABLE EMPLOYEE4;

CREATE TABLE EMPLOYEE4 AS SELECT * FROM EMPLOYEE;

SELECT * FROM EMPLOYEE4;

-- 5. EMPLOYEE4 테이블에서 고용일이 2000년대 이전인 사람의 월급을 100만원씩 인상해주자.
UPDATE EMPLOYEE4 SET 
SALARY = SALARY + 1000000
WHERE EXTRACT(YEAR FROM HIRE_DATE) < '2000';

--UPDATE EMPLOYEE4 SET 
--SALARY = SALARY + 1000000
--WHERE 1 = 1
--  AND HIRE_DATE < '2000-01-01';
 
SELECT * FROM EMPLOYEE4;

-- 6. EMPLOYEE4 테이블에서 한국에 근무하는 직원의 BONUS를 0.5로 변경
-- TIP 서브쿼리 사용!
--UPDATE EMPLOYEE4
--SET BONUS = 0.5
--WHERE EMP_NAME IN (
--  	SELECT EMP_NAME
--  	FROM EMPLOYEE4
--  	LEFT JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID)
--  	LEFT JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE)
--  	LEFT JOIN "NATIONAL" USING(NATIONAL_CODE)
--  	WHERE NATIONAL_NAME = '한국'
--  );


UPDATE EMPLOYEE4 SET 
BONUS = 0.5
WHERE EMP_NAME IN (SELECT EMP_NAME
					FROM EMPLOYEE4
					LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
					LEFT JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE)
					LEFT JOIN NATIONAL USING(NATIONAL_CODE)
					WHERE NATIONAL_CODE = 'KO');



UPDATE EMPLOYEE4
SET BONUS = 0.5
WHERE (EMP_NAME,EMP_ID) IN (
  	SELECT EMP_NAME, EMP_ID
  	FROM EMPLOYEE4
  	LEFT JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID)
  	LEFT JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE)
  	LEFT JOIN "NATIONAL" USING(NATIONAL_CODE)
  	WHERE NATIONAL_CODE = 'KO'
  	-- WHERE NATIONAL_NAME = '한국'
  );
 
ROLLBACK;
 
 
  
SELECT EMP_NAME, BONUS FROM EMPLOYEE4;










