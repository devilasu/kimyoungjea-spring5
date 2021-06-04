--20장
--19장 사용자 추가시 오라클 데스크탑(고전) 대신 웹프로그램을 사용.(http://127.0.0.1:9000/apex/f?p=4950)
--16장 PK = NOT NULL+UNIQUE+INDEX, FK(외래키): 두 테이블의 연결을 담당.
--15장 NOT NULL(빈 값 방지), UNIQUE(중복 방지)
--14장 트랜잭션 DB에서는 사용하지 않고, 스프링에서 사용. @Transactional
--12장 테이블 구조생성(create;), 변경(alter;), 삭제(drop;)
--ERD 관계형 다이어그램으로 물리테이블 생성.
create table tbl_member_DEL
(
USER_ID varchar2(50) primary key,
USER_PW varchar2(255),
USER_NAME varchar2(255),
EMAIL VARCHAR2(100),
POINT number(11,0),
ENABLED number(1,0),
LEVELS VARCHAR2(50),
REG_DATE timestamp(6),
update_date timestamp(6)
);
desc dept;
--작은자리에서 큰자리로 이동은 문제 없음, 그러나 큰 자리를 작은 자리로 변경은 에러.
alter table dept modify(deptno number(2));
alter table tbl_member_del rename column email to user_email;
drop table tbl_member_del;

--10장 테이블 조인 2개의 테이블을 연결해서 결과값을 구한다.
--카티시안프러덕트 조인 (합집합)안씀
--오라클 방식 조인
select * from dept d, emp e where d.deptno = e.deptno and e.ename = 'SCOTT';
--표준쿼리(ANSI)방식 inner는 default값이다.
select * from emp e join dept d on e.deptno = d.deptno;
select * from emp e join dept d on e.deptno = d.deptno where e.ename = 'SCOTT';
select * from dept inner join emp on dept.deptno = emp.deptno; 
select * from dept left outer join emp on dept.deptno = emp.deptno; 
select * from dept right outer join emp on dept.deptno = emp.deptno; 

--조인과 그룹을 이용해서 댓글카운터도 출력하는 게시판리스트 만들기
select b.bno, title, writer, view_count, b.reg_date, count(r.rno) reply_count from tbl_board b join tbl_reply r on b.bno=r.bno group by b.bno, title, writer, b.reg_date, view_count order by b.bno;

alter table tbl_board rename column update_data to update_date;

--9장 패스( 레포트용 함수사용)
--8장 함수(count, upper, lower, to_char, round..) 그룹함수
--having는 group by의 조건문을 적습니다.
--부서별 평균 연봉이 2000이상인 부서의 번호와 부서별 평균 급여.
SELECT deptno, round(AVG(sal)) FROM emp GROUP BY deptno HAVING AVG(sal) >= 2000;
--round(a,b): a의 데이터를 전부 b만큼 반올림
SELECT deptno,sal,round(sal,-3) FROM emp01;
--sum(a) 컬럼a의 레코드를 모두 더해서 출력.
SELECT SUM(sal) FROM emp;
--avg(a) 컬럼 a의 레코드의 평균 출력
SELECT round(AVG(sal)) FROM emp;

SELECT COUNT(*) FROM emp WHERE (sal < (SELECT round(AVG(sal)) FROM emp));

SELECT MAX(sal), MIN(sal), MAX(sal)-MIN(sal) AS " " FROM emp;

SELECT * FROM emp WHERE sal = (SELECT MAX(sal+nvl(comm,0)) FROM emp);

--group by {row} row가 같은 것끼리 묶어서 계산 후 출력
--알리아스 as는 ""를 붙이면 대소문자를 구분한다.
select deptno, max(sal),sum(sal) dept_sal from emp group by deptno order by sum(sal)desc;
select dept_sal from (select deptno, sum(sal) dept_sal from emp group by deptno) order by DEPT_SAL desc;
select dept_sal from (select deptno, sum(sal) dept_sal from emp group by deptno) order by DEPT_SAL desc;

--DDL문(create; alter;), DCL문(commit; rollback;)
--DML문(DataManufactureLangage) insert, update, delete
--insert문: 테이블에 새로운 레코드(row)를 추가
--dept 테이블과 구조와 내용이 똑같은 테이블 생성
CREATE TABLE dept02 AS SELECT * FROM dept;
--where 1=0을 추가하면 내용을 생략하고 만든다.
CREATE TABLE dept02 AS SELECT * FROM dept WHERE 1=0;
SELECT * FROM dept02;
--테이블의 컬럼 수 만큼 입력 
INSERT INTO dept02 VALUES(1, 'RESEART', 'LA');
INSERT INTO dept02 VALUES(2, 'RESEART', NULL);

--지정한 컬럼에 데이터 입력, 나머지는 null을 입력한다.
INSERT INTO dept02(deptno,dname) VALUES(2,'lollewn');
SELECT * FROM dept02;
--dept02테이블의 모든 LOC를 LA로 변경
UPDATE dept02 SET loc = 'LA';
--dept02테이블의 loc가 sydny인 데이터의 dname을 'John'으로, loc를 la로 변경하라
UPDATE dept02 SET dname='john', loc='LA' WHERE loc='sydny';
--실험결과: 다중값의 입력은 에러로 실행되지 않는다. (개수가 같아도 실행디지 않는다.)
UPDATE dept02 SET loc=(SELECT loc FROM detp02 WHERE deptno = 1) WHERE loc = NULL;
--dept02테이블의 모든 데이터 삭제
DELETE FROM dept02;--통으로 지우는 것은 좋지 않다.
DELETE FROM dept02 WHERE deptno <=100;
COMMIT;
DELETE FROM dept02 WHERE deptno = 2;
--테이블 제거
DROP TABLE dept02;
CREATE TABLE emp01 AS SELECT * FROM emp;
SELECT * FROM emp01;
UPDATE emp01 SET ename = '김영제' WHERE ename = 'CLARK';
--롤백은 마지막 커밋으로 되돌립니다.
ROLLBACK;
COMMIT;
UPDATE emp01 SET hiredate = sysdate;
--insert, update, commit, rollback, drop table, create table as select, 머지는 표준쿼리가 아니라서 스킵
