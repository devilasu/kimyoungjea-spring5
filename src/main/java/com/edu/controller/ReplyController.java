package com.edu.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.edu.service.IF_ReplyService;
import com.edu.vo.PageVO;
import com.edu.vo.ReplyVO;

/**
 * 이 클래스는 RestFull 서비스의 Endpoint를 만드는 클래스
 * 
 * @author 김영제
 *
 */

@RestController//결과를 view로 응답하는 것이 아닌 json형태로 반환
public class ReplyController {
	@Inject
	private IF_ReplyService replyService;
	
	//댓글은 Read가 필요없음. Ajax로 처리하기 때문에.
	@RequestMapping(value = "reply/reply_update",method = RequestMethod.PATCH)
	public ResponseEntity<String> reply_update(@RequestBody ReplyVO replyVO ){
		ResponseEntity<String> result = null;
		try {
			replyService.updateReply(replyVO);
			result = new ResponseEntity<String>("success",HttpStatus.OK);
		}catch(Exception e) {
			result = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	//댓글 등록
	@RequestMapping(value="/reply/reply_insert", method = RequestMethod.POST)
	public ResponseEntity<String> reply_insert(@RequestBody ReplyVO replyVO){
		ResponseEntity<String> result = null;
		//try~catch로 직접처리 하는 목적 Rest 상태값을 보내주기 위해서
	
		try {

		replyService.insertReply(replyVO);
		result = new ResponseEntity<String>("success",HttpStatus.OK);
		}catch(Exception e){
			result = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value="/reply/reply_list/{bno}/{page}", method = RequestMethod.POST)//현재 도메인에서만 사용가능하도록 하기위해서.
	public ResponseEntity<Map<String,Object>> reply_list(@PathVariable("bno")Integer bno, @PathVariable("page")Integer page) {
		//URL주소가 아니고, Json데이터형으로 자료를 반환.[{key:value,key:value},{key:value,key:value}]
		//Map가 한개의 레코드
		PageVO pageVO = new PageVO();
		Map<String,Object> resultMap = new HashMap<String,Object>();
		ResponseEntity<Map<String,Object>> result = null;
/*		Map<String,Object> dummyMap1 = new HashMap<String,Object>();
		Map<String,Object> dummyMap2 = new HashMap<String,Object>();
		Map<String,Object> dummyMap3 = new HashMap<String,Object>();
		Map<String,Object> dummyMap = new HashMap<String,Object>();
		List<Object> dumyList = new ArrayList<Object>();
		
		dumyList.clear();
		dummyMap1.put("rno", 1);
		dummyMap1.put("reply_text", "댓글테스트1");
		dummyMap1.put("replyer", "admin");
		dummyMap1.put("bno", bno);
		dumyList.add(dummyMap1);
		dummyMap2.put("rno", 2);
		dummyMap2.put("reply_text", "댓글테스트2");
		dummyMap2.put("replyer", "admin");
		dummyMap2.put("bno", bno);
		dumyList.add(dummyMap2);
		dummyMap3.put("rno", 3);
		dummyMap3.put("reply_text", "댓글테스트3");
		dummyMap3.put("replyer", "admin");
		dummyMap3.put("bno", bno);
		dumyList.add(dummyMap3);
		
		dummyMap.put("replyList", dumyList);
	*/
		try {
			pageVO.setPage(page);
			pageVO.setPerPageNum(5);
			pageVO.setQueryPerPageNum(5);
			pageVO.setTotalCount(replyService.countReply(bno));
			
			//아래의 Json데이터형태는 일반컨트롤러에서 사용했던 model사용해서 ("변수명",객체내용) 전송한 방식과 동일
			if(pageVO.getTotalCount() > 0) {
				//아래 resultMap을 만든 목적은: 위 List객체를 ResponseEntity객체의 매개변수로 사용.
				
				resultMap.put("replyList", replyService.selectReply(bno,pageVO));
				resultMap.put("pageVO", pageVO);
				//객체를 2개 이상 보내게 되는 상황일때, Json데이터형태(key:value)로 만들어서 보냅니다. 
				//--------------------------------------------------------
				//result객체를 만든목적:RestApi클라이언트(jsp쪽)으로 resultMap객체를 보낼때 상태값을 위해서
				result = new ResponseEntity<Map<String,Object>>(resultMap,HttpStatus.OK);
			} else {
				result = new ResponseEntity<Map<String,Object>>(HttpStatus.NO_CONTENT);
			}
			//======================================================
			} catch(Exception e) {
				result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
			return result;
	}

}
