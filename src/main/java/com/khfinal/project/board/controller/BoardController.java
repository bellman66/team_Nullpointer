package com.khfinal.project.board.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.khfinal.project.board.model.service.BoardService;
import com.khfinal.project.board.model.vo.Board;

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
		int cntPerPage = 5;
		String orderby = "b_num";

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
		int cntPerPage = 5;
		String orderby = "b_num";

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
	
	/**
	 * @method : boardResd
	 * @date : 2020. 6. 6.
	 * @buildBy : 김경호
	 * @comment : 게시판 상세보기
	 */
	@RequestMapping("/board/boardRead.do")
	public ModelAndView boardResd(int b_num) {
		ModelAndView mav = new ModelAndView();
		
		Map<String, Object> boardMap = bs.boardResd(b_num);
		
		System.out.println("시소 그대로 찍어본값" + boardMap.get("board"));
		//boardMap에 뭐가 들었는지 확인하는 코드
		for (String key : boardMap.keySet()) {
			System.out.println(boardMap.get(key));
		}
		mav.addObject("read",boardMap);
        mav.setViewName("board/board_read");
		
		return mav;
	}
	
	/**
	 * @method : boardDelete
	 * @date : 2020. 6. 8.
	 * @buildBy : 김경호
	 * @comment : 게시글 삭제
	 */
	@RequestMapping("/board/boardDelete.do")
	public ModelAndView boardDelete(int b_num) {
		ModelAndView mav = new ModelAndView();
		
		int res = bs.boardDelete(b_num);
		System.out.println(b_num);
		System.out.println(res);
		if(res > 0) {
//			if(b_category == 1) {
				mav.addObject("alertMsg", "게시글이 삭제가 되었습니다");
				mav.addObject("url", "/springmvc/board/boardSH.do");
				mav.setViewName("common/result");
//			}else {
//				mav.addObject("alertMsg", "게시글이 삭제가 되었습니다");
//				mav.addObject("url", "/springmvc/board/boardPR.do");
//				mav.setViewName("common/result");
//			}
			
		}else {
			mav.addObject("alertMsg", "존재하지 않는 게시물입니다.");
			mav.addObject("back", "/springmvc/board/boardSH.do");
			mav.setViewName("common/result");
		}
		
		return mav;
	}
	
	/**
	 * @method : boardRead_list
	 * @date : 2020. 6. 8.
	 * @buildBy : 김경호
	 * @comment : 게시글 상세보기에서 목록으로 넘어가는 기능
	 */
	@RequestMapping("/board/boardRead_list.do")
	public ModelAndView boardRead_list(int b_category) {
		ModelAndView mav = new ModelAndView();
		
		if(b_category == 1) {
			mav.addObject("url", "/springmvc/board/boardSH.do");
			mav.setViewName("common/result");
		}else {
			mav.addObject("url", "/springmvc/board/boardPR.do");
			mav.setViewName("common/result");
		}
		
		return mav;
	}
	String boardCategory;
	
	/**
	 * @method : boardWrite
	 * @date : 2020. 6. 8.
	 * @buildBy : 김경호
	 * @comment : 게시글 쓰기 페이지로 넘어가는 기능
	 */
	@RequestMapping("/board/boardwrite.do")
	public ModelAndView boardWrite(String board) {
		ModelAndView mav = new ModelAndView();
		
		boardCategory = board;
		
		if(board.equals("sh")) {
			mav.addObject("board", "sh");
			mav.setViewName("board/board_write");
		}else {
			mav.addObject("board", "pr");
			mav.setViewName("board/board_write");
		}
		
		return mav;
	}
	
	
	
	@RequestMapping("/board/boarduoload.do")
	public ModelAndView boardUpload(HttpServletRequest request, Board board, @RequestParam List<MultipartFile> boardFile) {
		ModelAndView mav = new ModelAndView();
		System.out.println("이게 뭘까?"+boardCategory);
		
		List<Map<String, Object>> file = new ArrayList<Map<String,Object>>();
		
		if(boardCategory.equals("sh")) {
			int res = bs.boardUploadSh(board, file);
			mav.setViewName("/board/boardSH.do");
		}else {
			int res = bs.boardUploadPr(board, file);
			mav.setViewName("/board/boardPR.do");
		}
		
		
		return mav;
	}
}
