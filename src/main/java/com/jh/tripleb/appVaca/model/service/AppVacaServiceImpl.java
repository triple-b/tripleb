package com.jh.tripleb.appVaca.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jh.tripleb.appVaca.model.dao.AppVacaDao;
import com.jh.tripleb.appVaca.model.vo.AppVaca;
import com.jh.tripleb.vacation.model.vo.Vacation;

@Service("avSerivce")
public class AppVacaServiceImpl implements AppVacaService{


	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AppVacaDao avDao;

	@Override
	public Vacation avDetail(int vacNo) {
		return avDao.avDetail(sqlSession, vacNo);
	}

	@Override
	public int insertApp(AppVaca av) {
		return avDao.insertApp(sqlSession, av);
	}

	@Override
	public int updateVaca(Vacation v) {
		return avDao.updateVaca(sqlSession, v);
	}

	@Override
	public int insertApp2(AppVaca av) {
		return avDao.insertApp2(sqlSession, av);
	}

	@Override
	public int updateVaca2(Vacation v) {
		return avDao.updateVaca2(sqlSession, v);
	}
}
