package com.jh.tripleb.product.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jh.tripleb.classInfo.model.vo.ClassInfo;
import com.jh.tripleb.mProduct.model.vo.MProduct;
import com.jh.tripleb.member.model.vo.Member;
import com.jh.tripleb.payInfo.model.vo.PayInfo;
import com.jh.tripleb.product.model.vo.Product;
import com.jh.tripleb.student.model.vo.Student;

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
	
	public Product selectPro1(SqlSessionTemplate sqlSession, int classNo) {
		return sqlSession.selectOne("productMapper.selectPro1", classNo);
	}
	
	public Member selectMem1(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("productMapper.selectMem1", memNo);
	}
	
	public int insertPay(SqlSessionTemplate sqlSession, PayInfo pay) {
		return sqlSession.insert("productMapper.insertPay", pay);
	}
	
	public int updateCl(SqlSessionTemplate sqlSession, ClassInfo cl) {
		return sqlSession.update("productMapper.updateCl", cl);
	}
	
	public int updateMem(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("productMapper.updateMem", m);
	}
	
	public int insertMpro(SqlSessionTemplate sqlSession, MProduct mp) {
		return sqlSession.insert("productMapper.insertMpro", mp);
	}
	
	public Product selectPro2(SqlSessionTemplate sqlSession, int productNo) {
		return sqlSession.selectOne("productMapper.selectPro2", productNo);
	}
	
	public Member selectMem2(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("productMapper.selectMem2", memberNo);
	}
	
	public int insertPay2(SqlSessionTemplate sqlSession, PayInfo pay2) {
		return sqlSession.insert("productMapper.insertPay2", pay2);
	}
	
	public int insertMpro2(SqlSessionTemplate sqlSession, MProduct mp2) {
		return sqlSession.insert("productMapper.insertMpro2", mp2);
	}
	
	public int insertStu(SqlSessionTemplate sqlSession, Student stu) {
		return sqlSession.insert("productMapper.insertStu", stu);
	}
}
