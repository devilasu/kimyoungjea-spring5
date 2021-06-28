#### 작업예정
- 스프링프로젝트 순서
- 1.JUnit > 마이바티스(DB핸들링) > (paging기능 > 검색기능) > 첨부파일기능 > 스프링시큐리티(로그인 인증)
- 2.> 댓글처리(RestAPI-백엔드, Ajax처리-프론트) > 네이버아이디로그인(외부API사용)
- AdminLTE(부트스트랩 기반 탬플릿 - 반응형)를 이용하요 관리자단 디자인 > 헤로쿠클라우드배포.
- 3.문서작업(화면기획서 제작, 화면설계서PPT 제작)
- UI디자인 끝----------------------------------------
- UI구현 시작 -------스프링프로젝트(Java+이클립스+Oracle+Spring) 시작.
- UI구현 ......UI디자인 이용해서 프로그램 입히게 됩니다.

- 정방향개발: 매퍼쿼리>DAO>Service>[JUnit-Ioc, DI기능]컨트롤러클래스>JSP
- 역방향개발: JSP>[JUnit]컨트롤러클래스>Service>DAO>매퍼쿼리
=================3주간 작업내역 시작=========================
- 관리자단 회원목록 처리 마무리(1. 페이징및 검색기능구현)
- model을 이용해서 결과를 JSP로 구현.(2. JSP화면은 표준언어인 JSTL로 구현)
- [공지]06-17 목요일(4교시) UI 디자인 시험 있습니다.(화면기획서XLS제작,화면설계서 PPT제출)
- 나머지 관리자 회원관리 CRUD 화면 JSP처리.
- 관리자단 게시판 생성관리 CRUD 처리(4. 파일업로드구현, 5. 트랜잭션 구현).
- 관리자단 게시판 생성관리 CRUD 처리(3. AOP기능구현).
- 관리자단 게시물관리 CRUD 처리(4. 파일업로드구현, 5. 트랜잭션구현).
- 관리자단 댓글 CRUD 처리(6.RestAPI기능구현).
- 관리자단 왼쪽메뉴 UI메뉴 고정시키기(7.jQuery로 구현).
- 사용자단 로그인 화면 JSP로 만들기.
- 로그인처리 및 관리자 권한체크 기능 추가(8.스프링시큐리티 구현).
===============3주간 작업내역 끝=======================
- 사용자단 회원가입, 수정, 탈퇴 JSP기능 추가.
- 사용자단 게시판 CRUD 처리.
- 사용자단 댓글 CRUD 처리.
- 헤로쿠 클라우드에 배포(9. 클라우드 배포CI/CD구현).깃(최신소스) - 헤로쿠(배포)
- 헤로쿠 클라우드에 배포 (9.클라우드 배포구현).
- 문서작업(제출용)

#### 20210628 (월) 작업.
- @RestController클래스 제작->크롬부메랑테스트->JSP제작
- @RestController클래스제작: 일반 컨트롤러와 다르게 반환값이 body임.
- Endpoint	: 마이크로서비스는 RestAPI로 구현되고, 이 요청하는 URL을 Endpoint라고 한다.
- 마이크로소프트	: 모듈화 하는거랑 같은듯?
- 쿼리스트링	: /reply/reply_list?bno=59&page=1
- Rest API	: /reply/reply_list/{bno}/{page}


#### 20210625 (금) 작업.
- IE에서 한글 처리를 위해서 jstl의 url을 사용. url태그 안에 param으로 변수 지정해준 후 href에 url변수를 넣어주면 해결.
- 게시물관리 Create 작업 마무리.
- 고전CRUD와 RestFull(API)방식 차이점: 고전(화면전환), Rest방식(한 화면에서 처리)
- 관리자단 댓글관리 CRUD 처리(6.RestAPI서버구 현, JUnit대신 크롬부메랑으로 테스트)

- 스프링시큐리티 준비 후 사용자단 로그인 구현.

#### 20210624 (목) 작업
- [복습]오늘 작업한 첨부파일 처리도 데이터 변수의 이동상태나 변수값이 제일 중요합니다.
핵심은 아래와 같습니다. Attach테이블에서 select쿼리 결과 테이터 구조는 아래와 같습니다.
List<AttachVO> = [
{"save_file_name":"abc1.jpg","real_file_name":"한글이미지1.jpg","bno":"bno10"},
{"save_file_name":"abc2.jpg","real_file_name":"한글이미지2.jpg","bno":"bno10"}
]
데이터베이스에서 가져올때, 위와 같이 구조가 발생됩니다. 구조를 정리하면 아래와 같습니다.
대괄호 List[VO배열] 안에 
중괄호 VO{1개레코드 } 안에
콜론으로 "키":"값" 구분 후 콥마, 로 멤버변수들을 구분합니다.
- file.getByte() 파일을 바이트형식으로 변환.

#### 20210623 (수) 작업
- aop프록시 설정은 controller 밑에 위치해야한다.
- 시큐어코딩 방지메서드: 코딩 태그를 특수문자로 변경하는 매서드(정규표현식)
- 세션 사용법: 겟(Get), 셋(Set), 삭제(Remove)하는 방법
- 세션 생성법: session.setAttribute("세션명", 값);
- 세션 값 불러오는 법: session.getAttribute("세션명");
- 세션 삭제하는 법: session.removeAttribute("세션명"); //변수삭제
- 전체 세션 삭제하는 법: session.invalidate();

#### 20210622 (화) 작업
- 첨부파일 업로드 기능.

#### 20210621 (월) 작업
- 트랜잭션? 동시에 발생하는 여러작업에 대하여 각 작업의 독립성을 보장하기 위한 기능
- root-context와 servlet-context에 트랜잭션과 파일 업로드 설정.

#### 20210618 (금) 작업
- 검색처리는 멤버쿼리에서 작성한 내용 붙여넣고, 다중게시판용 필드조회조건 board_type추가.
- 관리자단 게시물관리 CRUD 처리(4.파일업로드 구현, 5. 트랜잭션 구현).
- 게시물관리 시작: 다중게시판? 1개 페이지로 board_type 변수를 이용해서 공지사항, 갤러리, QnA 구별해서 사용.(쿼리스트링이 길어져서 @Aspect로 사용)
- @Transactional으로 병목현상 해결 가능, 그러나 값을 받아서 좀 더 안전하게 처리.
- @Service까지는 DB(테이블) CRUD합니다.

#### 20210617 (목) 작업
- 메뉴 부분에 데이터를 항상 전달해줘야하는데 그렇지 못하기때문에 list부분에서만 메뉴가 정상출력.
- 문제를 해결하는 방식으로 AOP 방식을 사용.
- 스프링 AspectOrientedProgram구현은 3가지 방식: @Aspect, @ControllerAdvice, intercept태그
- 게시판종류 출력: @ControllerAdvice 구현.(게시판생성관리 CRUD작업시 실습)
- 검색시 pageVO처럼 board_type을 값을 계속 유지하는 기능:@Aspect(게시물관리 CRUD작업시 실습)
- 로그인체크, 권한체크 시: intercept(스프링시큐리티)태크 사용
- AOP용어: 관점지향? -프로그램전체에 영향을 주는 공통의 기능을 적용하는 기법.
- AOP용어: Advice: 프로세스작업 중간 필용한 기능을 끼워넣는 것을 어드바이스라고 한다.
- Advice: 필요한 기능을 끼워넣는 시점, @Before, After, Around
- @ControllerAdvice 실행족런: 컨트롤러클래스의 메서드만이 Advice 적용
- @Aspect장점: 특정클래스의 특정메서드실행시(pointCut) 자동실행되는 메서드를 지정 가능.
- Aspect실행조건: 컨트롤러에 더해서 서비스, DAO클래스의 메서드에서도 Advice 가능
- 게시물관리: 다중게시판? 1개 페이지로 board_type변수를 이용해서 공지사항, 갤러리, QnA 구별해서 사용
===============================================
병가
===============================================
#### 20210614 (월) 작업
- multipart(첨부파일기능) 라는 폼태그 전송방식을 추가-> commons.fileupload 외부모듈필수(pom.xml에 추가)
- 위 외부모듈을 스프링 빈으로 등록합니다.(servlet-context.xml 하단에 추가)
- CRUD에서 multipart를 사용한다면, 리졸브(resolve-해석기) 스프링빈이 필요.

```
<beans:bean id="multipartResolver" class="org.springframework.web.multipart.commons.CommonsMultipartResolver" />
```
- GET: Insert(외부 사이트 입력폼에서도 입력이 가능하다)
- POST: Insert(외부 사이트에서 입력 불가능, 내부 사이트의 입력폼에서만 가능)
- 나머지 관리자 회원관리 CRUD 화면 JSP구현 update, delete, insert
- [공지]06-17 목요일(4교시) UI디자인 시험 있습니다.(화면기획서XLS제작, 화면설계서PPT제출용)
- 관리자 게시판 생성관리 CRUD 정방향 방식으로 JSP 구현.

#### 20210611 (금) 작업
- 수업전 관리자단 회원관리 페이징처리에서 컨트롤러와 calcPage()메서드의 관계 확인
- JSTL: Java Standard Tag Libary 자바표준태그모듈로서 JSP에서 자바를 사용하는 표준.
- taglib uri(Uniform Resource Identifier-식별값):링크경로+자료 (큰개념) > url(링크 경로)
- prefix(접두어), 태그 별칭, <별칭

#### 20210610 (목) 작업
- 컨트롤러를 이용해서 관리자단 회원관리화면 JSP만들기 진행시작.
- JUnit 마치고, 관리자단 회원관리(CRUD) jsp까지는 작업합니다.
- 업데이트 실습은 회원암호를 스프링시큐리티5 암호화(1234->해시데이터)로 일괄변경 실습예정.
- 정방향 암호화 가능, 역방향 복호화는 불가능(JAVA용 스프링시큐리티암호화,DB용 MD5등등)
- DB서버에 타임존설정(Asia/Seoul)일 경우 그냥 사용, 아닐 경우 연산을 통해 처리.
- 오라클일때: SELECT TO_CHAR(systimestamp + numtodsinterval(9, 'HOUR'),'YYYY-MM-DD HH24:MI.SS.FF4') from dual;
- mysql(마리아db): SELECT DATE_ADD(NOW(3),INTERVAL 9 HOUR);

- 스프링 MVC
-Mapper는 DAO와 연결되고
-DAO는 Service와 연결되고
-Service는 Controller과 연결된다고 알고 있는데
-Mapper은 쿼리의 처리
-DAO는 변수를 VO를 통해 세팅해서 db와 통신하거나 db에서 받은 자료를 리턴하는 역할
-Service는 작은 DAO작업들을 모아서 실제 홈페이지에서 사용하는 것들을 묶어서 시행되게끔 하는 것

#### 20210609 (수) 작업
- pageVO클래스 생성 마무리
- <![CDATA[쿼리]]>: 사용하는 목적은 태그 안쪽에 부등호를 사용하기 위해서 문자열 변환 태그
- 쿼리에서 변수와 문자열과의 연결에서는 +(X), ,(X), ||(O)
- JUnit에서 회원관리 나머지 CRUD 테스트 진행.
- 컨트롤러 이용해서 관리자단 회원과리화면 JSP만들기 진행


#### 20210608 (화) 작업
- 페이징에서 사용되는 변수
- queryStartNo, queryPerPageNum, page, perPageNum, startPage, endPage, totalCount
- 검색에 사용되는 변수(query변수만): 검색어(search_keyword), 검색조건(search_type)


```
--sql쿼리 페이징을 구현해서 변수로 삼을 것을 정의
--pageVO의 멤버변수로 사용
select TABLE_B.* from
(
	select ROWNUM as RNUM, TABLE_A.* from
	(
		select * from tbl_member
		where user_id like '%admin%'
		or user_name like '%사용자8%'
		order by reg_date desc
	) TABLE_A
    where ROWNUM <=(0*10)+10
) TABLE_B
where TABLE_B.RNUM > (0*10);
--페이징 쿼리에서 필요한 변수는 2개
--오라클과 mysql을 연동하깅 위해서 a = 페이지 시작 번호, b= 한 페이지당 보이는 갯수
--a+b보다 작고 a보다 크거나 같다.는 의미.
--UI하단의 페이지 총개수의 변수 c: select count(*) from tbl_member/b
```

- Interface로 Inject 하는 이유는 캡슐화.
- Mapper가 있으면 마이바티스를 사용한다고 생각해도 된다.
- 스프링코딩 작업순서 1부터6까지(아래)
- 1. ERD를 기준으로 VO클래스를 생성.
- M-V-C 사이에 데이터를 입출력하는 임시저장공간 (VO클래스-멤버변수+Get/Set메서드) 생성
- 보통 ValueObject클래스는 DB테이블과 1:1로 매칭이 됩니다.
- 2. 매퍼쿼리(마이바티스사용)를 만듭니다.(VO사용해서쿼리생성)-내일만들예정
- 3. DAO(데이터엑세스오브젝트)클래스를 생성(SqlSession사용쿼리실행). Sql세션은 root-context에 빈으로 만들었습니다.(3개)
- IF인터페이스는 만드는 목적: 복잡한 구현클래스는 간단하게 구조화 시켜서 개발자가 관리하기 편하도록 역할 -> 기사시험책에는 캡슐화 구현과 관련(내부 구현내용을 모르더라도 사용할 수 있도록 하는 것.)
- 스프링 부트(간단한 프로젝트)에서는 4번 Service클래스가 없이 바로 컨트롤러로 이동합니다.
- MemberDAOimpl에서 Mapper에 있는 쿼리를 사용하여 DAO로 만든다.
- 4. Service(서비스)클래스생성(서비스에 쿼리결과를 담아 놓습니다.)(1개)
- 게시물을 등록하는 서비스1개(tbl_board-DAO1, tbl_attach-DAO2 첨부)
- JUnit에서 위 작업한 내용을 CRUD 테스트(과장) -> 대리,  사원에게 Controller, Jsp 작업을 맞깁니다.
- 5. Controller(컨트롤러)클래스생성(서비스결과를 JSP로 보냅니다.)
- 6. JSP(View파일) 생성(컨트롤러의Model객체를 JSTL을 이용해 화면에 뿌려 줍니다.)

#### 20210607 (월) 작업
- 마이바티스 추가 순서:
- 1. Maven 모듈 추가.
- 2. 마이바티스 설정파일 추가(쿼리를 저장할 위치 지정, 파일명 지정)
- 현업에서는 오픈소스인 mysql(마리아db)를 사용할 기회가 더 많다.-개발자가 많은편.
- 스프링은 마이바티스를 이용해서 쿼리를 관리합니다.
- 이전에는 자바코드(jsp코드)안에 쿼리를 만들어서 사용.->문제점(스파게티코딩)
- MVC로 분리: Model 부분의 SQL쿼리를 분리하도록 기능을 추가한 것이 마이바티스 입니다.
- 마이바티스(mybatis): 아이바티스(ibatis)는 이전버전
- 그 전에는 프로시저로 만들어서 작업.
- 지금은 스플링으로 옮기지 못한 프로그램만 제외하고는 대부분 마이바티스로 처리.
- 오라클은 납품시 소프트웨어비용이 산정되므로 사용도 적고 개발자도 적다.
- 오라클 기초이론 마무리: 시퀸스(스프링에서 사용-AI 자동증가기능)
- 만약 시퀸스 기능이 없다면, 게시물 작성시 첫번째, 두번째 게시물 등등을 구별하는 숫자를 계속 추가하려면, 현재까지 저장된 게시물의 최고번호값(max)를 구해서 +1 해야 합니다.(Insert시마다 개발자가 해줘야 함.)
- 시노님(긴 객체의 경로를 타이핑하기 힘들어서 만든 단축이름)
- sys.dual->dual
- 오라클: 더미데이터 일괄등록 예정, 회원관리(100명), 게시판관리(공지사항50개, 갤러리 50개)
- 더미데이터는 함수 or 프로시저라는 DB 프로그램 방식으로 추가합니다.
- 오라클: 댓글은 수동등록 후 마무리.
- JUnit로 CRUD 실습.
- 책 스프링 웹프로젝트는 개발 STS(스프링툴슈트) 툴.
- 책 스프링 웹프로젝트는 전자정부표중프레임워크 개발 툴.


#### 20210604 (금) 작업
- 오라클일때: localhost:1521/XE 접속URL끝의 XE는 서비스ID명, 사용자명이 테이블스페이스(DB)명
- Mysql(마리아DB): localhost:3306/XE 접속URL 끝의 XE는 데이터베이스명
- 구버전은 데스크탑 프로그램 -> 지금은 웹프로그램 사용자추가/DB(테이블스페이스)추가
- junit테스트시 sql에러를 디버그하는 방법은 jdbc드라이버 -> log4jdbc드라이버 바구면, sql에러가 나온다.
- junit에서는 sql에러가 보입니다. 콘솔창에는 보이지 않습니다. 콘솔창에서 sql로그상황이 나오게 하는 드라이버 추가 pom.xml 추가.

#### 20210603 (목) 작업
- @Autowired와  @inject 차이.

- c와 다르게 java에는 #ifdef가 없다. 때문에 log4j는 로그 관리측면에서 매우 유용하다.
- 스프링에서 오라클연동 순서:
- 1. JDBC(Java DataBase Connection)확장모듈 porm.xml에 추가
- 2. 오라클 접속 드라이버 추가.(확장모듈을 직접 jar파일로 추가)
- root-context.xml 파일에 오라클 커넥션 빈을 추가.
- 스프링이 관리하는 클래스 추가방법:@Controller, @Repository, @Service, @Component, -context.xml에서 빈을 추가
- JUnit테스트: 오라클 연동한 후 회원관리부분 CRUD 테스트 진행예정
- 자바 대신에 오라클04장 부터 CRUD 실습예정.
- admin 회원관리 (jsp디자인) 부터 프로그램 작업 시작 예정.

#### 20210602(수) 작업.
- 예외처리 모적: 에러상황에서도 프로그램이 중단되지 않도록 하는 것(에러상황을 알기 쉽게)
- 스프링에서는 스프링이 대부분 처리. 개발자(파일 업로드, 다운로드)
- 쓰레드: thread, 실행되는 프로그램을 명시, 1개의 프로그램에는 보통 1개의 쓰레드가 실행.
- 1개의 프로그램에 여러개의 쓰레드가 필요한 경우가 있다.(네트워크 프로그램의 경우)(멀티 쓰레드)
- 예외처리: Throwable 오브첵트가 실행시 에러가 발생하면, 예외를 보낼때 사용하는 클래스
- 스프링에서는 예외정보를 스프링 처리합니다.
- 자바앱에서는 예외처리를 개발자가 throw 처리한다.
- 예외처리: 에러발생시 프로그램이 중지되는 것을 방지하고, 계속 프로그램을 사용할 수 있도록 처리.
- 패키지는 관련기능을 한곳에 모아서 개발자가 관리하기 편하게 하기 위해 구분
- 로거의 레벨: DEBUG < INFO < WARN < ERROR < FATAL
- Controller을 이용하여 resources로 향하는 접근을 차단 가능.(확인)
- views에 jsp를 만들고 거기서만 뿌리는 것도 가능.
- resources의 필요성을 알 필요가 있다.

-개발순서: ERD제작 ->html제작->jsp제작(현재: 관리자단10기능 작업 후 사용자단 5기능)
- Junit(Java Unit Test): 자바 단위 테스트(서비스프로그램 작업 전에 프로토타입 만드는 것) - Junit CRUD 작업 후 본격 작업.

- 프론트를 만들고 그것을 받아서 백엔드를 만드는 작업이 효율적인가?
- 서버에서 각 단을 분할해서 갖고 그것을 짜맞추는것이 더 효율적이지 않을까?
- 내부 컨텐츠를 jsp로 만들어서 보내는 것이 더 효율적이지 않을까?
- 지금처럼 많은 html 파일이 필요한가?
- 각자 조각내서 이어붙이는 것으로 새로운 html 파일을 만들 수 있다(고정 레이아웃인 헤더와 푸터를 하나로 관리하는 효과)
- html과 css 로 레이아웃을 만들고 js로 내부 컨텐츠를 체운다면?
- js의 append와 prepend를 사용해서 html을 새로 만든다.(더 좋은 방법이 맞는가?)
- jsp에서 js를 이용하여 페이지를 완성한다.
- 이는 서버에서 페이지를 구성하는 처리를 한다는 뜻.
- 동적인 페이지(내부 컨텐츠의 유동적인 변화)는 어디서 처리하는가?
- .jsp에서 .Ajax를 통한 통신은 컨트롤러에서 보내주는 것. 컨트롤러는 DB에서 데이터를 받아와서 .jsp에 보내는 역할.


- Controller클래스+.jsp는 한쌍입니다. 그래서, Controller클래스에서 만든 변수를 .jsp에서 사용가능해집니다.
- 안드로이드앱= activity.java + layout.xml 한쌍.

- 일반홈페이지(cafe24): URL직접접근이 가능(보안위험)
- MVC웹프로그램: URL직접접근이 불가능(보안위험이 낮음) - 관공서, 대학, 은행에서 주요 사용
- MVC프로젝트에서도 resources폴더는 직접접근이 가능하다.-static콘텐츠(html,css,js)를 모아놓은 폴더. views폴더는 직접접근이 불가능하다.
- views폴더처럼 직접접근이 불가능한 컨텐츠는 controller(라우터역할)로 접근.

- views/home/index.jsp 엑박처리 후 분해(header.jsp, footer.jsp, body.jsp, index.jsp)
- admin 부터 프로그램 작업 시작
- 4장 패키지와 예외처리 실습.

#### 20210601 (화) 작업
- 프로젝트 버전을 올립니다. -> 외부라이브러리 부분 버전 올림 -> 메이븐이 관리 porm.xml
- Controller클래스에서 생성한 변수 사용(자바) model 객체에 추가 -> jsp 출력
- 출력하는 방식1: EL(ExpressLanguage)방식출력 ${변수}, <%=${변수} %>
- 출력하는 방식2: JSTL방식(*표준)출력,반복,조건 등: 
- 스프링에서는 logger로 출력.
- 스프링이 관리하는 클래스(bean)의 종류3가지(사용법은 클래스 상단에 입력)
- 1. @Controller 클래스빈	: 라우터 역할을 하는 메서드가 위치.
- 2. @Service 클래스빈	: 비지니스로직 매서드 위치.(트랜잭션등 기능)
- 3. @repository 클래스빈	: Model처리 메서드를 만듭니다.(DB핸들링외부클래스사용)
- DpendencyInject(객체생성-의존성주입)
- AspectOrientedProgramming(관전지향프로그램) 
- InversionOfControl(제어의 역전) 
- 위 3가지의 기능을 사용하기 위함.
- 4장 패키지와 예외처리 실습.
- 프론트 개발자가 작업한 결과 백엔드 개발자가 확인.
- VS code 작업한 html을 이클립스에 배치
- resources 폴더에 static컨텐츠(html, css, js, font)에 배치
- ERD기준으로  게시판 UI 마무리합니다.
- 오늘부터 이클립스에서 작업.
- 회원관리CRUD-jsp, 게시판생성관리 CRUD-jsp
- html을 분해(1개의 페이지를 header.jsp, footer.jsp)
- 이클립스로 작업한 html 내용을 ->resources 폴더(admin,home,root파일까지)로 배치
- 스프링 작업의 시작

#### 20210531 (월) 작업
- 토드(=sqlDev) 버튼으로 포워드엔지니어링 처리.
- 무료sqlDev는 DDL을 실행하여 포워드엔지니어링 처리.
- 무료mysql용 워크벤치는 버튼으로 포워드엔지니어링 가능.
- sql쿼리는 3가지로 분류합니다.
- DDL문: Data Definition Language. 데이터 정의 언어 (Create, Alter, Drop ..)
- DCL문: Data Control Language. 데이터 제어 언어 (Commit, Backup, Rollback ..)
- DNL문: Data Manufacturing Language. 데이터 조작 언어(Insert, Select, Update, Delete ..)
- 데이터딕셔너리(데이터의 데이터)는 메타데이터와 비슷하다.:컨텐츠X, 구조, 구성 정보만 존재
- ERD 그림 만든것을 물리 테이블로 만드는 것: forward engineering
- 물리테이블을 ERD 그림으로 만드는 것: reverse engineering(기존DB분석시 사용)
- 스프링시큐리티는 2단계:
- 1단계. 로그인인즌(ENABLED): AUTHENTICATION
- 2단계. 권한체크(LEVELS): AUTHORITY (관리자는 admin 접근 가능)
- 1:N관계? 게시물1개에 댓글 n개 달릴수 있음
- E-R다이어그램은 그림일뿐, 물리DB는 ERD기준으로 생성가능.
- PK를 AI(AUTO INCREMENT자동증가)로 만들기: 오라클(시퀀스 객체)
- ERD에서 Relation 생성: 게시판타입테이블과 게시물관리테이블의 관계를 생성
- 부모의 PK를 기준, 자식에게는 FK가 된다.
- 게시판타입: notice, gallery 2가지가 존재한다면,
- Relation필요한 이유: 공지사항이나 겔러리 게시판이 아니면, 개발자가 예외처리를 하지 않아도 다른 게시판으로 등록하는 상황 발생이 되지 않게 됨.
- 데이터 무결성을 유지하는 역할.(fk 관계)
- 필드 데이터형3: Timestamp(시간도장) 년월일시분초밀리초, Date(년월일)
- 필드 데이터형2: CLOB(CHAR LONG BYTE) 글내용이 많을때 사용하는 데이터
- 필드 데이터형: VARCHAR2(2바이트를 1글자), VARCHAR(1바이트를 1글자)
- 기본키: 중복되지 않는 값.
- 외래키: 외부테이블에서 참조할 값.
- 테이블구성: 필드(컬럼)=테이블의 멤버변수=자바VO클래스의 멤버변수
- RDBMS: RelationDatBaseManagementSystem-관계형데이터베이스관리시스템
- 오라클: 테이블스페이스(TableSpace) = 스키마(Scheme:Mysql) = 데이터베이스(DB-MS_SQL)
- 지난주 금요일날, 오라클 웹설정에서 XE라는 테이블스페이스에 XE사용자를 추가함.
- EntityRelationshipDiagram(ERD-객체관계그림): Entity = 테이블
- 데이터 모델: Model Object를 형상화 시킨것을 모델이라고 함. 데이터베이스를 말함.
- MVC 스프링프로젝트
- M은 Model 이고 스프링프로젝트 구성중에 데이터베이스를 가리킴.
- V는 View고 Jsp를 말합니다.
- C는 Controller이고 Class를 가리킨다.
- 스프링 ERD 제작 후 게시판 UI디자인 적용.

#### 20210528 (금) 작업
- Oracle11g EX 설치예정.
- StructuredQueryLanguage: 구조화된 질의언어(DB서버에 질의)
- QueryString: URL에서 전송하는 값(서버에 질의문)을 문장으로 저장한 내용 ?로 시작.
- CommendLineInterface: SQL *Plus 터미널화면으로  SQL쿼리 실행
- GraphicUserInterface: SQLDev: 윈도우화면 에디터에서 SQL쿼리 실행
- SQL Developer: 프로그램으로 ERD 다이어그램으로 프로젝트 구조제작예정.
- EntityRelationDiagram: 테이블관계도형
- 프로젝트 진행: 발주(클라이언트) -> 수주(개발사) -> 디자인UI(Client-Dev) -> ERD(이사, 팀장급) -> 코딩시작(UI소스+ERD참고)
- ERD에서 SQL쿼리기 생성 -> 물리테이블을 생성.
---------------------------------------------
- 첨부파일(자식)-> 게시판테이블(부모)-댓글(자식)
- 스프링의 특징 3가지 (IoC, AOP, DI)


#### 20210527 (목) 작업예정
- 3장 객체와 클래스부터 시작
- abstract클래스(추상클래스): 구현내용 없이, 메서드명만 있는 클래스. 객체를 만들 수 없다.
- final클래스: 상속할 수 없는 클래스
- 인스턴스=오브젝트=객체=실행중인클래스
- 클래스는 멤버변수, 멤버메서드, 서브클래스 등등 포함할 수 있습니다.=C언어 구조체
-이클립스 커밋, 푸시가 안될경우 팝업창 하단의 force 부분 체크(덮어쓰기)

#### 20210526 (수) 작업
- 스프링에서는 @inject로 객체로 만들어서 사용.
- OOP: 객체지향프로그램
- 객체(Object)와 클래스(Class)
- 추상화(Abstract): 공통업무를 묶어놓으면서 자기 자신은 생성되지 않게 하고 싶을때
- 클래스는 멤버변수 + 멤버메서드 + 서브클래스
- 상수: 변하지 않는 변수
- 보통 상수변수는 클래스의 제일 상단에 위치
- 기본형(정수자료형-소문자시작):byte<short<int<long
- 기본형(실수자료형-소수점,소문자시작): float<double
- 기본형(문자형-'a'단일): char, 문자 하나
- 문자형에서 유니코드 \u숫자입니다.
- 기본형(불린형-참,거짓): boolean
- 참조형:(대문자로 시작) String참조형변수의 대표적인 
- 클래스 변수(저장된 상태) -> 실행가능하게 되었을때, 인스턴스 변수(메모리로드된 상태)
- final int MAX = 100; 상수설정.
-for-each 반복문 전까지 실습.

- MVC(Model View Controller)
- src/test/java: test작업 폴더(약속)
- src/main/java: 프로그래밍 작업 폴더.
- javac: 자바컴파일러 한글일때는 -encoding UTF-8
- javac를 실행하면 .class 파일이 만들어진다.
- 클래스 파일은 실행패키지의 루트(최상위폴더)에서 실행해야 함.
- kr.or.test패키지 root폴더 src/test/java에서 실행해야함.
- maven: 웹프로그램 컴파일러 -> 웹앱 실행파일(.war)을 만들어 톰캣에서 실행.
- 메이븐 컴파일 할 때, 자바소스만 컴파일하는 것이 아니고, 외부라이브러리도 가져와서 바인딩하게 된다. = 패키징 = .war 파일로 패키징.
- maven이 관리하는 외부라이브러리(lib) 목록을 저장하는 파일이 pom.xml입니다.
- 외부 라이브러리 파일을 참조하는 방식을 dependency라고 합니다.
- .jar: JaveArchive = 자바클래스를 패키징한 파일.
- maven update는 인터넷을 통해 외부lib를 받아오는 것.

#### 20210525 (화) 작업
- 자바 기초 실습
- .java파일을 컴파일하여 .class파일은 만들어 실행하는 구조.
- 파이썬/자바스크립트는 인터프리터 방식을 진행
- 자바스크립트는 함수구조의 프로그래밍: 함수로 이루어져 있는 프로그램(Function)
- 자바는 객체지향프로그래밍: Object Oriented Program
- 객체(Object) = 실행 가능한 class
- 아스키, 유티코드(UnicodeTypeFormat-8)
- 아스키코드는 IoT에서 데이터 전송시 필수로 확인해야 한다. 0,1을 전송-> 48,49
- IoT프로그램시 하드웨어 값을 주고 받을 때 if(var1 == 48){구현내용}
- 공유기가 하위로 가질 수 있는 사설IP는 255개(공유기 자신 IP빼고)
- encoding, decoding
- 영어인코딩은 아스키코드로 다 표현가능
- 단, 한글 인코딩, 중국어/일본어 등등은 아스키코드로 다 표현이 불가. 그래서 유니코드 등장UTF-8.
- Hex(16진수), Dec(10진수), char(문자) = 127개 = 아스키문자의 크기
- 아스키코드 7비트코드(127자) -> 8비트코드(256자) = ANSI코드 -> Unicode(65536자)-UTF-8
- UTF-8mb4(이모지 포함:이모티콘+이미지)
- 자바언어를 한다는 것은 컴파일로 실행 프로그램을 만들게 됩니다.
- 자바스크립트(파이썬)는 그냥 실행(한줄씩)해서 프로그램을 만들게 됩니다.
