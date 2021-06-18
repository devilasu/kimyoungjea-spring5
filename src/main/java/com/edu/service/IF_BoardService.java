package com.edu.service;

import java.util.List;

import com.edu.vo.AttachVO;
import com.edu.vo.BoardVO;
import com.edu.vo.PageVO;

public interface IF_BoardService {
	
	public List<AttachVO> readAttach(String save_file_name) throws Exception;
	//페이징 없는 게시물 개수
	public int countBoard(PageVO pageVO) throws Exception;
	//게시판 CRUD
	public void deleteBoard(int bno) throws Exception;
	public void updateBoard(BoardVO boardVO) throws Exception;
	public BoardVO readBoard(int bno) throws Exception;
	public void insertBoard(BoardVO boardVO) throws Exception;
	public List<BoardVO> selectBoard(PageVO pageVO) throws Exception;
	
}
