package com.khfinal.project.member.model.service;

import java.util.List;
import java.util.Map;

import com.khfinal.project.member.model.vo.Member;
import com.khfinal.project.member.model.vo.MyArtist;

public interface MemberService {
	
	public int insertMember(Map<String , Object>memberMap);
	public Member login(Map<String , Object>memberMap);
	public Member loginConfirm(Map<String , Object>memberMap);
	public String nickNameCheck(String nickname);
	public List<MyArtist> myArtistList(String m_id);
	public int myArtistDelete(MyArtist myartist);
	public int infoModify(Member member, List<Map<String, Object>> file);
	public void updateProfile(List<Map<String, Object>> file);
	public Member reload(String m_id);
	public int leave(String m_id);
	
}
