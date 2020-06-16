package com.khfinal.project.schedule.controller;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
		
		Map<String, Object> res = ss.schedule();
		
		
//		HttpSession session = request.getSession();
//	    Member member = (Member) session.getAttribute("loginInfo");
//	    board.setBoardWriter(member.getM_id());
//	    System.out.println("컨트롤러에서 멤버"+member);
		
		
//		if(아트스트면) {
//		데이터 베이스에서 가져오는 기능
//		}else {
//		mav.setViewName("schedule/schedule");
//	}
		
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
	(String startYear, String startMonth, String startDay, String startHour, String startMinute, 
			String endYear, String endMonth, String endDay, String endHour, String endMinute, String as_content, Schedule schedule) {
		ModelAndView mav = new ModelAndView();
		
		String start =  startYear + startMonth + startDay + startHour + startMinute;
		String end = endYear + startMonth + startDay + endHour + endMinute;
		
		schedule.setAs_start_date(start);
		schedule.setAs_end_date(end);
		
		int res = ss.scheduleadd(schedule);
//		mav.setViewName("schedule/schedule");
		
		mav.addObject("url", "/springmvc/schedule/schedule.do");
		mav.setViewName("common/result");
		return mav;
	}
	
}
