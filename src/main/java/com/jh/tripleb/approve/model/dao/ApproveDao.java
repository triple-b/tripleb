package com.jh.tripleb.approve.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jh.tripleb.approve.model.vo.Approve;
import com.jh.tripleb.classInfo.model.vo.ClassInfo;

@Repository("aDao")
public class ApproveDao {

	public ClassInfo selectCl(SqlSessionTemplate sqlSession, int classNo) {
		return sqlSession.selectOne("approveMapper.detailCl", classNo);
	}
	
	public int insertApp(SqlSessionTemplate sqlSession, Approve a) {
		return sqlSession.insert("approveMapper.insertApp", a);
	}
	
	public int updateCl(SqlSessionTemplate sqlSession, ClassInfo cl) {
		return sqlSession.update("approveMapper.updateCl", cl);
	}
	
	public int insertApp2(SqlSessionTemplate sqlSession, Approve a) {
		return sqlSession.insert("approveMapper.insertApp2", a);
	}
	
	public int updateCl2(SqlSessionTemplate sqlSession, ClassInfo cl) {
		return sqlSession.update("approveMapper.updateCl2", cl);
	}
}
