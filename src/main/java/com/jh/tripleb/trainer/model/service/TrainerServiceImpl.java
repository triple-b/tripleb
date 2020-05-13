package com.jh.tripleb.trainer.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jh.tripleb.trainer.model.dao.TrainerDao;
import com.jh.tripleb.trainer.model.vo.Trainer;

@Service("tService") 
public class TrainerServiceImpl implements TrainerService{
	
	@Autowired
	public TrainerDao tDao;
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public Trainer changeTrainer(Trainer t) {
		return tDao.changeTrainer(sqlSession, t);
	}
	
	@Override
	public int updateTrainerProfile(Trainer t) {
		return tDao.updateTrainerProfile(sqlSession, t);
	}

	@Override
	public ArrayList<Trainer> listTrainer() {
		return tDao.listTrainer(sqlSession);
	}

	@Override
	public Trainer detailTrainer(int tno) {
		return tDao.detailTrainer(sqlSession, tno);
	}

	@Override
	public Trainer searchPhone(String phone) {
		return tDao.searchPhone(sqlSession, phone);
	}

	@Override
	public int changePwd(Trainer t) {
		return tDao.changePwd(sqlSession, t);
	}



}
