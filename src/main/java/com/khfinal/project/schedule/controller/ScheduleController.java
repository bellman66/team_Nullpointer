package com.khfinal.project.schedule.controller;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.khfinal.project.member.model.vo.Member;
import com.khfinal.project.schedule.model.service.ScheduleService;
import com.khfinal.project.schedule.model.vo.Schedule;

@Controller
public class ScheduleController {
	@Autowired
	ScheduleService ss;
	
	/**
	 * @method : schedule
	 * @date : 2020. 6. 16.
	 * @buildBy : 김경호
	 * @comment : 스케줄 달력 보여주는 메소드
	 */
	@RequestMapping("/schedule/schedule.do")
	public ModelAndView schedule(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Schedule schedule = new Schedule();
		
		Map<String, Object> res = new HashMap<String, Object>();
		
		HttpSession session = request.getSession();
	    Map<String, Object> login =  (Map<String, Object>) session.getAttribute("loginInfo");
//	    Member member = (Member) login.get("member");
//	    
//	    
//	    System.out.println("이거 나오면 대박" + member.getM_class());
//	    
//	    System.out.println("컨트롤러에서 멤버"+member);
//	    System.out.println(schedule.getM_id());
		
		
		if(login != null) {
			Member member = (Member) login.get("member");
			if(member.getM_class() != 1) {
				schedule.setM_id(member.getM_id());
				res = ss.schedule(schedule);
			}else {
				res = ss.rentSchedule();
			}
		}else {
			mav.addObject("rent", "rent");
			res = ss.rentSchedule();
		}
		
		System.out.println("컨트롤러 res "+res);
		mav.addObject("scheduleList", res);
		mav.setViewName("schedule/schedule");
		return mav;
	}

	
	
	/**
	 * @method : add
	 * @date : 2020. 6. 16.
	 * @buildBy : 김경호
	 * @comment : 스케줄 추가하는 창으로 이동시켜주는 메서드
	 */
	@RequestMapping("/schedule/add.do")
	public ModelAndView add() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("schedule/schedule_add");
		return mav;
	}
	/**
	 * @method : scheduleadd
	 * @date : 2020. 6. 16.
	 * @buildBy : 김경호
	 * @comment : 스케줄을 디비에 입력하는 메서드
	 */
	@RequestMapping("/schedule/scheduleadd.do")
	public ModelAndView scheduleadd
	(HttpServletRequest request, String startYear, String startMonth, String startDay, String startHour, String startMinute, 
			String endYear, String endMonth, String endDay, String endHour, String endMinute, String as_content, Schedule schedule) {
		ModelAndView mav = new ModelAndView();
		
		String start =  startYear + startMonth + startDay + startHour + startMinute;
		String end = endYear + startMonth + startDay + endHour + endMinute;
		
		HttpSession session = request.getSession();
	    Map<String, Object> login =  (Map<String, Object>) session.getAttribute("loginInfo");
	    Member member = (Member) login.get("member");
	    
	    
	    schedule.setM_id(member.getM_id());
		schedule.setAs_start_date(start);
		schedule.setAs_end_date(end);
		
		int res = ss.scheduleadd(schedule);
//		mav.setViewName("schedule/schedule");
		
		mav.addObject("url", "/springmvc/schedule/schedule.do");
		mav.addObject("alert", "일정이 추가 되었습니다.");
		mav.setViewName("common/result");
		return mav;
	}
	/**
	 * @method : rentSchedule
	 * @date : 2020. 6. 17.
	 * @buildBy : 김경호
	 * @comment : 메인 렌트 스케줄 보여주는 메서드
	 */
	@RequestMapping("/schedule/rendSchedule.do")
	public ModelAndView rentSchedule() {
		ModelAndView mav = new ModelAndView();
		
		Map<String, Object> res = ss.rentSchedule();
		
		mav.addObject("scheduleList", res);
		mav.addObject("rent", "rent");
		mav.setViewName("schedule/schedule");
		return mav;
	}
	
	/**
	 * @method : rendAdd
	 * @date : 2020. 6. 17.
	 * @buildBy : 김경호
	 * @comment : 메인 렌트 스케줄 추가하는 창으로 이동시켜주는 메서드
	 */
	@RequestMapping("/schedule/rentAdd.do")
	public ModelAndView rendAdd() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("schedule/rent_request");
		return mav;
	}
	
	@RequestMapping("/schedule/rentadd.do")
	public ModelAndView rentAdd(HttpServletRequest request, String startYear, String startMonth, String startDay, String startHour, String startMinute, 
			String endYear, String endMonth, String endDay, String endHour, String endMinute, String as_content,  Schedule schedule) {
		ModelAndView mav = new ModelAndView();
		String start =  startYear + startMonth + startDay + startHour + startMinute;
		String end = endYear + startMonth + startDay + endHour + endMinute;
		
		HttpSession session = request.getSession();
	    Map<String, Object> login =  (Map<String, Object>) session.getAttribute("loginInfo");
	    Member member = (Member) login.get("member");
	    
	    
	    schedule.setM_id(member.getM_id());
		schedule.setAs_start_date(start);
		schedule.setAs_end_date(end);
		
		int res = ss.rentAdd(schedule);
		
		mav.addObject("url", "/springmvc/schedule/rendSchedule.do");
		mav.addObject("alert", "일정이 추가 되었습니다.");
		mav.setViewName("common/result");
		return mav;
	}
}
