package com.jh.tripleb.locker.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jh.tripleb.locker.model.Dao.LockerDao;
import com.jh.tripleb.locker.model.vo.Locker;
import com.jh.tripleb.locker.model.vo.LockerDto;

@Service("LService")
public class LockerServiceImpl implements LockerService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private LockerDao LDao;
	
	@Override
	public int insertLocker(Locker l) {
		int result1 = LDao.insertLocker(sqlSession, l);
		if(result1 > 0) {
			ArrayList<Locker> list = LDao.selectLockerPos(sqlSession);
			
			int lpno = list.get(4).getLockerPosNo();
			
			l.setLockerPosNo(lpno);
			
			return LDao.updateLockerPos(sqlSession, l);
		}else {
			return result1;
		}
	}

	@Override
	public ArrayList<LockerDto> selectList() {
		
		return LDao.selectList(sqlSession);
	}

	@Override
	public int collectLocker(int lcno) {
		return LDao.collectLocker(sqlSession, lcno);
	}
	
	
}
