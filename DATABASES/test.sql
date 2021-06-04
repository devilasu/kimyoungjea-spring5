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

--DESC: Description 설명
desc dept;
--select: 테이블내용 조회
select dname as "부서명" from dept where loc = 'NEW YORK';

select concat(deptno,' 번') as "부서번호", dname as "부서명", concat(loc,' 시') as "위치" from dept where loc = 'NEW YORK';
--dual 가상테이블이름. 테이블이 없는 내용을 select할때 사용.
select 3+5 as "3더하기5는" from dual;
-- 레코드(row) :칼럼(필드)
select concat(count(*), '명') as "연봉이 2000이상" from emp where sal > 2000;

select * from emp where sal > 2000;
--큰따옴표 레코드일때

select * from emp where ename != 'KING';

select * from emp where hiredate >= '1982/01/01';
select * from emp where deptno = 10 or job = 'MANAGER';
select * from emp where sal between 2000 and 3000;
select * from emp where hiredate between '1981/01/01' and '1981.12.31';
select * from emp where comm not in (300, 500, 1400);

--LIKE 조회, 와일드카드 조회
select * from emp where ename like upper('f%');
select * from emp where ename like '%N';
-- NULL이 중요한 이유: NULL값이 있으면 검색X
-- NULL이 필드에 있을때, 
select * from emp where comm is NULL;
--커미션이 0과 null을 다 구하고 싶을때.
select * from emp where NVL(comm,0) = 0;

--nvl(a,b) a는 검색위치, b는 null값을 바꿀 수.
select nvl(comm,0), E.* from emp E where nvl(comm,0) = 0;
--오라클은 표준쿼리x, ANSI쿼리 표준입니다.
--case 출력문: 모든 가능성에 대해서 조건을 설정하고 세팅해주지 않으면 설정되지 않은 값은 null로 출력된다.
select ename,deptno,
case when comm is null then 0
when comm = 0 then 0
when comm > 0 then comm
end comm
from emp;



select * from emp E where nvl(comm,0) = 0;
--nvl2(a,b,c) a에 존재하는 null값을 c로, null이 아닌 값을 b로 변환
select nvl2(comm,0,100), E.* from emp E;
--decode(a,b,c,d) a에서 b인 것을 c로 바꾸고, 나머지는 d로.
select decode(comm,null,0,comm), E.* from emp E where decode(comm,null,0,comm)=0;
--sort = order by 필드명 오름차순[초기값]|내림차순\
-- 오름차순: ASC
-- 내림차순: DESC
-- select 바로 뒤에 출력부분이 2개 이상이 되면 앞에 경로를 써줘야한다?
select emp.sal, emp.* from emp order by emp.sal DESC;
-- 1등만 구하고 싶다면? 정렬과  rownum을 이용하여 구한다.
select rownum, E.* from (select * from emp order by sal DESC) E where rownum =1;

select rownum, E.* from (select emp.*, emp.sal 월급 from emp order by nvl(empno,0) DESC) E where rownum =1;
--distinct 중복제거
select distinct deptno "부서번호" from emp;
--문자열을 연결할때 concat 함수 외에 ||로 구현
select ename || ' is a ' ||job "연결정의 예", emp.* from emp;
