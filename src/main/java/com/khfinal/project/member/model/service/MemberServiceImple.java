package com.khfinal.project.member.model.service;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.khfinal.project.member.model.dao.MemberDao;
import com.khfinal.project.member.model.dao.MyArtistDao;
import com.khfinal.project.member.model.dao.MyRecordDao;
import com.khfinal.project.member.model.vo.Member;
import com.khfinal.project.member.model.vo.MyArtist;
import com.khfinal.project.member.model.vo.MyRecord;

import common.util.Paging;

@Service
public class MemberServiceImple implements MemberService {

	@Autowired
	MemberDao mdao;
	@Autowired
	MyArtistDao madao;
	@Autowired
	MyRecordDao mrdao;
	@Autowired
	JavaMailSender mailSender;
	
	public MemberServiceImple() {

	}

	// @Transactional
	@Transactional(rollbackFor = SQLException.class)	// throw exception 은 이렇게잡아줌.
	public int insertMember(Map<String, Object> commandMap) throws SQLException {
		int res = 0;
		
		if(mdao.idExist(commandMap) < 1) {
			res = mdao.insertMember(commandMap);
		}
		// CheckedException 
		// throw new SQLException();
		return res;
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
	public Boolean nickNameCheck(String nickname) {
		String m_nickname = mdao.nickNameCheck(nickname);
		
		if(m_nickname != null) {
			return false;
		}
		return true;
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

	@Override
	public List<MyArtist> myArtistList(String m_id) {
		return madao.myArtistList(m_id);
	}

	@Override
	public int myArtistDelete(MyArtist myartist) {
		return madao.myArtistDelete(myartist);
		
	}
	
	public boolean idCheck(String m_id) {
		// TODO Auto-generated method stub
		String id = mdao.idCheck(m_id);
		
		if(id != null) return false;
		return true;
	}
	
	public void mailSending(Map<String, Object> commandMap) {
//		m_id
//		m_pass
//		m_class
//		m_name
//		m_nickname
//		m_tell1
//		m_tell2
//		m_tell3
//		bith_yy
//		bith_mm
//		bith_dd
//		m_email1
//		m_email2
//		zipcode
//		address
//		address_etc

		// 발신자메일
		String from = "enswjs62@gmail.com";
		String tomail = commandMap.get("m_email1") + "@" + commandMap.get("m_email2");
//		String m_tell = (String)commandMap.get("m_tell1") + commandMap.get("m_tell2") + commandMap.get("m_tell3");
		String title = "가입을 환영합니다.";
		String htmlBody = "<form action='http://" + commandMap.get("urlPath")
				+ "/member/joinimple.do' method='post'><h3>회원가입을 환영합니다.</h3>" + 
				"<input type='hidden' value='"+ commandMap.get("m_id") + "' name='m_id'>" + 
				"<input type='hidden' value='"+ commandMap.get("m_pass") + "' name='m_pass'>" + 
				"<input type='hidden' value='"+ commandMap.get("m_class") + "' name='m_class'>" + 
				"<input type='hidden' value='"+ commandMap.get("m_name") + "' name='m_name'>" + 
				"<input type='hidden' value='"+ commandMap.get("m_nickname") + "' name='m_nickname'>" + 
				"<input type='hidden' value='"+ commandMap.get("m_tell1") + "' name='m_tell1'>" + 
				"<input type='hidden' value='"+ commandMap.get("m_tell2") + "' name='m_tell2'>" + 
				"<input type='hidden' value='"+ commandMap.get("m_tell3") + "' name='m_tell3'>" + 
				"<input type='hidden' value='"+ commandMap.get("bith_yy") + "' name='bith_yy'>" + 
				"<input type='hidden' value='"+ commandMap.get("bith_mm") + "' name='bith_mm'>" + 
				"<input type='hidden' value='"+ commandMap.get("bith_dd") + "' name='bith_dd'>" + 
				"<input type='hidden' value='"+ commandMap.get("m_email1") + "' name='m_email1'>" + 
				"<input type='hidden' value='"+ commandMap.get("m_email2") + "' name='m_email2'>" + 
				"<input type='hidden' value='"+ commandMap.get("zipcode") + "' name='zipcode'>" + 
				"<input type='hidden' value='"+ commandMap.get("address") + "' name='address'>" + 
				"<input type='hidden' value='"+ commandMap.get("address_etc") + "' name='address_etc'>" + 
//				"<input type='hidden' value='"+ tomail + "' name='m_email'>" + 
//				"<input type='hidden' value='"+ m_tell + "' name='m_tell'>" + 
				"<button type='submit'>가입하기</form>";

		// 메일 발송해주는 코드
		// Template CallBack 패턴
		// 장점 : 빈에 등록을 안해도 된다.
		// 전략패턴과 동일한 용도로 사용되는 디자인 패턴 > 주입되는 객체가 내부 익명클래스 이다.
		mailSender.send(new MimeMessagePreparator() {
			public void prepare(MimeMessage mimeMessage) throws MessagingException {
				MimeMessageHelper message = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				message.setFrom(from);
				message.setTo(tomail);
				message.setSubject(title);
				message.setText(htmlBody, true);
				// message.addInline("myLogo", new ClassPathResource("img/mylogo.gif"));
				// message.addAttachment("myDocument.pdf", new
				// ClassPathResource("doc/myDocument.pdf"));
			}
		});
	}
	
	public int insertMyArtist(MyArtist myartist) {
		return madao.insertMyArtist(myartist);
	}

	@Override
	public int selectSame(MyArtist myartist) {
		return madao.selectSame(myartist);
	}

	@Override
	public List<Map<String, Object>> maplusprofile(String m_id) {
		return madao.maplusprofile(m_id);
	}

	@Override
	public Map<String, Object> selectAllMRList(String m_id, int currentPage, int cntPerPage) {
		Map<String, Object> result = new HashMap<String, Object>();
		
		Paging page = new Paging(mrdao.contentCntMr(m_id), currentPage, cntPerPage);

		List<MyRecord> mrlist = mrdao.selectMRList(m_id, page);
		result.put("paging", page);
		result.put("mrlist", mrlist);
		
		return result;
	}

	@Override
	public List<MyRecord> myRecordList(String m_id) {
		return mrdao.myRecordList(m_id);
	}

	@Override
	public int myRecordDelete(MyRecord myrecord) {
		return mrdao.myRecordDelete(myrecord);
	}

}
