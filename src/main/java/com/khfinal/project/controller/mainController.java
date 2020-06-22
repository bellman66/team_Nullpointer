package com.khfinal.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.khfinal.project.artist.model.service.ArtistService;
import com.khfinal.project.stream.service.streamService;

@Controller
public class mainController {
	
	@Autowired
	ArtistService as;
	@Autowired
	streamService streamservice;

	@RequestMapping("/main/index.do")
	public ModelAndView index () {
		ModelAndView mav = new ModelAndView();
		
		// 메인 화면에 진입할 때마다, 랜덤 영상(Today Video)이 담겨 전달
		// 수정 : 박혜연
	    mav.addObject("todayList", as.todayList());
		
		// 메인 화면에 진입할 때, best content 노출
		// 수정 : 박혜연
		mav.addObject("bestContent", as.bestContent());
		
		// 메인 탑 Stream 정보
		mav.addObject("topStream" , streamservice.getTopStream());
		mav.setViewName("main/index");
		return mav;
	}

}
