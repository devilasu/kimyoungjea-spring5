--8장 함수(count, upper, lower, to_char, round..)
--그룹함수
select deptno,sal,round(sal,-3) from emp01;
select deptno, sum(sal,comm) from emp01;
--DDL문(create; alter;), DCL문(commit; rollback;)
--DML문(DataManufactureLangage) insert, update, delete
--insert문: 테이블에 새로운 레코드(row)를 추가
--dept 테이블과 구조와 내용이 똑같은 테이블 생성
create table dept02 as select * from dept;
--where 1=0을 추가하면 내용을 생략하고 만든다.
create table dept02 as select * from dept where 1=0;
select * from dept02;
--테이블의 컬럼 수 만큼 입력 
insert into dept02 values(1, 'RESEART', 'LA');
insert into dept02 values(2, 'RESEART', null);

--지정한 컬럼에 데이터 입력, 나머지는 null을 입력한다.
insert into dept02(deptno,dname) values(2,'lollewn');
select * from dept02;
--dept02테이블의 모든 LOC를 LA로 변경
update dept02 set LOC = 'LA';
--dept02테이블의 loc가 sydny인 데이터의 dname을 'John'으로, loc를 la로 변경하라
update dept02 set dname='john', loc='LA' where loc='sydny';
--실험결과: 다중값의 입력은 에러로 실행되지 않는다. (개수가 같아도 실행디지 않는다.)
update dept02 set loc=(select loc from detp02 where deptno = 1) where loc = null;
--dept02테이블의 모든 데이터 삭제
delete from dept02;--통으로 지우는 것은 좋지 않다.
delete from dept02 where deptno <=100;
commit;
delete from dept02 where deptno = 2;
--테이블 제거
drop table dept02;
create table emp01 as select * from emp;
select * from emp01;
update emp01 set ename = '김영제' where ename = 'CLARK';
--롤백은 마지막 커밋으로 되돌립니다.
rollback;
commit;
update emp01 set hiredate = sysdate;
--insert, update, commit, rollback, drop table, create table as select, 머지는 표준쿼리가 아니라서 스킵
