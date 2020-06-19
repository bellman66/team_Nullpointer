package com.khfinal.project.artist.model.service;

import java.util.List;

import com.khfinal.project.artist.model.vo.Artist;
import com.khfinal.project.member.model.vo.Member;
import com.khfinal.project.artist.model.vo.ArtistPlus;
import com.khfinal.project.schedule.model.vo.Schedule;

public interface ArtistService {
	
	public List<Artist> todayList();
	public List<Artist> bestContent();
	public List<Artist> uploadList(String m_id);
	public List<Schedule> scheduleList(String m_id);
	public List<Member> selectArtist();
	public List<Member> selectTattooist();
	public List<Map> selectArtList();
	public int aWordModify(ArtistPlus artistplus);
	public int aWordInsert(ArtistPlus artistplus);
	public String aWord(String m_id);
	public int decrementAuLike(String m_nickname);

}
