package com.khfinal.project.artist.model.service;

import java.util.List;
import java.util.Map;

import com.khfinal.project.artist.model.vo.Artist;
import com.khfinal.project.artist.model.vo.ArtistPlus;
import com.khfinal.project.board.model.vo.Board;
import com.khfinal.project.member.model.vo.Member;
import com.khfinal.project.schedule.model.vo.Schedule;

public interface ArtistService {
	
	// 작성자: 박혜연
	public List<Artist> todayList();
	public List<Artist> bestContent();
	public List<Artist> uploadList(String m_id);
	public List<Schedule> scheduleList(String m_id);
	public List<Member> selectArtist();
	public List<Member> selectTattooist();
	public int aWordModify(ArtistPlus artistplus);
	public int aWordInsert(ArtistPlus artistplus);
	public String aWord(String m_id);
	public int decrementSubscribe(String m_nickname);
	public int plusSubscribe(String m_nickname);
	
	//작성자 : 김경호
	//스케줄 관련 서비스
	public List<Artist> schedule(String m_nickname);
	public int scheduleadd(Artist artist);
	public int artScDelete(String scdelete, String  m_id, String m_nickname);
	
	//작성자 : 이하진
	//수정자 : 박혜연
	//아티스트 개인페이지 관련
	public List<Artist> selectArtPageVideo(String m_nickname);
	public List<Artist> selectArtPagePhoto(String m_nickname);
	public Member selectProfile(String m_nickname);
	public ArtistPlus selectAll(String m_nickname);
	
	//작성자 : 김경호
	//게시판 관련 서비스
	public Map<String, Object> selectBoardList(int currentPage, int cntPerPage, String m_nickname);
	public Map<String, Object> aboardRead(int b_num);
	public int aboardUpload(Board board, List<Map<String, Object>> file);
	public int aboardFileUpload(List<Map<String, Object>> file);
	public int aboardDelect(int b_num);
	public Map<String , Object> aboardSearch(String searchType, String searchWord, int currentPage, int cntPerPage, String m_nickname);
	
	public int artCategory(String m_nickname);

	//작성자 : 윤종민
	// video view 
	public Artist selectvideoview(String select_file);

}
