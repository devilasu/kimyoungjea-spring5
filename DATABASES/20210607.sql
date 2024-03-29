--시노님: 테이블명이 사용하기 힘들정도로 길거나
--오라클은 스프링과 같은 방식 패키지명 안에 함수,
--프로시저(오라클프로그램)를 만들 수 있습니다.
--패키지 명이 길어서 사용시 부담, 시노님을 사용하여 해결.
drop user xe2 cascade;
--xe2사용자를 지울때, 사용자가 생성한 테이블까지 모두 지운다.
--cascade:계층형
select SEQ_BNO.nextval from dual;

call proc_dumy_member(100);
select * from tbl_member;
commit;

call proc_dummy_board(100);
select * from tbl_board order by reg_date desc;
commit;