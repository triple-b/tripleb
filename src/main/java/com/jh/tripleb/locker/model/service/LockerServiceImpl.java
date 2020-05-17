package com.jh.tripleb.locker.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jh.tripleb.locker.model.Dao.LockerDao;
import com.jh.tripleb.locker.model.vo.Locker;
import com.jh.tripleb.locker.model.vo.LockerDto;
import com.jh.tripleb.lockerPos.model.vo.LockerPos;

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

	@Override
	public ArrayList<LockerDto> selectList() {
		
		return LDao.selectList(sqlSession);
	}

	@Override
	public int collectLocker(int lcno) {
		return LDao.collectLocker(sqlSession, lcno);
	}

	@Override
	public ArrayList<Locker> selectLockerPos() {
		return LDao.selectLockerPos(sqlSession);
	}

	

	@Override
	public int updateLockerPos() {
	
		return LDao.updateLockerPos(sqlSession);
	}

	@Override
	public int updateMember(Locker l) {
		
		return LDao.updateMember(sqlSession, l);
	}

	@Override
	public int changeLcStatus(int lpno) {
		return LDao.updateLcPosStatus(sqlSession, lpno);
	}

	@Override
	public LockerPos selectLcPos(int lcno) {
		return LDao.selectLcPos(sqlSession, lcno);
	}
	
	
}
