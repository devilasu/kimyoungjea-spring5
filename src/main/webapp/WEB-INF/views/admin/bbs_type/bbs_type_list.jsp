<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/header.jsp" %>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">게시판 리스트</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">게시판생성관리</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- 콘텐츠 내용 -->
        <div class="card">
          <div class="card-header">
            <h3 class="card-title">목록</h3>
            
          </div>
          <!-- /.card-header -->
          <div class="card-body table-responsive p-0">
            <table class="table table-hover">
              <!-- 줄바꿈않할때 다음 클래스추가 text-nowrap  -->
              <thead>
                <tr>
                  <th class="text-center">BOARD_TYPE</th>
                  <th class="text-center">게시판 이름</th>
                  <th class="text-center">출력순서</th>
                </tr>
              </thead>
              <tbody>
                <!-- 아래 링크주소에 jsp에서 프로그램처리예정 -->
                <c:forEach var="boardTypeVO" items="${listBoardTypeVO}">
                <tr style="cursor: pointer;" onclick="location.replace('/admin/bbs_type/bbs_type_update?board_type=${boardTypeVO.board_type}');">
                  <td>${boardTypeVO.board_type}</td>
                  <td>${boardTypeVO.board_name}</td>
                  <td>${boardTypeVO.board_sun}</td>
                </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
          <!-- /.card-body -->
        </div>
        <!-- //콘텐츠 내용 -->
        <!-- 페이징 처리 -->
        <div class="row" >
            <div class="col-12">
		        <div class="col-12 text-right">
		          <a href="/admin/bbs_type/bbs_type_insert" class="btn btn-primary mb-3">게시판생성</a>
		        </div>
              
              <div class="dataTables_paginate paging_simple_numbers" id="example2_paginate">
                <ul class="pagination justify-content-center">
                  <li class="paginate_button page-item previous ${pageVO.prev?'':'disabled' }" id="previous">
                    <a href="/admin/member/member_list?page=${pageVO.startPage-1}" aria-controls="example2" data-dt-idx="${pageVO.startPage-1}" tabindex="0"
                      class="page-link">Previous</a>
                  </li>
                  <c:forEach var="idx" begin="${pageVO.startPage}" end="${pageVO.endPage}" step="1">
                  	<!-- c:out value값에 삼항 연산자 -->
	                  <li class="paginate_button page-item <c:out value="${idx==pageVO.page?'active':'' }" />">
	                    <a href="/admin/member/member_list?page=${idx}&search_keyword=${pageVO.search_keyword}&search_type=${pageVO.search_type}" aria-controls="example2" data-dt-idx="idx" tabindex="0" class="page-link">${idx}</a>
	                  </li>
                  </c:forEach>
                  <li class="paginate_button page-item next ${pageVO.next?'':'disabled' }" id="next"><a href="/admin/member/member_list?page=${pageVO.endPage+1}"
                      aria-controls="example2" data-dt-idx="${pageVO.endPage+1}" tabindex="0" class="page-link">Next</a></li>
                </ul>
              </div>
            </div>
          </div>

        <!-- //페이징 처리 -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

<%@ include file="../include/footer.jsp" %>

<script>

function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}
var success = getParameterByName("success");
$(document).ready(function(){
	if(success!=null && success !=""){
		if(success){
			alert("성공하였습니다.");
		}
		else{
			alert("실패하였습니다.");
		}
	}
});
</script>