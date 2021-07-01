<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!-- footer부분 -->
  <footer class="main-footer">
    <strong>Copyright &copy; 2014-2021 <a href="https://adminlte.io">AdminLTE.io</a>.</strong>
    All rights reserved.
    <div class="float-right d-none d-sm-inline-block">
      <b>Version</b> 3.1.0
    </div>
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
    <div class="text-center">
        <h5>로그아웃</h5><hr class="mb-2"/>
        <button class="btn btn-primary" id="btn_logout">로그아웃</button>
    </div>
  </aside>
  <!-- /.control-sidebar -->
  <!-- footer끝 부분 -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="/resources/admin/plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="/resources/admin/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="/resources/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Summernote -->
<script src="/resources/admin/plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script src="/resources/admin/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="/resources/admin/dist/js/adminlte.js"></script>
<!-- AdminLTE for demo purposes -->
<!-- <script src="/resources/admin/dist/js/demo.js"></script> -->
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<!-- <script src="/resources/admin/dist/js/pages/dashboard.js"></script> -->
</body>
</html>
<script>
//왼쪽메뉴 선택시 active 부트스트랩 클래스를 동적 추가.
$(document).ready(function(){
	//현재 선택한 url값을 기준으로 지정
	var current = location.pathname;//현재  url경로 추출
	var current2 = current.split("/")[2];
	$(".nav-treeview li a").each(function(){
		if($(this).attr("href").indexOf(current2) != -1){
			if(current2 != "board")
				$(this).addClass("active");
		}else{
			$(this).removeClass("active");
		}
	});
});
</script>
<script>
//로그아웃 버튼 처리
$("#btn_logout").click(function(){
	location.replace('/logout');//security-context의 /logout호출
});
</script>

<style>
.sidebar-dark-primary .nav-sidebar>.nav-item>.nav-link.active, .sidebar-light-primary .nav-sidebar>.nav-item>.nav-link.active{
	background-color:#fff;
	color:#000;
}
</style>