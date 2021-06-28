package com.edu.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.edu.service.IF_ReplyService;

/**
 * 이 클래스는 RestFull 서비스의 Endpoint를 만드는 클래스
 * 
 * @author 김영제
 *
 */

@RestController//결과를 view로 응답하는 것이 아닌 json형태로 반환
public class ReplyController {
//	@Inject
//	private IF_ReplyService replyService;
	
	@RequestMapping(value="/reply/{bno}/{page}",method = RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> reply_list() {
		//URL주소가 아니고, Json데이터형으로 자료를 반환.[{key:value,key:value},{key:value,key:value}]
		//Map가 한개의 레코드
		Map<String,Object> dummyMap = new HashMap<String,Object>();
		List<Object> dumyList = new ArrayList<Object>();
		ResponseEntity<Map<String,Object>> result = null;
		dummyMap.put("rno", 1);
		dummyMap.put("reply_text", "댓글테스트1");
		dummyMap.put("replyer", "admin");
		dummyMap.put("bno", 59);
		dumyList.add(dummyMap);
		dummyMap.clear();
		dummyMap.put("rno", 2);
		dummyMap.put("reply_text", "댓글테스트2");
		dummyMap.put("replyer", "admin");
		dummyMap.put("bno", 59);
		dumyList.add(dummyMap);
		dummyMap.clear();
		dummyMap.put("rno", 3);
		dummyMap.put("reply_text", "댓글테스트3");
		dummyMap.put("replyer", "admin");
		dummyMap.put("bno", 59);
		dumyList.add(dummyMap);
		
		dummyMap.clear();
		dummyMap.put("replyList", dumyList);
		
		
		result= new ResponseEntity<Map<String,Object>>(dummyMap,HttpStatus.OK);
		return result;
	}

}
