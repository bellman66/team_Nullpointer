package com.khfinal.project.board.model.service;

import java.io.File;
import java.io.IOException;
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
		
		//파일 읽어주는 코드
//		List<Map<String, String>> flist = bd.boardResdFile(b_num);
		
		res.put("board", board);
//		res.put("flist", flist);
		
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
		
//		bd.boardDeleteFile(b_num);
		
		return res;
	}

	@Override
	public int boardUploadSh(Board board /* , List<Map<String, Object>> file */) {
		int res = bd.boardUploadSh(board);
		/* boardFile(file); */
		return res;
	}

	@Override
	public int boardUploadPr(Board board /* , List<Map<String, Object>> file */) {
		int res = bd.boardUploadPr(board);
		/* boardFile(file); */
		return res;
	}

	@Override
	public int boardFile(List<Map<String, Object>> file) {
		int res = 0;
		for(Map<String, Object> fileData : file) {
			bd.boardUploadFile(fileData);
			
			MultipartFile mf = (MultipartFile) fileData.get("file");
			File f = new File((String) fileData.get("savePath"));
			
			try {
				mf.transferTo(f);
			} catch (IllegalStateException e) {
				// TODO: handle exception
				e.printStackTrace();
			} catch (IOException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
			
			
		}
		return res;
	}



}
