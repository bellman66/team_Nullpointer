package com.khfinal.project.artist.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.khfinal.project.artist.model.service.ArtistService;

@Controller
public class ArtistController {
	
	@Autowired
	ArtistService as;
	
	@RequestMapping("/artist/artist.do")
	public ModelAndView artist() {
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	
}
