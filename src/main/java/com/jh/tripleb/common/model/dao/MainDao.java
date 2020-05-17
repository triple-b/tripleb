package com.jh.tripleb.common.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jh.tripleb.calendar.model.vo.Calendar;

@Repository("umDao")
public class MainDao {
	
	public int currentClass(SqlSessionTemplate sqlSession, int tno) {
		return sqlSession.selectOne("mainMapper.currentClass", tno);
	}
	
	public int currentStudent(SqlSessionTemplate sqlSession, int tno) {
		return sqlSession.selectOne("mainMapper.currentStudent", tno);
	}
	
	public int newStudent(SqlSessionTemplate sqlSession, int tno) {
		return sqlSession.selectOne("mainMapper.newStudent", tno);
	}
	
	public int expStudent(SqlSessionTemplate sqlSession, int tno) {
		return sqlSession.selectOne("mainMapper.expStudent", tno);
	}
	
	public String thisMonth(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("mainMapper.thisMonth");
	}
	
	public int thisMonthGoal(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("mainMapper.thisMonthGoal");
	}
	
	public ArrayList<Calendar> todayCal(SqlSessionTemplate sqlSession, int tno) {
		return (ArrayList)sqlSession.selectList("calendarMapper.todayCal", tno);
	}

}
