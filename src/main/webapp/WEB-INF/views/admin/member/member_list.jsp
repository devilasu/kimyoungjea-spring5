<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                    <form class="form-horizontal" name="form_search" action="/admin/member/member_list.html" method="GET">
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
                        <th>BNO</th>
                        <th>BOARD_TYPE</th>
                        <th class="col-6">TITLE</th>
                        <th>WRITER</th>
                        <th>REG_DATE</th>
                      </tr>
                    </thead>
                    <tbody>
                      <!-- 링크 주소에 jsp에서 프로그램 처리 -->
                      <tr style="cursor:pointer" onclick="location.replace('board_view.html?bno=183')">
                        <td>183</td>
                        <td>NOTICE</td>
                        <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                        <td><span class="tag tag-success">John Doe</span></td>
                        <td>11-7-2014</td>
                      </tr>
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
                <a href="board_write.html" class="btn btn-primary">글쓰기</a>
              </div>
              
              <div class="dataTables_paginate paging_simple_numbers" id="example2_paginate">
                <ul class="pagination justify-content-center">
                  <li class="paginate_button page-item previous disabled" id="example2_previous">
                    <a href="#" aria-controls="example2" data-dt-idx="0" tabindex="0"
                      class="page-link">Previous</a>
                  </li>
                  <li class="paginate_button page-item active">
                    <a href="#" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">1</a>
                  </li>
                  <li class="paginate_button page-item "><a href="#" aria-controls="example2" data-dt-idx="2"
                      tabindex="0" class="page-link">2</a></li>
                  <li class="paginate_button page-item "><a href="#" aria-controls="example2" data-dt-idx="3"
                      tabindex="0" class="page-link">3</a></li>
                  <li class="paginate_button page-item "><a href="#" aria-controls="example2" data-dt-idx="4"
                      tabindex="0" class="page-link">4</a></li>
                  <li class="paginate_button page-item "><a href="#" aria-controls="example2" data-dt-idx="5"
                      tabindex="0" class="page-link">5</a></li>
                  <li class="paginate_button page-item "><a href="#" aria-controls="example2" data-dt-idx="6"
                      tabindex="0" class="page-link">6</a></li>
                  <li class="paginate_button page-item next" id="example2_next"><a href="#"
                      aria-controls="example2" data-dt-idx="7" tabindex="0" class="page-link">Next</a></li>
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