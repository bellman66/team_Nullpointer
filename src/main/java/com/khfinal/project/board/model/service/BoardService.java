package com.khfinal.project.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.khfinal.project.board.model.vo.Board;

public interface BoardService {


		public Map<String,Object> selectBoardListPR(String orderby, int currentPage, int cntPerPage);

		public Map<String, Object> selectBoardListSH(String orderby, int currentPage, int cntPerPage);
		
		public Map<String, Object> boardResd(int b_num);
		
		public int boardDelete(int b_num);
	
		public int boardUploadSh(Board board, List<Map<String, Object>> file);
		
		public int boardUploadPr(Board board, List<Map<String, Object>> file);
		
		public int boardFileSh(List<Map<String, Object>> file);
		
		public int boardFilePr(List<Map<String, Object>> file);

}

