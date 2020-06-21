package com.khfinal.project.artist.controller;

import java.util.ArrayList;
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
		System.out.println("오자ㅜㅜ");
		// 아티스트
		List<Member> music = as.selectArtist();
		mav.addObject("music", music);
		// 타투이스트
		List<Member> tattoo = as.selectTattooist();
		mav.addObject("tattoo", tattoo);
		System.out.println(music.size());
		System.out.println(tattoo.size());

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
	public Boolean artpageList() {
		ModelAndView mav = new ModelAndView();

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

		return true;
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
