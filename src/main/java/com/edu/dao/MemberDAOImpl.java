package com.edu.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.edu.vo.MemberVO;
import com.edu.vo.PageVO;

/**
 * 이 클래스는 IF_memberDAO 인터페이스를 구현하는 클래스
 * implements 키워드로 상속을 받습니다.
 * 단, DAO기능의 구현클래스는 스프링빈으로 등록이 필요. 그래서, @Repository
 * @author 김영제
 *
 */
@Repository
public class MemberDAOImpl implements IF_MemberDAO{
	@Inject//과거에는 객체를 생성하여 사용했지만, 현재는 Inject를 통해 사용.
	private SqlSession sqlSession;
	
	@Override
	public List<MemberVO> selectMember(PageVO pageVO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("memberMapper.selectMember",pageVO);
	}
	
	@Override
	public int countMember() throws Exception {
		// sqlSession빈의 메서드를 이용해서 매퍼쿼리를 실행
		return sqlSession.selectOne("memberMapper.countMember");
	}

	@Override
	public void insertMember(MemberVO memberVO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("memberMapper.insertMember",memberVO);
	}

	@Override
	public void deleteMember(String member_id) throws Exception {
		// TODO Auto-generated method stub
		MemberVO memberVO = new MemberVO();
		memberVO.setUser_id(member_id);
		sqlSession.delete("memberMapper.deleteMember",memberVO);
		
	}

}
