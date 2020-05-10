package com.jh.tripleb.product.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jh.tripleb.classInfo.model.vo.ClassInfo;
import com.jh.tripleb.member.model.vo.Member;
import com.jh.tripleb.product.model.dao.ProductDao;
import com.jh.tripleb.product.model.vo.Product;

@Service("pService")
public class ProductServiceImpl implements ProductService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ProductDao pDao;
	
	@Override
	public int getListCount() {
		return pDao.getListCount(sqlSession);
	}

	@Override
	public ArrayList<Product> selectList() {
		return pDao.selectList(sqlSession);
	}

	@Override
	public ArrayList<Member> getMember(String name) {
		return pDao.getMember(sqlSession, name);
	}

	@Override
	public int countMem(String name) {
		return pDao.countMem(sqlSession, name);
	}

	@Override
	public Member selectMem(int memberNo) {
		return pDao.selectMem(sqlSession, memberNo);
	}

	public Member selectImg(int memberNo) {
		return pDao.selectImg(sqlSession, memberNo);
	}

	@Override
	public int insertPro(Product p) {
		return pDao.insertPro(sqlSession, p);
	}

	@Override
	public int deletePro(int checkArr) {
		return pDao.deletePro(sqlSession, checkArr);
	}

	@Override
	public ArrayList<ClassInfo> selectcList(int productNo) {
		return pDao.selectcList(sqlSession, productNo);
	}
}
