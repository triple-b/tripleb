package com.jh.tripleb.locker.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jh.tripleb.locker.model.Dao.LockerDao;
import com.jh.tripleb.locker.model.vo.Locker;

@Service("LService")
public class LockerServiceImpl implements LockerService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private LockerDao LDao;
	
	@Override
	public int insertLocker(Locker l) {
		
		return LDao.insertLocker(sqlSession, l);
	}
	

}
