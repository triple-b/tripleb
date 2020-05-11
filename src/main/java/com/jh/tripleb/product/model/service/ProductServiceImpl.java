package com.jh.tripleb.product.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jh.tripleb.classInfo.model.vo.ClassInfo;
import com.jh.tripleb.mProduct.model.vo.MProduct;
import com.jh.tripleb.member.model.vo.Member;
import com.jh.tripleb.payInfo.model.vo.PayInfo;
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

	@Override
	public Product selectPro1(int classNo) {
		return pDao.selectPro1(sqlSession, classNo);
	}

	@Override
	public Member selectMem1(int memNo) {
		return pDao.selectMem1(sqlSession, memNo);
	}

	@Override
	public int insertPay(PayInfo pay) {
		return pDao.insertPay(sqlSession, pay);
	}

	@Override
	public int updateCl(ClassInfo cl) {
		return pDao.updateCl(sqlSession, cl);
	}

	@Override
	public int updateMem(Member m) {
		return pDao.updateMem(sqlSession, m);
	}

	@Override
	public int insertMpro(MProduct mp) {
		return pDao.insertMpro(sqlSession, mp);
	}

	@Override
	public Product selectPro2(int productNo) {
		return pDao.selectPro2(sqlSession, productNo);
	}

	@Override
	public Member selectMem2(int memberNo) {
		return pDao.selectMem2(sqlSession, memberNo);
	}

	@Override
	public int insertPay2(PayInfo pay2) {
		return pDao.insertPay2(sqlSession, pay2);
	}

	@Override
	public int insertMpro2(MProduct mp2) {
		return pDao.insertMpro2(sqlSession, mp2);
	}


}
