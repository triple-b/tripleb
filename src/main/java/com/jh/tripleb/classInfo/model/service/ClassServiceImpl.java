package com.jh.tripleb.classInfo.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jh.tripleb.approve.model.vo.Approve;
import com.jh.tripleb.classInfo.model.dao.ClassDao;
import com.jh.tripleb.classInfo.model.vo.ClassInfo;
import com.jh.tripleb.member.model.vo.Member;
import com.jh.tripleb.product.model.vo.Product;

@Service("cService")
public class ClassServiceImpl implements ClassService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ClassDao cDao;
	
	@Override
	public int getListCount() {
		return cDao.getListCount(sqlSession);
	}

	@Override
	public ArrayList<ClassInfo> selectList(int trainerNo) {
		return cDao.selectList(sqlSession, trainerNo);
	}
	
	@Override
	public ArrayList<ClassInfo> selectList() {
		return cDao.selectList(sqlSession);
	}

	@Override
	public int insertClass(ClassInfo cl) {
		return cDao.insertClass(sqlSession, cl);
	}

	@Override
	public int insertApp(Approve a) {
		return cDao.insertApp(sqlSession, a);
	}
	
	@Override
	public int getpListCount() {
		return cDao.getpListCount(sqlSession);
	}

	@Override
	public ArrayList<Product> selectpList() {
		return cDao.selectpList(sqlSession);
	}

	@Override
	public ArrayList<ClassInfo> selectaList() {
		return cDao.selectaList(sqlSession);
	}

	@Override
	public int deleteCl(int checkArr) {
		return cDao.deleteCl(sqlSession, checkArr);
	}

	@Override
	public ClassInfo clDetail(int classNo) {
		return cDao.clDetail(sqlSession, classNo);
	}

	@Override
	public ArrayList<Member> stuList(int classNo) {
		return cDao.stuList(sqlSession, classNo);
	}


}
