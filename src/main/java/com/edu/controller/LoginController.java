package com.edu.controller;

import java.util.Collection;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
/**
 * 스프링시큐리티의 /login처리한 결과를 받아서 /login_success로 처리
 * @author 김영제
 *
 */
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.edu.service.IF_MemberService;
import com.edu.vo.MemberVO;
@Controller
public class LoginController {
	@Inject
	IF_MemberService memberService;
	@RequestMapping(value = "/login_success",method = RequestMethod.POST)
	public String login_success(HttpServletRequest request, RedirectAttributes rdat) throws Exception{
		//request: 세션객체를 만들기 위해서
		//rdat: model객체로 값을 전달 할 수 없을때.
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String userid = "";
		String levels = "";		//권한
		boolean enabled = false;//로그인체크
		Object principal = authentication.getPrincipal();
		if(principal instanceof UserDetails) {
			enabled = ((UserDetails)principal).isEnabled();
		}
		
		if(enabled) {
			HttpSession session = request.getSession();
			//자바8이상 지원 람다식
			Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
			//authenticaties에는회원의 등록된 값 {"ROLE_ANONYMOUS",...}자동으로 들어간 것들이 있다.
			//한 아이디에 여러 권한을 주는 경우도 있다. 그럴 경우에는 [id:{role,role,role}]의 형태가 된다.
			if(authorities.stream().filter(o->o.getAuthority().equals("ROLE_ANONYMOUS")).findAny().isPresent()){
				levels = "ROLE_ANONYMOUS";
			}
			if(authorities.stream().filter(o->o.getAuthority().equals("ROLE_USER")).findAny().isPresent()){
				levels = "ROLE_USER";
			}
			if(authorities.stream().filter(o->o.getAuthority().equals("ROLE_ADMIN")).findAny().isPresent()){
				levels="ROLE_ADMIN";
			}
			userid = ((UserDetails) principal).getUsername();
			
			session.setAttribute("session_enabled", enabled);
			session.setAttribute("session_levels",levels);
			session.setAttribute("session_userid",userid);
			MemberVO memberVO = memberService.readMember(userid);
			session.setAttribute("session_username",memberVO.getUser_name());
		}
		rdat.addFlashAttribute("mag","로그인");
		return "redirect:";
	}
	
	//사용자단 로그인 URL 폼호출 GET, 로그인POST처리는 스프링시큐리티에서.
	@RequestMapping(value = "/login_form", method = RequestMethod.GET)
	public String login_form(Model model) throws Exception{
		
		return "home/login";
	}
	
}
