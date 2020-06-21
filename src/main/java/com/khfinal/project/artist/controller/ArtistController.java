package com.khfinal.project.artist.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.khfinal.project.artist.model.service.ArtistService;
import com.khfinal.project.artist.model.vo.Artist;
import com.khfinal.project.artist.model.vo.ArtistPlus;
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
	@ResponseBody
	public boolean selectArtist() {
		ModelAndView mav = new ModelAndView();
		// artist페이지가 열릴때 보여지는 페이지는 artistTab부분이어야함!
		//boolean이라 true라고 뜬다 왜지?ㅜㅜㅜ
		System.out.println("오자ㅜㅜ");
		// 아티스트
		if(true) {
			List<Member> music = as.selectArtist();
			mav.addObject("music", music);
			// 타투이스트

			List<Member> tattoo = as.selectTattooist();
			mav.addObject("tattoo", tattoo);
			mav.setViewName("tabmenu/artmenu");
		}
		
		return true;
	}
	
	@RequestMapping("/artist/loadartpage.do")
	public ModelAndView loadartpage() {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("artist/artistPage_Art");

		return mav;
	}

	/**
	 * @method : moreContent
	 * @date : 2020. 6. 21.
	 * @buildBy : hajin
	 * @comment : 내용을 쓰세요.
	 *//*
		 * @RequestMapping("/artist/getmore.do") public ModelAndView
		 * moreContent(HttpServletRequest request) { ModelAndView mav = new
		 * ModelAndView(); //페이징처리에 사용되는 int를 불러 더보기로 쓰자 //더보기를 한번 onclick 할 때마다 아티스트의
		 * 수가 다 불러올 때 까지 추가된다. //현재 페이지 int currentPage = 1; //페이지당 추가되는 아티스트 카데고리 수 int
		 * cntPerPage = 8;
		 * 
		 * if(request.getParameter("cPage") != null) { currentPage =
		 * Integer.parseInt(request.getParameter("cPage")); }
		 * if(request.getParameter("cntPerPage") != null) { currentPage =
		 * Integer.parseInt(request.getParameter("cntPerPage")); } List<Member>music =
		 * as.moreContentArt(currentPage, cntPerPage);
		 * 
		 * return mav; }
		 */

	/**
	 * @method : artistpage
	 * @date : 2020. 6. 17.
	 * @buildBy : hajin
	 * @comment : artist main페이지에서 선택한 아티스트의 개인 페이지로 넘어야합니다.
	 */
	@RequestMapping("/artist/artistpage.do")
	public ModelAndView artpageList(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		// 작성자 : 이하진
		// 탭메뉴페이지에서 닉네임값을 받아옵니다.
		String m_nickname = request.getParameter("artist_nick");

		List<Artist> artlist = as.selectArtPage();
		mav.addObject("artlist", artlist);

		List<ArtistPlus> aplist = as.selectAll();
		mav.addObject("aplist", aplist);

		List<Member> mlist = as.selectProfile();
		mav.addObject("mlist", mlist);

		// 작성자 : 김경호
		// 메인 화면에 행사 일정을 을 뿌려주는 코드
		List<Artist> aslist = as.schedule();

		if (aslist.size() < 5) {
			mav.addObject("aslist", aslist);
		} else {
			List<Artist> aslist_more = new ArrayList<Artist>();
			for (int i = 0; i < 5; i++) {
				aslist_more.add(i, aslist.get(i));
				mav.addObject("aslist", aslist);
			}
		}
		System.out.println("컨트롤러 " + aslist);

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

	/**
	 * @method : artistschedule
	 * @date : 2020. 6. 20.
	 * @buildBy : 김경호
	 * @comment : 아티스트 스케줄 캘린더에 뿌려주는 메소드
	 */
	@RequestMapping("/artist/artistschedule.do")
	public ModelAndView artistschedule() {
		ModelAndView mav = new ModelAndView();
		List<Artist> res = as.schedule();

		mav.addObject("artScList", res);
		/* mav.setViewName("artist/artSchedule"); */
		mav.setViewName("artist/artSchedule");
		return mav;
	}

	/**
	 * @method : artistscheduleAddShow
	 * @date : 2020. 6. 20.
	 * @buildBy : 김경호
	 * @comment : // 아트스트 스케줄 추가 버튼을 눌렀을때 스케줄 추가 창으로 이동
	 */
	@RequestMapping("/artist/artistscheduleaddshow.do")
	public ModelAndView artistscheduleAddShow() {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("artist/artSchedule_add");
		return mav;
	}

	/**
	 * @method : artistscheduleadd
	 * @date : 2020. 6. 20.
	 * @buildBy : 김경호
	 * @comment : // 아티스트 스케줄을 추가했을때 데이터값을 가져와서 디비에 추가해주는 메서드
	 */
	@RequestMapping("/artist/artistscheduleadd.do")
	public ModelAndView artistscheduleadd(String artstartYear, String artstartMonth, String artstartDay,
			String artstartHour, String artstartMinute, String artendYear, String artendMonth, String artendDay,
			String artendHour, String artendMinute, String atr_as_content, Artist artist) {
		ModelAndView mav = new ModelAndView();

		String start = artstartYear + artstartMonth + artstartDay + artstartHour + artstartMinute;
		String end = artendYear + artendMonth + artendDay + artendHour + artendMinute;

		artist.setAts_start_date(start);
		artist.setAts_end_date(end);
		artist.setAts_content(atr_as_content);

		int res = as.scheduleadd(artist);

		mav.addObject("url", "/springmvc/artist/artistschedule.do");
		mav.setViewName("common/result");

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

	/**
	 * @method : artWrite
	 * @date : 2020. 6. 20.
	 * @buildBy : hajin
	 * @comment : 아티스트 페이지에 사용되는 모든 글쓰기를 공통으로 사용합니다.
	 */
	@RequestMapping("/artist/artwrite.do")
	public ModelAndView artWrite() {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("artist/artWrite");
		return mav;
	}

}
