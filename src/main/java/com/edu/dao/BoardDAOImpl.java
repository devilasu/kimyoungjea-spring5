package com.edu.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.edu.vo.AttachVO;
import com.edu.vo.BoardVO;
import com.edu.vo.PageVO;

/**
 * 게시물 CRUD처리
 * @author 김영제
 *
 */
@Repository
public class BoardDAOImpl implements IF_BoardDAO{
	@Inject
	private SqlSession sqlSession;
	@Override
	public void deleteAttachAll(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("boardMapper.deleteAttachAll",bno);
	}

	@Override
	public void deleteAttach(String save_file_name) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("boardMapper.deleteAttach",save_file_name);
	}

	@Override
	public void updateAttach(AttachVO attachVO) throws Exception {
		// TODO 메서드명은 update지만 쿼리는 insert
		sqlSession.insert("boardMapper.updateAttach",attachVO);
	}

	@Override
	public void insertAttach(AttachVO attachVO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("boardMapper.insertAttach",attachVO);
	}

	@Override
	public List<AttachVO> readAttach(int bno) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("boardMapper.readAttach",bno);
	}

	@Override
	public void updateViewCount(int bno) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("boardMapper.updateViewCount",bno);
	}

	@Override
	public int countBoard(PageVO pageVO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.countBoard",pageVO);
	}

	@Override
	public void deleteBoard(int bno) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("boardMapper.deleteBoard",bno);
	}

	@Override
	public void updateBoard(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("boardMapper.updateBoard",boardVO);
	}

	@Override
	public BoardVO readBoard(int bno) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.readBoard",bno);
	}

	@Override
	public int insertBoard(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("boardMapper.insertBoard",boardVO);
		return boardVO.getBno();
	}

	@Override
	public List<BoardVO> selectBoard(PageVO pageVO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("boardMapper.selectBoard",pageVO);
	}
}
