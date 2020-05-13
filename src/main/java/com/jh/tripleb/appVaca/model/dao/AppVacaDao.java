package com.jh.tripleb.appVaca.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jh.tripleb.appVaca.model.vo.AppVaca;
import com.jh.tripleb.vacation.model.vo.Vacation;

@Repository("avDao")
public class AppVacaDao {

	public Vacation avDetail(SqlSessionTemplate sqlSession, int vacNo) {
		return sqlSession.selectOne("appVacaMapper.avDetail", vacNo);
	}
	
	public int insertApp(SqlSessionTemplate sqlSession, AppVaca av) {
		return sqlSession.insert("appVacaMapper.insertAppVc", av);
	}
	
	public int updateVaca(SqlSessionTemplate sqlSession, Vacation v) {
		return sqlSession.update("appVacaMapper.updateVaca", v);
	}
	
	public int insertApp2(SqlSessionTemplate sqlSession, AppVaca av) {
		return sqlSession.insert("appVacaMapper.insertAppVc2", av);
	}
	
	public int updateVaca2(SqlSessionTemplate sqlSession, Vacation v) {
		return sqlSession.update("appVacaMapper.updateVaca2", v);
	}
}
