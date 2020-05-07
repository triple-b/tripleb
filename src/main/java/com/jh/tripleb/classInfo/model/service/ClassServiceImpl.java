package com.jh.tripleb.classInfo.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jh.tripleb.classInfo.model.dao.ClassDao;
import com.jh.tripleb.classInfo.model.vo.ClassInfo;

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
	public ArrayList<ClassInfo> selectList() {
		return cDao.selectList(sqlSession);
	}

	@Override
	public int insertClass(ClassInfo cl) {
		return cDao.insertClass(sqlSession, cl);
	}
	
	

}
