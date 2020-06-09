package com.khfinal.project.board.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.khfinal.project.board.model.vo.Board;

import common.util.Paging;

@Repository
public class BoardDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	public int contentCntPr() {

		return sqlSession.selectOne("Board.contentCntPr");

	}
	
	public int contentCntSh() {

		return sqlSession.selectOne("Board.contentCntSh");

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
	
	/**
	 * @method : boardResd
	 * @date : 2020. 6. 6.
	 * @buildBy : 김경호
	 * @comment : 게시판 상세페이지
	 */
	public Board boardResd(int b_num) {
		return sqlSession.selectOne("Board.boardResd", b_num);
	}
	
	/**
	 * @method : boardResdFile
	 * @date : 2020. 6. 9.
	 * @buildBy : 김경호
	 * @comment : 게시판 파일 상세페이지
	 */
	public List<Map<String, String>> boardResdFile(int b_num){
		return sqlSession.selectList("Board.boardResdFile", b_num);
	}
	
	/**
	 * @method : boardDelete
	 * @date : 2020. 6. 8.
	 * @buildBy : 김경호
	 * @comment : 게시글 삭제
	 */
	public int boardDelete(int b_num) {
		return sqlSession.delete("Board.boardDelete" ,b_num);
	}
	
	/**
	 * @method : boardDeleteFile
	 * @date : 2020. 6. 9.
	 * @buildBy : 김경호
	 * @comment : 게시판 파일 삭제
	 */
	public int boardDeleteFile(int b_num) {
		return sqlSession.delete("Board.boardDeleteFile");
	}
	
	/**
	 * @method : boardUploadSh
	 * @date : 2020. 6. 9.
	 * @buildBy : 김경호
	 * @comment : 공유 게시글 업로드 
	 */
	public int boardUploadSh(Board board) {
		return sqlSession.insert("Board.boardinsertSh",board);
	}
	
	/**
	 * @method : boardUploadPr
	 * @date : 2020. 6. 9.
	 * @buildBy : 김경호
	 * @comment : 홍보 게시글 업로드
	 */
	public int boardUploadPr(Board board) {
		return sqlSession.insert("Board.boardinsertPr",board);
	}
	
	/**
	 * @method : boardFileSh
	 * @date : 2020. 6. 9.
	 * @buildBy : 김경호
	 * @comment : 게시글 파일 업로드
	 */
	public int boardUploadFile(Map<String, Object> file) {
		return sqlSession.insert("Board.boardinsertFile", file);
	}
	

	
	

}
