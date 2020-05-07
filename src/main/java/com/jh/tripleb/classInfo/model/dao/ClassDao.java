package com.jh.tripleb.classInfo.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jh.tripleb.classInfo.model.vo.ClassInfo;

@Repository("cDao")
public class ClassDao {

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("classMapper.getListCount");
	}
	
	public ArrayList<ClassInfo> selectList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("classMapper.selectList", null);
	}
	
	public int insertClass(SqlSessionTemplate sqlSession, ClassInfo cl) {
		return sqlSession.insert("classMapper.insertClass", cl);
	}
}
