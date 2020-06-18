package com.khfinal.project.member.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.khfinal.project.artist.model.service.ArtistService;
import com.khfinal.project.artist.model.vo.Artist;
import com.khfinal.project.member.model.service.MemberService;
import com.khfinal.project.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	MemberService ms;
	@Autowired
	ArtistService as;

	@RequestMapping("/member/join.do")
	public ModelAndView join() {
		ModelAndView mav = new ModelAndView();

		return mav;
	}

	@RequestMapping("/member/joinImple.do")
	public ModelAndView joinImple() {
		ModelAndView mav = new ModelAndView();

		return mav;
	}

	/**
	 * @method : nickNameCheck()
	 * @date : 2020. 6. 15.
	 * @buildBy : 박혜연
	 * @comment : 닉네임 중복 체크(ajax)
	 */
	@RequestMapping("/member/nicknamecheck.do")
	@ResponseBody
	public String nickNameCheck(HttpServletRequest request) {

		return ms.nickNameCheck(request.getParameter("NICKNAME"));
	}

	@RequestMapping("/member/login.do")
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView();

		return mav;
	}

	@RequestMapping("/member/loginImple.do")
	public ModelAndView loginImple() {
		ModelAndView mav = new ModelAndView();

		return mav;
	}

	// ### ### test loging ### ###
	@RequestMapping("/member/loginConfirm.do")
	public ModelAndView loginConfirm(ModelAndView mav, HttpServletRequest request) {

		Map<String, Object> commandMap = new HashMap<String, Object>();

		commandMap.put("userID", (String) request.getParameter("userID"));
		commandMap.put("userPWD", (String) request.getParameter("userPWD"));

		Member member = ms.loginConfirm(commandMap);

		// 반환되는 로그인값x
		if (member == null) {
			mav.addObject("alertMsg", "로그인에 실패하셨습니다.");
			mav.addObject("url", request.getContextPath() + "/member/login.do");
			mav.setViewName("common/result");
		} else {
			HttpSession session = request.getSession();

			Map<String, Object> map = new HashMap<String, Object>();
			// 수정자 : 박혜연
			// 기존 user_name 키값의 경우 사용 시 혼동의 소지가 있어 vo 및 db에 기록된 컬럼명으로 변경
			// > 기존 loginInfo에 id 값만 들어가 있어 mypage 로드 시, 기타 정보 누락되어 member 전체 내용 저장
			map.put("member", member);
			session.setAttribute("loginInfo", map);

			// 수정자: 박혜연
			// 수정 필요 내용 : main 페이지 진입 시, 랜덤/베스트 콘텐츠 노출을 위해
			// mainController 의 index() 메소드 필요함
			mav.addObject("todayList", as.todayList());
			mav.addObject("bestContent", as.bestContent());

			mav.setViewName("main/index");
		}

		return mav;
	}

	/**
	 * @method : myPage()
	 * @date : 2020. 6. 11.
	 * @buildBy : 박혜연
	 * @comment : 로그인 후, 해당 id를 가진 사람의 mypage로 이동 (일반 회원)
	 */
	@RequestMapping("/member/myPage.do")
	public ModelAndView myPage(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("member/myPage");

		return mav;
	}

	/**
	 * @method : myPage()
	 * @date : 2020. 6. 14.
	 * @buildBy : 박혜연
	 * @comment : 로그인 후, 해당 id를 가진 사람의 mypage로 이동 (아티스트 회원)
	 */
	@RequestMapping("/member/myPageArtist.do")
	public ModelAndView myPageArtist(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		// 수정자 : 박혜연
		// 페이지 로드 시, 회원의 업로드 목록 및 스케줄 내용 session에 담기

		HttpSession session = request.getSession();
		Map<String, Object> info = (Map<String, Object>) session.getAttribute("loginInfo");
		Member user = (Member) info.get("member");
		List<Artist> uploadList = as.uploadList(user.getM_id());

		String word = as.auWord(user.getM_id());

		mav.addObject("uploadList", uploadList);
		if (word != null) {
			mav.addObject("word", word);
		} else {
			mav.addObject("word", "한 줄 소개를 작성해주세요.");
		}
		mav.setViewName("member/myPage_artist");

		return mav;
	}

	/**
	 * @method : infoModify()
	 * @date : 2020. 6. 15.
	 * @buildBy : 박혜연
	 * @comment : 마이페이지 회원정보 수정
	 */
	@RequestMapping("/member/infoModify.do")
	public ModelAndView infoModify(HttpServletRequest request, @RequestParam List<MultipartFile> profile) {
		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();
		Map<String, Object> loginInfo = (Map<String, Object>) session.getAttribute("loginInfo");
		String savePath = "";
		String originFileName = ""; // 프로필 사진 변경을 위해 입력한 파일의 원래 이름
		String renameFile = ""; // db에 등록하기 위한 새로운 파일 이름

		// 프로필 사진 변경 시, upload 폴더 저장
		// 파일을 저장하는 코드
		List<Map<String, Object>> file = new ArrayList<Map<String, Object>>();
		String root = request.getSession().getServletContext().getRealPath("/");

		System.out.println(root);

		int i = 0;
		for (MultipartFile mf : profile) {
			savePath = root + "resources/upload/";
			originFileName = mf.getOriginalFilename();
			HashMap<String, Object> data = new HashMap<>();

			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");

			renameFile = sdf.format(new Date()) + i + "."
					+ originFileName.substring(originFileName.lastIndexOf(".") + 1);

			savePath += renameFile;

			data.put("originFileName", originFileName);
			data.put("renameFile", renameFile);
			data.put("savePath", savePath);
			data.put("file", mf);

			file.add(data);
			i++;
			for (int ai = 0; ai < file.size(); ai++) {
				System.out.println("파일" + file);
			}
		}

		// 기존 회원 정보
		Member info = (Member) loginInfo.get("member");

		// 새로 기입된 회원 정보
		String nickname = request.getParameter("NICKNAME");
		String m_pass = request.getParameter("USER_PWD");
		String m_tell1 = request.getParameter("USER_TELL1");
		String m_tell2 = request.getParameter("USER_TELL2");
		String m_tell3 = request.getParameter("USER_TELL3");
		String m_mail = request.getParameter("USER_MAIL");
		String m_mail2 = request.getParameter("USER_MAIL2");

		// 기입된 정보들이 null 아닐 때만 info의 값 변경
		if (nickname != null) {
			info.setM_nickname(nickname);
		}

		if (m_pass != null) {
			info.setM_pass(m_pass);
		}

		if (m_tell1 != null) {
			info.setM_tell1(m_tell1);
		}

		if (m_tell2 != null) {
			info.setM_tell2(m_tell2);
		}

		if (m_tell3 != null) {
			info.setM_tell3(m_tell3);
		}

		if (m_mail != null) {
			info.setM_email1(m_mail);
		}

		if (m_mail2 != null) {
			info.setM_email2(m_mail2);
		}

		if (originFileName != "") {
			info.setRename_filepath(renameFile);
		}

		// rewrite 값들을 update한 후의 결과 값
		int result = ms.infoModify(info, file);
		Member newInfo = null;
		if (result > 0) {
			newInfo = ms.reload(info.getM_id());
		}

		// artist 회원의 경우 '한줄소개' 입력
		Artist aRewrite = new Artist();
		String word = request.getParameter("WORD");
		if (!word.isEmpty()) {
			aRewrite.setM_id(info.getM_id());
			aRewrite.setAu_word(word);
			as.auWordModify(aRewrite);

		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member", newInfo);
		session.setAttribute("loginInfo", map);

		mav.addObject("todayList", as.todayList());
		mav.addObject("bestContent", as.bestContent());
		mav.setViewName("main/index");

		return mav;
	}

	/**
	 * @method : withdrawal()
	 * @date : 2020. 6. 16.
	 * @buildBy : 박혜연
	 * @comment : 회원 탈퇴 시, 비밀번호 확인 페이지로 이동
	 */
	@RequestMapping("/member/withdrawal.do")
	public ModelAndView withdrawal(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("member/withdrawal");

		return mav;
	}

	/**
	 * @method : leave()
	 * @date : 2020. 6. 16.
	 * @buildBy : 박혜연
	 * @comment : 회원 탈퇴 시, 비밀번호 확인 페이지로 이동
	 */
	@RequestMapping("/member/leave.do")
	public ModelAndView leave(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		// 비밀번호 입력 후 확인 클릭 시, id와 pwd 넘겨서 동일한 회원의 leave_YN 값 'Y'로 변경
		HttpSession session = request.getSession();
		Map<String, Object> loginInfo = (Map<String, Object>) session.getAttribute("loginInfo");
		Member info = (Member) loginInfo.get("member");

		// 로그인한 회원의 id와 pwd
		String m_id = info.getM_id();
		String m_pass = info.getM_pass();

		// 확인용으로 입력받은 password
		String pwd = request.getParameter("pwd");

		if (m_pass.equals(pwd)) {
			// 같으면 해당 id 회원의 leave_YN 값 'Y'로 변경
			int leave = ms.leave(m_id);
			// header에 위치한 loginInfo 삭제
			session.removeAttribute("loginInfo");
			mav.addObject("todayList", as.todayList());
			mav.addObject("bestContent", as.bestContent());
			mav.setViewName("main/index");
		} else {
			// alert 띄우기
			mav.addObject("alertMsg", "비밀번호가 올바르지 않습니다. 다시 한 번 확인해주세요.");
			mav.addObject("url", "/springmvc/member/withdrawal.do");
			mav.setViewName("common/result");
		}

		return mav;
	}

}
