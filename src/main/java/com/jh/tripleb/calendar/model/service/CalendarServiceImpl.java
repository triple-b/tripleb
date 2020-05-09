package com.jh.tripleb.calendar.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jh.tripleb.calendar.model.dao.CalendarDao;
import com.jh.tripleb.calendar.model.vo.Calendar;

@Service("ucService")
public class CalendarServiceImpl implements CalendarService {
	
	@Autowired
	private CalendarDao ucDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Calendar> listCalendar() {
		return ucDao.listCalendar(sqlSession);
	}

	@Override
	public int insertCalendar(Calendar c) {
		return ucDao.insertCalendar(sqlSession, c);
	}

	@Override
	public int updateCalendar(Calendar c) {
		return ucDao.updateCalendar(sqlSession, c);
	}

	@Override
	public int deleteCalendar(Calendar c) {
		return ucDao.deleteCalendar(sqlSession, c);
	}

}
