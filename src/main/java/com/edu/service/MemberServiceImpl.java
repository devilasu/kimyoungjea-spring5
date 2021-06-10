package com.edu.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.edu.dao.IF_MemberDAO;
import com.edu.vo.MemberVO;
import com.edu.vo.PageVO;

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
	public List<MemberVO> selectMember(PageVO pageVO) throws Exception {
		// pageVO를 받아서 select동작
		return memberDAO.selectMember(pageVO);
	}
	
	
	@Override
	public int countMember(PageVO pageVO) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.countMember(pageVO);
	}


	@Override
	public void insertMember(MemberVO memberVO) throws Exception {
		// TODO Auto-generated method stub
		memberDAO.insertMember(memberVO);
	}


	@Override
	public void deleteMember(String member_id) throws Exception {
		// TODO Auto-generated method stub
		memberDAO.deleteMember(member_id);
	}


	@Override
	public MemberVO readMember(String member_id) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.readMember(member_id);
	}


	@Override
	public void updateMember(MemberVO memberVO) throws Exception {
		// TODO Auto-generated method stub
		memberDAO.updateMember(memberVO);
	}
}
