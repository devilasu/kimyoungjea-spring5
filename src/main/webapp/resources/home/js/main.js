// 대메뉴 마우스 롤오버 이벤트
	//첫번째 서브메뉴 .gnb_depth2_1 마우스 롤아웃 상태처리

	isOver1 = false;//1차메뉴 숨김처리 플래그
	isOverSub1 = false;//2차메뉴 숨김처리 플래그
	let timerId1;

	function goHide1(){
		if(!isOver1 && !isOverSub1){
			$(".gnb_depth2_1").stop().fadeOut("fast");
		}
	}
	
	isOver2 = false;
	isOverSub2 = false;
	let timerId2;
	
	function goHide2(){
		if(!isOver2 && !isOverSub2){
			$(".gnb_depth2_2").stop().fadeOut("fast");
		}
	}

	$(document).ready(function(){
		//대메뉴1에 마우스 오버일때 gnb2_1 보이는 이벤트
		$(".openAll1").mouseover(function(){
		//pc용에서만 액션이 가능하도록 조건 추가.
			if(parseInt($("header").css("width"))>1049){
				// stop()가 들어가는 것으로 어느정도 원하는데로 구동되는데 어떤 식인지 아직 의문이다. 공부 필요함.
				$(".gnb_depth2_1").queue("fx",[]).stop();
				$(".gnb_depth2_1").fadeIn("fast");
			}
			isOver1 = true;
		});
		//대메뉴1에 마우스 아웃일때 gnb2_1 숨기는 이벤트
		$(".openAll1").mouseout(function(){
			isOver1 = false;
			timerId1 = setTimeout("goHide1()",200);
			// setTimeOut를 사용하는 이유는 대메뉴에서 서브메뉴로 이동할 시간을 벌기 위해서. 마우스를 움직였는데 fadeOut()는 일어나고 있기 때문에 바로 시작되질 않는다.
		});
		//서브메뉴1에 마우스 오버일때
		$(".gnb_depth2_1").mouseover(function(){
			isOverSub1=true;
		});

	//서브메뉴1에 마우스아웃일때
		$(".gnb_depth2_1").mouseout(function(){
			isOverSub1=false;
			timerId2 = setTimeout("goHide1()",200);
		});


	//대메뉴2에 마우스 오버일때 gnb2_2 보이는 이벤트
		$(".openAll2").mouseover(function(){
			if(parseInt($("header").css("width"))>1049){
			$(".gnb_depth2_2").queue("fx",[]).stop();
			$(".gnb_depth2_2").fadeIn("fast");
			}
		});
		//대메뉴2에 마우스 아웃일때 gnb2_2 숨기는 이벤트
		$(".openAll2").mouseout(function(){
			isOver2 = false;
			setTimeout("goHide2()",200)
		});

		//서브메뉴2에 마우스 오버일때
		$(".gnb_depth2_2").mouseover(function(){
			isOverSub2 = true;
		});

		//서브메뉴2에 마우스아웃일때
		$(".gnb_depth2_2").mouseout(function(){
			isOverSub2 = false;
			setTimeout("goHide2()",200)
		});
		});

$(document).ready(function() {
	$(".to_top a").smoothScroll();

	// 모바일용 메뉴 보이기 /숨기기 액션처리
	$(".openMOgnb").click(function(){
		// alert("메뉴보이기 액션 클릭");
		// $(".header_cont").css("display","block");
		$(".header_cont").slideDown("slow");
		$("#header").addClass("on");
	});

	$(".closePop").click(function(){
		// $(".header_cont").css("display","none");
		$(".header_cont").slideUp("fast");
		$("#header").removeClass("on");
	});
	//  //모바일용 메뉴 보이기 /숨기기 액션처리
});