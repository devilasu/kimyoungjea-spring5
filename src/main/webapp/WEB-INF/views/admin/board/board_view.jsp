<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@include file="../include/header.jsp" %>

<div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <div class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1 class="m-0">${boardVO.board_type} 상세보기</h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item active">${boardVO.board_type}</li>
              </ol>
            </div><!-- /.col -->
          </div><!-- /.row -->
        </div><!-- /.container-fluid -->
      </div>
      <!-- /.content-header -->

      <!-- Main content -->
      <section class="content">
        <div class="container-fluid">
          <!-- 컨텐츠 내용 -->
          <div class="row">
            <div class="col-12">
              <div class="card card-primary">
                <div class="card-header">
                  <h3 class="card-title">보기</h3>
                </div>
                <!-- /.card-header -->
                <!-- form start -->
                <!-- <form name="" method="" action="" anctype="" -->
                <form name="form_view" action="/admin/board/board_update" enctype="multipart/form-data">
                  <div class="card-body">
                    <div class="form-group">
                      <label for="exampleInputEmail1">제목</label>
                      <br>
                      ${boardVO.title}
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword1">내용</label>
                      <br>
                      ${boardVO.content}
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword1">작성자</label>
                      <br>
                      ${boardVO.writer}
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword1">조회수</label>
                      <br>
                      ${boardVO.view_count}
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword1">작성일</label>
                      <br>
                      <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${boardVO.reg_date}"/>  
                    </div>
                    <div class="form-group">
                      <label for="exampleInputFile">첨부파일</label>
                      <c:forEach begin="0" end="1" var='idx'>
                      <c:if test="${boardVO.attachVO == null}">
                      <div class="input-group">
                        <div class="custom-file">
                        <a href='/download?save_file_name=${boardVO.AttachVO[idx].save_file_name}&real_file_name=${boardVO.AttachVO[idx].real_file_name}'>
                          ${boardVO.real_file_names[idx]}
                         </a>
                         <!-- jstl에서 변수사용하기 fn.split('데이터','구분자') 목적: 확장자를 이용해서 이미지 미리보기 할지 결정.-->
                         <c:set var="fileNameArray" value="${fn:split('boardVO.attachVO[index].save_file_name','.')}" />
                         <c:set var="extName" value="${fileNameArray[fn:length(fileNameArray)-1] }"/>
                        </div>
                      </div>
                      </c:if>
                      </c:forEach>
                    </div>
                  </div>
                  <!-- /.card-body -->
  
                  <div class="card-footer text-right">
                    <button type="revise" class="btn btn-primary">수정</button>
                    <button type="delete" class="btn btn-danger">삭제</button>
                    <a href="board_list.html" class="btn btn-default">목록</a>
                  </div>
                </form>
              </div>
              <!-- 댓글 타임라인 -->
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
        
              <!-- /댓글 타임라인 -->
            </div>
          </div><!-- /컨텐츠 내용 -->
        </div><!-- /.container-fluid -->
      </section>
      <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

<%@include file="../include/footer.jsp" %>