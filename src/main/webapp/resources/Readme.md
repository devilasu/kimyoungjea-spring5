#### 작업예정
- AdminLTE(부트스트랩 기반 탬플릿 - 반응형)를 이용하요 관리자단 디자인.
- UI디자인 끝----------------------------------------
- UI구현 시작 -------스프링프로젝트(Java+이클립스+Oracle+Spring) 시작.
- UI구현 ......UI디자인 이용해서 프로그램 입히게 됩니다.

#### 20210601 (화) 작업
- ERD기준으로  게시판 UI 마무리합니다.
- 오늘부터 이클립스에서 작업.
- 회원관리CRUD-jsp, 게시판생성관리 CRUD-jsp
- html을 분해(1개의 페이지를 header.jsp, footer.jsp)
- 이클립스로 작업한 html 내용을 ->resources 폴더(admin,home,root파일까지)로 배치
- 스프링 작업의 시작


#### 20210531 (월) 작업
- ERD기준으로 게시판UI 수정.
- 관리자단 AdminLte적용-스프링때바로:(회원관리CRUD, 게시판생성관리CRUD)
- 이클립스로 .html을 가져가서 -> resources 폴더(static폴더): admin, home, root파일까지 배치 - 스프링 작업의 시작

#### 20210528 (금) 작업
- UI트랜드용어: 카드UI, 뱃지, 리본
- 데이터 전송할때 사용문장-쿼리스트링: ?키 = value&키=value 
- 프로그램에서는 뒤로가기 허용하면, 게시물 테러가 가능합니다.
- 뒤로가기를 허용하지 않게 페이지 이동방식(JS에서는 location.replace())
- 뒤로가기를 허용하는 함수(JS에서는 location.href="")
- 관리자단 admin/board_write.html, board_view.html(댓글 Ajax처리)
- 대시보드 home.html (최근 회원가입정보, 최근 게시물 정보)



#### 20210527 (목) 작업.
- admin/board_list.html부터 시작
- 관리자단 AdminLTE적용. - 스프링: 회원관리CRUD, 게시판생성관리CRUD
- 관리자단 AdminLte적용. - 지금: 게시판CRUD, 대시보드
- 관리자단 기본 틀(템플릿): 공통 UI부분 작업.
- Ctrl+k+0(코드축소), Ctrl+K+J(코드확대)
- damo.js의 변수명의 이유, 태그에서 / 가 뒤에 있는 이유, demo.js 분석 필요
- Read-리스트형식(다중Map):board_list.html, ex>회원리스트(회원목록)
- Read-Map형식, JSON형식(key:value):board_view.html(회원 상세보기)
- 상세보기; 페이지 댓글 디자인은 부트스트랩 디자인시 추가할 예정.
- href(헤르프): Hypertext referance
- 정적 컨텐츠: html, css, js
- 동적 컨텐츠: JSP(java스프링), py(python장고), PHP, C#, Nodejs(익스프레스)
- (데이터변수) 바인딩: 정적인 컨텐츠에 동적인 데이터를 넣어주는 것을 바인딩이라고 한다.(묶어주는 역할)

#### 20210526 (수) 작업
- id: 문서내에 유일한 객체 식별자
- class: 성격이 동일한 태그들을 그룹으로 나타내기 위한 식별자
- name: 서버전송용 사용, 내부스크립트용 사용
- 검색엔진에 최적화: 각 태그를 의미에 맞게 사용하였는가?
- 유효성검사: validation 입력값이 제대로된 값인지 확인하는 과정.
- HTML5내장된 유효성 검사: required(공백 체크), type="email"(이메일형식 체크), type="password"(입력값을 숨김처리), type="number"(숫자 체크), validator lib를 사용하여 type="tel"에 number 속성 추가방식이 더 좋다.
- JS유효성검사: 비밀번호확인(두 개의 입력값) 체크
- 반응형 서브페이지들(로그인, 회원가입, 마이페이지).
- HTML5부터는 유효성 검사가 내장되어 있기때문에, JS로 빈칸인지 코딩할 필요가 없습니다. required 속성을 태그에 넣으면 끝.
- 기획시, 메인1 CSS 네이밍, 서브1 CSS 네이밍.(과장/이사급이 UI를 만듬.or 테마포레스트 같은 디자인 UI .html+.css+.js를 구매해서 사용.) -> 기반으로 퍼블리셔, 프론트 개발자가 추가작업
- 발주금액이 4000이상, 2억 안팍인 프로젝트는 자체 UI를 사용.


#### 문제점과 해결책
- board_view.html에서 댓글에 대한 페이징과 댓글을 받아와서 출력하는 과정에서의 레이아웃 깨짐 현상과 문제에 대한 해결방안
- 변수를 만들어서 클릭시 변수에 변화를 주는 스크립트를 이용한 출력.
- 클릭시마다 데이터를 받아와서 새로운 출력을 해줘야 하므로 script에서 제어가 필요하다.
- 그러면 페이징도 스크립트에서 제어하면 되는 것 아닐까?
- 페이징도 Handlebars로 처리해보자.
- 실제 위에서는 layout을 짜놓고 아래 script에서 추가하는 방식으로 html을 만들 수 있다. 수업 시간에 해야하는 것들을 배우고 여분의 시간에 새로운 html을 만들어 보자.


#### 20210525 (화) 작업
- board-view.html 댓글 AdminLTE3의 페이징 UI 추가.
- 위 시작전 이클립스에서 프로젝트 익스플로러와 패키지 익스플로러 차이 확인.
- 프로젝트 익스플로러: 윈도우 탐색기와 동일
- 패키지 익스플로러: 폴더경로를 .으로 구분

- Handlebars라는 라이브러리를 사용하면 변수가 필요한 부분을 설정하고 배열의 길이만큼 반복해서 호출이 가능하다.
- 이는 동일한 레이아웃을 연속해서 쉽게 불러올 수 있는 효과.
- $.ajax를 통하여 데이터의 통신이 가능하다. 현재는 임의로 데이터를 입력하였지만, 후에는 서버와 데이터를 주고 받음으로서 동적인 페이지 구축가능.
- $.ajax({method:, url:, datatype:, success:, error:}
- 프론트: 레이아웃 작성, 서버와의 통신이 필요한 데이터를 설정, 서버에서 넘어오는 데이터를 출력할 수 있게 하는 부분.
- 백엔드: db를 통해 서버에 데이터 저장. 필요한 데이터를 뽑아서 넘겨주는 기능. ??? 또 무엇을?
- 의문점: index페이지가 모든 페이지의 시작으로 사용자의 입력에 따라 서버에서 다양한 페이지를 받아 상호간의 통신을 진행한다...?  뭔가가 헷갈리는데 뭔지 찾을 필요.

#### 20210524 (월) 작업
- 시간형식: date(년월일), dateTime(년월일시분초), timeStamp(년월일시분초)
- 1970년 생일: 타임스탬프가 1970년 1월1일부터 현재까지 초를 계산한 결과
- 팝업창: 모달창(modal)-기존창을 사용 못하게 함., 모달리스(modeless)창-제어권을 독점하지 않음.
- 버튼을 누를때 필수입력은 required옵션을 사용한다. 이는 <form> 내부에서 사용해야한다.
- fontawesome(아이콘웹폰트): 확대해도 깨지지 않는다.(벡터방식의 아이콘)
- 벡터방식인 것을 보니 아마도 방향과 크기를 이용한 그리기 방식인듯 하다. 한 글꼴의 크기값을 가져와서 비율로 방향, 크기를 정하고 그리는 방식인듯.
- 포토샵 디자인으로 아이콘을 만들면 확대시 깨진다.(비트맵 방식)
- 부트스트랩 그리드 레이아웃: 화면을 12개의 컬럼으로 분리해서 크기를 반응형으로 만듭니다.
- div에 클래스 지정
- .container        : 반응형 고정폭 레이아웃
- .container-fluid  : 유동 최대혹 레이아웃
- row(가로줄), co(세로칸), col-md-12(화면가로 크기를 12로 지정 = 100%, 조건은 md에서 100%)
- 반응형의 화면크기: xs(nene(auto)), sm(~750px), md(970px~), lg라지(1170px~)
- col-6(화면가로 크기를 6으로 지정 = 50%)
- 화면 가로크기를 지정하는 이유(모바일, 테블릿, pc)

- 피곤할때, Java|스프링(이클립스-egov전자정부 프레임워크 개발환경)
- 피곤할때, 오라클DB(SQL DEV)-실습진행. Ansi-SQL(표준SQL)기본언어실습 CRUD.
- 2달째부터(백엔드), 주로 스프링으로 실습이 진행.(납품용-이력서포트폴리오용)
-egov: 자바기반 ->JDK설치확인.
- JDK 실행 경로 추가.
- jave -version
- 자바 오라클자바는 8버전부터 돈을 내야합니다. 오픈JDK 회사에서는 변경
- 그래서 오라클자바 8~11버전 지우고, 오픈 JDK로 변경 후 이클립스로 사용할 예정.
- OPEN JDK 8버전(egov와 100%연동)
- 톰캣: 이클립스에서 웹프로그램 결과를 확인하는 라이브서버 입니다.(localhost:8080)
- 라이브서버(아파치): VS code에서 HTML결과를 확인하는 라이브서버(localhost:5500)
- jsp(1세데 2000년 -게시판) -> 서블렛(2세대 servelet) -> 스트러츠(3세대 2010년대 프레임워크) -> 스프링프레임워크(4세대 2013년 이후.)

#### 20210521 (금) 작업내용
- 반응형 게시판페이지(CRUD) CSS 처리: Create(Update) = board_write.html
- 글쓰기폼에서 첨부파일 부분, 내용입력부분의 웹에디터를 추가.
- 부트스트랩: jQuery기반의 UI템플릿(UI프레임워크)
- 부트스트랩(AdminLTE): dist(distribute=배포폴더), pages(더미데이터), plugins(서머노트 등등)
- 대시보드파일샘플: index.html, index2.html, index3.html 
- board_write.html 파일에 bootstrap코어import + 서머노트플러그인 import.
- 반응형 서브페이지들(loginPage, 회원가입Page, myPage).
- 관리자단 AdminLTE적용. (외원관리 CRUD, 대시보드)
- 톰캣(class(jsp) 해석)) vs VS라이브서버(아파치-html해석)
- 자바소스(.java맵, .jsp웹) -> 컴파일 -> class파일(여기에 DB자료가 동적으로 입출력이 됨) -> html 번역(WAS-톰캣) -> 웹브라우저
- eclipse Hello World 실습. 
- 1. 다이나믹 웹프로젝트(jsp만드는 방식) 만든 후 사용자단 UI 실행 후 삭제.
- 2. 스프링 MVC웹프로젝트 만들예정. 헬로 월드 1개 -2달간 이 프로젝트로 진행됩니다.
- 위 스프링 프로젝트에서 자바 기초 실습예정. -> htmlUI 만든 것을 jsp변경작업 들어갑니다.
- 백엔드: 1. 이클립스(스프링-규모가 있는 프로젝트 개발), 2. 인텔리J(스프링부트-규모가 작은 프로젝트 개발)


#### 20210520 (목) 작업내용
- main.js의 mouseover부분 연구 필요. stop()가 어떻게 작동하는지에 대하여.
- 메인페이지 시간이 걸리는 부분(프런트엔드):메뉴처리, 슬라이딩처리
- 메인페이지 시간이 걸리는 부분(백엔드): 최근갤러리, 최근공지사항 DB데이터를 출력하는 부분
- 모바일 게시판페이지(CRUD) CSS 처리: Read(list, view페이지)





#### 20210518 (화) 작업내용
- pc.css 에서 gnb부분 수정필요.
- 테블릿 메인 CSS 스타일 처리, PC용 메인 CSS 스타일 처리
- 반응형 페이지의 핵심기술은 미디어쿼리 명령어 사용 + 가로크기를 %로 지정(px 고정크기가 아닌 비율로 내부 컨텐츠 크기를 지정하는 방법)
- 미디어(PC화면, 스마트폰화면, 프린터, 태블릿화면)+ 쿼리(질의어)
- @media 미디어타입(screen, print 등등=all) and (min-width:801px){스타일 구현 내용)
- 태블릿은 마우스 오버 기능을 넣을 필요가 없습니다.(손가락 터치)
- 배치1: jQuery코어 import 이후, 사용자가 지정한 js배치를 해야합니다.
- 배치2: reset.css, mobile.css import이후에 사용자가 지정한 tablet.css, pc.css를 배치해야 레이아웃이 깨지지 않습니다.


- CSS작성시 1, 1-1, 1-2 가 있는 경우(숫자는 태그를 의미) 1은 보통 layout를 나타낸다. 그러나 1-1, 1-2에 공통적으로 적용하고 싶은 폰트, 여백등이 있을 경우에는 어떻게 처리하는 것이 좋을까?
- 방법1: 또 다른 태그로 감싼다?(별로...)
- 방법2: 아니면 1태그에 추가한다?(적용되나?)
- 방법3: 각자 적용한다.(낭비)
- 방법4: 1-1, 1-2가 같은 태그일 경우 1-1에 추가하면 1-2에도 적용되는 방법을 사용한다.(이것을 사용해야 하나?)
- hide()의 경우에는 display속성을 none로 바꾸므로 웹페이지의 레이아웃에 주던 영향이 사라지게 된다.
- fadeIn(), fadeOut()를 animate()를 대신하여 쓸 수 있다.
- 조건: position: absolute이어야 하며, 레이아웃이 깨지지 않기 위해 상위 태그에 높이값을 지정해줄 필요가 있다.
- 참고사항: 사이트탐색 결과 타 사이트에서는 fadeIn(),fadeOut()를 사용할때 display: inline-block으로 설정되어 있었다.
- fadeOut()이후 fadeIn()이 호출 될 때, 현 코드에서는 img가 재출력되지 않는 현상이 있다.
- 현재 슬라이드이미지는 .viewImgList라는 <ul>태그 안에 존재하며, <li>태그에 height:300px라는 높이값이 정해져 있다.
- 또한 <ul>태그 안에 <li>태그 내에 존재하는 <img><a>태그의 경우 첫 번재 <li>가 position:relative, 나머지가 position:absolute로 되어있다.
- 첫 번째 슬라이드가 fadeOut()이 되면 레이아웃이 깨지는 현상이 발생한다.
- 결론: 실제 데이터를 보여주는 태그와 레이아웃을 구성하는 태그를 별개로 구성하여, 레이아웃을 잡는다면, fadeIn(), fadeOut()를 충분하게 사용할 수 있을 듯 하다.
- 위 작업들은 슬라이드버튼을 눌렀을 경우, 발생하는 싱크로율의 문제를 해결하기 위해 찾은 것이며, 이후 fadeIn(), fadeOut()과 animate()의 차이는 fadeOut()는 마지막에 display값이 none가 된다는 것. animate()는 매개변수가 실행되기까지의 지연값을 가지게 해주는 것이 차이점이다.
-fadeIn()의 경우에는 $("").fadeIn("숫자",function(){$(this).css("display:inline-block"); }); 를 사용하여 효과를 주어 fade를 적용할 수 있다.

#### 20210517 (월) 작업내역
- 메인 페이지에 자바스크립트(jQuery)적용. (VS code+CSS+jQuery+HTML5)
- 제이쿼리적용부분: 메뉴, 슬라이드이미지3개 처리: 모바일 메인페이지만 마무리
- 보통 이미지슬라이드 처리는 외부lib를 많이 쓴다. 사용(니보슬라이드, 캐로셀슬라이드)
- 외부lib 사용 안하고, 직접 만들어 봅니다.
- 

#### 20210515 (토) 이론내용
- var myData = JSON.parse(data); 라는 함수를 통해 json파일을 파싱할 수 있다.
- $(#id).load를 통해 타 html의 속성을 읽을 수 있을 듯 하다.(크롤링)
- 이상하게 .js에서는 .load를 쓸 수 없었다. .html본문의 <script></script>에서는 사용이 되었다.
- 라이선스 등이 걸려 있어서 함부로 사용하면 안된다.

#### 20210514 (금) 작업내역
- json데이터 코딩으로 다양한 방법으로 불러오는 법 연구
- HTML5에서는 <table>태그 내의 <tr>태그등은 <thead> or <tbody> or <tfoot>라는 큰 틀내에 존재해야 한다. 그렇지 않으면 <tbody>가 자동으로 생성되어 오류가 날 수 있다.
- syntex오류(문법 오류)
- css의 가장 위에는 주석도 오면 안된다. @charset가 먼저와야한다.
- CSS3, HTML5: 검사기준입니다.
- background-size는 그림의 크기를 확대, 축소하는 것.
- width값을 지정해주는 것과 가운데 정렬을 하는 것, 목표는 가운데 정렬인데 두 가지를 같이쓴다. 어디에 px값으로 주고 어디에 정렬을 해주는지 확인해보자.
- background와 background-image의 차이점에 대해서 알아보자.
- div.wrap으로 전체를 감싸준다.
- 각 영역을 큰 틀로 나눈다.
- 나눈 영역을 세부내용으로 나눈다.
- 비슷한 중요도의 내용들은 <ul>의 <li>로 감싸준다.
- <span> 3개는 햄버거를 만들 수 있다. 무슨 태그인지 확인해보자.
- <a>는 하이퍼링크로 사용가능하다.
- href 속성에 javascript:;가 입력 가능한데 무슨역할인지 확인하자.
- <b>는 글자를 굵게 하는 태그지만 <strong>를 권장한다.
- <div>가 생각보다 많다. 어떻게 나눴는지 한번 분석할 필요가 있다.
- <img>는 이미지를 넣는 태그인데 생각보다 안에 들어 갈 수 있는 속성이 많다. 한 번 살펴보자.
- Layout을 살펴볼 때는 큰 틀을 먼저 나누고 각각의 틀을 다시 큰 틀로 보고 세부틀을 나누며 각 태그들의 쓰임새를 확인한다.

#### 작업예정: jQuery JSON데이터 파싱
- 외부data.js 파일에서 json데이터를 저장한 후 html에서 불러와서 파싱.
- 외부 사이트에서 제공하는(RestAPI서버) json데이터를 html에서 불러와서 파싱.
- RestAPI서버 중 코로나19 확진자 데이터를 받아서 html에서 파싱(데이터를 분해해서 화면에 뿌려주는 작업)
- RestAPI서버주소(빅데이터): https://coroname.me/getdata

#### 20210513 (목) 작업내역
- .openMOgnb span:first-of-type + span {width: 17px;} /* 인접형제경합자 */
- /* .openMOgnb span + span {width: 17px;}
- .openMOgnb span:last-child{
-     width:25px;
-     margin-bottom: 0px;
- } */

- .openMOgnb span:last-child{
-     width:25px;
-     margin-bottom: 0px;
- }
- .openMOgnb span:first-child + span {width: 17px;}은 왜 적용 안되는가? 밑의 span:last-child는 적용되는데?
- .openMOgnb에 선택자를 붙이면 적용되었었다. child는 무엇이 문제인가?
- first-child 는 .openMOgnb의 첫번째 태그가 span이어야 선택되는데 그렇지 않기에 선택되지 않았다.?? 이상한데;..
- pixabay에서 받은 이미지 3개
- logo: https://pixabay.com/ko/illustrations/%EB%82%98%EB%AC%B4-%EB%AF%B8%EC%9D%98-%EB%A1%9C%EA%B7%B8-%EB%AF%B8%EA%B5%AD-990861/
- slide1: https://pixabay.com/ko/photos/%EB%8F%99%EB%AC%BC-%EC%82%AC%EC%A7%84-%EC%A2%8B%EC%9D%80-%EC%9E%90%EC%97%B0-%EA%B3%A0%EC%96%91%EC%9D%B4-3215197/
- slide2: https://pixabay.com/ko/photos/%EA%B3%A0%EC%96%91%EC%9D%B4-%EA%BD%83-%EC%83%88%EB%81%BC-%EA%B3%A0%EC%96%91%EC%9D%B4-%EB%8F%8C-2536662/
- slide3: https://pixabay.com/ko/photos/%EC%83%88%EB%81%BC-%EA%B3%A0%EC%96%91%EC%9D%B4-%EA%B3%A0%EC%96%91%EC%9D%B4-2288404/
- noImage: https://pixabay.com/ko/vectors/%EC%A7%80%EA%B5%AC-%EC%97%86%EC%9D%8C-%EA%B1%B0%EC%A7%93-%EC%8B%A4%ED%8C%A8%ED%95%9C-1528493/
- 작업폴더를 나누는 이유: 시청(관공서), 대학, 기업의 웹프로그램(사이트)를 제작 할 때, 1년간 무상 유지보수 이후 2천, 리뉴얼 4청 비용이 측정
- home폴더 기존작업물, 리뉴얼 home에 덮어씌우는 것이 아니고,
- 리뉴얼 할 때, home2022폴더에 작업을 하게 된다.
- jQuery코어 다운받기: minVersion(속도up), devVersion
- jQuery 미처리 작업은 다음주
- 오늘부터는 모바일 메인페이지 1개 제작 후 과제물로 제출 -> 실제 스프링에서 프로그램 입히는 소스로 사용
- 애니데스크(독일산): 팀뷰어(독일산) 사용하는 대신에 애니데스크 사용.
- html5.html, css.html, js.html 여기까지
- jQuery 기본구조만 실습했습니다.

- <button onclick="checkValue()">입력값 확인</button> 는 줄 색이 바뀌는 jQuery에서 느림
#### 20210512 (수) 작업내역
- jQuery 사용법: jQuery cdn 검색
- document.getElements~를 통해 ID, Name,ClassName등을 통하여 하나의 배열로 선택가능하다.
- 이를 이용하여 같은 name, 같은 class를 묶어서 공동 작업이 가능하다.
- iframe으로 홈페이지를 띄울때 live server에서는 실행되었으나 github로 푸쉬 이후 홈페이지에서는 뜨지 않는 현상.
- 가상 선택자를 통한 추가에서 Space는 중복되지 않는다.
- user.name, user.email 확인법: git config --list, user.name, user.email 확인.
- 프로젝트를 1명 제작하는 경우는 없기 때문에, 2명일때 소스 수정한 사람 확인용 정보입니다.
#### 20210511 (화) 작업내역
- 내가 사용한 방식: section과 article을 <div>로 씌워주고 aside에 <div>로 씌워준 뒤 전체에 <div>를 씌워준 후 div의 설정값을 조정.
- padding는 내부여백, margin은 외부여백
- div가 id 면 div#  div가 class면 div.
- <iframe> 에서 반응형을 만들 때, width, height를 그냥 설정하면 vw나 vh를 사용하지 못하지만 style을 사용하여 설정하면 단위를 vw를 사용하여 반응형으로 만들 수 있다.
- **<iframe>에서 홈체이지 좌우가 짤려있다.
- 유튜브영상 넣는법: 우클릭->소스코드 복사 붙여넣기
- 로렘입숨 한글 http://guny.kr/stuff/klorem
- 로렘입숨 영어 http://loremipsum.io/generator
- 줄바꿈이 이루어지는 영역태그를 블럭영역 <p>
- 줄바꿈이 이루어지지 않는 영역은 인라인블럭영역 <span>
- p태그는 문단의약자(Paragraph)
- Emmet문법 h${헬로 html}*6, ({}는 생략가능)
- url결로(path): /루트, /test/html5.html
- 에러-promission: 자격증명이 들어가 있으면, 자격증명관리자에서 제거한 후, git credential-manager uninstall --force 를 타이핑하면 된다.
- HTML5의 레이아웃 구조 제작합니다.
- 서버(응답하는프로그램=response) = 아파치, 톰캣서버
- 클라이언트(요청하는프로그램=request) = 웹브라우저
- HTML은 마크업이 태그로 구성됩니다.<의미있는문자>....</의미있는문자>
- cmd 작업할폴더주소 에서 git clone <github주소>를 타이핑할 시 github에 업데이트 되어 있는 자료를 다운로드 할 수 있다. (.git 포함)
- hppt://127.0.0.1:<Port>(80)[8080|9000|5500|6500]
- PC의 네트워크 내부주소(공통): 127.0.0.1 == localhost
- yahoo.com(도메인) == 74.6.143.25(IP주소)
- 도메인 80은 생략가능 (기본 포트)
- IP주소버전: IPv4, IPv6
- HTML도 버전: HTML5, HTML4.01(old)

- git문제점
- 무한로딩: vs code를 껐다가 킨다.
- 에러-영어 promission: 자격증명관리자에서 제거, cmd 관리자권한실행 git credential-manger uninstall --force
- 에러-user.name, user.email: 터미널에서 git config --local user.name 이름, git config --logcal user.email 이메일
- 에러-읽기전용: 터미널을 확인. 껐다가 새 터미널
- 깃의 사용 순서: 저장(파일저장)->스테이징(커밋 전 임시저장)->커밋(푸쉬 전에 임시저장)->푸쉬(실제로 올라감)

#### 20210510 (월) 작업내역 
- git pull문제였던 것: vs code에서 폴더를 설정하고 clone를 실행하여 만들어진 devilasu.github.io폴더 안에 github아이디인 devilasu.github.io폴더가 다시 만들어지고 그 안에 자료가 복사되었다. 따라서 터미널에서 설정된 경로와 실제 자료가 있는 경로가 불일치하여 문제가 발생했다.
-해결책: 모두 제거 후에 다시 경로를 설정한 후 clone 실행.
- git pull의 경우에는 .git 폴더가 있어야 사용가능하다. 이미 작업세팅이 되어 있는 곳에서 다운로드할 때 사용할 것 같다.
- git clone <주소>는 github에 있는 자료를 그대로 복사한다.(최초에 실행이며 .git폴더도 만들어진다.)
- 별개: git에는 branch, remote저장소개념이 있다. remote개념에서 clone라는 개념이 나온다.
- breanch (분기)의 경우에는 작업이 어느 지점에서 갈라져서 작업이 될 경우에 쓰이는 듯 하다. git checkout으로 이동 가능
- remote는
- Git에서 'User Name' 'User Mail'추가하라고 떠요
- 해결책
- git config --local user.name 이름
- git config --logcal user.email 이메일
- 업로드절차: 1. 커밋(commit)  2. 푸시(push)
- 다운로드절차: 1. 풀(pull) : 교실에서 작업한 결과를 집에서 이어서 작업할 상황
- 레퍼지토리(저장소) 초기화: git init
- 개발PC(html)와 Git 저장소를 연결시킵니다.
- 포트의 역할이 트렌드로 많이 사용됩니다.
- 포트(port): 포트번호로 서비스를 만드는 것이 트렌드
- 이전에는 80포트에 모든 서비스를 묶어놓았습니다.
- 모든서비스를 개별로 분리하는 트렌드가 있습니다.마이크로서비스라고 한다. == RestAPI로 구현이 됩니다.
- 도메인 (예, https://naver.com:1451241/네이버 인증서비스 개발)
- 외부 인원(네이버직원아닌)이 포트기준으로 제작한 서비스를 가져다 사용
- html : Hyper Text MarkUp Language 태그를 사용하는 언어
- md : MarkDown Language 태그를 사용하지 않는 언어

