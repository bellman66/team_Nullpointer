package com.khfinal.project.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.khfinal.project.member.model.service.MemberService;
import com.khfinal.project.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	MemberService ms;
	
	@RequestMapping("/member/join.do")
	public ModelAndView join() {
		ModelAndView mav = new ModelAndView();

		return mav;
	}
	
	@RequestMapping("/member/joinImple.do")
	public ModelAndView joinImple() {
		ModelAndView mav = new ModelAndView();

		return mav;
	}

	@RequestMapping("/member/login.do")
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView();

		return mav;
	}
	
	@RequestMapping("/member/loginImple.do")
	public ModelAndView loginImple() {
		ModelAndView mav = new ModelAndView();

		return mav;
	}
	
	// ### ### test loging ### ###
	@RequestMapping("/member/loginConfirm.do")
	public ModelAndView loginConfirm(ModelAndView mav , HttpServletRequest request) {
		
		Map<String , Object> commandMap = new HashMap<String, Object>();

		commandMap.put("userID", (String) request.getParameter("userID"));
		commandMap.put("userPWD", (String) request.getParameter("userPWD"));
		
		Member member = ms.loginConfirm(commandMap);
		
		// 반환되는 로그인값x
		if(member == null) {
			mav.addObject("alertMsg" , "로그인에 실패하셨습니다.");
			mav.addObject("url" , request.getContextPath()+"/member/login.do");
			mav.setViewName("common/result");
		}
		else {
			HttpSession session = request.getSession();
			
			Map<String , Object> map = new HashMap<String, Object>();
			map.put("user_name", member.getM_id());
			session.setAttribute("loginInfo", map);
			
			mav.setViewName("main/index");
		}
		
		return mav;
	}
}
