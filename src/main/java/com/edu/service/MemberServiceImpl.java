package com.edu.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.edu.dao.IF_MemberDAO;
import com.edu.vo.MemberVO;

/**
 * 이 클래스는 회원관리 서비스 인터페이스를 구현하는 클래스입니다.
 * 상속은 extends, 구현 implements
 * 스프링 빈으로 등록하려면 @Service 필요.
 * @author 김영제
 *
 */
@Service
public class MemberServiceImpl implements IF_MemberService{
	@Inject//IF_MemberDAO를 주입해서 사용
	private IF_MemberDAO memberDAO; 
	@Override
	public List<MemberVO> selectMember() throws Exception {
		// 인터페이스에서 상속받은 메서드를 구현.
		return memberDAO.selectMember();
	}
	
}
