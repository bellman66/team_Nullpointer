package com.khfinal.project.stream.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.WebSocketSession;

import com.khfinal.project.stream.vo.streamVo;

@Component
public class streamService {
	
//	private String id;								// userid
//	private String userHashCode;					// userHashCode
//	private List<WebSocketSession> sessionList;		// 채팅창 인원
	
	// Stream 객체 
	// id로 구분
	Map<String , streamVo> streamObj = new HashMap<String, streamVo>();

	public streamService() {
		// TODO Auto-generated constructor stub
	}

	public streamService(Map<String, streamVo> streamObj) {
		super();
		this.streamObj = streamObj;
	}
	
	public streamVo get(String id) {
		return streamObj.get(id);
	}

	public void put(String id , streamVo obj) {
		streamObj.put(id, obj);
	}
	
	public void delete(String id) {
		streamObj.remove(id);
	}
	
	public List<streamVo> getAll() {
		List<streamVo> result = new ArrayList<streamVo>();
		for(String key : streamObj.keySet()) {
			result.add(streamObj.get(key));
		}
			
		return result;
	}
	
	public List<streamVo> getIdlist() {
		List<streamVo> result = new ArrayList<streamVo>();
		for(String key : streamObj.keySet()) {
			streamVo vo = streamObj.get(key);
			
			vo.setId(vo.getId());
			vo.setTitle(vo.getTitle());
			vo.setUserHashCode(vo.getUserHashCode());
			vo.setSessionList(vo.getSessionList());
			
			result.add(vo);
		}
			
		return result;
	}


}
