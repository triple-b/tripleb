package com.jh.tripleb.locker.model.Dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jh.tripleb.locker.model.vo.Locker;
import com.jh.tripleb.locker.model.vo.LockerDto;
import com.jh.tripleb.lockerPos.model.vo.LockerPos;

@Repository("LDao")
public class LockerDao {

	public int insertLocker(SqlSessionTemplate sqlSession, Locker l) {
		
		return sqlSession.insert("lockerMapper.insertLocker",l);
	}

	public ArrayList<LockerDto> selectList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("lockerMapper.selectList");

	}
	
	public ArrayList<Locker> selectLockerPos(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("lockerMapper.selectLockerPos");
	}

	public int updateLockerPos(SqlSessionTemplate sqlSession) {
		
		return sqlSession.update("lockerPosMapper.updateLockerPos");
	}

	public int collectLocker(SqlSessionTemplate sqlSession, int lcno) {
		
		return sqlSession.update("lockerMapper.collectLocker", lcno);
	}

	public int updateMember(SqlSessionTemplate sqlSession, Locker l) {
		
		return sqlSession.update("lockerMapper.updateMember",l);
	}

	public int updateLcPosStatus(SqlSessionTemplate sqlSession, int lpno) {
		return sqlSession.update("lockerMapper.updateLcPosStatus", lpno);
	}
	
	public LockerPos selectLcPos(SqlSessionTemplate sqlSession, int lcno) {
		return sqlSession.selectOne("lockerMapper.selectLcPos", lcno);
	}

}
