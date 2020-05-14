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

	@Override
	public ArrayList<Trainer> selectList() {
		return tDao.selectList(sqlSession);
	}

	@Override
	public Trainer trDetail(int trainerNo) {
		return tDao.trDetail(sqlSession, trainerNo);
	}

	@Override
	public int insertTr(Trainer t) {
		return tDao.insertTr(sqlSession, t);
	}

	@Override
	public int pwdCheck(String trainerPwd2) {
		return tDao.pwdCheck(sqlSession, trainerPwd2);
	}

	@Override
	public ArrayList<Trainer> expertList() {
		return tDao.expertList(sqlSession);
	}

	@Override
	public ArrayList<Trainer> beginnerList() {
		return tDao.beginnerList(sqlSession);
	}

	@Override
	public int deleteTr(int checkArr) {
		return tDao.deleteTr(sqlSession, checkArr);
	}

	@Override
	public int trEndDate(int checkArr) {
		return tDao.trEndDate(sqlSession, checkArr);
	}

	@Override
	public Trainer selectTr(int trainerNo) {
		return tDao.selectTr(sqlSession, trainerNo);
	}

}
