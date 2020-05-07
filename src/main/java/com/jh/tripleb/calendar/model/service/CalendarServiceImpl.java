package com.jh.tripleb.calendar.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.jh.tripleb.calendar.model.dao.CalendarDao;
import com.jh.tripleb.calendar.model.vo.Calendar;

public class CalendarServiceImpl implements CalendarService {
	
	@Autowired
	private CalendarDao cDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Calendar> listCalendar() {
		return cDao.listCalendar(sqlSession);
	}

}
