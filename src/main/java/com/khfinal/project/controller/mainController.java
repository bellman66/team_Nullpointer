package com.khfinal.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/main")
public class mainController {

	@RequestMapping("index.do")
	public ModelAndView index (ModelAndView mav) {
		mav.setViewName("main/index");
		return mav;
	}
	
}
