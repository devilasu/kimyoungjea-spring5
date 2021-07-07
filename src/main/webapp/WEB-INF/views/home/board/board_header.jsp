<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 게시판용 CSS 임포트 -->
<link rel="stylesheet" href="/resources/home/css/board.css">
<!-- 부트스트랩CSS코어 import -->
<link rel="stylesheet" href="/resources/admin/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<!-- 부트스트랩JS코어 import -->
<script src ="/resources/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- adminLTE전용CSS코어 import-->
<link rel="stylesheet" href="/resources/admin/dist/css/adminlte.min.css">
<!-- 첨부파일 부트스트랩 디자인 JS -->
<script src="/resources/admin/plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
<!-- summernote 웹에디터CSS import -->
<link rel="stylesheet" href="/resources/admin/plugins/summernote/summernote-bs4.min.css">
<link rel="stylesheet" href="/resources/admin/plugins/summernote/summernote.css">
<!-- summernote 웹에디터JS import -->
<script src="/resources/admin/plugins/summernote/summernote.js"></script>
<!--  -->

<style>

/* tablet용 메인페이지 스타일 지정 */
@media all and (min-width:801px){

}
/* PC용 메인페이지 스타일 지정 */
@media all and (min-width:1066px){
}

</style>
<!-- 섬머노트 -->
<script>
$(document).ready(function() {
	// 첨부파일 선택한 내용 출력 실행
	bsCustomFileInput.init();

	//summernote 실행
	//$("#content_lbl").summernote({}); 기본 실행틀 커스터마이징 가능
	$("#content_lbl").summernote({
		height: 150,
		lang: "ko_KR",
		placeholder: "글 내용을 입력해 주세요.",
		fontNames: ["Arial","Arial Black", "Nanum Gothic","맑은 고딕", "궁서", "굴림", ],
		fontSizes: ['8','10','12','14','16','18','20','22','24','28','30','36','50','72'],
		toolbar: [
			["fontname",["fontname"]],
			["fontsize",["fontsize"]],
			["style",["bold","italic","underline"]],
			["color",["forecolor","color"]],
			["table",["table"]],
			["para",["ul","ol","paragraph"]],
			["height",["height"]],
			["insert",["link","video"]],
			["view",["fullscreen","help"]]
		],
		fontNamesIgnoreCheck: ['Nanum Gothic']
	});
});
// 노트 폰트 수정.note-editable {font-family:Nanum Gothic} 
</script>
<!-- 메인상단위치표시영역 -->
<div class="location_area customer">
	<div class="box_inner">
		<h2 class="tit_page">스프링 <span class="in">in</span> 자바</h2>
		<p class="location">고객센터 <span class="path">/</span> 공지사항</p>
		<ul class="page_menu clear">
		<c:forEach var="boardTypeVO" items="${listBoardTypeVO}">
			<li><a href="/home/board/board_list?board_type=${boardTypeVO.board_type}" class="${boardTypeVO.board_type==session_board_type?'on':''}">${boardTypeVO.board_name}</a></li>
		</c:forEach>
		</ul>
	</div>
</div>	
<!-- //메인상단위치표시영역 -->