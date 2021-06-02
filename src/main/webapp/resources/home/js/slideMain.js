// 슬라이드이미지 처리
var slideNum = 0; //슬라이드 인덱스 초기값
var slideAuto = null; //슬라이드 자동실행 변수
//on | off 역할을 하는 값을 스위치 or 플래그 변수

//자바스크립트 함수 선언
//play_w함수 시작
function play_w(directw){//좌우로 슬라이드되는 함수선언
	if(directw == "right"){
		slideNum++;
		if(slideNum>2){slideNum=0;}
	}else if(directw == "left"){
		slidenum--;
		if(slideNum < 0){slideNum = 2;}//순서대로 무한반복을 의미
	}else{
		slideNum = directw;	//슬라이드 버튼에서 그림이 바뀌는 부분을 처리하기 위한 부분.
	}

	//함수 | 변수 사용
	//rollingBtn클래스 영역 안쪽으 li태그에서 클래스 seq인 것 3개를 each함수로 반복(3번 반복)
	$(".rollingBtn").find("li.seq a").each(function(){
		$(".rollingBtn li.seq a img").attr("src",$(".rollingBtn li.seq a img").attr("src").replace("_on.png","_off.png"));
	});
	$(".rollingBtn li.butt"+slideNum+" a img").attr("src",$(".rollingBtn li.butt"+slideNum+" a img").attr("src").replace("_off.png","_on.png"));
	//slideNum조건 실행
	if(slideNum == 0){
		// 슬라이드인덱스가 0번일때 li태그를 1초간 서서히 사라지게 한다.
		$(".viewImgList li.imgList0").animate({"opacity":1},1000);
		$(".viewImgList li.imgList1").animate({"opacity":0},1000);
		$(".viewImgList li.imgList2").animate({"opacity":0},1000);		
	}else if(slideNum == 1){
		$(".viewImgList li.imgList0").animate({"opacity":0},1000);
		$(".viewImgList li.imgList1").animate({"opacity":1},1000);
		$(".viewImgList li.imgList2").animate({"opacity":0},1000);	
	}else if(slideNum == 2){
		$(".viewImgList li.imgList0").animate({"opacity":0},1000);
		$(".viewImgList li.imgList1").animate({"opacity":0},1000);
		$(".viewImgList li.imgList2").animate({"opacity":1},1000);	
	}
	//자동슬라이드(true), 슬라이드멈춤(false)
	if(slideAuto){
		clearTimeout(slideAuto);//play_w함수 실행중지함.
	}
	
	slideAuto = setTimeout("play_w('right')",3000); //3초마다 슬라이드 이미지 액션 발생
}//play_w함수 끝

	