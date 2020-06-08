package com.khfinal.project.board.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
		Paging page = new Paging(bd.contentCntPr(), currentPage, cntPerPage);

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
		Paging page = new Paging(bd.contentCntSh(), currentPage, cntPerPage);

		List<Board> nlist = bd.selectBoardListSh(page, orderby);
		res.put("paging", page);
		res.put("nlist", nlist);

		return res;
	}

	/**
	 * @method : boardResd
	 * @date : 2020. 6. 6.
	 * @buildBy : 김경호
	 * @comment : 게시판 상세보기
	 */
	@Override
	public Map<String, Object> boardResd(int b_num) {
		Map<String, Object> res = new HashMap<String, Object>();
		Board board = bd.boardResd(b_num);
		
		res.put("board", board);
		
		return res;
	}

	/**
	 * @method : boardDelete
	 * @date : 2020. 6. 8.
	 * @buildBy : 김경호
	 * @comment : 게시글 삭제
	 */
	@Override
	public int boardDelete(int b_num) {
		int res = bd.boardDelete(b_num);
		return res;
	}

	@Override
	public int boardUploadSh(Board board, List<Map<String, Object>> file) {
		int res = bd.boardUploadSh(board);
		boardFileSh(file);
		return 0;
	}

	@Override
	public int boardUploadPr(Board board, List<Map<String, Object>> file) {
		int res = bd.boardUploadPr(board);
		boardFilePr(file);
		return 0;
	}

	@Override
	public int boardFileSh(List<Map<String, Object>> file) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int boardFilePr(List<Map<String, Object>> file) {
		// TODO Auto-generated method stub
		return 0;
	}

}
