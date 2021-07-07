<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/header.jsp"%>

<!-- 메인컨텐츠영역 -->
    <div id="container">
		<!-- 메인상단위치표시영역 -->
		<%@ include file="./board_header.jsp" %>
		<!-- //메인상단위치표시영역 -->

		<!-- 메인본문영역 -->
		<div class="bodytext_area box_inner">			
			<ul class="bbsview_list">
				<li class="bbs_title">박물관 미션 투어 응모 당첨자 발표</li>
				<li class="bbs_date">작성일 : 
				<span><fmt:formatDate pattern="yyyy.MM.dd hh:mm:ss" value="${boardVO.reg_date}"/></span>
				</li>
				<li class="bbs_hit">조회수 : <span>${boardVO.view_count}</span></li>
				<li class="bbs_content">
					<div class="editer_content">
					    ${boardVO.content}
                    </div>
				</li>
				<li class="bbs_title" style="height:inherit;">첨부파일: 
					<c:forEach begin="0" end="1" var="idx">
						<c:url var="url" value="/download">
							<c:param name="save_file_name" value="${boardVO.save_file_names[idx]}"/>
							<c:param name="real_file_name" value="${boardVO.real_file_names[idx]}"/>
						</c:url>
						<!-- c:url로 쿼리스트링을 처리하면 한글이 인코딩 된다. -->
						<c:if test="${boardVO.real_file_names[idx] != null}">
						<a href="${url}">다운로드
						${boardVO.real_file_names[idx]}
						</a>
						
						<!-- 이미지 미리보기 처리 -->
						<c:set var="fileNameArray" value="${fn:split(boardVO.save_file_names[idx],'.')}" />
	                    <!-- 그림판.얼굴.코.JPG = 3개배열, 그림판.jpg = 2개배열 -->
	                    <c:set var="extName" value="${fileNameArray[fn:length(fileNameArray)-1]}" />
	                    <!-- 그림판.얼굴.jpg 파일을 위 변수로 처리시 extName = fineNameArray[2] = jpg -->
	                    <!-- 자바언어로는 switch ~ case문 ~ default -->
	                    <!-- containsIgnoreCase('찾을값의문장','비교기준값') -->
	                    <c:choose>
	                    	<c:when test="${fn:containsIgnoreCase(checkImgArray,extName)}">
								<img style="width:100%;display:block;" alt="다운로드 이미지" src="/image_preview?save_file_name=${boardVO.save_file_names[idx]}">	
							</c:when>
						</c:choose>						
						</c:if>
					</c:forEach>
				</li>
			</ul>
			<p class="btn_line txt_right">
				<a href="/home/board/board_list?page=${pageVO.page}&search_type=${pageVO.search_type}" class="btn_bbs">목록</a>
			</p>
			
		</div>
		<!-- //메인본문영역 -->

		<!-- 댓글 영역 -->
		<div class="container-fluid">
			<!-- Timelime example  -->
			<div class="row">
					<!-- 댓글 입력 폼 -->
					<div class="col-md-12">
						<div class="card-default">
						  <div class="card-header">
							<h3 class="card-title">댓글 작성</h3>
						  </div>
						  <div class="card-body p-0">
							<div class="bs-stepper linear">
							  <div class="bs-stepper-header" role="tablist">
							  <div class="bs-stepper-content">
								<!-- your steps content here -->
								<div id="logins-part" class="content active dstepper-block" role="tabpanel" aria-labelledby="logins-part-trigger">
								  <div class="form-group">
									<label for="replyer">작성자</label>
									<input type="text" class="form-control" id="replyer" placeholder="작성자를 입력해 주세요.">
								  </div>
								  <div class="form-group">
									<label for="reply_text">댓글내용</label>
									<input type="text" class="form-control" id="reply_text" placeholder="내용을 입력해 주세요.">
								  </div>
								</div>
								<div id="information-part" class="content" role="tabpanel" aria-labelledby="information-part-trigger"></div>
								  <button type="button" class="btn btn-warning" id="btn_reply_write">댓글등록</button>
								</div>
							  </div>
							</div>
						  </div>
						</div>
						<div class="card-footer">
							아래 댓글리스트 버튼을 클릭하시면 댓글 목록이 나옵니다.
						</div>
					  </div>
					<!-- //댓글 입력 폼 -->
			  <div class="col-md-12">
				<!-- The time line -->
				<div class="timeline">
				  <!-- timeline time label -->
				  <div class="time-label">
					<span id="btn_reply_list" class="bg-red" data-toggle="collapse" href="#collapseReply" role="button">
						댓글 리스트
						[<span>2</span>]
					</span>
					</div>
					<!-- /.timeline-label -->
					<!-- timeline item -->
					<!-- 댓글리스트를 자바스크립트의 빵틀(templete)을 만듭니다. -->
					<!-- 기존 퍼블리셔가 만든 태그를 그대로 사용 가능 -->
					<div class="collapse timeline" id="collapseReply">
						<!-- END timeline item -->
						<ul class="pagination">
						</ul>
					</div>
			  <!-- /.col -->
			</div>
		  </div>
		  <!-- //댓글 영역 -->
	</div>
<!-- //메인컨텐츠영역 -->


<%@ include file="../include/footer.jsp"%>