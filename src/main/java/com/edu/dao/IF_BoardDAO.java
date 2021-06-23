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
	//첨부파일 CRUD 아래
	public Integer deleteAttachAll(Integer bno) throws Exception;
	public Integer deleteAttach(String save_file_name) throws Exception;
	public Integer updateAttach(AttachVO attachVO) throws Exception;
	public Integer insertAttach(AttachVO attachVO) throws Exception;
	public List<AttachVO> readAttach(Integer bno) throws Exception;
	//게시물 상세보기시 조회수 올리는 메서드(아래)
	public Integer updateViewCount(Integer bno) throws Exception;
	//페이징 없는 검색된(board_type포함된) 게시물 개수
	public int countBoard(PageVO pageVO) throws Exception;
	//기본 CRUD 아래
	public Integer deleteBoard(int bno) throws Exception;
	public Integer updateBoard(BoardVO boardVO) throws Exception;
	public BoardVO readBoard(int bno) throws Exception;
	public Integer insertBoard(BoardVO boardVO) throws Exception;
	public List<BoardVO> selectBoard(PageVO pageVO) throws Exception;
}
