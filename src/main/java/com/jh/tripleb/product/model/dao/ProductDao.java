package com.jh.tripleb.product.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jh.tripleb.classInfo.model.vo.ClassInfo;
import com.jh.tripleb.member.model.vo.Member;
import com.jh.tripleb.product.model.vo.Product;

@Repository("pDao")
public class ProductDao {

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("productMapper.getListCount");
	}
	
	public ArrayList<Product> selectList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("productMapper.selectList", null);
	}
	
	public ArrayList<Member> getMember(SqlSessionTemplate sqlSession, String name){
		return (ArrayList)sqlSession.selectList("productMapper.getMember", name);
	}
	
	public int countMem(SqlSessionTemplate sqlSession, String name) {
		return sqlSession.selectOne("productMapper.countMem", name);
	}
	
	public Member selectMem(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("productMapper.selectMem", memberNo);
	}
	
	public Member selectImg(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("productMapper.selectImg", memberNo);
	}
	
	public int insertPro(SqlSessionTemplate sqlSession, Product p) {
		return sqlSession.insert("productMapper.insertPro", p);
	}
	
	public int deletePro(SqlSessionTemplate sqlSession, int checkArr) {
		return sqlSession.update("productMapper.deletePro", checkArr);
	}
	
	public ArrayList<ClassInfo> selectcList(SqlSessionTemplate sqlSession, int productNo){
		return (ArrayList)sqlSession.selectList("productMapper.selectcList", productNo);
	}
}
