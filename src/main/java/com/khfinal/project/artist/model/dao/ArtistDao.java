package com.khfinal.project.artist.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.khfinal.project.artist.model.vo.Artist;
import com.khfinal.project.member.model.vo.Member;
import com.khfinal.project.artist.model.vo.ArtistPlus;
import com.khfinal.project.schedule.model.vo.Schedule;

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

	public List<Map> selectArtList(){
		return session.selectList("Member.selectArtList");
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
	
	public List<Member> selectArtist(){
		return session.selectList("Member.selectArtist");
	}
	
	public List<Member> selectTattooist(){
		return session.selectList("Member.selectTattooist");
	}
	
	
	
	/**
	 * @method : artScheduleadd
	 * @date : 2020. 6. 20.
	 * @buildBy : 김경호
	 * @comment : 스케줄 관련 다오
	 */
	
	public List<Artist> artSchedule(){
		return session.selectList("Artist.artschedule");
	}
	
	
	public int artScheduleadd(Artist artist) {
		return session.insert("Artist.artscheduleadd", artist);
	}
	
	public int artScDelete(String scdelete) {
		return session.delete("Artist.scDelect", scdelete);
	}

}
