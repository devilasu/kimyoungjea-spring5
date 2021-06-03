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
--round(반올림), mod(나머지), trunc(버리는 함수),floor(버림)<->ceil(올림)
--문자:
--upper(대문자), lower(소문자), length(길이), instr(특정문자 위치), substr(매개변수 사이 문자열 출력), lpad(왼쪽여백), rpad(오른쪽 여백), trim(왼쪽,오른쪽 문자열 잘라내는 함수)
--수학:
--abs(절대값), round(반올림), mod(나머지), trunc(버리는 함수),floor(버림)<->ceil(올림)
--날짜:
--sysdate, systimestamp(오라클전용 함수 게시물 입력시간, 회원등록 시간)
select to_char(systimestamp, 'yyyy-mm-dd hh24:mi:ss:ff4') from dual;
select sysdate +1 from dual;
select sysdate -1 from dual;
--max(~) KEEP(DENSE_RANK FIRST ORDER BY ~ DESC
-- min(~) KEEP(DENSE_RANK LAST ORDER BY ~ DESC