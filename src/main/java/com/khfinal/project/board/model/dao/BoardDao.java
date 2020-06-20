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
	public List<Board> selectBoardListPr(Paging page) {

		Map<String, Object> data = new HashMap<String, Object>();

		data.put("page", page);
		return sqlSession.selectList("Board.selectBoardListPr", data);

	}

	/**
	 * @method : selectNoticListSh
	 * @date : 2020. 6. 5.
	 * @buildBy : 김경호
	 * @comment : 공유게시판 리스트 및 페이징 처리하는 메소드 
	 */
	public List<Board> selectBoardListSh(Paging page) {

		Map<String, Object> data = new HashMap<String, Object>();

		data.put("page", page);
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
		return sqlSession.delete("Board.boardDeleteFile", b_num);
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
	
	
	/**
	 * @method : contentWrSeCntSh
	 * @date : 2020. 6. 14.
	 * @buildBy : 김경호
	 * @comment : 게시판 검색 기능 페이징 처리
	 */
	//공유게시판 작성자 검색 페이징 처리를 위한 게시글 갯수세는 쿼리
	public int contentWrSeCntSh(String searchWord) {

		return sqlSession.selectOne("Board.contentWrSeCntSh",searchWord);

	}
	//공유게시판 제목 검색 페이징 처리를 위한 게시글 갯수세는 쿼리
	public int contentTiSeCntSh(String searchWord) {

		return sqlSession.selectOne("Board.contentTiSeCntSh",searchWord);

	}
	//공유게시판 작성자+제목 검색 페이징 처리를 위한 게시글 갯수세는 쿼리
	public int contentWTSeCntSh(String searchWord) {

		return sqlSession.selectOne("Board.contentWTSeCntSh",searchWord);

	}
	//홍보게시판 작성자 검색 페이징 처리를 위한 게시글 갯수세는 쿼리
	public int contentWrSeCntPr(String searchWord) {

		return sqlSession.selectOne("Board.contentWrSeCntPr",searchWord);

	}
	//홍보게시판 제목 검색 페이징 처리를 위한 게시글 갯수세는 쿼리
	public int contentTiSeCntPr(String searchWord) {

		return sqlSession.selectOne("Board.contentTiSeCntPr",searchWord);

	}
	//홍보게시판 작성자+제목 검색 페이징 처리를 위한 게시글 갯수세는 쿼리
	public int contentWTSeCntPr(String searchWord) {

		return sqlSession.selectOne("Board.contentWTSeCntPr",searchWord);

	}
	
	
	/**
	 * @method : searchWrBoardListSh
	 * @date : 2020. 6. 14.
	 * @buildBy : 김경호
	 * @comment : 게시판 검색 리스트 
	 */
	//공유게시판 작성자 검색 리스트
	public List<Board> searchWrBoardListSh(String searchWord, Paging page) {

		Map<String, Object> data = new HashMap<String, Object>();
		data.put("page", page);
		data.put("searchWord", searchWord);
		return sqlSession.selectList("Board.searchWrBoardListSh", data);

	}
	//공유게시판 제목 검색 리스트
	public List<Board> searchTiBoardListSh(String searchWord, Paging page) {

		Map<String, Object> data = new HashMap<String, Object>();
		data.put("page", page);
		data.put("searchWord", searchWord);
		return sqlSession.selectList("Board.searchTiBoardListSh", data);

	}
	//공유게시판 작성자+제목 검색 리스트
	public List<Board> searchWTBoardListSh(String searchWord, Paging page) {

		Map<String, Object> data = new HashMap<String, Object>();
		data.put("page", page);
		data.put("searchWord", searchWord);
		return sqlSession.selectList("Board.searchWTBoardListSh", data);

	}
	//홍보게시판 작성자 검색 리스트
	public List<Board> searchWrBoardListPr(String searchWord, Paging page) {

		Map<String, Object> data = new HashMap<String, Object>();
		data.put("page", page);
		data.put("searchWord", searchWord);
		return sqlSession.selectList("Board.searchWrBoardListPr", data);

	}
	//홍보게시판 제목 검색 리스트
	public List<Board> searchTiBoardListPr(String searchWord, Paging page) {

		Map<String, Object> data = new HashMap<String, Object>();
		data.put("page", page);
		data.put("searchWord", searchWord);
		return sqlSession.selectList("Board.searchTiBoardListPr", data);

	}
	//홍보게시판 작성자+제목 검색 리스트
	public List<Board> searchWTBoardListPr(String searchWord, Paging page) {

		Map<String, Object> data = new HashMap<String, Object>();
		data.put("page", page);
		data.put("searchWord", searchWord);
		return sqlSession.selectList("Board.searchWTBoardListPr", data);

	}
	
}
