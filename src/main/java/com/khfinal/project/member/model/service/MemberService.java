package com.khfinal.project.member.model.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.khfinal.project.member.model.vo.Member;
import com.khfinal.project.member.model.vo.MyArtist;
import com.khfinal.project.member.model.vo.MyRecord;

public interface MemberService {
	
	public int insertMember(Map<String , Object>memberMap) throws SQLException;
	public Member login(Map<String , Object>memberMap);
	public Member loginConfirm(Map<String , Object>memberMap);
	public Boolean nickNameCheck(String nickname);
	public List<MyArtist> myArtistList(String m_id);
	public int myArtistDelete(MyArtist myartist);
	public int infoModify(Member member, List<Map<String, Object>> file);
	public void updateProfile(List<Map<String, Object>> file);
	public Member reload(String m_id);
	public int leave(String m_id);
	public boolean idCheck(String m_id);
	public boolean pwCheck(String m_id);
	public void mailSending(Map<String, Object> commandMap) throws SQLException;
	public void idMailSending(Map<String, Object> commandMap) throws SQLException;
	public void pwMailSending(Map<String, Object> commandMap) throws SQLException;
	public int insertMyArtist(MyArtist myartist);
	public int selectSame(MyArtist myaritst);
	public List<Map<String, Object>> maplusprofile(String m_id);
	public List<MyRecord> myRecordList(String m_id);
	public Map<String, Object> selectAllMRList(String m_id, int currentPage, int cntPerPage);
	public int myRecordDelete(MyRecord myrecord);
	public int insertMyRecord(Map<String, Object> myrecord);
	
	public String findId(String id_email);
	public String findPwd(String pwd_id , String pwd_email);
	
}
