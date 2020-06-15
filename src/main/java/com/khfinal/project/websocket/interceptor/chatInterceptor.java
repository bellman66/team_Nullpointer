package com.khfinal.project.websocket.interceptor;

import java.util.Map;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

public class chatInterceptor extends HttpSessionHandshakeInterceptor{

	
	@Override
	public void setCreateSession(boolean createSession) {
		// TODO Auto-generated method stub
		super.setCreateSession(createSession);
	}

	
	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Map<String, Object> attributes) throws Exception {
		
		String[] originuri = request.getURI().getQuery().split("&");
		String[] splitvalue = originuri[0].split("=");
		String id = splitvalue[1];
		
		splitvalue = originuri[1].split("=");
		String user_name;
		if(splitvalue.length < 2) {
			user_name = "user";
		}
		else user_name = splitvalue[1];
		
		attributes.put("id", id);
		attributes.put("user_name", user_name);
		
		return super.beforeHandshake(request, response, wsHandler, attributes);
	}
	
	
	
}
