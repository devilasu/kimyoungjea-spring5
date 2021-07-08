<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

	<!-- 메인컨텐츠영역 -->
	<div id="container">
		<!-- 메인상단위치표시영역 -->
		<%@ include file="./board_header.jsp" %>
		<!-- //메인상단위치표시영역 -->

		<!-- 메인본문영역 -->
		<div class="bodytext_area box_inner">
			<!-- 폼영역 -->
			<form method="POST" name="board_update" action="/home/board/board_update" class="appForm" enctype="multipart/form-data">
				<fieldset>
					<legend>상담문의 입력 양식</legend>
					<p class="info_pilsoo pilsoo_item">필수입력</p>
					<ul class="app_list">
						<li class="clear">
							<label for="title_lbl" class="tit_lbl pilsoo_item">제목</label>
							<div class="app_content"><input value="${boardVO.title}" type="text" name="title" class="w100p" id="title_lbl" placeholder="제목을 입력해주세요" required/></div>
						</li>
						<li class="clear">
							<label for="content_lbl" class="tit_lbl pilsoo_item">내용</label>
							<div class="app_content">
								<textarea  name="content" id="content_lbl" class="w100p" placeholder="내용을 입력해주세요." required>${boardVO.title}</textarea></div>
						</li>
						<li class="clear">
							<label for="name_lbl" class="tit_lbl pilsoo_item">작성자명</label>
							<div class="app_content"><input readonly value="${boardVO.writer}" type="text" name="writer" class="w100p" id="name_lbl" placeholder="이름을 입력해주세요" required/></div>
						</li>
						<li class="clear">
		                    <label for="file_lbl" class="tit_lbl">첨부파일</label>
		                    <c:forEach begin="0" end="1" var="idx">
								<div class="custom-file" style="width:96%;margin:0 2%;">
									<input type="file" name="file" class="custom-file-input m-1" id="customFile_${idx}">
									<label class="custom-file-label m-1" for="customFile" style="color:#999;">파일첨부${idx}</label>
									<c:if test="${!empty boardVO.save_file_names[idx]}">
										<c:url var="url" value="/download">
											<c:param name="save_file_name" value="${boardVO.save_file_names[idx]}"/>
											<c:param name="real_file_name" value="${boardVO.real_file_names[idx]}"/>
										</c:url>
										<div class="text-right mr-4">
											<a href="${url}"> ${boardVO.real_file_names[idx]}</a>
											<button type="button" class="btn btn-info btn_file_delete">삭제</button>
											<input type="hidden" name="save_file_name" value="${boardVO.save_file_names[idx]}">
										</div>
									</c:if>
								</div>
								<div style="height:10px;"></div>
							</c:forEach>
		                </li>
					</ul>
					<p class="btn_line">
					<button type="submit" class="btn_baseColor">수정</button>
					<a href="/home/board/board_list" class="btn_baseColor">목록</a>
					</p>	
				</fieldset>
				<input name="board_type" value="${session_board_type}" type="hidden">
				<input type="hidden" name="page" value="${page}">
				<input type="hidden" name="bno" value="${boardVO.bno}">
			</form>
			<!-- //폼영역 -->
		</div>
		<!-- //메인본문영역 -->
	</div>
    <!-- //메인컨텐츠영역 -->
<%@ include file="../include/footer.jsp" %>

<script>
$(document).ready(function(){
	$(".btn_file_delete").click(function(){
		if(confirm('선택한 첨부파일을 삭제하시겠습니까?')){
			var click_element = $(this);
			var save_file_name = click_element.parent().find('input[name=save_file_name]').val();
			$.ajax({
				type:"post",
				url:"/file_delete?save_file_name="+save_file_name,
				dataType:"text",
				success:function(result){
					if(result=="success"){
						click_element.parents(".custom-file").remove();
					}
				},
				error:function(){
					alert("RestAPI서버가 작동하지 않습니다. 잠시 후에 이용해주세요.");
				}
			});
		}
	});
});
</script>