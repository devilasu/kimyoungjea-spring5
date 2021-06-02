#### 작업예정
- AdminLTE(부트스트랩 기반 탬플릿 - 반응형)를 이용하요 관리자단 디자인.
- UI디자인 끝----------------------------------------
- UI구현 시작 -------스프링프로젝트(Java+이클립스+Oracle+Spring) 시작.
- UI구현 ......UI디자인 이용해서 프로그램 입히게 됩니다.

#### 20210602(수) 작업.
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
