package com.edu.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.edu.vo.PageVO;
import com.edu.vo.ReplyVO;

@Repository
public class ReplyDAOImpl implements IF_ReplyDAO{

	@Inject
	SqlSession sqlSession;
	
	@Override
	public void deleteReplyAll(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("replyMapper.deleteReplyAll",bno);
	}

	@Override
	public void deleteReply(Integer rno) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("replyMapper.deleteReply",rno);
	}

	@Override
	public void updateReply(ReplyVO replyVO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("replyMapper.updateReply", replyVO);
	}

	@Override
	public void replyCountUpdate(Integer bno) throws Exception {
		// TODO 매개변수가 2개 있을때,
		//Map<String,Object> paramMap=new HashMap<String,Object>();
		//paramMap.put()로 넣어준 뒤 paramMap를 인자로 보낸다.
		sqlSession.update("replyMapper.replyCountUpdate",bno);
	}

	@Override
	public int countReply(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("replyMapper.countReply",bno);
	}

	@Override
	public void insertReply(ReplyVO replyVO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("replyMapper.insertReply",replyVO);
	}

	@Override
	public List<ReplyVO> selectReply(Integer bno, PageVO pageVO) throws Exception {
		// TODO Auto-generated method stub
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("bno", bno);
		paramMap.put("pageVO", pageVO);
		return sqlSession.selectList("replyMapper.selectReply",paramMap);
	}

}
