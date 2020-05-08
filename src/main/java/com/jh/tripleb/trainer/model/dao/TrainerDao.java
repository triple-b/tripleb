package com.jh.tripleb.trainer.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jh.tripleb.trainer.model.vo.Trainer;

@Repository("tDao")
public class TrainerDao {
	
	public Trainer loginTrainer(SqlSessionTemplate sqlSession, Trainer t) {
		return sqlSession.selectOne("trainerMapper.loginTrainer", t);
	}
	
	public Trainer changeTrainer(SqlSessionTemplate sqlSession, Trainer t) {
		
		return sqlSession.selectOne("trainerMapper.changeTrainer", t);
	}
	
	public int updateTrainerProfile(SqlSessionTemplate sqlSession, Trainer t) {
		return sqlSession.update("trainerMapper.updateTrainerProfile", t);
	}
	
	public ArrayList<Trainer> calListTrainer(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("trainerMapper.calListTrainer");
	}

}
