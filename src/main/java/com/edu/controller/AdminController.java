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
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.edu.service.IF_BoardTypeService;
import com.edu.service.IF_MemberService;
import com.edu.vo.BoardTypeVO;
import com.edu.vo.MemberVO;
import com.edu.vo.PageVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	//디버그용 로그객체 생성
	private Logger logger = LoggerFactory.getLogger(AdminController.class);
	@Inject
	private IF_MemberService memberService;
	@Inject
	private IF_BoardTypeService boardTypeService;
	
	//jsp에서 게시판생성관리에 Get/Post 접근할때 URL을 bbs_type로 지정합니다.
	//왜 board_type하지않고, bbs_type하는 이유는 왼쪽메뉴 고정시키는 로직에서 경로 board와 겹치지 않도록
	@GetMapping("/bbs_type/bbs_type_list")
	public String selectBoardTypeList(Model model) throws Exception {//목록폼1
		model.addAttribute("listBoardTypeVO", boardTypeService.selectBoardType());
		return "admin/bbs_type/bbs_type_list";//상대경로일때는 views폴더가 root(최상위)
	}
	//bbs_type_list.jsp에서 게시판생성 버튼을 클릭했을때 이동하는 폼 경로 
	@GetMapping("/bbs_type/bbs_type_insert")
	public String insertBoardTypeForm() throws Exception {//입력폼1
		return "admin/bbs_type/bbs_type_insert";//.jsp생략
	}
	//bbs_type_insert.jsp의 입력폼에서 전송된 값을 boardTypeVO 자동담겨서 {구현} 단, 자동으로 값이 바인딩되려면, 폼name과, VO 멤버변수명 동일해야함. 
	@PostMapping("/bbs_type/bbs_type_insert")
	public String insertBoardType(BoardTypeVO boardTypeVO) throws Exception {//입력처리1
		boardTypeService.insertBoardType(boardTypeVO);
		return "redirect:/admin/bbs_type/bbs_type_list";
		//리다이렉트(뒤로가기 데이터사라짐)는 절대경로, forward:이동이 가능(뒤로가기 데이터가 살아있음)
		//쇼핑몰에서 결제화면을 처리 후 뒤로가기를 누르면, 리다이렉트는 데이터가 사라지기때문에 재결제 불가
		//forward로 결제화면을 처리 후 뒤로가기를 누르면, 재결제가 발생됩니다. 이러면 않되기때문에 사용안함. 
	}
	//게시판 생성관리는 이 기능은 사용자단에서 UI를 사용할 일이 없기때문에, Read, Update를 1개로 사용.
	@GetMapping("/bbs_type/bbs_type_update")
	public String updateBoardTypeForm(@RequestParam("board_type")String board_type, Model model) throws Exception {//수정폼1
		model.addAttribute("boardTypeVO", boardTypeService.readBoardType(board_type));
		//서식model.add~("jsp변수로담아서 view화면으로 보냄","서비스에서 쿼리실행한 데이터객체");
		return "admin/bbs_type/bbs_type_update";//.jsp생략
	}
	@PostMapping("/bbs_type/bbs_type_update")
	public String updateBoardType(BoardTypeVO boardTypeVO) throws Exception {//수정처리1
		boardTypeService.updateBoardType(boardTypeVO);
		return "redirect:/admin/bbs_type/bbs_type_update?board_type="+boardTypeVO.getBoard_type();//수정한 이후 수정폼을 GET방식으로 이동
	}
	@PostMapping("/bbs_type/bbs_type_delete")
	public String deleteBoardType(@RequestParam("board_type")String board_type) throws Exception {//삭제처리1
		boardTypeService.deleteBoardType(board_type);//삭제서비스 호출(실행) 끝
		return "redirect:/admin/bbs_type/bbs_type_list";//.jsp생략
	}
	@GetMapping("/member/member_insert_form")
	public String insertMemberForm() throws Exception{
		return "admin/member/member_insert";
	}
	
	@PostMapping("/member/member_insert")
	public String insertMember(MemberVO memberVO, @ModelAttribute("PageVO")PageVO pageVO) throws Exception{
		String rawPassword = memberVO.getUser_pw();
		if(!rawPassword.isEmpty()) {//수정폼에서 암호 입력값이 비어있지 않을때만 아래로직실행.
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			String encPassword = passwordEncoder.encode(rawPassword);
			memberVO.setUser_pw(encPassword);
		}
		System.out.println("컨트롤러의 insert 출력");
		memberService.insertMember(memberVO);
		return "redirect:/admin/member/member_list";
	}
	
	
	//수정처리를 호출=DB 변경처리함.
	@PostMapping("/member/member_update")
	public String updateMember(MemberVO memberVO, PageVO pageVO) throws Exception{
		//update 서비스만 처리하면 끝
		//업데이트 쿼리서비스 호출하기 전 스프링시큐리티 암호화 적용합니다.
		String rawPassword = memberVO.getUser_pw();
		if(!rawPassword.isEmpty()) {//수정폼에서 암호 입력값이 비어있지 않을때만 아래로직실행.
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			String encPassword = passwordEncoder.encode(rawPassword);
			memberVO.setUser_pw(encPassword);
		}
		memberService.updateMember(memberVO);//반환값이 없습니다.
		//redirect로 페이지를 이동하면, model로 담아서 보낼수 없습니다. 쿼리스트링(URL?)으로 보냅니다.
		String queryString = "user_id="+memberVO.getUser_id()+"&page="+pageVO.getPage()+"&search_type="+pageVO.getSearch_type()+"&search_keyword="+pageVO.getSearch_keyword();
		return "redirect:/admin/member/member_update_form?"+queryString;
	}
	//아래 경로는 수정폼을 호출=화면에 출력만=렌더링만
	@GetMapping("/member/member_update_form")
	public String updateMemberForm(MemberVO memberVO, Model model,@ModelAttribute("pageVO")PageVO pageVO) throws Exception{
		//이 메서드는 수정폼에 pageVO, memberVO 2개의 데이터객체를 jsp로 보냅니다.
		//사용자1명의 레코드를 가져오는 멤버서비스(쿼리)를 실행(아래)
		//사용자1명의 레코드를 model에 담아서 + @ModelAttribute에 담아서 jsp로 보냅니다.
		model.addAttribute("memberVO", memberService.readMember(memberVO.getUser_id()));
		return "admin/member/member_update";
	}
	@PostMapping("/member/member_delete")
	public String deleteMember(MemberVO memberVO) throws Exception{
		//이 메서드는 회원상세보기페이지에서 삭제버튼을 클릭시 전송받은 memberVO값을 이용해서 삭제를 구현
		memberService.deleteMember(memberVO.getUser_id());//삭제쿼리가 실행됨
		return "redirect:/admin/member/member_list";//forward방식이면, 새로고침시 무한 실행.
	}
	
	//@RequestMapping(value="/member/member_view", method=RequestMethod.GET)
	@GetMapping("/member/member_view")
	public String viewMemberForm(Model model, @RequestParam("user_id")String user_id, @ModelAttribute("pageVO") PageVO pageVO) throws Exception{
		/**
		 * 이 메서드는 리스트페이지에서 상세보기로 이동할 때 보여주는 1개 레코드 값을 보여주는 구현
		 * JUnit에서 테스트했던 readMember방식 사용
		 * 다른점은 JUnit에서는 식별자 ID를 강제로 지정했지만, 이 메서드에서는 @RequestParam을 이용.
		 */
		logger.info(pageVO.toString());
		MemberVO readMember = memberService.readMember(user_id);
		model.addAttribute("memberVO", readMember);
		return "admin/member/member_view";
	}
	//@RequestMapping(value = "/member/member_list", method = RequestMethod.GET)
	@GetMapping("/member/member_list")
	public String listMember(@ModelAttribute PageVO pageVO, Model model) throws Exception{
		//이 매서드는 회원목록을 출력하는 jsp와 매칭합니다.
		//model.addAttribute("",)를 통해 jsp로 전송
		//memberService.searchMember(pageVO);
		//pageVO.setTotalCount(memberService.countMember(pageVO));
		List<MemberVO> listMember = memberService.searchMember(pageVO);
		
		logger.info("디버그: "+pageVO.toString());
		
		model.addAttribute("listMember", listMember);
		//model.addAttribute("pageVO", pageVO);//매개변수에 @ModelAttribute("pageVO")PageVO pageVO 형식으로 쓸 수 있다. 함수가 끝나고 보낸다.
		return "admin/member/member_list";
	}
//	URL요청 경로는 @RequestMapping 절대경로로 표시
	//@RequestMapping(value = "/", method = RequestMethod.GET)
	@GetMapping("")
	public String admin(Model model) throws Exception{ //예외 발생시 정보를 담은 Exception 객체가 throw된다.
//		Views가 서블렛에 root폴더로 지정되어 있다.
		return "admin/home";//확장자 .jsp가 생략.
	}
}
