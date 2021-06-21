package com.edu.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	@Transactional
	@Override
	public void deleteBoard(int bno) throws Exception {
		// TODO 게시물 삭제할 때, 자식들도 삭제. 3개의 메서드 실행(댓글+첨부파일 삭제)
		//트랜잭션이 필요한 순간, 1. 첨부파일 삭제, 2. 삭시물 삭제, 에러
		//위와 같은 상황을 방지하는 목적으로 @Transan
		//댓글 삭제도 나중에 추가.
		boardDAO.deleteAttachAll(bno);
		boardDAO.deleteBoard(bno);
	}

	@Transactional
	@Override
	public void updateBoard(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		boardDAO.updateBoard(boardVO);
		//첨부파일 DB처리
		int bno = boardVO.getBno();
		List<AttachVO> attachVOs = boardVO.getAttachVO();
		if(attachVOs == null) {return;}
		for(AttachVO attachVO:attachVOs) {
			attachVO.setTbl_board_bno(bno);
			boardDAO.updateAttach(attachVO);
		}
		
		boardDAO.updateAttach(null);
		
	}

	@Override
	public BoardVO readBoard(int bno) throws Exception {
		// TODO readBoard+updateViewCount
		boardDAO.updateViewCount(bno);
		return boardDAO.readBoard(bno);
	}

	@Transactional
	@Override
	public void insertBoard(BoardVO boardVO) throws Exception {
		// TODO 첨부파일 있으면 첨부파일 insertAttach
		//게시물 등록
		int boardIndex = boardDAO.insertBoard(boardVO);
		//첨부파일 등록
		if(boardVO.getAttachVO()==null) {return;}
		for(AttachVO attachVO:boardVO.getAttachVO()) {//첨부파일 개수만큼 반복진행
			if(attachVO !=null) {
				attachVO.setTbl_board_bno(boardIndex);
				boardDAO.insertAttach(attachVO);
			}
		}
	}

	@Override
	public List<BoardVO> selectBoard(PageVO pageVO) throws Exception {
		// TODO Auto-generated method stub
		if(pageVO.getPage() == null) {
			pageVO.setPage(1);
		}
		if(pageVO.getPerPageNum() == 0) {
			pageVO.setPerPageNum(5);
		}
		if(pageVO.getQueryPerPageNum() == 0) {
		pageVO.setQueryPerPageNum(5);
		}
		pageVO.setTotalCount(boardDAO.countBoard(pageVO));
		return boardDAO.selectBoard(pageVO);
	}

}