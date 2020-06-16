package com.khfinal.project.member.model.service;

import java.util.Map;

import com.khfinal.project.member.model.vo.Member;

public interface MemberService {
	
	public int insertMember(Map<String , Object>memberMap);
	public Member login(Map<String , Object>memberMap);
	public Member loginConfirm(Map<String , Object>memberMap);
	public String nickNameCheck(String nickname);
	public int infoModify(Member member);
	public Member reload(String m_id);
	
}
