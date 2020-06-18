package com.khfinal.project.artist.model.service;

import java.util.List;
import java.util.Map;

import com.khfinal.project.artist.model.vo.Artist;
import com.khfinal.project.schedule.model.vo.Schedule;

public interface ArtistService {
	
	public List<Artist> todayList();
	public List<Artist> bestContent();
	public List<Artist> uploadList(String m_id);
	public List<Schedule> scheduleList(String m_id);
	public List<Map> selectArtList();
	public int auWordModify(Artist artist);
	public String auWord(String m_id);

}
