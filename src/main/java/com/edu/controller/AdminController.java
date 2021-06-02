package com.edu.controller;
/**
 * 이 클래스는 Admin관리자단 접근하는 클래스입니다.
 * 변수 Object를 만들어서 jsp로 전송 + jsp 값을 받아서 Object로 처리
 * @author 김영제
 */

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {
//	URL요청 경로는 @RequestMapping 절대경로로 표시
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin(Model model) throws Exception{ //예외 발생시 정보를 담은 Exception 객체가 throw된다.
//		Views가 서블렛에 root폴더로 지정되어 있다.
		return "admin/home";//확장자 .jsp가 생략.
	}
}
