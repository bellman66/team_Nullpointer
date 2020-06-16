package com.khfinal.project.stream.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.khfinal.project.stream.service.streamService;
import com.khfinal.project.stream.vo.streamVo;

@Controller
@RequestMapping("/streamMapping")
public class streamMappingController {
	
	@Autowired
	streamService streamservice;
	
	@RequestMapping("*")
	public ModelAndView userStream(ModelAndView mav , HttpServletRequest request) {
		
		String[] uripart = request.getRequestURI().split("/");
		String uri = uripart[uripart.length-1];
		// 접속하고자하는 스트리밍 아이디
		String id = uri.substring(0,uri.length()-3);
		
		HttpSession session = request.getSession();
		
//		private String id;								// userid
//		private String userHashCode;					// userHashCode
//		private List<WebSocketSession> sessionList;		// 채팅창 인원
		
		if(streamservice.get(id) != null) {	// stream 방이 열려있는 경우 
			streamVo mappingVo = streamservice.get(id);
			Map<String , Object> logininfo = (Map<String, Object>) request.getSession().getAttribute("loginInfo");
			
			mav.addObject("userHashCode" , mappingVo.getUserHashCode() );
			mav.addObject("id" , mappingVo.getId());
			// mav.addObject("user_name" , logininfo.get("user_name"));
			mav.setViewName("stream/index2");
		}
		else {
			mav.addObject("alertMsg" , "종료된 방송입니다.");
			mav.addObject("url" , request.getContextPath()+"/main/index.do");
			mav.setViewName("common/result");
		}
		return mav;
	}

}
