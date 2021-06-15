<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/header.jsp"%>
	 <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <div class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1 class="m-0">${memberVO.user_id} 상세보기</h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item active">${memberVO.user_id}</li>
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
                <form id="form_view" name="form_view" action="/admin/member/member_update_form" method="get" enctype="multipart/form-data">
                  <div class="card-body">
                    <div class="form-group">
                      <label for="exampleInputEmail1">사용자ID</label>
                      <br>
                      <c:out value="${memberVO.user_id}" />
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword1">사용자이름</label>
                      <br>
                      <c:out value="${memberVO.user_name}" />
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword1">이메일</label>
                      <br>
                      <c:out value="${memberVO.email}" />
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword1">권한</label>
                      <br>
                      ${memberVO.enabled}
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword1">가입일</label>
                      <br>
                      <fmt:formatDate pattern="yyyy-MM-dd HH시 mm분 ss.SSS초" value="${memberVO.reg_date}" />
                    </div>
                  </div>
                  <!-- /.card-body --> 
                  <div class="card-footer text-right">
                     <button type="submit" class="btn btn-primary">수정폼</button>
                    <button type="button" class="btn btn-danger" id="btn_delete">삭제</button>
                    <button type="button"class="btn btn-default" id="btn_list" >목록</a>
                    <!-- 목록으로 이동하려면, pageVO도 가져야 합니다. 또한 삭제/수정 보안때문에 URL쿼리 스트링(GET)으로 보내면 X, POST방식으로 보냅니다. -->
		            <input type="hidden" name="page" value="${pageVO.page}">
		            <input type="hidden" name="search_type" value="${pageVO.search_type}">
		            <input type="hidden" name="search_keyword" value="${pageVO.search_keyword}">
		            <input type="hidden" name="user_id" value="${memberVO.user_id}">
                  </div>
                </form>
              </div>
            </div>
          </div><!-- /컨텐츠 내용 -->
        </div><!-- /.container-fluid -->
      </section>
      <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
<%@ include file="../include/footer.jsp"%>
<!-- 관리자단은 jQuery코어가 하단 footer에 있기 때문에 여기에 위치합니다. -->
<script>
$(document).ready(function(){
	$("#btn_delete").click(function(){
		if(confirm("정말로 삭제하시겠습니까?")){
			$("#form_view").attr("action","/admin/member/member_delete")
			$("#form_view").attr("method","post");
			$("#form_view").submit();
		}
	});
	
	$("#btn_list").click(function(){
		var queryString = "page=${pageVO.page}&search_type=${pageVO.search_type}&search_keyword=${pageVO.search_keyword}";

		location.replace('/admin/member/member_list?'+queryString);
	});
});
</script>