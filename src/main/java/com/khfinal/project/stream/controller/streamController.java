package com.khfinal.project.stream.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/stream")
public class streamController {
	
	@RequestMapping("index")
	public ModelAndView index(ModelAndView mav) {
		
		
		
		mav.setViewName("stream/index");
		return mav;
	}
	

}
