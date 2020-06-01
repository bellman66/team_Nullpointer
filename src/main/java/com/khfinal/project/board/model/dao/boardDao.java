//package com.khfinal.project.board.model.dao;
//
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import org.mybatis.spring.SqlSessionTemplate;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Repository;
//
//import com.khfinal.project.board.model.vo.board;
//
//import common.util.Paging;
//
//@Repository
//public class boardDao {
//
//	@Autowired
//	SqlSessionTemplate sqlSession;
//	
//	public int contentCnt() {
//
//		return sqlSession.selectOne("Board.contentCnt");
//
//	}
//
//	public List<board> selectNoticList(Paging page, String orderby) {
//
//		Map<String, Object> data = new HashMap<String, Object>();
//
//		data.put("page", page);
//		data.put("orderby", orderby);
//		System.out.println("다오");
//		return sqlSession.selectList("Board.selectNoticeList", data);
//
//	}
//	
//}
