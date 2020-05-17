package com.jh.tripleb.common.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jh.tripleb.calendar.model.vo.Calendar;
import com.jh.tripleb.common.model.dao.MainDao;

@Service("umService")
public class MainServiceImpl implements MainService {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	@Autowired
	MainDao umDao;

	@Override
	public int currentClass(int tno) {
		return umDao.currentClass(sqlSession, tno);
	}

	@Override
	public int currentStudent(int tno) {
		return umDao.currentStudent(sqlSession, tno);
	}

	@Override
	public int newStudent(int tno) {
		return umDao.newStudent(sqlSession, tno);
	}

	@Override
	public int expStudent(int tno) {
		return umDao.expStudent(sqlSession, tno);
	}

	@Override
	public String thisMonth() {
		return umDao.thisMonth(sqlSession);
	}

	@Override
	public int thisMonthGoal() {
		return umDao.thisMonthGoal(sqlSession);
	}

	@Override
	public ArrayList<Calendar> todayCal(int tno) {
		return umDao.todayCal(sqlSession, tno);
	}
	

}
