package com.khfinal.project.artist.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ArtistController {

	
	@RequestMapping("/artist/artist.do")
	public ModelAndView artist() {
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	
}
