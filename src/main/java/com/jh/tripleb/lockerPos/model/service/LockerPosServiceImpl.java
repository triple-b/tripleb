package com.jh.tripleb.lockerPos.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jh.tripleb.locker.model.vo.Locker;
import com.jh.tripleb.lockerPos.model.dao.LockerPosDao;
import com.jh.tripleb.lockerPos.model.vo.LockerDtou;
import com.jh.tripleb.lockerPos.model.vo.LockerPos;
import com.jh.tripleb.lockerPos.model.vo.LockerPosDto;
import com.jh.tripleb.member.model.vo.Member;

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
	@Override
	public LockerPosDto DetailLocker(int lpno) {
		
		return LpDao.DetailLocker(sqlSession, lpno);
	}
	@Override
	public ArrayList<LockerDtou> selectnList() {
		
		return LpDao.selectnList(sqlSession);
	}
	@Override
	public ArrayList<Member> selectmList() {
		
		return LpDao.selectmList(sqlSession);
	}
	@Override
	public ArrayList<Locker> selectLList() {
		return LpDao.selectLList(sqlSession);
	}
	@Override
	public ArrayList<LockerPos> selectCategory() {
		
		return LpDao.selectCategory(sqlSession);
	}
	@Override
	public ArrayList<LockerPos> selectFCategory() {
		
		return LpDao.selectFCategory(sqlSession);
	}
	@Override
	public int troubleLocker(int lpno) {
		
		return LpDao.troubleLocker(sqlSession, lpno);
	}
	
}
