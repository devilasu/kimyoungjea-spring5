package com.edu.service;

import java.util.List;
import com.edu.vo.BoardTypeVO;
/**
 * 이 인터페이스는 boardType에 대한 인터페이스를 모아놓은 것.
 * @author 김영제
 *
 */

public interface IF_BoardTypeService {
	public boolean deleteBoardType(String board_type) throws Exception;
	public boolean updateBoardType(BoardTypeVO boardTypeVO) throws Exception;
	public BoardTypeVO readBoardType(String board_type) throws Exception;
	public boolean insertBoardType(BoardTypeVO boardTypeVO) throws Exception;
	public List<BoardTypeVO> selectBoardType() throws Exception;
}
