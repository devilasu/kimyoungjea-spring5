<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title> TEST 스프링 </title>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- jQuery Core import -->
<script src="/resources/home/js/jquery-3.6.0.js"></script>
<!-- 상단 바로가기 링크시 부드럽게 이동하는 외부lib import -->
<script src="/resources/home/js/jquery.smooth-scroll.min.js"></script>

<!-- 화면 초기화시키는 스타일 import: 크로스브라우징을 처리하기 위해서-->
<!-- chrome, IE, Edge, Safari, fireFox의 h1, p, ul, div영역의 태그의 크기가 전부 조금씩 다르다. -->
<!-- 작업한 결과가 모든 브라우저에서 다르게 보이는걸 똑같이 보이게 하기 위한 reset.css(crossingBrowser) -->
<link rel="stylesheet" href="/resources/home/css/reset.css">
<!-- 여기서부터는 사용자 정의형 스타일 + 스크립트 추가 -->
<script src="/resources/home/js/main.js"></script>
<link rel="stylesheet" href="/resources/home/css/mobile.css">
<link rel="stylesheet" href="/resources/home/css/tablet.css">
<link rel="stylesheet" href="/resources/home/css/pc.css">
<script src="/resources/home/js/slideMain.js"></script>
<style>
	/* tablet용 메인페이지 스타일 지정 */
	@media all and (min-width:801px){
	}
	/* PC용 메인페이지 스타일 지정 */
	@media all and (min-width:1066px){
	}
</style>
<script>
	


$(document).ready(function() {
	//슬라이드 실행부분.
	slideAuto = setTimeout("play_w('right')",3000);
	//play_w함수 실행(3초가 되기 전에 미리 누르면 버튼이 다 사라지는 버그 발생.)
	// var slidePlay_hide = setTimeout(function(){
	// 	$(".rollPlay").css("display","none");
	// },3000);

	//초기설정: play상태로 play버튼을 감추는 부분
	$(".rollPlay").css("display","none");

	// 정지버튼을 클릭했을 때
	$(".rollStop a").click(function(){
		$(this).parent().hide();
		$(".rollPlay").css("display","inline-block");
		//진행버튼을 클릭했을때, setTimeeout로 실행시킨 함수 실행취소
		if(slideAuto){clearTimeout(slideAuto);}
	});

	// 진행버튼을 클릭했을 때
	$(".rollPlay a").click(function(){
		$(this).parent().hide();
		$(".rollStop").css("display","inline-block");
		//슬라이드 함수 실행
		play_w("right");
	});

	//슬라이드의 3가지 버튼
	$(".rollingBtn li.seq a").each(function(index){
		$(this).click(function(){
			$(".rollPlay").hide();
			$(".rollStop").css("display","inline-block");
			if(slideAuto){clearTimeout(slideAuto);}
			play_w(index);
		});
	});

});
</script>
</head>
<body>
<!-- 헤더에서푸터까지 -->
<div id="wrap">
	<!-- 헤더상단메뉴영역영역 -->
	<header id="header">
		<div class="header_area box_inner clear">
			<!-- 상단로고영역 -->
			<h1><a href="/">스프링 in 자바</a></h1>
			<!-- //상단로고영역 -->
			
			<!-- 상단메뉴메뉴영역 -->
			<p class="openMOgnb"><a href="#"><b class="hdd">메뉴열기</b> <span></span><span></span><span></span></a></p>
			<div class="header_cont">
				<ul class="util clear">
					<li><a href="login.html">로그인</a></li>
					<li><a href="join.html">회원가입</a></li>
					<!-- 로그인 후 보이는 메뉴(아래) -->
					<li><a href="#">OOO님 환영합니다.</a></li>
					<li><a href="mypage.html">마이페이지</a></li>
					<li><a href="/admin">AdminLTE</a></li>
				</ul>	
				<nav>
				<ul class="gnb clear">
					<li><a href="board_list.html" class="openAll1">샘플홈페이지</a>

                        <div class="gnb_depth gnb_depth2_1">
                            <ul class="submenu_list">
                                <li><a href="board_list.html">반응형홈페이지</a></li>
                            </ul>
                        </div>
					</li>
					<li><a href="board_list.html" class="openAll2">커뮤니티</a>
				        <div class="gnb_depth gnb_depth2_2">
                            <ul class="submenu_list">
                                <li><a href="board_list">공지사항</a></li>
                                <li><a href="board_list">갤러리게시판</a></li>
                            </ul>
                        </div>
					</li>
				</ul>
                </nav>
				<p class="closePop"><a href="javascript:;">닫기</a></p>
			</div>
			<!-- //상단메뉴메뉴영역 -->
		</div>
	</header>
	<!-- //헤더상단메뉴영역영역 -->
	
	<!-- 메인컨텐츠영역 -->
	<div id="container">
		<!-- 모바일+PC 공통슬라이드영역 -->
    	<div class="main_rolling_pc">
            <div class="visualRoll">
            	<!-- 슬라이드이미지영역 -->
                <ul class="viewImgList">
                    <li class="imgList0">
                        <div class="roll_content">
                            <a href="javascript:;">
							<p class="roll_txtline">1OOO OOOOOOOOO OOOOOOOOO OOOOO</p>
							</a>
                        </div>
                    </li>
                    <li class="imgList1">
                        <div class="roll_content">
                            <a href="javascript:;">
							<p class="roll_txtline">2OOO OOOOOOOOO OOOOOOOOO OOOOO</p>
							</a>
                        </div>
                    </li>
                    <li class="imgList2">
                        <div class="roll_content">
                            <a href="javascript:;">
							<p class="roll_txtline">3OOO OOOOOOOOO OOOOOOOOO OOOOO</p>
							</a>
                        </div>
                    </li>
                </ul>
                <!-- //슬라이드이미지영역 -->
                <!-- 슬라이드버튼영역 -->
                <div class="rollBtnArea">
                    <ul class="rollingBtn">
                        <li class="seq butt0"><a href="#butt"><img src="/resources/home/img/btn_rollbutt_on.png" alt="1번" /></a></li>
                        <li class="seq butt1"><a href="#butt"><img src="/resources/home/img/btn_rollbutt_off.png" alt="2번" /></a></li>
                        <li class="seq butt2"><a href="#butt"><img src="/resources/home/img/btn_rollbutt_off.png" alt="3번" /></a></li>
                        <li class="rollStop"><a href="#" class="stop"><img src="/resources/home/img/btn_roll_stop.png" alt="멈춤" /></a></li>
                        <li class="rollPlay"><a href="#" class="play"><img src="/resources/home/img/btn_roll_play.png" alt="재생" /></a></li>
                    </ul>
                </div>
                <!-- //슬라이드버튼영역 -->
            </div>
        </div>
        <!-- //모바일+PC 공통슬라이드영역 -->
	
		<!-- 갤러리최근게시물영역 -->
		<div class="about_area">
			<h2>갤러리 최근 게시물 <b>TOP 3</b></h2>
			<div class="about_box">
				<ul class="place_list box_inner clear">
					<li><a href="#" onclick="$('.popup_base').css('height',$(document).height());$('.contact_pop').show();">
							<img class="img_topplace" src="/resources/home/img/no_image.png" alt="OOOO OOOOO" style="opacity:0.7;"/>
							<h3>OOOO OOOOO</h3>
							<p class="txt">OOOO OOOOOOOOO OOOOOOOOO OOOOOOOOO OOOOOOOOO OOOOOOOOO OOOOOOOOO OOOOO!</p>
							<span class="view">VIEW</span></a>
					</li>
					<li><a href="#" onclick="$('.popup_base').css('height',$(document).height());$('.space_pop').show();">
							<img class="img_topplace" src="/resources/home/img/no_image.png" alt="OOOO OOOOO" style="opacity:0.7;"/>
							<h3>OOOO OOOOO</h3>
							<p class="txt">OOOO OOOOOOOOO OOOOOOOOO OOOOOOOOO OOOOOOOOO OOOOOOOOO OOOOOOOOO OOOOO.</p>
							<span class="view">VIEW</span></a>
					</li>
					<li><a href="#" onclick="$('.popup_base').css('height',$(document).height());$('.program_pop').show();">
							<img class="img_topplace" src="/resources/home/img/no_image.png" alt="OOOO OOOOO" style="opacity:0.7;"/>
							<h3>OOOO OOOOO</h3>
							<p class="txt">OOOO OOOOOOOOO OOOOOOOOO OOOOOOOOO OOOOOOOOO OOOOOOOOO OOOOOOOOO OOOOO</p>
							<span class="view">VIEW</span></a>
					</li>
				</ul>
			</div>
		</div>
		<!-- //갤러리최근게시물영역 -->

		<!-- 카카오톡상담및최근공지사항영역 -->
		<div class="appbbs_area">
			<div class="appbbs_box box_inner clear">
				<h2 class="hdd">상담과 최근게시물</h2>
				<p class="app_line">
					<a href="javascript:;">카카오톡 1:1 상담</a>
					<a href="javascript:;">전화 상담 신청</a>
				</p>
				<div class="bbs_line">
					<h3>NOTICE</h3>
					<ul class="notice_recent">
						<li><a href="javascript:;">OOOO OOOOO (스프링OOOO OOOOO)</a></li>
						<li><a href="javascript:;">OOOO OOOOOOOOO OOOOO</a></li>
						<li><a href="javascript:;">OOOO OOOOO/OOOO OOOOO</a></li>
						<li><a href="javascript:;">OOOO OOOOO OPEN! (스프링정보, OOOO OOOOO)</a></li>
						<li><a href="javascript:;">OOOO OOOOO 서비스 점검 안내</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- //카카오톡상담및최근공지사항영역 -->
	</div>
	<!-- //메인컨텐츠영역 -->
	
	<!-- 푸터메뉴및사업자정보영역 -->
	<footer>
		<div class="foot_area box_inner">
			<ul class="foot_list clear">
				<li><a href="javascript:;">이용약관</a></li>
				<li><a href="javascript:;">개인정보취급방침</a></li>
			</ul>
			<h2>스프링</h2>
            <p class="addr">OOOO OOOOO OOOO OOOOOOOOO OOOOO <span class="gubun">/</span>        
				<span class="br_line">대표전화 <span class="space0">02-1234-5678</span> <span class="gubun">/</span>        
					<span class="br_line">E-mail : <span class="space0"> admin@OOOO OOOOO.com</span></span>
				</span>
			</p>
			<p class="copy box_inner">Copyright(c) OOOO OOOOO all right reserved</p>
			<ul class="snslink clear">
				
				<li><a href="javascript:;">blog</a></li>
				<li><a href="javascript:;">facebook</a></li>
				<li><a href="javascript:;">instargram</a></li>
			</ul>
		</div>
	</footer>
	<!-- //푸터메뉴및주소영역 -->
</div>
<!-- //헤더에서푸터까지 -->

<!-- 하단퀵메뉴영역 -->
<div class="quick_area">
	<p class="to_top"><a href="#wrap" class="s_point">TOP</a></p>
</div>
<!-- //하단퀵메뉴영역 -->

</body>
</html>