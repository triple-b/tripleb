package com.jh.tripleb.lockerPos.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jh.tripleb.lockerPos.model.dao.LockerPosDao;
import com.jh.tripleb.lockerPos.model.vo.LockerPos;

@Service("LpService")
public class LockerPosServiceImpl implements LockerPosService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private LockerPosDao LpDao;
	@Override
	public int insertLockerPos(String lockerPosType, int lockerPosQuantity) {
		
		return LpDao.insertLockerPos(sqlSession,lockerPosType,lockerPosQuantity);


}
	@Override
	public ArrayList<LockerPos> selectList() {
		
		return LpDao.selectList(sqlSession);
	}
	@Override
	public int deleteLockerPos(int lpno) {
		
		return LpDao.deleteLockerPos(sqlSession, lpno);
	}
	@Override
	public int updateLockerPos(String lockerPosType, int lockerPosQuantity) {
		
		return LpDao.updateLockerPos(sqlSession,lockerPosType,lockerPosQuantity);
	}
	
}
