package com.jh.tripleb.calendar.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jh.tripleb.calendar.model.vo.Calendar;

@Repository("ucDao")
public class CalendarDao {
	
	public ArrayList<Calendar> listCalendar(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("calendarMapper.selectListCalendar");
	}
	
	public int insertCalendar(SqlSessionTemplate sqlSession, Calendar c) {
		return sqlSession.insert("calendarMapper.insertCalendar", c);
	}
	
	public int updateCalendar(SqlSessionTemplate sqlSession, Calendar c) {
		return sqlSession.update("calendarMapper.updateCalendar", c);
	}
	
	public int deleteCalendar(SqlSessionTemplate sqlSession, Calendar c) {
		return sqlSession.update("calendarMapper.deleteCalendar", c);
	}
}
