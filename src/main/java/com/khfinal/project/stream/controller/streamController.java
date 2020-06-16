package com.khfinal.project.stream.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.core.HashCodeCustomizer;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.socket.WebSocketSession;

import com.khfinal.project.member.model.vo.Member;
import com.khfinal.project.stream.service.streamService;
import com.khfinal.project.stream.vo.streamVo;

@Controller
@RequestMapping("/stream")
public class streamController {
	
	@Autowired
	streamService streamservice;
	
	@RequestMapping("index")
	public ModelAndView index(ModelAndView mav) {
		
		mav.setViewName("stream/index2");
		return mav;
	}
	
	@RequestMapping("allstream")
	public ModelAndView allstream(ModelAndView mav) {
		
		mav.addObject("streamObj" , streamservice.getIdlist());
		mav.setViewName("stream/allstream");
		return mav;
	}
	
	@RequestMapping("usersetting")
	public ModelAndView userstream(ModelAndView mav , HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		// loginInfo.member.m_id
		Map<String,Object> logininfo = (Map<String, Object>) session.getAttribute("loginInfo");
		if(logininfo != null) {
			Member member = (Member) logininfo.get("member");
			String userHashCode = (String) member.getM_id() + (String) member.getM_pass();
			mav.addObject("userHashCode" , userHashCode.hashCode());
			mav.addObject("userid" , member.getM_id());
			
			mav.setViewName("stream/usersetting");
		}
		else {
			mav.addObject("alertMsg" , "로그인 후 이용가능합니다.");
			mav.addObject("url" , request.getContextPath()+"/stream/allstream.do");
			
			mav.setViewName("common/result");
		}
		
		return mav;
	}
	
	@RequestMapping("liveon")
	@ResponseBody
	public int liveon(ModelAndView mav,
					  @RequestParam String userHashCode ,
					  @RequestParam String id ,
					  @RequestParam String streamTitle) {
		int result = 0;
		
		// 현재 Obj에 있는지 확인
		// HashCode값을 이용해서 열렸는지 확인.
		
		// 1. 방이 존재하지않는 겨우 새롭게 생성
		if(streamservice.get(id) == null) {
			streamVo obj = new streamVo();
			obj.setId(id);
			obj.setUserHashCode(userHashCode);
			obj.setTitle(streamTitle);
			obj.setSessionList(new ArrayList<WebSocketSession>());

			// key : id
			streamservice.put(id , obj);
			result = 1;	// 방송 시작.
		}
		else { 
			streamVo obj = streamservice.get(id);
			obj.setId(id);
			obj.setUserHashCode(userHashCode);
			obj.setTitle(streamTitle);
			result = 2;	// 방송 변경
		}
		
		return result;
	}
	
	@RequestMapping("liveoff")
	@ResponseBody
	public int liveoff(ModelAndView mav,
					  @RequestParam String userHashCode ,
					  @RequestParam String id ,
					  @RequestParam String streamTitle) {
		int result = 0;

		streamservice.delete(id);
		result = 1;	// 방송 종료
		
		return result;
	}
	
	@RequestMapping("settingPopup")
	public ModelAndView settingPopup(ModelAndView mav) {

		mav.setViewName("stream/settingPopup");
		return mav;
	}

}
