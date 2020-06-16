package com.khfinal.project.member.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartRequest;
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
		mav.addObject("uploadList", uploadList);

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
	public ModelAndView infoModify(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();
		Map<String, Object> loginInfo = (Map<String, Object>) session.getAttribute("loginInfo");
		Member info = (Member) loginInfo.get("member");
		
		// 프로필 사진 변경 시, upload 폴더 저장
		
		
		// 새로 기입된 회원정보
		Member rewrite = new Member();
		rewrite.setM_id(info.getM_id());
		rewrite.setM_name(info.getM_id());
		rewrite.setM_nickname(request.getParameter("NICKNAME"));
		rewrite.setM_pass(request.getParameter("USER_PWD"));
		rewrite.setM_tell1(request.getParameter("USER_TELL1"));
		rewrite.setM_tell2(request.getParameter("USER_TELL2"));
		rewrite.setM_tell3(request.getParameter("USER_TELL3"));
		rewrite.setM_email1(request.getParameter("USER_MAIL"));
		rewrite.setM_email2(request.getParameter("USER_MAIL2"));
		//rewrite.setRename_filepath(rename_filepath);

		Artist aRewrite = new Artist();
		aRewrite.setM_id(info.getM_id());
		aRewrite.setM_word(request.getParameter("WORD"));

		// rewrite 값들을 update한 후의 결과 값
		int result = ms.infoModify(rewrite);
		if (result > 0) {
			Member newInfo = ms.reload(info.getM_id());
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.replace("member", result);
		session.setAttribute("loginInfo", map);

		mav.setViewName("main/index");

		return mav;
	}
}
