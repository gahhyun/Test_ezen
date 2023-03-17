-- 1.부서 테이블

drop table if exists tb_department;
create table tb_department
(
   dnumber varchar(10) primary key
   , dname varchar(10) not null
);

insert into tb_department(dnumber, dname) 
      values('D1001', '문구생산부');
insert into tb_department(dnumber, dname) 
      values('D2001', '가구생산부');
insert into tb_department(dnumber, dname) 
      values('D3001', '악세사리생산부');
insert into tb_department(dnumber, dname) 
      values('D4001', '전자기기생산부');
insert into tb_department(dnumber, dname) 
      values('D5001', '음료생산부');

select *
from tb_department ;

--2.직급 테이블

drop table if exists tb_rank;
create table tb_rank
(
    rnumber varchar(10) primary key
    , rname varchar(5) not null
);

insert into tb_rank (rnumber, rname)
      values('R0001', '사원');
insert into tb_rank (rnumber, rname)
      values('R0002', '주임');
insert into tb_rank (rnumber, rname)
      values('R0003', '대리');
insert into tb_rank (rnumber, rname)
      values('R0004', '과장');
insert into tb_rank (rnumber, rname)
      values('R0005', '차장');
insert into tb_rank (rnumber, rname)
      values('R0006', '부장');
insert into tb_rank (rnumber, rname)
      values('R0007', '이사');
insert into tb_rank (rnumber, rname)
      values('R0008', '상무');
insert into tb_rank (rnumber, rname)
      values('R0009', '전무');
insert into tb_rank (rnumber, rname)
      values('R0010', '사장');

select *
from tb_rank ;

--3.물품 테이블
drop table if exists tb_item;
create table tb_item
(
   inumber varchar(10) primary key
   , iname varchar(15) not null
   , price numeric(15) not null
   , registerdate timestamptz not null
);

insert into tb_item (inumber, iname, price, registerdate)
      values ('I1001', '가위', '600', '2019-01-02 23:32:23');
insert into tb_item (inumber, iname, price, registerdate)
      values ('I1002', '풀', '500', '2019-01-14 00:33:23');
insert into tb_item (inumber, iname, price, registerdate)
      values ('I1003', '공책', '1000', '2019-01-24 01:34:23');
insert into tb_item (inumber, iname, price, registerdate)
      values ('I1004', '볼펜', '1500', '2019-02-16 02:26:23');
insert into tb_item (inumber, iname, price, registerdate)
      values ('I1005', '지우개', '300', '2019-02-22 03:19:23');
insert into tb_item (inumber, iname, price, registerdate)
      values ('I2001', '쇼파', '1230000', '2019-03-05 23:22:52');
insert into tb_item (inumber, iname, price, registerdate)
      values ('I2002', '테이블', '625000', '2019-03-18 00:34:17');
insert into tb_item (inumber, iname, price, registerdate)
      values ('I2003', '장농', '470000', '2019-03-22 01:52:11');
insert into tb_item (inumber, iname, price, registerdate)
      values ('I2004', '침대', '2180000', '2019-04-12 02:32:47');
insert into tb_item (inumber, iname, price, registerdate)
      values ('I2005', '책상', '382000', '2019-04-30 03:17:32');
insert into tb_item (inumber, iname, price, registerdate)
      values ('I3001', '반지', '1023000', '2019-05-13 18:34:54');
insert into tb_item (inumber, iname, price, registerdate)
      values ('I3002', '목걸이', '1510000', '1019-05-27 20:15:32');
insert into tb_item (inumber, iname, price, registerdate)
      values ('I4003', '모니터', '530000', '2019-07-23 00:13:52');

select *
from  tb_item;

--4.반품사유 테이블
drop table if exists tb_return_reason;
create table tb_return_reason
(
	rrnumber varchar(10) primary key
   , rreason varchar(15) not null
);

insert into tb_return_reason (rrnumber, rreason)
      values ('RR0001', '불량');
insert into tb_return_reason (rrnumber, rreason)
      values ('RR0002', '단순변심');
insert into tb_return_reason (rrnumber, rreason)
      values ('RR0003', '환불');
insert into tb_return_reason (rrnumber, rreason)
      values ('RR0004', '배송오류');
     
select *
from tb_return_reason;

--5.고객 테이블
drop table if exists tb_customer;
create table tb_customer
(
   cnumber varchar(10) primary key
   , cname varchar(15) not null
   , caddr varchar(15) not null
   , contractdate timestamptz not null
);

insert into tb_customer(cnumber, cname, caddr, contractdate)
   values('C1001', '대한문방구', '서울시 강남구', '2019-01-23 22:32:12');
insert into tb_customer(cnumber, cname, caddr, contractdate)
   values('C1002', '용호문방구', '서울시 용산구', '2019-01-27 23:10:01');
insert into tb_customer(cnumber, cname, caddr, contractdate)
   values('C1003', '오랜문방구', '울산시 중구', '2019-02-04 01:08:06');
insert into tb_customer(cnumber, cname, caddr, contractdate)
   values('C1004', '학교앞문방구', '부산시 남구', '2019-02-18 03:17:52');
insert into tb_customer(cnumber, cname, caddr, contractdate)
   values('C1005', '최고문방구', '부산시 북구', '2019-02-26 03:31:32');
insert into tb_customer(cnumber, cname, caddr, contractdate)
   values('C2001', '튼튼가구', '서울시 동작구', '2019-03-02 19:13:22');
insert into tb_customer(cnumber, cname, caddr, contractdate)
   values('C2002', '동해가구', '서울시 송파구', '2019-03-13 21:07:11');
insert into tb_customer(cnumber, cname, caddr, contractdate)
   values('C2003', '그린가구', '서울시 강남구', '2019-03-22 02:52:34');
insert into tb_customer(cnumber, cname, caddr, contractdate)
   values('C2004', '소나무가구', '부산시 진구', '2019-04-04 03:07:56');
insert into tb_customer(cnumber, cname, caddr, contractdate)
   values('C2005', '조경가구', '부산시 남구', '2019-04-23 03:07:56');  
insert into tb_customer(cnumber, cname, caddr, contractdate)
   values('C3001', '패션악세사리', '서울시 광진구', '2019-05-08 00:32:11');
insert into tb_customer(cnumber, cname, caddr, contractdate)
   values('C3004', '강남악세사리', '서울시 강남구', '2019-06-03 03:13:42');
insert into tb_customer(cnumber, cname, caddr, contractdate)
   values('C4003', '다있다전자상가', '부산시 남구', '2019-08-03 01:21:11');

select *
from tb_customer ;

--6.직원 테이블
drop table if exists tb_employee;
create table tb_employee
(
   enumber varchar(10) primary key
   , dnumber varchar(10)
   , rnumber varchar(10) not null
   , ename varchar(10) not null
   , errn varchar(15) not null
   , eaddr varchar(15) not null
   , startdate timestamptz not null
   , resignationdate timestamptz
);

insert into tb_employee (enumber, dnumber, rnumber, ename, errn, eaddr, startdate, resignationdate)
      values('E0001', null, 'R0001', '김이수', '850726-1118323', '서울시 강남구', '2018-01-02 18:00:00', null);
insert into tb_employee (enumber, dnumber, rnumber, ename, errn, eaddr, startdate, resignationdate)
      values('E0002', null, 'R0001', '김사원', '900513-1136345', '부산시 북구', '2018-01-02 18:00:00', null);
insert into tb_employee (enumber, dnumber, rnumber, ename, errn, eaddr, startdate, resignationdate)
      values('E0003', null, 'R0001', '이길동', '890206-1112632', '대전시 서구', '2018-01-02 18:00:00', null);
insert into tb_employee (enumber, dnumber, rnumber, ename, errn, eaddr, startdate, resignationdate)
      values('E0004', null, 'R0001', '서준수', '880816-1116234', '서울시 동구', '2018-01-02 18:00:00', null);
insert into tb_employee (enumber, dnumber, rnumber, ename, errn, eaddr, startdate, resignationdate)
      values('E0005', null, 'R0001', '이기영', '920322-2114233', '울산시 동구', '2018-01-02 18:00:00', null);
insert into tb_employee (enumber, dnumber, rnumber, ename, errn, eaddr, startdate, resignationdate)
      values('E1001', 'D1001', 'R0001', '박하나', '760312-2127522', '서울시 강남구', '2016-01-02 18:00:00', null);
insert into tb_employee (enumber, dnumber, rnumber, ename, errn, eaddr, startdate, resignationdate)
      values('E1002', 'D1001', 'R0001', '김문구', '830622-1152643', '부산시 남구', '2014-03-05 18:00:00', null);
insert into tb_employee (enumber, dnumber, rnumber, ename, errn, eaddr, startdate, resignationdate)
      values('E1003', 'D1001', 'R0001', '이과장', '790312-1117865', '부산시 중구', '2010-02-03 18:00:00', null);
insert into tb_employee (enumber, dnumber, rnumber, ename, errn, eaddr, startdate, resignationdate)
      values('E1004', 'D1001', 'R0001', '이해오', '800312-1112346', '서울시 도봉구', '2010-05-06 18:00:00', null);
insert into tb_employee (enumber, dnumber, rnumber, ename, errn, eaddr, startdate, resignationdate)
      values('E1005', 'D1001', 'R0001', '박총괄', '670107-1116244', '서울시 광진구', '2002-02-06 18:00:00', null);
insert into tb_employee (enumber, dnumber, rnumber, ename, errn, eaddr, startdate, resignationdate)
      values('E1006', 'D1001', 'R0001', '김이해', '870721-1113245', '부산시 북구', '2016-05-06 18:00:00', '2021-02-26 08:59:59');
insert into tb_employee (enumber, dnumber, rnumber, ename, errn, eaddr, startdate, resignationdate)
      values('E1007', 'D1001', 'R0002', '박지원', '910513-2112432', '울산시 동구', '2015-12-11 18:00:00', '2021-01-14 08:59:59');
insert into tb_employee (enumber, dnumber, rnumber, ename, errn, eaddr, startdate, resignationdate)
      values('E1008', 'D1001', 'R0001', '정정인', '951215-2712012', '부산시 중구', '2019-10-17 18:00:00', null);
insert into tb_employee (enumber, dnumber, rnumber, ename, errn, eaddr, startdate, resignationdate)
      values('E1009', 'D1001', 'R0001', '김지오', '941011-1744283', '울산시 남구', '2019-04-30 18:00:00', '2021-01-14 08:59:59');
insert into tb_employee (enumber, dnumber, rnumber, ename, errn, eaddr, startdate, resignationdate)
      values('E2001', 'D2001', 'R0001', '김구성', '921107-1111235', '울산시 동구', '2018-02-07 18:00:00', null);
insert into tb_employee (enumber, dnumber, rnumber, ename, errn, eaddr, startdate, resignationdate)
      values('E2005', 'D2001', 'R0006', '박천이', '681207-1111523', '울산시 중구', '2001-03-13 18:00:00', null);    
insert into tb_employee (enumber, dnumber, rnumber, ename, errn, eaddr, startdate, resignationdate)
      values('E3001', 'D3001', 'R0001', '이빛나', '920122-2112532', '서울시 강남구', '2018-01-06 18:00:00', null);
insert into tb_employee (enumber, dnumber, rnumber, ename, errn, eaddr, startdate, resignationdate)
      values('E3002', 'D3001', 'R0001', '김화사', '930205-2117353', '서울시 강남구', '2018-01-06 18:00:00', null);
insert into tb_employee (enumber, dnumber, rnumber, ename, errn, eaddr, startdate, resignationdate)
      values('E3003', 'D3001', 'R0003', '박은혜', '890709-2114253', '서울시 동작구', '2014-03-09 18:00:00', null);
insert into tb_employee (enumber, dnumber, rnumber, ename, errn, eaddr, startdate, resignationdate)
      values('E3006', 'D3001', 'R0005', '박수혜', '740617-2112135', '서울시 강남구', '2006-02-07 18:00:00', '2021-02-20 08:59:59');
insert into tb_employee (enumber, dnumber, rnumber, ename, errn, eaddr, startdate, resignationdate)
      values('E4003', 'D4001', 'R0003', '이정보', '810503-1111244', '부산시 북구', '2013-05-01 18:00:00',null);


--제약조건 추가
alter table tb_employee add constraint fk_tb_employee_dnumber foreign key (dnumber)
references tb_department (dnumber) on delete set null;

alter table tb_employee add constraint fk_tb_employee_rnumber foreign key (rnumber)
references tb_rank (rnumber) on delete cascade;

select *
from tb_employee;

--7.생산테이블
drop table if exists tb_production;
create table tb_production
(
   pnumber varchar(10) primary key
   , enumber varchar(10) not null
   , inumber varchar(10) not null
   , pcount numeric(8) not null
   , pdate timestamptz not null
);

insert into tb_production (pnumber, enumber, inumber, pcount, pdate)
      values ('P1001', 'E1001', 'I1001', '620', '2020-01-03 20:32:22');
insert into tb_production (pnumber, enumber, inumber, pcount, pdate)
      values ('P1002', 'E1002', 'I1002', '32', '2020-02-16 18:11:07');
insert into tb_production (pnumber, enumber, inumber, pcount, pdate)
      values ('P1003', 'E1003', 'I1003', '363', '2020-02-21 19:07:35');
insert into tb_production (pnumber, enumber, inumber, pcount, pdate)
      values ('P1004', 'E1004', 'I1004', '122', '2020-03-03 20:17:08');
insert into tb_production (pnumber, enumber, inumber, pcount, pdate)
      values ('P1005', 'E1005', 'I1005', '210', '2020-03-06 18:03:56');
insert into tb_production (pnumber, enumber, inumber, pcount, pdate)
      values ('P1006', 'E1006', 'I1001', '1020', '2020-03-12 19:07:32');
insert into tb_production (pnumber, enumber, inumber, pcount, pdate)
      values ('P1007', 'E1007', 'I1002', '923', '2020-03-16 02:21:44');
insert into tb_production (pnumber, enumber, inumber, pcount, pdate)
      values ('P1008', 'E1001', 'I1003', '700', '2020-03-18 01:44:36');
insert into tb_production (pnumber, enumber, inumber, pcount, pdate)
      values ('P1009', 'E1003', 'I1004', '720', '2020-03-30 02:02:57');
insert into tb_production (pnumber, enumber, inumber, pcount, pdate)
      values ('P1010', 'E1005', 'I1002', '352', '2020-03-30 02:02:57');
insert into tb_production (pnumber, enumber, inumber, pcount, pdate)
      values ('P1011', 'E1007', 'I1001', '100', '2020-04-10 00:17:09');
insert into tb_production (pnumber, enumber, inumber, pcount, pdate)
      values ('P1017', 'E1007', 'I1002', '754', '2020-05-07 22:18:06');
insert into tb_production (pnumber, enumber, inumber, pcount, pdate)
      values ('P1018', 'E1009', 'I1004', '432', '2020-03-28 23:27:08');
insert into tb_production (pnumber, enumber, inumber, pcount, pdate)
      values ('P2001', 'E2001', 'I2001', '52', '2020-01-02 18:23:17');
insert into tb_production (pnumber, enumber, inumber, pcount, pdate)
      values ('P2008', 'E2005', 'I2002', '65', '2020-02-23 18:23:48');
insert into tb_production (pnumber, enumber, inumber, pcount, pdate)
      values ('P3001', 'E3001', 'I3001', '325', '2020-01-03 18:07:12');
insert into tb_production (pnumber, enumber, inumber, pcount, pdate)
      values ('P3002', 'E3002', 'I3002', '632', '2020-01-07 19:32:52');
insert into tb_production (pnumber, enumber, inumber, pcount, pdate)
      values ('P3006', 'E3006', 'I3001', '62', '2020-02-15 22:23:07');
insert into tb_production (pnumber, enumber, inumber, pcount, pdate)
      values ('P3007', 'E3003', 'I3001', '210', '2020-02-17 19:58:11');
insert into tb_production (pnumber, enumber, inumber, pcount, pdate)
      values ('P4003', 'E4003', 'I4003', '110', '2020-01-23 20:08:23');


--제약조건
alter table tb_production add constraint fk_tb_production_enumber foreign key (enumber)
references tb_employee (enumber) on delete cascade;

alter table tb_production add constraint fk_tb_production_inumber foreign key (inumber)
references tb_item (inumber) on delete cascade;

select *
from tb_production;

--8.주문 테이블
drop table if exists tb_order;
create table tb_order
(
   onumber varchar(10) primary key
   , cnumber varchar(10) not null
   , pnumber varchar(10) not null
   , odate timestamptz not null
);

insert into tb_order(onumber, cnumber, pnumber, odate)
      values('O1001', 'C1001', 'P1001', '2021-01-07 18:08:32');
insert into tb_order(onumber, cnumber, pnumber, odate)
      values('O1002', 'C1002', 'P1002', '2021-01-08 19:31:27');
insert into tb_order(onumber, cnumber, pnumber, odate)
      values('O1003', 'C1003', 'P1004', '2021-01-12 18:43:31');
insert into tb_order(onumber, cnumber, pnumber, odate)
      values('O1004', 'C1004', 'P1006', '2021-01-22 00:05:17');
insert into tb_order(onumber, cnumber, pnumber, odate)
      values('O1005', 'C1005', 'P1007', '2021-01-27 20:13:08');
insert into tb_order(onumber, cnumber, pnumber, odate)
      values('O1006', 'C1002', 'P1009', '2021-01-31 23:31:22');
insert into tb_order(onumber, cnumber, pnumber, odate)
      values('O1007', 'C1003', 'P1008', '2021-02-07 01:42:16');
insert into tb_order(onumber, cnumber, pnumber, odate)
      values('O1008', 'C1005', 'P1011', '2021-02-23 22:27:53');
insert into tb_order(onumber, cnumber, pnumber, odate)
      values('O1009', 'C1001', 'P1017', '2021-02-25 23:29:08');
insert into tb_order(onumber, cnumber, pnumber, odate)
      values('O1010', 'C1003', 'P1018', '2021-03-04 20:13:04');
insert into tb_order(onumber, cnumber, pnumber, odate)
      values('O2001', 'C2001', 'P2001', '2021-01-27 18:15:54');
insert into tb_order(onumber, cnumber, pnumber, odate)
      values('O2007', 'C2002', 'P2008', '2021-02-05 00:21:31');
insert into tb_order(onumber, cnumber, pnumber, odate)
      values('O3001', 'C3001', 'P3001', '2021-01-16 18:42:18');
insert into tb_order(onumber, cnumber, pnumber, odate)
      values('O3004', 'C3004', 'P3006', '2021-02-08 18:07:32');
insert into tb_order(onumber, cnumber, pnumber, odate)
      values('O007', 'C3001', 'P3002', '2021-02-16 01:43:51');
insert into tb_order(onumber, cnumber, pnumber, odate)
      values('O3008', 'C3004', 'P3007', '2021-02-17 19:39:52');
insert into tb_order(onumber, cnumber, pnumber, odate)
      values('O4003', 'C4003', 'P4003', '2021-01-15 18:32:11');

--제약조건
alter table tb_order add constraint fk_tb_order_pnumber foreign key (pnumber)
references tb_production (pnumber) on delete cascade;

alter table tb_order add constraint fk_tb_order_cnumber foreign key (cnumber)
references tb_customer (cnumber) on delete cascade;

select * 
from tb_order;

--9.반품 테이블
drop table if exists tb_return;
create table tb_return
(
   rnumber varchar(10) primary key
   , onumber varchar(10) not null
   , rcount numeric(5) not null
   , rrnumber varchar(6) not null
   , rdate timestamptz not null
);

insert into tb_return (rnumber, onumber, rcount, rrnumber, rdate)
      values ('R1001', 'O1002', '5', 'RR0001', '2022-01-03 22:32:07');
insert into tb_return (rnumber, onumber, rcount, rrnumber, rdate)
      values ('R1002', 'O1007', '700', 'RR0004', '2022-01-04 00:17:47');
insert into tb_return (rnumber, onumber, rcount, rrnumber, rdate)
      values ('R1003', 'O1009', '754', 'RR0002', '2022-01-04 01:22:13');
insert into tb_return (rnumber, onumber, rcount, rrnumber, rdate)
      values ('R2001', 'O2001', '10', 'RR0001', '2022-01-05 23:06:07');
insert into tb_return (rnumber, onumber, rcount, rrnumber, rdate)
      values ('R2002', 'O2007', '65', 'RR0002', '2022-01-24 23:06:45');
insert into tb_return (rnumber, onumber, rcount, rrnumber, rdate)
      values ('R3001', 'O3001', '18', 'RR0001', '2022-01-06 18:13:52');
insert into tb_return (rnumber, onumber, rcount, rrnumber, rdate)
      values ('R3002', 'O3004', '62', 'RR0003', '2022-01-07 23:03:31');
insert into tb_return (rnumber, onumber, rcount, rrnumber, rdate)
      values ('R3003', 'O3004', '210', 'RR0002', '2022-01-10 19:15:34');
insert into tb_return (rnumber, onumber, rcount, rrnumber, rdate)
      values ('R3004', 'O3004', '632', 'RR0002', '2022-01-20 18:45:33');
insert into tb_return (rnumber, onumber, rcount, rrnumber, rdate)
      values ('R4001', 'O3004', '110', 'RR0003', '2022-01-02 18:27:11');

--제약조건
alter table tb_return add constraint fk_tb_return_onumber foreign key (onumber)
references tb_order (onumber);

alter table tb_return add constraint fk_tb_return_rrnumber foreign key (rrnumber)
references tb_return_reason (rrnumber);

select *
from tb_return;

