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
              <h1 class="m-0">회원 리스트</h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item active">관리자 관리</li>
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
                    <form class="form-horizontal" name="form_search" action="/admin/member/member_list" method="GET">
                    <div class="input-group input-group-sm">
                        <select name="search_type" class="form-control col-3">
                          <option value="all">전체</option>
                          <option value="user_id">아이디</option>
                          <option value="user_name">이름</option>
                        </select>
                      <input type="text" name="search_keyword" class="form-control float-right" placeholder="Search">

                      <div class="input-group-append">
                        <button type="submit" class="btn btn-default"><i class="fas fa-search"></i></button>
                      </div>
                    </div>
                  </form>
                  </div>
                </div>
                <!-- /.card-header -->
                <div class="card-body table-responsive p-0">
                  <table class="table table-hover text-center">  <!-- text-nowrap 줄바꿈 안할때 -->
                    <thead>
                      <tr>
                        <th>사용자ID</th>
                        <th>사용자 이름</th>
                        <th>이메일</th>
                        <th>레벨</th>
                        <th>가입일자</th>
                      </tr>
                    </thead>
                    <tbody>
                    <!-- 검색결과가 없을때, 레이아웃 깨지는 현상 -->
                    <c:if test="${empty listMember}">
                    	<tr>
                    		<td colspan="5">
                    		조회된 값이 없습니다.
                    		<td>
                    	</tr>
                    </c:if>
                      <!-- jstl 반복문으로 listMember객체 바인딩 -->
                      <c:forEach var="member" items="${listMember}">
	                      <tr style="cursor:pointer" onclick="location.replace('/admin/member/member_view?page=${pageVO.page}&search_keyword=${pageVO.search_keyword}&search_type=${pageVO.search_type}&user_id=${member.user_id}')">
	                        <td><c:out value="${member.user_id}"/></td>
	                        <td><c:out value="${member.user_name}" /> </td>
	                        <td><c:out value="${member.email}"></c:out></td>
	                        <td><span class="tag tag-success">${member.m_level}</span></td>
	                        <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss.SSS" value="${member.reg_date}"/></td>
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
                <a href="/admin/member/member_insert" class="btn btn-primary">회원등록</a>
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
        </div><!-- /.container-fluid -->
      </section>
      <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
<%@ include file="../include/footer.jsp"%>