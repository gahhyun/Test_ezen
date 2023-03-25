DROP TABLE IF EXISTS BACKPACK ;
CREATE TABLE BACKPACK (
  ID SERIAL PRIMARY KEY
, BOOK VARCHAR(50) NOT NULL
);

INSERT INTO BACKPACK(BOOK) VALUES('SPRING');
INSERT INTO BACKPACK(BOOK) VALUES('SPRING');
INSERT INTO BACKPACK(BOOK) VALUES('JAVASCRIPT');
INSERT INTO BACKPACK(BOOK) VALUES('JAVASCRIPT');
INSERT INTO BACKPACK(BOOK) VALUES('JAVASCRIPT');
INSERT INTO BACKPACK(BOOK) VALUES('CSS');

COMMIT;  --커밋을 사용하려면 트랜잭션 모드로 변경


  --BACKPACK 테이블의 모든 데이터 출력

--ROW_NUMBER() 함수는 결과 집합의 파티션 내 각 행에 순차적인 정수를 할당하는 윈도우 함수
--Partition : DB에서 크기가 큰 테이블을 작은 단위로 나눈다
select id,row_number () over(partition by book order by id) as row_num1 , book
from backpack B;


--where 일치하길 원하는 컬럼명 in(조건1, 조건2, 조건3,..)//여기에 나열한 조건들은 or조건으로 검색
--제거할 행들의 조건주기
select *
from backpack A
where id in (select id  
			 from (select id,row_number () over(partition by book order by id) as ROW_NUM 
       			   from backpack B)as row_num2
       		 where row_num >1);
       			   
--제거 되고 출력 될 부분들의 select문       			          			   
select id ,book
from (select id,row_number () over(partition by book order by id) as ROW_NUM , book
      from backpack A) as row_num2
where row_num < 2 
order by id;


--BACKPACK 테이블에서 BOOK 컬럼이 중복된 행을 삭제
delete 
from backpack 
where id in (select id
			 from (select id,row_number () over(partition by book order by id) as ROW_NUM
				   from backpack A) as row_num2
			 where row_num > 1 
			);
commit;

SELECT * FROM BACKPACK;















