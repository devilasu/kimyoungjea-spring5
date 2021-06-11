package com.edu.service;

import java.util.List;

import com.edu.vo.MemberVO;
import com.edu.vo.PageVO;

/**
 * 이 인터페이스는 회원관리에 관련된 Service의 명세를 모아놓은 파일.
 * @author 김영제
 *
 */
public interface IF_MemberService {
	public List<MemberVO> searchMember(PageVO pageVO) throws Exception;
	public int countMember(PageVO pageVO) throws Exception;
	public void insertMember(MemberVO memberVO) throws Exception;
	public void deleteMember(String member_id) throws Exception;
	public MemberVO readMember(String member_id) throws Exception;
	public void updateMember(MemberVO memberVO) throws Exception;
}
