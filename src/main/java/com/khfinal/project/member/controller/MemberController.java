package com.khfinal.project.member.controller;

import java.sql.SQLException;
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
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.khfinal.project.artist.model.service.ArtistService;
import com.khfinal.project.artist.model.vo.Artist;
import com.khfinal.project.artist.model.vo.ArtistPlus;
import com.khfinal.project.member.model.service.MemberService;
import com.khfinal.project.member.model.vo.Member;
import com.khfinal.project.member.model.vo.MyArtist;
import com.khfinal.project.schedule.model.vo.Schedule;
import com.khfinal.project.stream.service.streamService;

@Controller
public class MemberController {

	@Autowired
	MemberService ms;
	@Autowired
	ArtistService as;
	@Autowired
	streamService streamservice;

	@RequestMapping("/member/join.do")
	public ModelAndView join() {
		ModelAndView mav = new ModelAndView();

		return mav;
	}

	@RequestMapping("/member/joinimple.do")
	public ModelAndView joinImple(@RequestParam Map<String, Object> commandMap, HttpServletRequest request) throws SQLException {
		ModelAndView mav = new ModelAndView();
		
		int res = ms.insertMember(commandMap);
		if (res < 1) {
			mav.addObject("alertMsg", "회원가입에 실패하였습니다.");
			mav.addObject("url" , request.getContextPath()+"/main/index.do");
			mav.setViewName("common/result");

		} else {
			mav.addObject("alertMsg", "회원가입이 완료되었습니다..");
			mav.addObject("url" , request.getContextPath()+"/member/login.do");
			mav.setViewName("common/result");
		}
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
	public Boolean nickNameCheck(@RequestParam String m_nickname) {

		return ms.nickNameCheck(m_nickname);
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
	
	@RequestMapping("/member/logout.do")
	public ModelAndView logout(HttpSession session,HttpServletRequest request) throws SQLException{

		ModelAndView mav = new ModelAndView();
		Member user = (Member) ((Map<String, Object>) session.getAttribute("loginInfo")).get("member");
		String id = user.getM_id();
		
		if(streamservice.get(id) != null) {
			streamservice.delete(id);
		}

		if (session != null && user != null) {
			session.removeAttribute("loginInfo");
		}

		mav.setViewName("main/index");
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

		// 수정자 : 박혜연
		// 페이지 로드 시, 회원의 myartist(구독) 목록 session에 담기

		HttpSession session = request.getSession();
		Map<String, Object> info = (Map<String, Object>) session.getAttribute("loginInfo");
		Member user = (Member) info.get("member");
		List<MyArtist> myArtistList = ms.myArtistList(user.getM_id());
		mav.addObject("myArtistList", myArtistList);

		// 페이지 로드 시, 시청 기록 목록 session에 담기

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
		// 페이지 로드 시, 회원의 업로드 목록 session에 담기

		HttpSession session = request.getSession();
		Map<String, Object> info = (Map<String, Object>) session.getAttribute("loginInfo");
		Member user = (Member) info.get("member");
		List<Artist> uploadList = as.uploadList(user.getM_id());
		mav.addObject("uploadList", uploadList);

		// 페이지 로드 시, 회원의 스케줄 목록 session에 담기
		List<Schedule> scheduleList = as.scheduleList(user.getM_id());

		if (scheduleList.size() < 5) {
			mav.addObject("scheduleList", scheduleList);
		} else {
			List<Schedule> scheduleList_more = new ArrayList<Schedule>();
			for (int i = 0; i < 5; i++) {
				scheduleList_more.add(i, scheduleList.get(i));
				mav.addObject("scheduleList", scheduleList_more);
			}
		}

		// 한줄 소개 추출 하여 session에 담기
		String word = as.aWord(user.getM_id());

		if (word != null) {
			mav.addObject("word", word);
		} else {
			mav.addObject("word", "한 줄 소개를 작성해주세요.");
		}
		mav.setViewName("member/myPage_artist");

		return mav;
	}
	
	/**
	 * @method : myArtistDelete()
	 * @date : 2020. 6. 19.
	 * @buildBy : 박혜연
	 * @comment : 마이페이지(일반회원) 나의 아티스트 목록 삭제(ajax)
	 */
	@RequestMapping("/member/myArtistDelete.do")
	@ResponseBody
	public Boolean myArtistDelete(HttpServletRequest request) {
		
		int res = 0;
		Boolean decrementRes = true;
		// 삭제 버튼 클릭 시, 해당 버튼이 속한 아티스트의 닉네임 get
		String artist_nick = request.getParameter("artist_nick");
		Map<String, Object> info = (Map<String, Object>) request.getSession().getAttribute("loginInfo");
		Member user = (Member) info.get("member");
		MyArtist user_ma = new MyArtist();
		user_ma.setM_id(user.getM_id());
		user_ma.setm_nickname(artist_nick);
		
		// 회원의 myArtist 중 해당 닉네임 삭제
		
		int deleteRes = ms.myArtistDelete(user_ma);
		
		if(deleteRes > 0) {
			// 회원의 myArtist 에서 삭제되면 해당 nickname을 가진 아티스트의 a_subscribe -1
			res = as.decrementSubscribe(artist_nick);
			
			if(res < 0) {
				decrementRes = false;
			}
		}
		
		return decrementRes;
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
		int aRewriteRes = 0;
		if (info.getM_class() == 2 || info.getM_class() == 3) {
			ArtistPlus aRewrite = new ArtistPlus();
			String word = request.getParameter("WORD");
			if (!word.isEmpty()) {
				aRewrite.setM_id(info.getM_id());
				aRewrite.setM_nickname(info.getM_nickname());
				aRewrite.setA_word(word);
				System.out.println(aRewrite);
				aRewriteRes = as.aWordModify(aRewrite);
				if(aRewriteRes == 0) {
					as.aWordInsert(aRewrite);
				}
			}
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
	
	@RequestMapping("/member/sign_in.do")
	public ModelAndView sign_in(ModelAndView mav ,HttpServletRequest request ,@RequestParam Map<String, Object> commandMap) throws SQLException {
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

//		Date m_join_date = request.getParameter("USER_ID");	// sysdate
//		String m_leave_yn = request.getParameter("USER_ID"); // 'N'
//		String original_filepath = request.getParameter("USER_ID"); // 생성
//		String rename_filepath = request.getParameter("USER_ID");	// 생성.
//		String m_word = request.getParameter("USER_ID");			// 공란 - 차후에 생성
		
		String path = request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
		commandMap.put("urlPath", path);
		ms.mailSending(commandMap);
		
		mav.addObject("alertMsg", "이메일로 인증번호가 발송되었습니다.");
		mav.addObject("url", request.getContextPath() + "/main/index.do");
		mav.setViewName("common/result");
		return mav;
	}
	
	@RequestMapping("/member/idCheck.do")
	@ResponseBody
	public boolean idCheck(@RequestParam String id) {
		return ms.idCheck(id);
	}
	
	@ExceptionHandler(value = SQLException.class)
	public ModelAndView handleException(ModelAndView mav,HttpServletRequest request,Exception e) {

//		String getMessage() : 발생된 예외의 메시지를 리턴한다. 
//		String toString() : 발생된 예외 클래스명과 메시지를 리턴한다. 
//		String pritnStackTrace() : 발생된 예외를 역추적하기 위해 표준 예외 스트림을 출력한다. 
//		예외 발생시 예외가 발생한 곳을 알아낼 때 주로 사용된다. 
		
		mav.addObject("alertMsg", e.getMessage() );
		mav.addObject("url" , request.getContextPath()+"/main/index.do");
		mav.setViewName("common/result");
		return mav;

	}
	
	/**
	 * @method : updatemyArtist()
	 * @date : 2020. 6. 21.
	 * @buildBy : 박혜연
	 * @comment : 아티스트 회원 구독하기
	 */
	@RequestMapping("/member/insertMyArtist.do")
	public Boolean insertMyArtist(HttpServletRequest request) {
		// 최종 결과
		Boolean res = true;
		// 업데이트 결과
		int insertRes = 0;
		int updateRes = 0;
		// 회원의 정보
		Map<String, Object> info = (Map<String, Object>) request.getSession().getAttribute("loginInfo");
		Member user = (Member) info.get("member");
		String m_id = user.getM_id();
		System.out.println(m_id);
		
		// 해당 페이지의 아티스트 nickname
		String m_nickname = request.getParameter("artist_nick");
		System.out.println(m_nickname);
		
		// 회원의 myartist 추가
		MyArtist myArtist = new MyArtist();
		myArtist.setM_id(m_id);
		myArtist.setm_nickname(m_nickname);
		insertRes = ms.insertMyArtist(myArtist);
		
		// 아티스트의 구독자수 a_subscribe +1
		if(insertRes > 0) {
			updateRes = as.plusSubscribe(m_nickname);
		}
		
		if(updateRes > 0) {
			res = true;
		} else {
			res = false;
		}
		
		return res;
		
	}

}
