package com.edu.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.edu.dao.IF_BoardDAO;
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
	@Inject
	private IF_BoardDAO boardDAO;
	
	@Override
	public List<AttachVO> readAttach(String save_file_name) throws Exception {
		// TODO 첨부파일 List형으로 조회 DAO호출
		return boardDAO.readAttach(save_file_name);
	}

	@Override
	public int countBoard(PageVO pageVO) throws Exception {
		// TODO 페이징 처리시 totalCount변수에 사용될 값을 리턴값으로 받음
		return boardDAO.countBoard(pageVO);
	}

	@Override
	public void deleteBoard(int bno) throws Exception {
		// TODO 게시물 삭제할 때, 자식들도 삭제. 3개의 메서드 실행(댓글+첨부파일 삭제)
		//트랜잭션이 필요한 순간, 1. 첨부파일 삭제, 2. 삭시물 삭제, 에러
		//위와 같은 상황을 방지하는 목적으로 @Transan
		//댓글 삭제도 나중에 추가.
		boardDAO.deleteAttachAll(bno);
		boardDAO.deleteBoard(bno);
	}

	@Override
	public void updateBoard(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		boardDAO.updateAttach(null);
		boardDAO.updateBoard(boardVO);
	}

	@Override
	public BoardVO readBoard(int bno) throws Exception {
		// TODO readBoard+updateViewCount
		BoardVO boardVO= boardDAO.readBoard(bno);
		boardDAO.updateViewCount(bno);
		return boardVO;
	}

	@Override
	public void insertBoard(BoardVO boardVO) throws Exception {
		// TODO 첨부파일 있으면 첨부파일 insertAttach
		//게시물 등록
		boardDAO.insertBoard(boardVO);
		//첨부파일 등록
		String[] save_file_names = null;
		String[] real_file_names = null;
		int index=0;
		String real_file_name="";
		if(save_file_names==null) {return;}
		for(String save_file_name:save_file_names) {//첨부파일 개수만큼 반복진행
			if(save_file_name !=null) {
				real_file_name=real_file_name;
				boardDAO.insertAttach(save_file_name);
			}
		}
		boardDAO.insertAttach(null);
	}

	@Override
	public List<BoardVO> selectBoard(PageVO pageVO) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.selectBoard(pageVO);
	}

}
