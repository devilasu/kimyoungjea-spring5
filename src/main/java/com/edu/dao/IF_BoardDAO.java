package com.edu.dao;

import java.util.List;

import com.edu.vo.AttachVO;
import com.edu.vo.BoardVO;
import com.edu.vo.PageVO;

/**
 * boardMapper.xml 접근
 * @author 김영제
 *
 */

public interface IF_BoardDAO {
	//첨부파일 CRUD
	public void deleteAttachAll(Integer bno) throws Exception;
	public void deleteAttach(String save_file_name) throws Exception;
	public void updateAttach(AttachVO attachVO) throws Exception;
	public void insertAttach(AttachVO attachVO) throws Exception;
	public List<AttachVO> readAttach(String save_file_name) throws Exception;
	//상세보기시 조회수 올리는 메서드
	public void updateViewCount(int bno) throws Exception;
	//페이징 없는 게시물 개수
	public int countBoard(PageVO pageVO) throws Exception;
	//게시판 CRUD
	public void deleteBoard(int bno) throws Exception;
	public void updateBoard(BoardVO boardVO) throws Exception;
	public BoardVO readBoard(int bno) throws Exception;
	public void insertBoard(BoardVO boardVO) throws Exception;
	public List<BoardVO> selectBoard(PageVO pageVO) throws Exception;
	
}
