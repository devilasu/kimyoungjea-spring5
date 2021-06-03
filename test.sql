--DESC: Description ����
desc dept;
--select: ���̺��� ��ȸ
select dname as "�μ���" from dept where loc = 'NEW YORK';

select concat(deptno,' ��') as "�μ���ȣ", dname as "�μ���", concat(loc,' ��') as "��ġ" from dept where loc = 'NEW YORK';
--dual �������̺��̸�. ���̺��� ���� ������ select�Ҷ� ���.
select 3+5 as "3���ϱ�5��" from dual;
-- ���ڵ�(row) :Į��(�ʵ�)
select concat(count(*), '��') as "������ 2000�̻�" from emp where sal > 2000;

select * from emp where sal > 2000;
--ū����ǥ ���ڵ��϶�

select * from emp where ename != 'KING';

select * from emp where hiredate >= '1982/01/01';
select * from emp where deptno = 10 or job = 'MANAGER';
select * from emp where sal between 2000 and 3000;
select * from emp where hiredate between '1981/01/01' and '1981.12.31';
select * from emp where comm not in (300, 500, 1400);

--LIKE ��ȸ, ���ϵ�ī�� ��ȸ
select * from emp where ename like upper('f%');
select * from emp where ename like '%N';
-- NULL�� �߿��� ����: NULL���� ������ �˻�X
-- NULL�� �ʵ忡 ������, 
select * from emp where comm is NULL;
--Ŀ�̼��� 0�� null�� �� ���ϰ� ������.
select * from emp where NVL(comm,0) = 0;

--nvl(a,b) a�� �˻���ġ, b�� null���� �ٲ� ��.
select nvl(comm,0), E.* from emp E where nvl(comm,0) = 0;
--����Ŭ�� ǥ������x, ANSI���� ǥ���Դϴ�.
select * from emp E where nvl(comm,0) = 0;
--nvl2(a,b,c) a�� �����ϴ� null���� c��, null�� �ƴ� ���� b�� ��ȯ
select nvl2(comm,0,100), E.* from emp E;
--decode(a,b,c,d) a���� b�� ���� c�� �ٲٰ�, �������� d��.
select decode(comm,null,0,comm), E.* from emp E where decode(comm,null,0,comm)=0;
--sort = order by �ʵ�� ��������[�ʱⰪ]|��������\
-- ��������: ASC
-- ��������: DESC
-- select �ٷ� �ڿ� ��ºκ��� 2�� �̻��� �Ǹ� �տ� ��θ� ������Ѵ�?
select emp.sal, emp.* from emp order by emp.sal DESC;
-- 1� ���ϰ� �ʹٸ�? ���İ�  rownum�� �̿��Ͽ� ���Ѵ�.
select rownum, E.* from (select * from emp order by sal DESC) E where rownum =1;

select rownum, E.* from (select emp.*, emp.sal ���� from emp order by nvl(empno,0) DESC) E where rownum =1;
--distinct �ߺ�����
select distinct deptno "�μ���ȣ" from emp;
--���ڿ��� �����Ҷ� concat �Լ� �ܿ� ||�� ����
select ename || ' is a ' ||job "�������� ��", emp.* from emp;