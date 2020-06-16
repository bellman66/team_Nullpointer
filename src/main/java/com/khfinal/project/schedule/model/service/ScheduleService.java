package com.khfinal.project.schedule.model.service;

import java.util.Map;

import com.khfinal.project.schedule.model.vo.Schedule;

public interface ScheduleService {

	public Map<String, Object> schedule();
	
	public int scheduleadd(Schedule schedule);
}
