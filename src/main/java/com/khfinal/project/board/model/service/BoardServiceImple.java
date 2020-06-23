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
	public Map<String, Object> selectBoardListPR(int currentPage, int cntPerPage) {

		Map<String, Object> res = new HashMap<String, Object>();
		Paging page = new Paging(bd.contentCntPr(), currentPage, cntPerPage);

		List<Board> nlist = bd.selectBoardListPr(page);
		res.put("paging", page);
		res.put("nlist", nlist);

		return res;

	}

	/**
	 * @method : selectBoardListSH
	 * @date : 2020. 6. 5.
	 * @buildBy : 김경호
	 * @comment : 공유게시판 리스트 및 페이징 처리하는 메소드 
	 */
	@Override
	public Map<String, Object> selectBoardListSH(int currentPage, int cntPerPage) {
		Map<String, Object> res = new HashMap<String, Object>();
		Paging page = new Paging(bd.contentCntSh(), currentPage, cntPerPage);

		List<Board> nlist = bd.selectBoardListSh(page);
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
		List<Map<String, String>> flist = bd.boardResdFile(b_num);
		
		res.put("board", board);
		res.put("flist", flist);
		
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
		
		bd.boardDeleteFile(b_num);
		
		return res;
	}

	/**
	 * @method : boardUploadSh
	 * @date : 2020. 6. 9.
	 * @buildBy : 김경호
	 * @comment : 게시판 업로드 메서드
	 */
	@Override
	public int boardUploadSh(Board board , List<Map<String, Object>> file) {
		int res = bd.boardUploadSh(board);
		
		
		if(file.get(0).get("originFileName").equals("")) {
			
		}else {
			boardFile(file);
		}
		
		return res;
	}

	/**
	 * @method : boardUploadPr
	 * @date : 2020. 6. 9.
	 * @buildBy : 김경호
	 * @comment : 게시판 업로드 메서드
	 */
	@Override
	public int boardUploadPr(Board board , List<Map<String, Object>> file) {
		int res = bd.boardUploadPr(board);
		
		if(file.get(0).get("originFileName").equals("")) {
			
		}else {
			boardFile(file);
		}
		return res;
	}

	/**
	 * @method : boardFile
	 * @date : 2020. 6. 10.
	 * @buildBy : 김경호
	 * @comment : 게시판 파일 추가 메서드
	 */
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

	/**
	 * @method : deleteFiles
	 * @date : 2020. 6. 10.
	 * @buildBy : 김경호
	 * @comment : 게시판 파일 삭제 메서드
	 */
	@Override
	public void deleteFiles(int b_num) {
		List<Map<String, String>> files = bd.boardResdFile(b_num);
		
		if(files.size() > 0) {
			for(Map<String, String> filePath : files) {
				
				File file = new File(filePath.get("SAVEPATH"));
				//delete(즉시 삭제), deleteOnExist(JVM(서버)가 내려갈때 삭제)
				file.delete();
				
			}
		}
		
	}

	/**
	 * @method : boardSearchSH
	 * @date : 2020. 6. 14.
	 * @buildBy : 김경호
	 * @comment : 공유 게시판 검색 메서드
	 */
	@Override
	public Map<String, Object> boardSearchSH(String searchType, String searchWord, int currentPage,
			int cntPerPage) {
		
		Map<String, Object> res = new HashMap<String, Object>();
		System.out.println("searchType " + searchType);
		System.out.println("searchWord " + searchWord);
		
		if(searchType.equals("write")) {
			Paging page = new Paging(bd.contentWrSeCntSh(searchWord), currentPage, cntPerPage);
			List<Board> nlist = bd.searchWrBoardListSh(searchWord, page);
			res.put("paging", page);
			res.put("nlist", nlist);
		}else if(searchType.equals("title")){
			Paging page = new Paging(bd.contentTiSeCntSh(searchWord), currentPage, cntPerPage);
			List<Board> nlist = bd.searchTiBoardListSh(searchWord, page);
			res.put("paging", page);
			res.put("nlist", nlist);
		}else {
			Paging page = new Paging(bd.contentWTSeCntSh(searchWord), currentPage, cntPerPage);
			List<Board> nlist = bd.searchWTBoardListSh(searchWord, page);
			res.put("paging", page);
			res.put("nlist", nlist);
		}
		
		return res;
	}

	/**
	 * @method : boardSearchPR
	 * @date : 2020. 6. 14.
	 * @buildBy : 김경호
	 * @comment : 홍보 게시판 검색 메서드
	 */
	@Override
	public Map<String, Object> boardSearchPR(String searchType, String searchWord, int currentPage,
			int cntPerPage) {
		
		Map<String, Object> res = new HashMap<String, Object>();
		
		System.out.println("searchType " + searchType);
		System.out.println("searchWord " + searchWord);
		
		if(searchType.equals("write")) {
			Paging page = new Paging(bd.contentWrSeCntPr(searchWord), currentPage, cntPerPage);
			List<Board> nlist = bd.searchWrBoardListPr(searchWord, page);
			res.put("paging", page);
			res.put("nlist", nlist);
		}else if(searchType.equals("title")){
			Paging page = new Paging(bd.contentTiSeCntPr(searchWord), currentPage, cntPerPage);
			List<Board> nlist = bd.searchTiBoardListPr(searchWord, page);
			res.put("paging", page);
			res.put("nlist", nlist);
		}else {
			Paging page = new Paging(bd.contentWTSeCntPr(searchWord), currentPage, cntPerPage);
			List<Board> nlist = bd.searchWTBoardListPr(searchWord, page);
			res.put("paging", page);
			res.put("nlist", nlist);
		}
		return res;
	}



}
