package com.khfinal.project.stream.vo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.annotation.Primary;
import org.springframework.web.socket.WebSocketSession;

public class streamVo {
	
	private String id;								// userid
	private String title;
	private String userHashCode;					// userHashCode
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

	public List<WebSocketSession> getSessionList() {
		return sessionList;
	}

	public void setSessionList(List<WebSocketSession> sessionList) {
		this.sessionList = sessionList;
	}
	
	
}
