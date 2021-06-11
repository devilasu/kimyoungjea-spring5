package com.edu.controller;



//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 * 이 클래스는 MVC웹프로젝트를 최초로 생성하면 자동 생성.
 * 웹브라우저의 요청사항을 view단(jsp)에 연결시켜준다.
 * beans그래프로 프로젝트의 규모를 확인 가능하다.
 * 스프링이 관리하는 클래스는 파일아이콘에 S가 붙는다.
 * Handles requests for the application home page.
 */

@Controller
public class HomeController {
//	스프링에서는 logger로 출력한다.
//	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * return값으로 view를 선택하여 작업한 결과를 변수로 담아서  화면에 결과를 표시.
	 * 폼 전송시 post(자료 숨김), get(자료노출-URL쿼리스트링:자료전송)
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {//콜백메서드, 자동실행됨
//		String jspVar = "@Service(DB)에서 처리한 결과";
//		model객체에 Attribute를 추가하면 스프링이 전송하는 결과.
//		model.addAttribute("jspObject", jspVar );
		return "home/index";//확장자 .jsp가 생략.
	}
	
}
