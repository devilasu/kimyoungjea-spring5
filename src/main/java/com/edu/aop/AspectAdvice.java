package com.edu.aop;

import java.util.List;

import javax.inject.Inject;

//import org.aspectj.lang.annotation.Aspect;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.edu.service.IF_BoardTypeService;
import com.edu.vo.BoardTypeVO;

/**
 * 이 클래스는 AOP기능 중 @Aspect와 @ControllerAdvice로 구현됩니다.
 * @author 김영제
 *
 */
//@Aspect
@ControllerAdvice
public class AspectAdvice {
	@Inject
	private IF_BoardTypeService boardTypeService;
	//이 메서드는 컨트롤러의 메서드가 싱행 전에 값을 생성해서 model객체에 값을 담아 jsp로 보냄
	//위 @컨트롤러어드바이스를 이용해서 컨트롤러의 모든 메서드가 실행되기 전에 호출만 되면, 아래 메서드가 자동 실행.
	@ModelAttribute("listBoardTypeVO")
	public List<BoardTypeVO> listBoardTypeVO() throws Exception{
		
		return boardTypeService.selectBoardType();
	}

}
