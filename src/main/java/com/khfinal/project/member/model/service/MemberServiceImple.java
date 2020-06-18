package com.khfinal.project.member.model.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
	public int infoModify(Member member, List<Map<String, Object>> file) {

		int result = mdao.infoModify(member);
		updateProfile(file);

		return result;
	}

	@Override
	public void updateProfile(List<Map<String, Object>> file) {
		int res = 0;

		for (Map<String, Object> f : file) {

			res = mdao.updateProfile(f);

			MultipartFile mf = (MultipartFile) f.get("file");

			File saveFile = new File((String) f.get("savePath"));

			try {
				mf.transferTo(saveFile);
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	}

	@Override
	public Member reload(String m_id) {
		return mdao.reload(m_id);
	}

	@Override
	public int leave(String m_id) {
		return mdao.leave(m_id);
	}

}
