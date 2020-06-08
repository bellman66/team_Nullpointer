package com.khfinal.project.board.model.service;

import java.util.Map;

public interface BoardService {


		public Map<String,Object> selectBoardListPR(String orderby, int currentPage, int cntPerPage);

		public Map<String, Object> selectBoardListSH(String orderby, int currentPage, int cntPerPage);
		
		public Map<String, Object> boardResd(int b_num);
		
		public int boardDelete(int b_num);
	
}

