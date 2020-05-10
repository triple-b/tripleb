package com.jh.tripleb.classInfo.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jh.tripleb.approve.model.vo.Approve;
import com.jh.tripleb.classInfo.model.vo.ClassInfo;
import com.jh.tripleb.product.model.vo.Product;

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
	
	public int insertApp(SqlSessionTemplate sqlSession, Approve a) {
		return sqlSession.insert("classMapper.insertApp", a);
	}
	
	public int getpListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("classMapper.getpListCount");
	}
	
	public ArrayList<Product> selectpList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("classMapper.selectpList");
	}
	
	public ArrayList<ClassInfo> selectaList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("classMapper.selectaList");
	}
	
	public int deleteCl(SqlSessionTemplate sqlSession, int checkArr) {
		return sqlSession.update("classMapper.deleteCl", checkArr);
	}
}
