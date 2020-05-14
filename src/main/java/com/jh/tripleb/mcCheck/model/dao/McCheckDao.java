package com.jh.tripleb.mcCheck.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jh.tripleb.mcCheck.model.vo.McCheck;

@Repository("mccDao")
public class McCheckDao {

	public McCheck selectMcCheck(SqlSessionTemplate sqlSession, int mccno) {
		
		return sqlSession.selectOne("mcCheckMapper.selectMcCheck", mccno);
	}

}
