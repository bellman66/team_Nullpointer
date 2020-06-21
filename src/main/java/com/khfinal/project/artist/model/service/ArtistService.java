package com.khfinal.project.artist.model.service;

import java.util.List;
import java.util.Map;

import com.khfinal.project.artist.model.vo.Artist;
import com.khfinal.project.artist.model.vo.ArtistPlus;
import com.khfinal.project.member.model.vo.Member;
import com.khfinal.project.schedule.model.vo.Schedule;

public interface ArtistService {
	
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
	
	//작성자 : 김경호
	//스케줄 관련 서비스
	public List<Artist> schedule();
	public int scheduleadd(Artist artist);
	public int artScDelete(String scdelete);
	
	//작성자 : 이하진
	//아티스트 개인페이지 관련
	public List<Artist>selectArtPage();
	public List<Member>selectProfile();
	public List<ArtistPlus>selectAll();
}
