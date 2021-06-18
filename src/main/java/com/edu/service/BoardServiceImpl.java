package com.edu.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.edu.vo.AttachVO;
import com.edu.vo.BoardVO;
import com.edu.vo.PageVO;

/**
 * DAO클래스 호출
 * 
 * @author 김영제
 *
 */
@Service
public class BoardServiceImpl implements IF_BoardService {

	@Override
	public List<AttachVO> readAttach(String save_file_name) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int countBoard(PageVO pageVO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void deleteBoard(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateBoard(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public BoardVO readBoard(int bno) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertBoard(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<BoardVO> selectBoard(PageVO pageVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
