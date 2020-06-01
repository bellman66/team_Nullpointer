package com.khfinal.project.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class boardController {

	@RequestMapping("/board/board.do")
	public ModelAndView noticeList() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/board");
		return mav;
	}
}
