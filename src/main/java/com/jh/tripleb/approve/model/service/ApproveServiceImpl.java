package com.jh.tripleb.approve.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jh.tripleb.approve.model.dao.ApproveDao;
import com.jh.tripleb.approve.model.vo.Approve;
import com.jh.tripleb.classInfo.model.vo.ClassInfo;

@Service("aService")
public class ApproveServiceImpl implements ApproveService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ApproveDao aDao;

	@Override
	public ClassInfo detailApp(int classNo) {
		return aDao.selectCl(sqlSession, classNo);
	}

	@Override
	public int insertApp(Approve a) {
		return aDao.insertApp(sqlSession, a);
	}

	@Override
	public int updateCl(ClassInfo cl) {
		return aDao.updateCl(sqlSession, cl);
	}

	@Override
	public int insertApp2(Approve a) {
		return aDao.insertApp2(sqlSession, a);
	}

	@Override
	public int updateCl2(ClassInfo cl) {
		return aDao.updateCl2(sqlSession, cl);
	}

}
