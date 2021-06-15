package com.edu.utill;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edu.service.IF_MemberService;
import com.edu.vo.MemberVO;

/**
 * 이 클래스는 공통으로 사용하는 Utill기능을 모아놓은 클래스입니다.
 * @author 김영제
 * 컨트롤러 기능 @Controller
 * 컴포넌트 기능은 MVC가 아닌 기능들을 모아놓을 때, @Component
 */

@Controller
@RequestMapping("/utill")
public class CommonUtill {
	//RestAPI서버 맛보기 ID중복체크 @RestController
	@Inject
	private IF_MemberService memberService;
	
	@ResponseBody //반환받은 값의 헤더(네트워크),푸터(네트워크) 값을 제외하고, body(내용)만 반환 하겠다.
	@GetMapping(value="/id_check")
	public String idCheck(@RequestParam("user_id")String user_id) throws Exception {
		
		String memberCnt="1"; //중복ID가 있을때, 기본값1
		
		if(!user_id.isEmpty()) { //user_id가 공백이 아니라면
			MemberVO memberVO = memberService.readMember(user_id);
			if(memberVO == null) {//중복아이디가 존재하지 않는다면
				memberCnt = "0";
			}
		}
		return memberCnt; //0.jsp로 작동하지 않습니다. 이유는 @ResponseBody때문임
	}
	
}
