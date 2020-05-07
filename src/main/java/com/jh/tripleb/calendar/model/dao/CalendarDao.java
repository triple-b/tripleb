package com.jh.tripleb.calendar.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jh.tripleb.calendar.model.vo.Calendar;

@Repository
public class CalendarDao {
	
	public ArrayList<Calendar> listCalendar(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("calendarMapper.selectListCalendar");
	}

}
