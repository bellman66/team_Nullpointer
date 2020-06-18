package com.khfinal.project.stream.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.context.annotation.Primary;
import org.springframework.web.socket.WebSocketSession;

public class streamVo implements Serializable , Comparable<streamVo>{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 6546071212207918568L;
	private String id;								// userid
	private String title;
	private String userHashCode;					// userHashCode
	private Map<String,Object> people;
	private List<WebSocketSession> sessionList;		// 채팅창 인원
	
	public streamVo() {
		// TODO Auto-generated constructor stub
		this.id="";
		this.title="";
		this.userHashCode="";
		this.sessionList = new ArrayList<WebSocketSession>();
	}
	
	public streamVo(String id, String title) {
		super();
		this.id = id;
		this.title = title;
	}
	
	public streamVo(String id, String title, String userHashCode) {
		super();
		this.id = id;
		this.title = title;
		this.userHashCode = userHashCode;
	}

	public streamVo(String id, String title, String userHashCode, List<WebSocketSession> sessionList) {
		super();
		this.id = id;
		this.title = title;
		this.userHashCode = userHashCode;
		this.sessionList = sessionList;
	}

	public streamVo(String id, String title, String userHashCode, Map<String,Object> people,
			List<WebSocketSession> sessionList) {
		super();
		this.id = id;
		this.title = title;
		this.userHashCode = userHashCode;
		this.people = people;
		this.sessionList = sessionList;
	}

	@Override
	public String toString() {
		return "streamVo [id=" + id + ", title=" + title + ", userHashCode=" + userHashCode + ", people=" + people
				+ ", sessionList=" + sessionList + "]";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUserHashCode() {
		return userHashCode;
	}

	public void setUserHashCode(String userHashCode) {
		this.userHashCode = userHashCode;
	}

	public Map<String, Object> getPeople() {
		return people;
	}

	public void setPeople(Map<String, Object> people) {
		this.people = people;
	}

	public List<WebSocketSession> getSessionList() {
		return sessionList;
	}

	public void setSessionList(List<WebSocketSession> sessionList) {
		this.sessionList = sessionList;
	}

	@Override
	public int compareTo(streamVo o) {
		// TODO Auto-generated method stub
		int pare1 = this.getPeople().size();
		int pare2 = o.getPeople().size();
		
		if(pare1 > pare2) return -1 ;
		else if(pare1 < pare2) return 1;
		return 0;
	}
	
}
