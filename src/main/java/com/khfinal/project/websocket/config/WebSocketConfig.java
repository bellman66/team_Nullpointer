package com.khfinal.project.websocket.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean; 
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketTransportRegistration;

import com.khfinal.project.websocket.handler.chatHandler;

//@Configuration
//@EnableWebSocket
//@EnableWebMvc
//public class WebSocketConfig extends WebMvcConfigurerAdapter implements WebSocketConfigurer{

	//@Autowired
	//private chatHandler chathandler;
	
	//@Override
	//public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		//registry.addHandler(chathandler, "/chatHandler.do").setAllowedOrigins("*");
	//}

//}
