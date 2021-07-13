<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<style>
	.img_topplace{
		overflow:hidden;
		height:250px;
		opacity: 0.7;
	}
	.img_topplace:hover{
		opacity: 1.0;
	}
	.txt{
		overflow:hidden;
	}
	/*갤러리, 공지사항 게시물 제목 자르기*/
	.title_crop{
		white-space:nowrap;
		overflow:hidden;
		text-overflow:ellipsis;
		
	}
</style>
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
			<h2><a href="/home/board/board_list?board_type=gallery&search_keyword=">
			갤러리 최근 게시물 <b>TOP 3</b></a></h2>
			<div class="about_box">
				<ul class="place_list box_inner clear">
					<c:forEach var="gallery" items="${latestGallery}">
						<li><a href="/home/board/board_view?bno=${gallery.bno}&page=1&board_type=gallery">
							<c:choose>
								<c:when test="${empty gallery.save_file_names[0]}">
									<img class="img_topplace" src="/resources/home/img/no_image.png" alt="OOOO OOOOO" />
								</c:when>
								<c:otherwise>
									<img class="img_topplace" src="/image_preview?save_file_name=${gallery.save_file_names[0]}" alt="OOOO OOOOO"/>
								</c:otherwise>
							</c:choose>
							<h3 class="title_crop">
								${gallery.title}
							</h3>
							<p class="txt">
							<c:choose>
									<c:when test="${fn:length(gallery.content) gt 40}">
										${fn:substring(gallery.content,0,39)}...
									</c:when>
									<c:otherwise>
										${gallery.content}
									</c:otherwise>
								</c:choose>
							</p>
							<span class="view">VIEW</span></a>
						</li>
					</c:forEach>
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
					<h3><a href="/home/board/board_list?board_type=notice&search_keyword=">NOTICE</a></h3>
					<ul class="notice_recent">
						<c:forEach var="notice" items="${latestNotice}">
							<li><a href="/home/board/board_view?bno=${notice.bno}&page=1&board_type=notice">${notice.title}(${notice.content})</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		<!-- //카카오톡상담및최근공지사항영역 -->
	</div>
	<!-- //메인컨텐츠영역 -->
	
	<%@ include file="./include/footer.jsp" %>
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
