package com.khfinal.project.artist.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.khfinal.project.artist.model.service.ArtistService;
import com.khfinal.project.artist.model.vo.Artist;
import com.khfinal.project.artist.model.vo.ArtistPlus;
import com.khfinal.project.board.model.vo.Board;
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
		// boolean이라 true라고 뜬다 왜지?ㅜㅜㅜ
		System.out.println("오자ㅜㅜ");
		// 아티스트
		if (true) {
			List<Member> music = as.selectArtist();
			mav.addObject("music", music);
			// 타투이스트

			List<Member> tattoo = as.selectTattooist();
			mav.addObject("tattoo", tattoo);
			mav.setViewName("tabmenu/artmenu");
		}

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
	String m_nickname;

	/**
	 * @method : artistpage
	 * @date : 2020. 6. 17.
	 * @buildBy : hajin
	 * @comment : artist main페이지에서 선택한 아티스트의 개인 페이지로 넘어야합니다.
	 */
	@RequestMapping("/artist/artistpage.do")
	@ResponseBody
	public ModelAndView artpageList(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		// 작성자 : 이하진
		// 탭메뉴페이지에서 닉네임값을 받아옵니다.
		m_nickname = request.getParameter("artist_nick");
		System.out.println(m_nickname);

		// 수정자 : 박혜연
		// 매개변수 설정
		// 아티스트의 업로드 콘텐츠 받아오기
		List<Artist> artlist = as.selectArtPage(m_nickname);
		mav.addObject("artlist", artlist);

		// 아티스트의 한줄소개, 구독자수 받아오기
		ArtistPlus aplist = as.selectAll(m_nickname);
		mav.addObject("aplist", aplist);

		// 아티스트의 프로필 사진 받아오기
		Member mlist = as.selectProfile(m_nickname);
		mav.addObject("mlist", mlist);

		// 작성자 : 김경호
		// 메인 화면에 행사 일정을 을 뿌려주는 코드
		List<Artist> aslist = as.schedule(m_nickname);

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

		// 작성자 : 김경호
		// 메인 화면에 게시판 목록 5개 뿌려주는 코드
		// 매개변수로 타투인지 밴드인지 받고 아이디값이나 닉넴값 받고 보낸다
		int currentPage = 1;
		int cntPerPage = 5;
		Map<String, Object> artboardlist = as.selectBoardList(currentPage, cntPerPage, m_nickname);
		if (aslist.size() < 5) {
			mav.addObject("artboardlist", artboardlist);
		} else {
			List<Artist> aslist_more = new ArrayList<Artist>();
			for (int i = 0; i < 5; i++) {
				aslist_more.add(i, aslist.get(i));
				mav.addObject("artboardlist", artboardlist);
			}
		}

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
	public ModelAndView tattpageList(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		// 수정자 : 박혜연
		// 매개변수 설정
		// 아티스트의 업로드 콘텐츠 받아오기

		m_nickname = request.getParameter("artist_nick");
		System.out.println(m_nickname);

		List<Artist> artlist = as.selectArtPage(m_nickname);
		mav.addObject("artlist", artlist);

		// 아티스트의 한줄소개, 구독자수 받아오기
		ArtistPlus aplist = as.selectAll(m_nickname);
		mav.addObject("aplist", aplist);

		// 아티스트의 프로필 사진 받아오기
		Member mlist = as.selectProfile(m_nickname);
		mav.addObject("mlist", mlist);

		// 작성자 : 김경호
		// 메인 화면에 행사 일정을 을 뿌려주는 코드
		List<Artist> aslist = as.schedule(m_nickname);

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

		// 작성자 : 김경호
		// 메인 화면에 게시판 목록 5개 뿌려주는 코드
		// 매개변수로 타투인지 밴드인지 받고 아이디값이나 닉넴값 받고 보낸다
		int currentPage = 1;
		int cntPerPage = 5;
		Map<String, Object> artboardlist = as.selectBoardList(currentPage, cntPerPage, m_nickname);
		if (aslist.size() < 5) {
			mav.addObject("artboardlist", artboardlist);
		} else {
			List<Artist> aslist_more = new ArrayList<Artist>();
			for (int i = 0; i < 5; i++) {
				aslist_more.add(i, aslist.get(i));
				mav.addObject("artboardlist", artboardlist);
			}
		}

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

	/**
	 * @method : artistphoto
	 * @date : 2020. 6. 17.
	 * @buildBy : hajin
	 * @comment : 아티스트 개인 페이지의 사진게시판 전체목록
	 */
	@RequestMapping("/artist/artistphoto.do")
	public ModelAndView artistphoto(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		// String m_nickname을 통해 닉네임값으로 받아서 게시판 목록을 받아줍니다.
		String m_nickname = request.getParameter("art_nickname");
		
		

		mav.setViewName("artist/artPhotoList");
		return mav;
	}

	/**
	 * @method : artphotoView
	 * @date : 2020. 6. 22.
	 * @buildBy : hajin
	 * @comment : 아티스트 개인 페이지의 사진게시판 보여주는 페이지
	 */
	@RequestMapping("/artist/artphotoview.do")
	public ModelAndView artphotoView() {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("artist/artPhoto_view");
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
		List<Artist> res = as.schedule(m_nickname);

		mav.addObject("artScList", res);
		mav.addObject("m_nickname", m_nickname);
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
	public ModelAndView artistscheduleadd(HttpServletRequest request, String artstartYear, String artstartMonth, String artstartDay,
			String artstartHour, String artstartMinute, String artendYear, String artendMonth, String artendDay,
			String artendHour, String artendMinute, String atr_as_content, Artist artist) {
		ModelAndView mav = new ModelAndView();

		String start = artstartYear + artstartMonth + artstartDay + artstartHour + artstartMinute;
		String end = artendYear + artendMonth + artendDay + artendHour + artendMinute;
		
		HttpSession session = request.getSession();
	    Map<String, Object> login =  (Map<String, Object>) session.getAttribute("loginInfo");
	    Member member = (Member) login.get("member");

		artist.setAts_start_date(start);
		artist.setAts_end_date(end);
		artist.setAts_content(atr_as_content);
		artist.setM_nickname(m_nickname);
		artist.setM_id(member.getM_id());

		int res = as.scheduleadd(artist);

		mav.addObject("url", "/springmvc/artist/artistschedule.do");
		mav.setViewName("common/result");

		return mav;
	}
	
	@RequestMapping("/artist/artScDelete.do")
	public ModelAndView artScDelete(HttpServletRequest request, String scdelete) {
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
	    Map<String, Object> login =  (Map<String, Object>) session.getAttribute("loginInfo");
	    Member member = (Member) login.get("member");
	    
	    String m_id = member.getM_id();
	    
	    int res = as.artScDelete(scdelete, m_id, m_nickname);
	    
	    if(res < 1) {
			mav.addObject("alertMsg", "일정을 삭제 할수 없습니다.");
			mav.addObject("url", "/artist/artistschedule.do");
			mav.setViewName("common/result");
		}else {
			mav.addObject("alertMsg", "일정이 삭제 되었습니다.");
			mav.addObject("url", "/artist/artistschedule.do");
			mav.setViewName("common/result");
		}
	    
		return mav;
	}

//
//	/**
//	 * @method : artWrite
//	 * @date : 2020. 6. 20.
//	 * @buildBy : hajin
//	 * @comment : 아티스트 페이지에 사용되는 모든 글쓰기를 공통으로 사용합니다.
//	 */
//	@RequestMapping("/artist/artwrite.do")
//	public ModelAndView artWrite() {
//		ModelAndView mav = new ModelAndView();
//
//		mav.setViewName("artist/artWrite");
//		return mav;
//	}

	/**
	 * @method : aboardList
	 * @date : 2020. 6. 17.
	 * @buildBy : 김경호
	 * @comment : 아티스트 게시판 목록
	 */
	// 게시판 리스트 나오는 메서드
	@RequestMapping("/artist/artboardlist.do")
	public ModelAndView aboardList(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		int currentPage = 1;
		int cntPerPage = 5;

		if (request.getParameter("cPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("cPage"));
		}

		if (request.getParameter("cntPerPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("cntPerPage"));
		}

		Map<String, Object> artboardlist = as.selectBoardList(currentPage, cntPerPage, m_nickname);
		mav.addObject("paging", artboardlist.get("paging"));
		System.out.println(artboardlist.get("paging"));

		mav.addObject("aboard", "aboard");
		mav.addObject("artboardlist", artboardlist);
		mav.setViewName("artist/artboardList");
		return mav;
	}

	// 게시판 읽는 메소드
	@RequestMapping("/artist/aboardRead.do")
	public ModelAndView aboardRead(int b_num) {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> readMap = as.aboardRead(b_num);

		mav.addObject("readMap", readMap);
		mav.setViewName("artist/artBoard_view");

		return mav;
	}

	// 게시판 쓰는 페이지로 이동 메서드
	@RequestMapping("/artist/aboardWrite.do")
	public ModelAndView aboardWrite() {
		ModelAndView mav = new ModelAndView();
		
		
		

		mav.setViewName("artist/artWrite");
		return mav;
	}

	// 게시판 디비에 저장되는 메서드
	@RequestMapping("/artist/aboardUpload.do")
	public ModelAndView aboardUpload(HttpServletRequest request, Board board) {
		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();
		Map<String, Object> login = (Map<String, Object>) session.getAttribute("loginInfo");
		Member member = (Member) login.get("member");

		board.setBoardWriter(member.getM_id());
		board.setM_nickname(m_nickname);

		int res = as.aboardUpload(board);

		mav.setViewName("redirect:artboardlist.do");
		return mav;
	}

	// 게시글 삭제 메서드
	@RequestMapping("/artist/aboardDelect.do")
	public ModelAndView aboardDelect(int b_num) {
		ModelAndView mav = new ModelAndView();

		int res = as.aboardDelect(b_num);

		if (res > 0) {
			mav.addObject("alertMsg", "게시글이 삭제가 되었습니다");
			mav.addObject("url", "/springmvc/artist/artboardlist.do");
			mav.setViewName("common/result");
		} else {
			mav.addObject("alertMsg", "존재하지 않는 게시물입니다.");
			mav.addObject("back", "/springmvc/artist/artboardlist.do");
			mav.setViewName("common/result");
		}
		return mav;
	}

	@RequestMapping("/artist/aboardSearch.do")
	public ModelAndView aboardSearch(HttpServletRequest request, String searchType, String searchWord,
			String boardsearch) {
		ModelAndView mav = new ModelAndView();

//		String m_nickname = request.getParameter("artist_nick");

		int currentPage = 1;
		int cntPerPage = 5;

		if (request.getParameter("cPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("cPage"));
		}

		if (request.getParameter("cntPerPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("cntPerPage"));
		}

		Map<String, Object> res = new HashMap<String, Object>();

		res = as.aboardSearch(searchType, searchWord, currentPage, cntPerPage, m_nickname);

		mav.addObject("paging", res.get("paging"));
		mav.addObject("artboardlist", res);
		mav.addObject("searchType", searchType);
		mav.addObject("searchWord", searchWord);
		mav.addObject("aboard", "search");
		mav.setViewName("artist/artboardList");
		return mav;
	}

}
