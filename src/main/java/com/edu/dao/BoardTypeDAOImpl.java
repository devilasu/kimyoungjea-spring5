package com.edu.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.edu.vo.BoardTypeVO;

@Repository
public class BoardTypeDAOImpl implements IF_BoardTypeDAO {
	//sqlSession템플릿(틀) 의존성을 주입
	@Inject //자바8부터 신규로 나온 애노테이션 입니다.
	private SqlSession sqlSession;
	
	@Override
	public Integer deleteBoardType(String board_type) throws Exception {
		// TODO sqlSession템플릿(틀)을 이용해서 매퍼쿼를 실행
		return sqlSession.delete("boardTypeMapper.deleteBoardType", board_type);
		// 서식 sqlSession.~템플릿메서드("SQL쿼리위치", 테이터객체변수);
	}

	@Override
	public Integer updateBoardType(BoardTypeVO boardTypeVO) throws Exception {
		// TODO 아래 주석 동일
		return sqlSession.update("boardTypeMapper.updateBoardType", boardTypeVO);
	}

	@Override
	public BoardTypeVO readBoardType(String board_type) throws Exception {
		// TODO 아래 주석 동일
		return sqlSession.selectOne("boardTypeMapper.readBoardType", board_type);
	}

	@Override
	public Integer insertBoardType(BoardTypeVO boardTypeVO) throws Exception {
		// TODO 아래 주석 동일
		return sqlSession.insert("boardTypeMapper.insertBoardType", boardTypeVO);
	}

	@Override
	public List<BoardTypeVO> selectBoardType() throws Exception {
		// TODO 매퍼쿼리를 실행 sqlSession템플릿(틀)을 이용해서
		return sqlSession.selectList("boardTypeMapper.selectBoardType");
	}

}
