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
					<li><a href="/login_form">로그인</a></li>
					<li><a href="/join_form">회원가입</a></li>
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