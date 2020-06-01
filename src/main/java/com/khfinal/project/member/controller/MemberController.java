package com.khfinal.project.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {

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
}
