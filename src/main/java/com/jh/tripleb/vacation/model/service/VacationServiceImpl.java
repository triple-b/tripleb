package com.jh.tripleb.vacation.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jh.tripleb.vacation.model.dao.VacationDao;
import com.jh.tripleb.vacation.model.vo.Vacation;

@Service("vService")
public class VacationServiceImpl implements VacationService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private VacationDao vDao;

	@Override
	public ArrayList<Vacation> selectList(int trainerNo) {
		return vDao.selectList(sqlSession, trainerNo);
	}

	@Override
	public int insertVac(Vacation v) {
		return vDao.insertVac(sqlSession, v);
	}

	@Override
	public ArrayList<Vacation> selectVList() {
		return vDao.selectVList(sqlSession);
	}

	@Override
	public ArrayList<Vacation> selectMyList(int trainerNo) {
		return vDao.selectMyList(sqlSession, trainerNo);
	}

	@Override
	public ArrayList<Vacation> selectAllList() {
		return vDao.selectAllList(sqlSession);
	}
}
