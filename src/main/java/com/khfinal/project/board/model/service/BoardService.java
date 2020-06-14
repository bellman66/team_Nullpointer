package com.khfinal.project.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.khfinal.project.board.model.vo.Board;

public interface BoardService {


		public Map<String,Object> selectBoardListPR(int currentPage, int cntPerPage);

		public Map<String, Object> selectBoardListSH(int currentPage, int cntPerPage);
		
		public Map<String, Object> boardResd(int b_num);
		
		public int boardDelete(int b_num);
	
		public int boardUploadSh(Board board , List<Map<String, Object>> file);
		
		public int boardUploadPr(Board board , List<Map<String, Object>> file);
		
		public int boardFile(List<Map<String, Object>> file);
		
		public void deleteFiles(int b_num);
		
		public Map<String, Object> boardSearchSH(String searchType, String searchWord, int currentPage, int cntPerPage);
		
		public Map<String, Object> boardSearchPR(String searchType, String searchWord, int currentPage, int cntPerPage);

}

