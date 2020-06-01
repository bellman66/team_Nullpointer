package com.khfinal.project.websocket.handler;

import java.util.List;

import org.apache.commons.logging.Log;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class chatHandler extends TextWebSocketHandler {
	
	private List<WebSocketSession> sessionList;
	private Logger log = LoggerFactory.getLogger(chatHandler.class);
	
	public chatHandler() {
		// TODO Auto-generated constructor stub
		System.out.println("핸들러 생성");
	}

	@Override
	protected void handleBinaryMessage(WebSocketSession session, BinaryMessage message) {
		// TODO Auto-generated method stub
		super.handleBinaryMessage(session, message);
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// 1. 접속이 완료된 이후 작동되는 메서드 
		if(session.getAttributes().size() == 0) {
			
		}
		sessionList.add(session);
		System.out.println("=== 채팅 접속 ===");
		log.info("=== 채팅 접속 ===");
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		log.info("채팅 입력");
		System.out.println(message.getPayload());
		for (WebSocketSession webSocketSession : sessionList) {
			webSocketSession.sendMessage(new TextMessage(" user : " + message.getPayload()));
		}
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		// TODO Auto-generated method stub
		super.handleTransportError(session, exception);
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session); 
		log.info("연결 끊김");
	}
	
	

	
}
