package com.khfinal.project.artist.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.khfinal.project.artist.model.service.ArtistService;
import com.khfinal.project.artist.model.vo.Artist;
import com.khfinal.project.member.model.vo.Member;

@Controller
public class ArtistController {

	@Autowired
	ArtistService as;

	/**
	 * @method : selectArtist
	 * @date : 2020. 6. 16.
	 * @buildBy : hajin
	 * @comment : 아티스트 tab 메인페이지 -> 뮤지션만 받아주는 tab이 제일 먼저 보여진다.
	 */
	@RequestMapping("/artist/artist.do")
	public ModelAndView selectArtist() {
		ModelAndView mav = new ModelAndView();
		// artist페이지가 열릴때 보여지는 페이지는 artistTab부분이어야함!
		List<Member> alist = as.selectArtist();
		System.out.println("오자ㅜㅜ");
		mav.addObject("alist", alist);
		mav.setViewName("tabmenu/artmenu");
		return mav;
	}

	/**
	 * @method : selecttaTab
	 * @date : 2020. 6. 19.
	 * @buildBy : hajin
	 * @comment : 타투이스트만 받아주는 tab
	 */
	@RequestMapping("/artist/tattooist.do")
	public ModelAndView selectTattooist() {
		ModelAndView mav = new ModelAndView();
		// artist페이지가 열릴때 보여지는 페이지는 tattooTab부분이어야함!
		List<Member> alist = as.selectTattooist();
		mav.addObject("alist", alist);
		mav.setViewName("tabmenu/artmenu");
		return mav;
	}

	/**
	 * @method : artistpage
	 * @date : 2020. 6. 17.
	 * @buildBy : hajin
	 * @comment : artist main페이지에서 선택한 아티스트의 개인 페이지로 넘어야합니다.
	 */
	@RequestMapping("/artist/artistpage.do")
	public ModelAndView artpageList() {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("artist/artistPage_Art");
		return mav;
	}

	/**
	 * @method : tattopage
	 * @date : 2020. 6. 17.
	 * @buildBy : hajin
	 * @comment : artist main페이지에서 선택한 타투이스트의 개인 페이지로 넘어야합니다.
	 */
	@RequestMapping("/artist/tattoopage.do")
	public ModelAndView tattpageList() {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("artist/artistPage_Ta");
		return mav;
	}

	/**
	 * @method : artistvideo
	 * @date : 2020. 6. 17.
	 * @buildBy : hajin
	 * @comment : 아티스트 영상 목록을 받아!!
	 */
	@RequestMapping("/artist/artistvideo.do")
	public ModelAndView artistvideo() {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("artist/artMovieList");
		return mav;
	}

	//
	/**
	 * @method : artistphoto
	 * @date : 2020. 6. 17.
	 * @buildBy : hajin
	 * @comment : 아티스트 사진목록을 받아!!
	 */
	@RequestMapping("/artist/artistphoto.do")
	public ModelAndView artistphoto() {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("artist/artPhotoList");
		return mav;
	}

	// 아티스트 스케줄
	@RequestMapping("/artist/artistschedule.do")
	public ModelAndView artistschedule() {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("artist/artSchedule");
		return mav;
	}

	/**
	 * @method : aboardList
	 * @date : 2020. 6. 17.
	 * @buildBy : hajin
	 * @comment : 아티스트 게시판목록을 받아!!
	 */
	@RequestMapping("/artist/artboardlist.do")
	public ModelAndView aboardList() {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("artist/artboardList");
		return mav;
	}
}
