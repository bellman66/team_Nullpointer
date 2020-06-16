package com.khfinal.project.member.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khfinal.project.member.model.dao.MemberDao;
import com.khfinal.project.member.model.vo.Member;

@Service
public class MemberServiceImple implements MemberService {

	@Autowired
	MemberDao mdao;
	
	public MemberServiceImple() {
		
	}

	@Override
	public int insertMember(Map<String, Object> memberMap) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Member login(Map<String, Object> memberMap) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Member loginConfirm(Map<String, Object> memberMap) {
		// TODO Auto-generated method stub
		
		return mdao.loginConfirm(memberMap);
	}

	@Override
	public String nickNameCheck(String nickname) {
		return mdao.nickNameCheck(nickname);
	}

	@Override
	public int infoModify(Member member) {
		return mdao.infoModify(member);
	}

	@Override
	public Member reload(String m_id) {
		return mdao.reload(m_id);
	}
	
	
}
