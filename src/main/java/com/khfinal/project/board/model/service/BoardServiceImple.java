package com.khfinal.project.board.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khfinal.project.board.model.dao.BoardDao;
import com.khfinal.project.board.model.vo.Board;

import common.util.Paging;

@Service
public class BoardServiceImple implements BoardService {

	@Autowired
	public BoardDao bd;

	/**
	 * @method : selectNoticListPr
	 * @date : 2020. 6. 5.
	 * @buildBy : 김경호
	 * @comment : 홍보게시판 리스트 및 페이징 처리하는 메소드 
	 */
	@Override
	public Map<String, Object> selectBoardListPR(String orderby, int currentPage, int cntPerPage) {

		Map<String, Object> res = new HashMap<String, Object>();
		Paging page = new Paging(bd.contentCnt(), currentPage, cntPerPage);

		List<Board> nlist = bd.selectBoardListPr(page, orderby);
		res.put("paging", page);
		res.put("nlist", nlist);

		return res;

	}

	/**
	 * @method : selectNoticListPr
	 * @date : 2020. 6. 5.
	 * @buildBy : 김경호
	 * @comment : 공유게시판 리스트 및 페이징 처리하는 메소드 
	 */
	@Override
	public Map<String, Object> selectBoardListSH(String orderby, int currentPage, int cntPerPage) {
		Map<String, Object> res = new HashMap<String, Object>();
		Paging page = new Paging(bd.contentCnt(), currentPage, cntPerPage);

		List<Board> nlist = bd.selectBoardListSh(page, orderby);
		res.put("paging", page);
		res.put("nlist", nlist);

		return res;
	}

}
