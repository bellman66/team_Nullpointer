package com.khfinal.project.board.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.khfinal.project.board.model.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	BoardService bs;
	
	HttpServletRequest request; 
	
	/**
	 * @method : view
	 * @date : 2020. 6. 5.
	 * @buildBy : 김경호
	 * @comment : 게시판 처음 눌렀을때 보여주는 메서드
	 */
	@RequestMapping("/board/board.do")
	public ModelAndView view() {
		ModelAndView mav = new ModelAndView();
		boardListPR(request);
		mav.setViewName("board/board");
		return mav;

	}

	
	/**
	 * @method : noticeListPR
	 * @date : 2020. 6. 5.
	 * @buildBy : 김경호
	 * @comment : 홍보게시판 리스트 및 페이징 처리하는 메소드 
	 */
	@RequestMapping("/board/boardPR.do")
	public ModelAndView boardListPR(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		int currentPage = 1;
		int cntPerPage = 10;
		String orderby = "b_category";

		if (request.getParameter("cPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("cPage"));
		}

		if (request.getParameter("cntPerPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("cntPerPage"));
		}

		Map<String, Object> res = bs.selectBoardListPR(orderby, currentPage, cntPerPage);
		mav.addObject("paging", res.get("paging"));
		System.out.println(res.get("paging"));

//		res에 뭐가 들어있는지 다 보여주는 코드
		for (String key : res.keySet()) {
			System.out.println(res.get(key));
		}

		mav.addObject("boardList", res);
		mav.addObject("board", "pr");
		mav.setViewName("board/board");

		return mav;
	}

	/**
	 * @method : noticeListSH
	 * @date : 2020. 6. 5.
	 * @buildBy : 김경호
	 * @comment : 공유게시판 리스트 및 페이징 처리하는 메소드
	 */
	@RequestMapping("/board/boardSH.do")
	public ModelAndView boardListSH(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		int currentPage = 1;
		int cntPerPage = 10;
		String orderby = "b_category";

		if (request.getParameter("cPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("cPage"));
		}

		if (request.getParameter("cntPerPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("cntPerPage"));
		}

		Map<String, Object> res = bs.selectBoardListSH(orderby, currentPage, cntPerPage);
		mav.addObject("paging", res.get("paging"));
		System.out.println(res.get("paging"));

//		res에 뭐가 들어있는지 다 보여주는 코드
		for (String key : res.keySet()) {
			System.out.println(res.get(key));
		}

		mav.addObject("boardList", res);
		mav.addObject("board", "sh");
		mav.setViewName("board/board");

		return mav;
	}
}
