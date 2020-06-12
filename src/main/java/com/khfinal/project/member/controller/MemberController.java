package com.khfinal.project.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.khfinal.project.artist.model.service.ArtistService;
import com.khfinal.project.controller.mainController;
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
	public ModelAndView loginConfirm(ModelAndView mav , HttpServletRequest request) {
		
		Map<String , Object> commandMap = new HashMap<String, Object>();

		commandMap.put("userID", (String) request.getParameter("userID"));
		commandMap.put("userPWD", (String) request.getParameter("userPWD"));
		
		Member member = ms.loginConfirm(commandMap);
		
		// 반환되는 로그인값x
		if(member == null) {
			mav.addObject("alertMsg" , "로그인에 실패하셨습니다.");
			mav.addObject("url" , request.getContextPath()+"/member/login.do");
			mav.setViewName("common/result");
		}
		else {
			HttpSession session = request.getSession();
			
			Map<String , Object> map = new HashMap<String, Object>();
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
	 * @comment : 로그인 후, 해당 id를 가진 사람의 mypage로 이동
	 */
	@RequestMapping("/member/myPage.do")
	public ModelAndView myPage(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("member/myPage");
		
		return mav;
	}
}
