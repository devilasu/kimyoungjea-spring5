package com.edu.controller;
/**
 * 이 클래스는 Admin관리자단 접근하는 클래스입니다.
 * 변수 Object를 만들어서 jsp로 전송 + jsp 값을 받아서 Object로 처리
 * @author 김영제
 */




import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.edu.service.IF_MemberService;
import com.edu.vo.MemberVO;
import com.edu.vo.PageVO;

@Controller
public class AdminController {
	//디버그용 로그객체 생성
	private Logger logger = LoggerFactory.getLogger(AdminController.class);
	@Inject
	private IF_MemberService memberService;
	@RequestMapping(value = "/admin/member/member_list", method = RequestMethod.GET)
	public String selectMember(PageVO pageVO, Model model) throws Exception{
		//이 매서드는 회원목록을 출력하는 jsp와 매칭합니다.
		//model.addAttribute("",)를 통해 jsp로 전송
		if(pageVO.getPage() == null) {
			pageVO.setPage(6);
		}
		//pageVO의 calcPage 메서드 실행을 위해서는 필수 변수값이 필요.
		pageVO.setQueryPerPageNum(10);
		pageVO.setPerPageNum(5);
		pageVO.setTotalCount(memberService.countMember(pageVO));
		List<MemberVO> listMember = memberService.selectMember(pageVO);
		
		
		logger.info("디버그: "+pageVO.toString());
		return "admin/member/member_list";
	}
//	URL요청 경로는 @RequestMapping 절대경로로 표시
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin(Model model) throws Exception{ //예외 발생시 정보를 담은 Exception 객체가 throw된다.
//		Views가 서블렛에 root폴더로 지정되어 있다.
		return "admin/home";//확장자 .jsp가 생략.
	}
}
