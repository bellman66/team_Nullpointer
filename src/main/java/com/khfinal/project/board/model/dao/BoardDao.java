package com.khfinal.project.board.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.khfinal.project.board.model.vo.Board;

import common.util.Paging;

@Repository
public class BoardDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	public int contentCnt() {

		return sqlSession.selectOne("Board.contentCnt");

	}

	/**
	 * @method : selectNoticListPr
	 * @date : 2020. 6. 5.
	 * @buildBy : 김경호
	 * @comment : 홍보게시판 리스트 및 페이징 처리하는 메소드 
	 */
	public List<Board> selectBoardListPr(Paging page, String orderby) {

		Map<String, Object> data = new HashMap<String, Object>();

		data.put("page", page);
		data.put("orderby", orderby);
		System.out.println("다오");
		return sqlSession.selectList("Board.selectBoardListPr", data);

	}

	/**
	 * @method : selectNoticListSh
	 * @date : 2020. 6. 5.
	 * @buildBy : 김경호
	 * @comment : 공유게시판 리스트 및 페이징 처리하는 메소드 
	 */
	public List<Board> selectBoardListSh(Paging page, String orderby) {

		Map<String, Object> data = new HashMap<String, Object>();

		data.put("page", page);
		data.put("orderby", orderby);
		System.out.println("다오");
		return sqlSession.selectList("Board.selectBoardListSh", data);

	}

}
