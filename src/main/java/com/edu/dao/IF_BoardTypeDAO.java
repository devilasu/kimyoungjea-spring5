package com.edu.dao;

import java.util.List;

import com.edu.vo.BoardTypeVO;

public interface IF_BoardTypeDAO {
	public void deleteBoardType(String board_type) throws Exception;
	public void updateBoardType(BoardTypeVO boardTypeVO) throws Exception;
	public BoardTypeVO readBoardType(String board_type) throws Exception;
	public void insertBoardType(BoardTypeVO boardTypeVO) throws Exception;
	public List<BoardTypeVO> selectBoardType() throws Exception;
}
