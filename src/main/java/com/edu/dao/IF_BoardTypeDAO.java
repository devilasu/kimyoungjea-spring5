package com.edu.dao;

import java.util.List;

import com.edu.vo.BoardTypeVO;

public interface IF_BoardTypeDAO {
	// CRUD 메서드 명세만 생성(아래5개)
	public Integer deleteBoardType(String board_type) throws Exception;
	public Integer updateBoardType(BoardTypeVO boardTypeVO) throws Exception;
	public BoardTypeVO readBoardType(String board_type) throws Exception;
	public Integer insertBoardType(BoardTypeVO boardTypeVO) throws Exception;
	//BoardTypeVO 1개의 레코드를 저장한 클래스를 다중레코드 List<제네릭타입>로 묶어서 받습니다.
	public List<BoardTypeVO> selectBoardType() throws Exception;
}