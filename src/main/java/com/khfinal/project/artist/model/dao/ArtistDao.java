package com.khfinal.project.artist.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.khfinal.project.artist.model.vo.Artist;
import com.khfinal.project.member.model.vo.Member;
import com.khfinal.project.artist.model.vo.ArtistPlus;
import com.khfinal.project.board.model.vo.Board;
import com.khfinal.project.schedule.model.vo.Schedule;

import common.util.Paging;

@Repository
public class ArtistDao {

	@Autowired
	SqlSessionTemplate session;

	// vo.Artist > DB 내 TB_ARTIST_UPLOAD 컬럼 변경
	public List<Artist> todayList() {
		return session.selectList("Artist.todayList");
	}

	public List<Artist> bestContent() {
		return session.selectList("Artist.bestContent");
	}

	public List<Artist> uploadList(String m_id) {
		return session.selectList("Artist.uploadList", m_id);
	}

	public List<Schedule> scheduleList(String m_id) {
		return session.selectList("Schedule.scheduleList", m_id);
	}

	// vo.ArtistPlus > DB 내 TB_ARTIST 컬럼 변경
	public int aWordModify(ArtistPlus artistplus) {
		return session.update("ArtistPlus.wordModify", artistplus);
	}

	public String aWord(String m_id) {
		return session.selectOne("ArtistPlus.word", m_id);
	}

	public int decrementSubscribe(String m_nickname) {
		return session.update("ArtistPlus.decrementSubscribe", m_nickname);
	}

	public int aWordInsert(ArtistPlus artistplus) {
		return session.insert("ArtistPlus.wordInsert", artistplus);
	}

	public int plusSubscribe(String m_nickname) {
		return session.update("ArtistPlus.plusSubscribe", m_nickname);
	}

	public List<Member> selectArtist() {
		return session.selectList("Member.selectArtist");
	}

	public List<Member> selectTattooist() {
		return session.selectList("Member.selectTattooist");
	}

	/**
	 * @method : artScheduleadd
	 * @date : 2020. 6. 20.
	 * @buildBy : 김경호
	 * @comment : 스케줄 관련 다오
	 */

	public List<Artist> artSchedule(String m_nickname) {
		return session.selectList("Artist.artschedule", m_nickname);
	}

	public int artScheduleadd(Artist artist) {
		return session.insert("Artist.artscheduleadd", artist);
	}
	
	public int artScDelete(String scdelete, String  m_id, String m_nickname) {
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("scdelete", scdelete);
		data.put("m_id", m_id);
		data.put("m_nickname", m_nickname);
		return session.delete("Artist.scDelect", data);
	}
	public int artScDelete(String scdelete) {
		return session.delete("Artist.scDelect", scdelete);
	}

	/**
	 * @method : selectArtPage
	 * @date : 2020. 6. 21.
	 * @buildBy : hajin
	 * @comment : 아티스트 개인 페이지관련(비디오)
	 */
	public List<Artist> selectArtPageVideo(String m_nickname) {
		return session.selectList("Artist.selectArtPageVideo", m_nickname);
	}
	
	/**
	 * @method : selectArtPage
	 * @date : 2020. 6. 22.
	 * @buildBy : 박혜연
	 * @comment : 아티스트 개인 페이지관련(사진)
	 */
	public List<Artist> selectArtPagePhoto(String m_nickname) {
		return session.selectList("Artist.selectArtPagePhoto", m_nickname);
	}

	public ArtistPlus selectAll(String m_nickname) {
		return session.selectOne("ArtistPlus.selectArtPage", m_nickname);
	}

	/**
	 * @method : contentCnt
	 * @date : 2020. 6. 20.
	 * @buildBy : 김경호
	 * @comment : 아티스트 게시판 관련 다오
	 */
	public int contentCnt(String m_nickname) {
		return session.selectOne("Artist.boardCount", m_nickname);
	}

	public List<Artist> selectBoardList(Paging page, String m_nickname) {
		Map<String, Object> data = new HashMap<String, Object>();

		data.put("page", page);
		data.put("m_nickname", m_nickname);
		return session.selectList("Artist.selectBoardList", data);
	}

	public Board aboardRead(int b_num) {
		return session.selectOne("Artist.aboardRead", b_num);
	}
	
	public List<Map<String, String>> aboardResdFile(int b_num){
		return session.selectList("Artist.aboardResdFile", b_num);
	}

	public int aboardUpload(Board board) {
		return session.insert("Artist.aboardUpload", board);
	}
	
	public int aboardFileUpload(Map<String, Object> file) {
		return session.insert("Artist.aboardFileUpload", file);
	}

	public int aboardDelect(int b_num) {
		return session.delete("Artist.aboardDelect", b_num);
	}

	// 게시판 작성자 검색 페이징 처리를 위한 게시글 갯수세는 쿼리
	public int contentWrSeCnt(String searchWord, String m_nickname) {
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("searchWord", searchWord);
		data.put("m_nickname", m_nickname);

		return session.selectOne("Artist.contentWrSeCnt", data);

	}

	// 게시판 제목 검색 페이징 처리를 위한 게시글 갯수세는 쿼리
	public int contentTiSeCnt(String searchWord, String m_nickname) {
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("searchWord", searchWord);
		data.put("m_nickname", m_nickname);

		return session.selectOne("Artist.contentTiSeCnt", data);

	}

	// 게시판 작성자+제목 검색 페이징 처리를 위한 게시글 갯수세는 쿼리
	public int contentWTSeCnt(String searchWord, String m_nickname) {
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("searchWord", searchWord);
		data.put("m_nickname", m_nickname);

		return session.selectOne("Artist.contentWTSeCnt", data);

	}

	// 게시판 작성자 검색 리스트
	public List<Board> searchWrBoardList(String searchWord, Paging page, String m_nickname) {

		Map<String, Object> data = new HashMap<String, Object>();
		data.put("page", page);
		data.put("searchWord", searchWord);
		data.put("m_nickname", m_nickname);
		return session.selectList("Artist.searchWrBoardList", data);

	}

	// 게시판 제목 검색 리스트
	public List<Board> searchTiBoardList(String searchWord, Paging page, String m_nickname) {

		Map<String, Object> data = new HashMap<String, Object>();
		data.put("page", page);
		data.put("searchWord", searchWord);
		data.put("m_nickname", m_nickname);
		return session.selectList("Artist.searchTiBoardList", data);

	}

	// 게시판 작성자+제목 검색 리스트
	public List<Board> searchWTBoardList(String searchWord, Paging page, String m_nickname) {

		Map<String, Object> data = new HashMap<String, Object>();
		data.put("page", page);
		data.put("searchWord", searchWord);
		data.put("m_nickname", m_nickname);
		return session.selectList("Artist.searchWTBoardList", data);

	}
	
	// 사진 게시판 전체 목록 리스트
	public List<Board>selectPhotoList(){
		return session.selectList("Board.selectPhotoList");
	}
	
	//
	public int artCategory(String m_nickname) {
		return session.selectOne("Artist.artCategory", m_nickname);
	}

}
