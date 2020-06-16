package com.khfinal.project.schedule.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.khfinal.project.schedule.model.vo.Schedule;

@Repository
public class ScheduleDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List<Schedule> schedule(Schedule schedule){
		return sqlSession.selectList("Schedule.schedule", schedule);
	}
	
	public List<Schedule> rentSchedule(){
		return sqlSession.selectList("Schedule.rentSchedule");
	}
	
	public int scheduleadd(Schedule schedule) {
		return sqlSession.insert("Schedule.scheduleadd", schedule);
		
	}
	
	public int rentAdd(Schedule schedule) {
		return sqlSession.insert("Schedule.rentAdd", schedule);
	}
}
