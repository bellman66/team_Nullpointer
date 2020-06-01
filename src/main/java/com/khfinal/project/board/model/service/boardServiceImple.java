//package com.khfinal.project.board.model.service;
//
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import org.springframework.beans.factory.annotation.Autowired;
//
//import com.khfinal.project.board.model.dao.boardDao;
//import com.khfinal.project.board.model.vo.board;
//
//import common.util.Paging;
//
//public class boardServiceImple implements boardService {
//	
//	@Autowired
//	public boardDao bd;
//
//	@Override
//	public Map<String, Object> selectNoticeList(String orderby, int currentPage, int cntPerPage) {
//		
//		Map<String, Object> res = new HashMap<String, Object>();
//		Paging page = new Paging(bd.contentCnt(), currentPage, cntPerPage);
//
//		List<board> nlist = bd.selectNoticList(page, orderby);
//		res.put("paging", page);
//		res.put("nlist", nlist);
//
//		return res;
//		
//	
//	}
//
//	
//}
