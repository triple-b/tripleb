package com.jh.tripleb.suggestions.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jh.tripleb.suggestions.model.dao.SuggestionsDao;
import com.jh.tripleb.suggestions.model.vo.Suggestions;

@Service("sService")
public class SuggestionsServiceImpl implements SuggestionsService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private SuggestionsDao sDao;
	
	@Override
	public int getListCount() {
		return sDao.getListCount(sqlSession);
	}

	
	@Override
	public ArrayList<Suggestions> selectList() {
		return sDao.selectList(sqlSession);
	}

	@Override
	public int insertSug(Suggestions s) {
		return sDao.insertSug(sqlSession, s);
	}

	@Override
	public Suggestions selectSug(int sugNo) {
		return sDao.selectSug(sqlSession, sugNo);
	}
	
	@Override
	public int updateSug(Suggestions s) {
		return sDao.updateSug(sqlSession, s);
	}

}
