<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <div class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1 class="m-0">${boardVO.title} 글쓰기</h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item active">{게시판변수명}</li>
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
                  <h3 class="card-title">등록</h3>
                </div>
                <!-- /.card-header -->
                <!-- form start -->
                <!-- <form name="" method="" action="" anctype="" -->
                <form name="form_update" action="/admin/board/board_update" method="post" enctype="multipart/form-data">
                  <div class="card-body">
                    <div class="form-group">
                      <label>게시판타입</label>
                      <select name="board_type" class="form-control">
                      <c:forEach var="boardTypeVO" items="${listBoardTypeVO}"> 
                        <option ${boardVO.board_type==boardTypeVO.board_type?'selected':''} value="${boardTypeVO.board_type}">${boardTypeVO.board_name}</option>
                      </c:forEach>
                      </select>
                    </div>
                    <div class="form-group">
                      <label for="title">글 제목</label>
                      <input name="title" value="${boardVO.title}" type="text" class="form-control" id="title" placeholder="글 제목을 입력해주세요." required>
                    </div>
                    <div class="form-group">
                      <label for="maincont">글 내용</label>
                      <textarea name="content" id="content" class="form-control" placeholder="내용을 입력해주세요.">${boardVO.content}</textarea>
                    </div>
                    <div class="form-group">
                      <label for="writer">작성자</label>
                      <input name="writer" value="${boardVO.writer}" type="text" class="form-control" id="writer" placeholder="작성자를 입력해주세요." required>
                    </div>
                    <div class="form-group">
                      <label">첨부파일</label>
                      <c:forEach var="idx" begin="0" end="1">
                      <!-- div_file_delete 영역이름은 첨부파일을 개별 삭제할 때 필요. -->
                      <div class="input-group div_file_delete">
                        <div class="custom-file" style="width:100%;">
                          <input name="file" type="file" class="custom-file-input" id="file_${idx}">
                          <label class="custom-file-label" for="file_${idx}">파일선택</label>
                        </div>
                      <c:if test="${boardVO.save_file_names[idx] != null}">
                      	<p class="text-muted">
                      		<a href="/download?save_file_name=${boardVO.save_file_names[idx]}&real_file_name=${boardVO.real_file_names[idx]}">첨부파일명
                      		${boardVO.real_file_names[idx]}
                      		</a>
                      		&nbsp;<button class="btn btn-info btn-file-delete">삭제</button>
                      		<input type="hidden" name="save_file_name" value="${boardVO.save_file_names[idx]}">
                      	</p>
                      </c:if>
                      </div>
                      <div class="mb-2"></div>
                      </c:forEach>
                    </div>
                  </div>
                  <!-- /.card-body -->
  
                  <div class="card-footer text-right">
                    <button type="submit" class="btn btn-primary">수정</button>
                    <a href="board_view?bno=${boardVO.bno}&page=${pageVO.page}&search_type=${pageVO.search_type}" class="btn btn-default">뷰화면</a>
                  </div>
	                <input name="page" value="${pageVO.page}" type="hidden">
		            <input name="search_type" value="${pageVO.search_type}" type="hidden">
		            <%-- <input name="search_keyword" value="${pageVO.search_keyword}" type="hidden"> --%>
		            <input name="bno" value="${boardVO.bno}" type="hidden">
                </form>
              </div>
            </div>
          </div><!-- /컨텐츠 내용 -->
        </div><!-- /.container-fluid -->
      </section>
      <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

<%@ include file="../include/footer.jsp" %>

<script src="/resources/admin/plugins/bs-custom-file-input/bs-custom-file-input.min.js" ></script>
 <!-- 섬머노트 -->
  <script>
    $(document).ready(function() {
      // 첨부파일 선택한 내용 출력 실행
	    bsCustomFileInput.init();
      //summernote 실행
      //$("#content_lbl").summernote({}); 기본 실행틀 커스터마이징 가능
      $("#content").summernote({
        height: 150,
        lang: "ko_KR",
        placeholder: "글 내용을 입력해 주세요.",
        fontNames: ["Arial","Arial Black","맑은 고딕", "궁서", "굴림", ],
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
        ]
      });
    });
    
    ${"form[name='form_update']"}.on('submit',function(e){
    	if($("#content").summernote('isEmpty')){
    		console.log("contentes is empty");
    		e.preventDefault();
    	}else{
    		submit();
    	}
    });
  </script>