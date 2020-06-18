package com.khfinal.project.websocket.handler;

import java.security.URIParameter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.khfinal.project.stream.service.streamService;
import com.khfinal.project.stream.vo.streamVo;

@Component
public class chatHandler extends TextWebSocketHandler {
	
	@Autowired
	private streamService streamservice;
	
    // private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	private Logger log = LoggerFactory.getLogger(chatHandler.class);
	
	public chatHandler() {
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void handleBinaryMessage(WebSocketSession session, BinaryMessage message) {
		// TODO Auto-generated method stub
		super.handleBinaryMessage(session, message);
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// 1. 접속이 완료된 이후 작동되는 메서드 		
		// sessionList.add(session);
		
		Map<String , Object> attr = session.getAttributes();
		String id = (String) attr.get("id");

		if(streamservice.get(id) != null) {
			streamVo sv = streamservice.get(id);

			List<WebSocketSession> sessionlist = sv.getSessionList();
			sessionlist.add(session);
		}
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		Map<String , Object> attr = session.getAttributes();
		String id = (String) attr.get("id");
		String user_name = (String) attr.get("user_name");
		
		if(streamservice.get(id) != null) {
			List<WebSocketSession> sessionlist = streamservice.get(id).getSessionList();
			for (WebSocketSession webSocketSession : sessionlist) {
				webSocketSession.sendMessage(new TextMessage(user_name + " : " + message.getPayload()));
			}
		}
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		// TODO Auto-generated method stub
		super.handleTransportError(session, exception);
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		String[] originuri = session.getUri().getQuery().split("&");
		
		String[] splitvalue = originuri[0].split("=");
		String id = splitvalue[1];

		if(streamservice.get(id) != null) {
			List<WebSocketSession> sessionlist = streamservice.get(id).getSessionList();
			sessionlist.remove(session); 
			log.info("연결 끊김");
		}
	}
}
