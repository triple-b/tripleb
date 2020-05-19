package com.jh.tripleb.trainer.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jh.tripleb.trainer.model.vo.Trainer;

@Repository("tDao")
public class TrainerDao {
	
	public Trainer changeTrainer(SqlSessionTemplate sqlSession, Trainer t) {
		return sqlSession.selectOne("trainerMapper.changeTrainer", t);
	}
	
	public int updateTrainerProfile(SqlSessionTemplate sqlSession, Trainer t) {
		return sqlSession.update("trainerMapper.updateTrainerProfile", t);
	}
	
	public int updateTrainer(SqlSessionTemplate sqlSession, Trainer t) {
		return sqlSession.update("trainerMapper.updateTrainer", t);
	}
	
	public ArrayList<Trainer> listTrainer(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("trainerMapper.listTrainer");
	}
	
	public Trainer detailTrainer(SqlSessionTemplate sqlSession, int tno) {
		return sqlSession.selectOne("trainerMapper.detailTrainer", tno);
	}
	
	public int tnoTrainer(SqlSessionTemplate sqlSession, String tname) {
		return sqlSession.selectOne("trainerMapper.tnoTrainer", tname);
	}
	
	public Trainer searchPhone(SqlSessionTemplate sqlSession, String phone) {
		return sqlSession.selectOne("trainerMapper.serachPhone", phone);
	}
	
	public int changePwd(SqlSessionTemplate sqlSession, Trainer t) {
		return sqlSession.update("trainerMapper.changePwd",t);
	}
	
	public ArrayList<Trainer> selectList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("trainerMapper.selectList");
	}
	
	public Trainer trDetail(SqlSessionTemplate sqlSession, int trainerNo) {
		return sqlSession.selectOne("trainerMapper.trDetail", trainerNo);
	}
	
	public int insertTr(SqlSessionTemplate sqlSession, Trainer t) {
		return sqlSession.insert("trainerMapper.insertTr", t);
	}
	
	public int pwdCheck(SqlSessionTemplate sqlSession, String trainerPwd2) {
		return sqlSession.selectOne("trainerMapper.pwdCheck", trainerPwd2);
	}
	
	public ArrayList<Trainer> expertList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("trainerMapper.expertList");
	}
	
	public ArrayList<Trainer> beginnerList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("trainerMapper.beginnerList");
	}
	
	public int deleteTr(SqlSessionTemplate sqlSession, int checkArr) {
		return sqlSession.update("trainerMapper.deleteTr", checkArr);
	}
	
	public int trEndDate(SqlSessionTemplate sqlSession, int checkArr) {
		return sqlSession.update("trainerMapper.trEndDate", checkArr);
	}
	
	public Trainer selectTr(SqlSessionTemplate sqlSession, int trainerNo) {
		return sqlSession.selectOne("trainerMapper.selectTr", trainerNo);
	}
	
	public int updateECheck(SqlSessionTemplate sqlSession, Trainer t) {
		return sqlSession.update("trainerMapper.updateECheck", t);
	}
	
	public int updateSCheck(SqlSessionTemplate sqlSession, Trainer t) {
		return sqlSession.update("trainerMapper.updateSCheck", t);
	}
	
	public Trainer calendarDetail(SqlSessionTemplate sqlSession, String tname) {
		return sqlSession.selectOne("trainerMapper.calendarDetail", tname);
	}
}
