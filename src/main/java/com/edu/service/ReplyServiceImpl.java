package com.edu.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.transaction.annotation.Transactional;

import com.edu.dao.IF_ReplyDAO;
import com.edu.vo.PageVO;
import com.edu.vo.ReplyVO;

public class ReplyServiceImpl implements IF_ReplyService{

	@Inject
	private IF_ReplyDAO replyDAO;
	
	@Transactional
	@Override
	public void deleteReply(ReplyVO replyVO) throws Exception {
		// TODO Auto-generated method stub
		replyDAO.deleteReply(replyVO.getRno());
		replyDAO.replyCountUpdate(replyVO.getBno());
	}

	@Override
	public void updateReply(ReplyVO replyVO) throws Exception {
		// TODO Auto-generated method stub
		replyDAO.updateReply(replyVO);
	}
	
	@Transactional
	@Override
	public void insertReply(ReplyVO replyVO) throws Exception {
		// TODO DAO 2개 실행
		replyDAO.insertReply(replyVO);
		replyDAO.replyCountUpdate(replyVO.getBno());
	}

	@Override
	public int countReply(Integer bno) throws Exception {
		// TODO 해당 게시물 댓글의 수
		return replyDAO.countReply(bno);
	}

	@Override
	public List<ReplyVO> selectReply(PageVO pageVO) throws Exception {
		// TODO Auto-generated method stub
		return replyDAO.selectReply(pageVO);
	}

}
