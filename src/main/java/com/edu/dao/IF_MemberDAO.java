 package com.edu.dao;

import java.util.List;

import com.edu.vo.MemberVO;
import com.edu.vo.PageVO;

/**
 * 이 인터페이스는 회원관리에 관련된 CRUD 메서드 명세가 포함되는 파일.
 * 이 인터페이스는 메서드명만 있고, {구현내용} 이 없는 목록 파일
 * @author 김영제
 *
 */
public interface IF_MemberDAO {
	//List<제네릭타입>: 다수의 레코드를 저장할 수 있도록 해주는 형태
	public List<MemberVO> selectMember(PageVO pageVO) throws Exception;
	//회원의 전체명수를 구한다.
	public int countMember(PageVO pageVO) throws Exception;
	public void insertMember(MemberVO memberVO) throws Exception;
	public void deleteMember(String member_id) throws Exception;
	public MemberVO readMember(String member_id) throws Exception;
	public void updateMember(MemberVO memberVO) throws Exception;
}
