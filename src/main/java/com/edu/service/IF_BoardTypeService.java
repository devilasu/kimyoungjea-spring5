package com.edu.service;

import java.util.List;
import com.edu.vo.BoardTypeVO;
/**
 * 이 인터페이스는 boardType에 대한 인터페이스를 모아놓은 것.
 * @author 김영제
 *
 */

public interface IF_BoardTypeService {
	void deleteBoardType(String board_type) throws Exception;
	void updateBoardType(BoardTypeVO boardTypeVO) throws Exception;
	BoardTypeVO readBoardType(String board_type) throws Exception;
	void insertBoardType(BoardTypeVO boardTypeVO) throws Exception;
	List<BoardTypeVO> selectBoardType() throws Exception;
}
