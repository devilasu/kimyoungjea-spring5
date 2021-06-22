<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <div class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1 class="m-0">${pageVO.board_type} 리스트</h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item active">${pageVO.board_type}게시물 관리</li>
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
              <div class="card">
                <div class="card-header">
                  <h3 class="card-title">목록</h3>
                  <div class="card-tools" style="width:70%;">
                    <form class="form-horizontal" name="form_search" action="board_list" method="get">
                    <div class="input-group input-group-sm">
                        <select name="search_type" class="form-control col-3">
                          <option value="all">전체</option>
                          <option value="title">제목</option>
                          <option value="content">내용</option>
                        </select>
                      <input type="text" name="search_keyword" class="form-control float-right" placeholder="Search">

                      <div class="input-group-append">
                        <button type="submit" class="btn btn-default"><i class="fas fa-search"></i></button>
                      </div>
                    </div>
                     <input type="hidden" name="board_type" value="${pageVO.board_type}">
                  </form>
                  </div>
                </div>
                <!-- /.card-header -->
                <div class="card-body table-responsive p-0">
                  <table class="table table-hover text-center">  <!-- text-nowrap 줄바꿈 안할때 -->
                    <thead>
                      <tr>
                        <th>BNO</th>
                        <th>BOARD_TYPE</th>
                        <th>TITLE</th>
                        <th>WRITER</th>
                        <th>REG_DATE</th>
                      </tr>
                    </thead>
                    <tbody>
                      <!-- 링크 주소에 jsp에서 프로그램 처리 -->
                      <c:forEach var="boardVO" items="${listBoardVO}">
                      <tr style="cursor:pointer" onclick="location.replace('/admin/board/board_view?bno=${boardVO.bno}&page=${pageVO.page}&search_type=${pageVO.search_type}&search_keyword=${pageVO.search_keyword}')">
                        <td>${boardVO.bno}</td>
                        <td>${boardVO.board_type}</td>
                        <td>${boardVO.title}</td>
                        <td><span class="tag tag-success">${boardVO.writer}</span></td>
                        <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${boardVO.reg_date}"/></td>
                      </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                </div><!-- /.card-body -->
                <!-- .card-footer -->
                <div class="card-footer clearfix">
                </div><!-- /.card-footer -->
              </div> <!-- /.card -->
            </div>
          </div><!-- /컨텐츠 내용 -->
<div class="row" >
            <div class="col-12">
              <div class="text-right">
                <a href="/admin/board/board_insert_form?board_type=${pageVO.board_type}&page=${pageVO.page}$search_keyword=${pageVO.search_keyword}&search_type=${pageVO_search_type}" class="btn btn-primary" id="btn_insert">게시물등록</a>
              </div>
              
              <div class="dataTables_paginate paging_simple_numbers" id="example2_paginate">
                <ul class="pagination justify-content-center">
                  <li class="paginate_button page-item previous ${pageVO.prev?'':'disabled' }" id="previous">
                    <a href="/admin/board/board_list?board_type=${pageVO.board_type}&page=${pageVO.startPage-1}" aria-controls="example2" data-dt-idx="${pageVO.startPage-1}" tabindex="0"
                      class="page-link">Previous</a>
                  </li>
                  <c:forEach var="idx" begin="${pageVO.startPage}" end="${pageVO.endPage}" step="1">
                  	<!-- c:out value값에 삼항 연산자 -->
	                  <li class="paginate_button page-item <c:out value="${idx==pageVO.page?'active':'' }" />">
	                    <a href="/admin/board/board_list?board_type=${pageVO.board_type}&page=${idx}&search_keyword=${pageVO.search_keyword}&search_type=${pageVO.search_type}" aria-controls="example2" data-dt-idx="idx" tabindex="0" class="page-link">${idx}</a>
	                  </li>
                  </c:forEach>
                  <li class="paginate_button page-item next ${pageVO.next?'':'disabled' }" id="next"><a href="/admin/board/board_list?board_type=${pageVO.board_type}&page=${pageVO.endPage+1}"
                      aria-controls="example2" data-dt-idx="board_type=${pageVO.endPage+1}" tabindex="0" class="page-link">Next</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div><!-- /.container-fluid -->
      </section>
      <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

<%@ include file="../include/footer.jsp" %>

<script>
encodeURI()
</script>