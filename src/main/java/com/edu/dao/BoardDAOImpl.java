package com.edu.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
public class BoardDAOImpl implements IF_BoardDAO {
	private Logger logger = LoggerFactory.getLogger(BoardDAOImpl.class);
	@Inject
	private SqlSession sqlSession;//sql세션템플릿(틀)에는 insert,update()...
	
	@Override
	public Integer deleteAttachAll(Integer bno) throws Exception {
		// TODO sql세션템플릿을 상용한 매퍼쿼리 호출(아래)
		return sqlSession.delete("boardMapper.deleteAttachAll", bno);
	}

	@Override
	public Integer deleteAttach(String save_file_name) throws Exception {
		// TODO 위 주석과 동일
		return sqlSession.delete("boardMapper.deleteAttach", save_file_name);
	}

	@Override
	public Integer updateAttach(AttachVO attachVO) throws Exception {
		// TODO 아래 주석 동일-첨부파일 주, 메서드명은 update지만, 쿼리는 insert
		return sqlSession.insert("boardMapper.updateAttach", attachVO);
	}

	@Override
	public Integer insertAttach(AttachVO attachVO) throws Exception {
		// TODO 아래 주석 동일-첨부파일
		return sqlSession.insert("boardMapper.insertAttach", attachVO);
	}

	@Override
	public List<AttachVO> readAttach(Integer bno) throws Exception {
		// TODO 아래 주석 동일-첨부파일
		return sqlSession.selectList("boardMapper.readAttach", bno);
	}

	@Override
	public Integer updateViewCount(Integer bno) throws Exception {
		// TODO 아래 주석 동일
		return sqlSession.update("boardMapper.updateViewCount", bno);
	}

	@Override
	public int countBoard(PageVO pageVO) throws Exception {
		// TODO 아래 주석 동일
		return sqlSession.selectOne("boardMapper.countBoard", pageVO);
	}

	@Override
	public Integer deleteBoard(int bno) throws Exception {
		// TODO 아래 주석 동일
		return sqlSession.delete("boardMapper.deleteBoard", bno);
	}

	@Override
	public Integer updateBoard(BoardVO boardVO) throws Exception {
		// TODO 아래 주석 동일
		return sqlSession.update("boardMapper.updateBoard", boardVO);
	}

	@Override
	public BoardVO readBoard(int bno) throws Exception {
		// TODO 아래 주석 동일
		return sqlSession.selectOne("boardMapper.readBoard", bno);
	}

	@Override
	public Integer insertBoard(BoardVO boardVO) throws Exception {
		// TODO 아래 주석 동일+ 게시물 입력 후 반환값으로 bno를 받습니다.
		sqlSession.insert("boardMapper.insertBoard", boardVO);
		return boardVO.getBno();
	}

	@Override
	public List<BoardVO> selectBoard(PageVO pageVO) throws Exception {
		// TODO sqlSession템플릿을 사용해서 매퍼쿼리 실행
		return sqlSession.selectList("boardMapper.selectBoard", pageVO);
	}

}