package com.jh.tripleb.mcAllCheck.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jh.tripleb.mcAllCheck.model.vo.mcAllCheck;
import com.jh.tripleb.mcAllCheck.model.vo.mcAllCheckDto;

@Repository("macDao")
public class McAllCheckDao {

	public ArrayList<mcAllCheck> selectList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("mcAllCheckMapper.selectList");
	}

	public mcAllCheck selectMcAllCheck(SqlSessionTemplate sqlSession, int macno) {
		
		return sqlSession.selectOne("mcAllCheckMapper.selectMcAllCheck", macno);
	}

	public int insertMcAllCheck(SqlSessionTemplate sqlSession, mcAllCheckDto m) {
		
		return sqlSession.insert("mcAllCheckMapper.insertMcAllCheck", m);
	}

	public int insertMcCheck(SqlSessionTemplate sqlSession, mcAllCheckDto m) {
		
		return sqlSession.insert("mcAllCheckMapper.insertMcCheck", m);
	}

}
