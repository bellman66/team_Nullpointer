package com.khfinal.project.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {


		
//		@Autowired
////		boardService bs;

		@RequestMapping("/board/board.do")
		public ModelAndView noticeList(HttpServletRequest request) {
			
			ModelAndView mav = new ModelAndView();
			
//			int currentPage = 1;
//			int cntPerPage = 10;
//			String orderby = "noticeno";
//			
//			
//			if(request.getParameter("cPage") != null) {
//				currentPage = Integer.parseInt(request.getParameter("cPage"));
//			}
//			
//			if(request.getParameter("cntPerPage") != null) {
//				currentPage = Integer.parseInt(request.getParameter("cntPerPage"));
//			}
//			
//			Map<String,Object> res = bs.selectNoticeList(orderby, currentPage, cntPerPage);
//			mav.addObject("paging", res.get("paging"));
//			System.out.println(res.get("paging"));
			
//			mav.addObject("mdata", res);
			mav.setViewName("board/board");
			
			return mav;
		}
	}

