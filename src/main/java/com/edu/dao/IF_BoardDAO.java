package com.edu.dao;

import java.util.List;

import com.edu.vo.BoardVO;
import com.edu.vo.PageVO;

/**
 * boardMapper.xml 접근
 * @author 김영제
 *
 */

public interface IF_BoardDAO {
	//페이징 없는 게시물 개수
	public int countBoard(PageVO pageVO) throws Exception;
	//게시판 CRUD
	public void deleteBoard(BoardVO boardVO) throws Exception;
	public void updateBoard(BoardVO boardVO) throws Exception;
	public BoardVO readBoard(int bno) throws Exception;
	public void insertBoard(BoardVO boardVO) throws Exception;
	public List<BoardVO> selectBoard(PageVO pageVO) throws Exception;
	
}
