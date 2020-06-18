package com.khfinal.project.schedule.model.service;

import java.util.Map;

import com.khfinal.project.schedule.model.vo.Schedule;

public interface ScheduleService {

	public Map<String, Object> schedule(Schedule schedule);
	
	public Map<String, Object> rentSchedule();
	
	public int scheduleadd(Schedule schedule);
	
	public int rentAdd(Schedule schedule);
	
	public int scdelete(String scdelete);
}
