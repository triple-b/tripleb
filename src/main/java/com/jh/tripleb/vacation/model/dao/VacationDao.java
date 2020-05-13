package com.jh.tripleb.vacation.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jh.tripleb.vacation.model.vo.Vacation;

@Repository("vDao")
public class VacationDao {

	public ArrayList<Vacation> selectList(SqlSessionTemplate sqlSession, int trainerNo){
		return (ArrayList)sqlSession.selectList("vacationMapper.selectList", trainerNo);
	}
	
	public int insertVac(SqlSessionTemplate sqlSession, Vacation v) {
		return sqlSession.insert("vacationMapper.insertVac", v);
	}
	
	public ArrayList<Vacation> selectVList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("vacationMapper.selectVList");
	}
	
	public ArrayList<Vacation> selectMyList(SqlSessionTemplate sqlSession, int trainerNo){
		return (ArrayList)sqlSession.selectList("vacationMapper.selectMyList", trainerNo);
	}
	
	public ArrayList<Vacation> selectAllList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("vacationMapper.selectAllList");
	}
}
