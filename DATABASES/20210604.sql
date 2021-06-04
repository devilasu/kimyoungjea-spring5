--8장 함수(count, upper, lower, to_char, round..)
--그룹함수
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
