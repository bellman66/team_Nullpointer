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

	//아티스트 메인 페이지
	@RequestMapping("/artist/artist.do")
	public ModelAndView artist() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("artist/artist");
		return mav;
	}

	// artist main페이지에서 선택한 아티스트의 개인 페이지로 넘어야합니다.
	@RequestMapping("/artist/artistpage.do")
	public ModelAndView artistpage() {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("artist/artistPage_Art");
		return mav;
	}
	
	// artist main페이지에서 선택한 타투이스트의 개인 페이지로 넘어야합니다.
	@RequestMapping("/artist/tattopage.do")
	public ModelAndView tattopage() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("artist/artistPage_Ta");
		return mav;
	}

	// 아티스트 영상
	@RequestMapping("/artist/artistvideo.do")
	public ModelAndView artistvideo() {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("artist/artMove");
		return mav;
	}

	// 아티스트 사진
	@RequestMapping("/artist/artistphoto.do")
	public ModelAndView artistphoto() {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("artist/artPhoto");
		return mav;
	}

	// 아티스트 스케줄
	@RequestMapping("/artist/artistschedule.do")
	public ModelAndView artistschedule() {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("artist/artSchedule");
		return mav;
	}

	// 아티스트 게시판
	@RequestMapping("/artist/artistboard.do")
	public ModelAndView artistboard() {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("artist/artBoard");
		return mav;
	}
}
