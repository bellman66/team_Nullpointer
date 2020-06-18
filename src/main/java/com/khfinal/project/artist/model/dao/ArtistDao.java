package com.khfinal.project.artist.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.khfinal.project.artist.model.vo.Artist;
import com.khfinal.project.schedule.model.vo.Schedule;

@Repository
public class ArtistDao {
	
	@Autowired
	SqlSessionTemplate session;
	
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
	
	public int auWordModify(Artist artist) {
		return session.update("Artist.wordModify", artist);
	}
	
	public String auWord(String m_id) {
		return session.selectOne("Artist.word", m_id);
	}

}
