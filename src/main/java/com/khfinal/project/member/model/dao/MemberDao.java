package com.khfinal.project.member.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.khfinal.project.member.model.vo.Member;

@Repository
public class MemberDao {

	/**
	 * @method : insertMember
	 * @date : 2020. 6. 2.
	 * @buildBy : hajin
	 * @comment : 회원가입용 
	 */
	
	@Autowired
	SqlSessionTemplate session;
	
	public int insertMember(Map<String , Object>memberMap) {
		return session.insert("Member.insertMember",memberMap);
	}
	
	/**
	 * @method : login
	 * @date : 2020. 6. 2.
	 * @buildBy : hajin
	 * @comment : 로그인 용
	 */
	
	public Member login(Map<String , Object>memberMap) {
		return session.selectOne("Memeber.login",memberMap);
	}
	
	// ### test
	public Member loginConfirm(Map<String, Object> memberMap) {
		// TODO Auto-generated method stub
		
		return session.selectOne("Member.loginConfirm", memberMap);
	}
	
	public String nickNameCheck(String nickname) {
		return session.selectOne("Member.nickNameCheck", nickname);
	}
	
	public int infoModify(Member member) {
		return session.update("Member.infoModify", member);
	}
	
	public Member reload(String m_id) {
		return session.selectOne("Member.reload", m_id);
	}
	
}
