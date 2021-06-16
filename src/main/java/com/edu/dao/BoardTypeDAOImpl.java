package com.edu.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.edu.vo.BoardTypeVO;

public class BoardTypeDAOImpl implements IF_BoardTypeDAO {
	//sqlSession템플릿(틀) 의존성을 주입
		@Inject //자바8부터 신규로 나온 애노테이션 입니다.
		private SqlSession sqlSession;
		
		@Override
		public void deleteBoardType(String board_type) throws Exception {
			// TODO sqlSession템플릿(틀)을 이용해서 매퍼쿼리를 실행
			sqlSession.delete("boardTypeMapper.deleteBoardType", board_type);
			// 서식 sqlSession.~템플릿메서드("SQL쿼리위치", 테이터객체변수);
		}

		@Override
		public void updateBoardType(BoardTypeVO boardTypeVO) throws Exception {
			// TODO 아래 주석 동일
			sqlSession.update("boardTypeMapper.updateBoardType", boardTypeVO);
		}

		@Override
		public BoardTypeVO readBoardType(String board_type) throws Exception {
			// TODO 아래 주석 동일
			return sqlSession.selectOne("boardTypeMapper.readBoardType", board_type);
		}

		@Override
		public void insertBoardType(BoardTypeVO boardTypeVO) throws Exception {
			// TODO 아래 주석 동일
			sqlSession.insert("boardTypeMapper.insertBoardType", boardTypeVO);
		}

		@Override
		public List<BoardTypeVO> selectBoardType() throws Exception {
			// TODO 아래주석 동일
			return sqlSession.selectList("boardTypeMapper.selectBoardType");
		}

}
