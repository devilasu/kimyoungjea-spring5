package com.edu.dao;

import java.util.List;

import com.edu.vo.PageVO;
import com.edu.vo.ReplyVO;

public interface IF_ReplyDAO {
	public void deleteReplyAll(Integer bno)  throws Exception;
	public void deleteReply(Integer rno) throws Exception;
	public void updateReply(ReplyVO replyVO) throws Exception;
	public void replyCountUpdate(Integer bno) throws Exception;
	public int countReply(Integer bno) throws Exception;
	public void insertReply(ReplyVO replyVO) throws Exception;
	public List<ReplyVO> selectReply(PageVO pageVO) throws Exception;
}
