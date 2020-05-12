package com.jh.tripleb.student.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jh.tripleb.student.model.dao.StudentDao;
import com.jh.tripleb.student.model.vo.StudentDtoJ;

@Service("stService")
public class StudentServiceImpl implements StudentService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private StudentDao stDao;
	
	@Override
	public ArrayList<StudentDtoJ> selectList() {
		return stDao.selectList(sqlSession);
	}

	
}
