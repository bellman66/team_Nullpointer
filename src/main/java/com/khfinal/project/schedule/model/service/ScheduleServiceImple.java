package com.khfinal.project.schedule.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khfinal.project.schedule.model.dao.ScheduleDao;
import com.khfinal.project.schedule.model.vo.Schedule;

@Service
public class ScheduleServiceImple implements ScheduleService {
	
	@Autowired
	ScheduleDao sd;

	@Override
	public Map<String, Object> schedule(Schedule schedule) {
		Map<String, Object> res = new HashMap<String, Object>();
		
		List<Schedule> slist = sd.schedule(schedule);
		
		res.put("slist", slist);
		return res;
	}
	
	@Override
	public Map<String, Object> rentSchedule() {
		Map<String, Object> res = new HashMap<String, Object>();
		
		List<Schedule> slist = sd.rentSchedule();
		res.put("slist", slist);
		return res;
	}

	
	@Override
	public int scheduleadd(Schedule schedule) {
		int res = sd.scheduleadd(schedule);
		return res;
	}

	@Override
	public int rentAdd(Schedule schedule) {
		int res = sd.rentAdd(schedule);
		return res;
	}

	@Override
	public int scdelete(String scdelete) {
		int res = sd.scdelete(scdelete);
		return res;
	}




}
