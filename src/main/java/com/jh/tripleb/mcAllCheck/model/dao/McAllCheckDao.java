package com.jh.tripleb.mcAllCheck.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jh.tripleb.mcAllCheck.model.vo.mcAllCheck;
import com.jh.tripleb.mcAllCheck.model.vo.mcAllCheckDto;
import com.jh.tripleb.mcAllCheck.model.vo.mcAllDto;

@Repository("macDao")
public class McAllCheckDao {

	public ArrayList<mcAllCheck> selectList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("mcAllCheckMapper.selectList");
	}


	public int insertMcAllCheck(SqlSessionTemplate sqlSession, mcAllCheckDto m) {
		
		return sqlSession.insert("mcAllCheckMapper.insertMcAllCheck", m);
	}

	public int insertMcCheck(SqlSessionTemplate sqlSession, mcAllCheckDto m) {
		
		return sqlSession.insert("mcAllCheckMapper.insertMcCheck", m);
	}

	public ArrayList<mcAllDto> selectMcCheck(SqlSessionTemplate sqlSession, int macno) {
	
		return (ArrayList)sqlSession.selectList("mcAllCheckMapper.selectMcCheck", macno);
	}

}
