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
	
	public int decrementAuLike(String m_nickname) {
		return session.update("ArtistPlus.decrementAuLike", m_nickname);
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

}
