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
	
	public String product1(SqlSessionTemplate sqlSession, int tno) {
		return sqlSession.selectOne("mainMapper.product1", tno);
	}
	
	public String product2(SqlSessionTemplate sqlSession, int tno) {
		return sqlSession.selectOne("mainMapper.product2", tno);
	}
	
	public String product3(SqlSessionTemplate sqlSession, int tno) {
		return sqlSession.selectOne("mainMapper.product3", tno);
	}
	
	public String productAvg1(SqlSessionTemplate sqlSession, int tCount) {
		return sqlSession.selectOne("mainMapper.productAvg1", tCount);
	}
	
	public String productAvg2(SqlSessionTemplate sqlSession, int tCount) {
		return sqlSession.selectOne("mainMapper.productAvg2", tCount);
	}
	
	public String productAvg3(SqlSessionTemplate sqlSession, int tCount) {
		return sqlSession.selectOne("mainMapper.productAvg3", tCount);
	}
	
	public String trainerCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("mainMapper.trainerCount");
	}
	
	public String productName1(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("mainMapper.productName1");
	}
	
	public String productName2(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("mainMapper.productName2");
	}
	
	public String productName3(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("mainMapper.productName3");
	}

}
