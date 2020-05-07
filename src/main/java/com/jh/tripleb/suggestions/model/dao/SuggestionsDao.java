package com.jh.tripleb.suggestions.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jh.tripleb.suggestions.model.vo.Suggestions;

@Repository("sDao")
public class SuggestionsDao {

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("suggestionsMapper.getListCount");
	}
	
	public ArrayList<Suggestions> selectList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("suggestionsMapper.selectList", null);
	}
	
	public int insertSug(SqlSessionTemplate sqlSession, Suggestions s) {
		return sqlSession.insert("suggestionsMapper.insertSug", s);
	}
	
	public Suggestions selectSug(SqlSessionTemplate sqlSession, int sugNo) {
		return sqlSession.selectOne("suggestionsMapper.selectSug", sugNo);
	}
	
	public int updateSug(SqlSessionTemplate sqlSession, Suggestions s) {
		return sqlSession.update("suggestionsMapper.updateSug", s);
	}
}
