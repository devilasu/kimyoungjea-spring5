package com.edu.aop;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
//import org.aspectj.lang.annotation.Aspect;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.edu.service.IF_BoardTypeService;
import com.edu.vo.BoardTypeVO;
import com.edu.vo.PageVO;

/**
 * 이 클래스는 AOP기능 중 @Aspect와 @ControllerAdvice로 구현됩니다.
 * @author 김영제
 *
 */
@Aspect
@ControllerAdvice
public class AspectAdvice {
	@Inject
	private IF_BoardTypeService boardTypeService;
	
	//나중에 게시물관리 기능 만들때 @Aspect로 AOP기능 추가
	//세션: 서버-클라이언트 구조상에서 클라이언트가 서버에 접속할때 발생되는 정보를 서버에 저장하는 것을 세션이라고 함
	//쿠키: 서버-클라이언트 구조상에서 클라이언트가 서버에 접속할때 발생되는 정보를 클라이언트에 저장하는 것을 쿠키라고 함
	//Aspect로 AOP 구현할때는 포인트컷이 필요. 
	//조인 포인트를 매개변수로 받는다.
	//조인 포인트는 @Around로 실행되는 모든 객체를 나타낸다.
	@Around("execution(* com.edu.controller.*Controller.*(..))")	//@Before, @After
	public Object sessionManager(ProceedingJoinPoint pjp) throws Throwable {
		//board_type변수값을 세션에 저장하려고 함. 클라이언트별 세션이 발생됨.
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		//일반적인 컨트롤러에서는 매개변수 HttpServletRequest를 사용가능함. 위처럼 복잡하게 구하지 않음.
		//컨트롤러 클래스에서 매개변수로 받을값(board_type) < pageVO
		PageVO pageVO = null;
		String board_type = null;//jsp에서 전송되는 값을 임시로 저장,목적은 세션변수 발생조건으로사용
		//조인포인트리스트의 객체의 메서드의 Arguments(매개변수)를 뽑아냄 
		for(Object object:pjp.getArgs()) {
			if(object instanceof PageVO) {
				pageVO = (PageVO) object;
				board_type = pageVO.getBoard_type();
			}
		}
		if(request != null) {//jsp에서 Get,Post 있을때,
			//세션값을 pageVO.board_type 값으로 저장 로직(아래)
			HttpSession session = request.getSession();//PC가 스프링프로젝트 접근시 세션객체
			if(board_type != null) {//최초로 세션변수가 발생
				session.setAttribute("session_board_type", board_type);
			}
			if(session.getAttribute("session_board_type") != null) {
				board_type = (String) session.getAttribute("session_board_type");
				//pageVO.setBoard_type(board_type);//검색목표달성:여기서 항상 값을 가져가도록 구현됩니다.
			}
		}
		return pjp.proceed();
	}
	
	//이 메서드는 컨트롤러의 메서드가 싱행 전에 값을 생성해서 model객체에 값을 담아 jsp로 보냄
	//위 @컨트롤러어드바이스를 이용해서 컨트롤러의 모든 메서드가 실행되기 전에 호출만 되면, 아래 메서드가 자동 실행.
	@ModelAttribute("listBoardTypeVO")
	public List<BoardTypeVO> listBoardTypeVO() throws Exception{
		
		return boardTypeService.selectBoardType();
	}

}
