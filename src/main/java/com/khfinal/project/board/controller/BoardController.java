package com.khfinal.project.board.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.khfinal.project.board.model.service.BoardService;
import com.khfinal.project.board.model.vo.Board;
import com.khfinal.project.member.model.vo.Member;

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

		if (request.getParameter("cPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("cPage"));
		}

		if (request.getParameter("cntPerPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("cntPerPage"));
		}

		Map<String, Object> res = bs.selectBoardListPR(currentPage, cntPerPage);
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

		if (request.getParameter("cPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("cPage"));
		}

		if (request.getParameter("cntPerPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("cntPerPage"));
		}

		Map<String, Object> res = bs.selectBoardListSH(currentPage, cntPerPage);
		System.out.println("///" + res.get("paging"));

//		res에 뭐가 들어있는지 다 보여주는 코드
		for (String key : res.keySet()) {
			System.out.println(res.get(key));
		}

		mav.addObject("paging", res.get("paging"));
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
		// boardMap에 뭐가 들었는지 확인하는 코드
		for (String key : boardMap.keySet()) {
			System.out.println(boardMap.get(key));
		}
		mav.addObject("read", boardMap);
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
		if (res > 0) {
//			if(b_category == 1) {
			mav.addObject("alertMsg", "게시글이 삭제가 되었습니다");
			mav.addObject("url", "/springmvc/board/boardSH.do");
			mav.setViewName("common/result");
//			}else {
//				mav.addObject("alertMsg", "게시글이 삭제가 되었습니다");
//				mav.addObject("url", "/springmvc/board/boardPR.do");
//				mav.setViewName("common/result");
//			}

		} else {
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

		if (b_category == 1) {
			mav.addObject("url", "/springmvc/board/boardSH.do");
			mav.setViewName("common/result");
		} else {
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

		if (board.equals("sh")) {
			mav.addObject("board", "sh");
			mav.setViewName("board/board_write");
		} else {
			mav.addObject("board", "pr");
			mav.setViewName("board/board_write");
		}

		return mav;
	}

	/**
	 * @method : boardUpload
	 * @date : 2020. 6. 9.
	 * @buildBy : 김경호
	 * @comment : 게시판 업로드 메서드
	 */
	@RequestMapping("/board/boardupload.do")
	public ModelAndView boardUpload(HttpServletRequest request, Board board, @RequestParam List<MultipartFile> bfile) {
		ModelAndView mav = new ModelAndView();
		System.out.println("이게 뭘까?" + boardCategory);
		System.out.println(board);

		List<Map<String, Object>> file = null;
//		  for(int i = 0; i < bfile.size(); i++ ) { 
//			  System.out.println("bfile 리스트" +bfile.get(i)); 
//			  }

		// 파일을 저장하는 코드
		if (bfile != null) {
			file = new ArrayList<Map<String, Object>>();
			String root = request.getSession().getServletContext().getRealPath("/");

			int i = 0;
			for (MultipartFile mf : bfile) {
				String savePath = root + "resources/upload/";
				String originFileName = mf.getOriginalFilename();
				HashMap<String, Object> data = new HashMap<>();

				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");

				String renameFile = sdf.format(new Date()) + i + "."
						+ originFileName.substring(originFileName.lastIndexOf(".") + 1);

				savePath += renameFile;

				data.put("originFileName", originFileName);
				data.put("renameFile", renameFile);
				data.put("savePath", savePath);
				data.put("file", mf);

				file.add(data);
				i++;
				for (int ai = 0; ai < file.size(); ai++) {
					System.out.println("파일" + file);
				}
			}
		}
		// 파일을 뺸 나머지 값들 가져오는 코드
		HttpSession session = request.getSession();
		Map<String, Object> login = (Map<String, Object>) session.getAttribute("loginInfo");
		Member member = (Member) login.get("member");

		board.setBoardWriter(member.getM_id());
		System.out.println("컨트롤러에서 멤버" + member);

		if (boardCategory.equals("sh")) {
			int res = bs.boardUploadSh(board, file);
			mav.setViewName("redirect:boardSH.do");
		} else {
			int res = bs.boardUploadPr(board, file);
			mav.setViewName("redirect:boardPR.do");
		}

		return mav;
	}

	/**
	 * @method : boardSearchPR
	 * @date : 2020. 6. 14.
	 * @buildBy : 김경호
	 * @comment : 홍보 게시판 검색기능
	 */
	@RequestMapping("/board/boardSearchPR.do")
	public ModelAndView boardSearchPR(HttpServletRequest request, String searchType, String searchWord, String board,
			String boardsearch) {
		ModelAndView mav = new ModelAndView();

		int currentPage = 1;
		int cntPerPage = 5;

		if (request.getParameter("cPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("cPage"));
		}

		if (request.getParameter("cntPerPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("cntPerPage"));
		}

		Map<String, Object> res = new HashMap<String, Object>();

		searchType = request.getParameter("searchType");
		searchWord = request.getParameter("searchWord");

		res = bs.boardSearchPR(searchType, searchWord, currentPage, cntPerPage);

		System.out.println("controller 에서 전체     " + res.get("nlist"));
		System.out.println("토탈" + res.get("total"));
		System.out.println("///" + res.get("paging"));

		mav.addObject("paging", res.get("paging"));
		mav.addObject("boardList", res);
		mav.addObject("searchType", searchType);
		mav.addObject("searchWord", searchWord);
		mav.addObject("board", "searchPR");
		mav.setViewName("board/board");

		return mav;
	}

	/**
	 * @method : boardSearchSH
	 * @date : 2020. 6. 17.
	 * @buildBy : 김경호
	 * @comment : 홍보 게시판 검색기능
	 */
	@RequestMapping("/board/boardSearchSH.do")
	public ModelAndView boardSearchSH(HttpServletRequest request, String searchType, String searchWord, String board,
			String boardsearch) {
		ModelAndView mav = new ModelAndView();

		int currentPage = 1;
		int cntPerPage = 5;

		if (request.getParameter("cPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("cPage"));
		}

		if (request.getParameter("cntPerPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("cntPerPage"));
		}

//		searchType = request.getParameter("searchType");
//		searchWord = request.getParameter("searchWord");

		Map<String, Object> res = new HashMap<String, Object>();
		res = bs.boardSearchSH(searchType, searchWord, currentPage, cntPerPage);

		System.out.println("controller 에서 전체     " + res.get("nlist"));

		System.out.println("board " + board);

		System.out.println(res.get("paging"));

		System.out.println("controller 에서 전체     " + res.get("nlist"));

		System.out.println("토탈" + res.get("total"));
		System.out.println("///" + res.get("paging"));

		for (String key : res.keySet()) {
			System.out.println("검색시 컨트롤러" + res.get(key));
		}

		mav.addObject("paging", res.get("paging"));
		mav.addObject("boardList", res);
		mav.addObject("searchType", searchType);
		mav.addObject("searchWord", searchWord);
		mav.addObject("board", "searchSH");
		mav.setViewName("board/board");

		return mav;
	}

}
