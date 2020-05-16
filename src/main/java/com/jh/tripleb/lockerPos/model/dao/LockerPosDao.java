package com.jh.tripleb.lockerPos.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jh.tripleb.locker.model.vo.Locker;
import com.jh.tripleb.lockerPos.model.vo.LockerDtou;
import com.jh.tripleb.lockerPos.model.vo.LockerPos;
import com.jh.tripleb.lockerPos.model.vo.LockerPosDto;
import com.jh.tripleb.member.model.vo.Member;

@Repository("LpDao")
public class LockerPosDao {

	public int insertLockerPos(SqlSessionTemplate sqlSession, LockerPos l) {
		
		return sqlSession.insert("lockerPosMapper.insertLockerPos",l);
	}

	public int insertLockerPos(SqlSessionTemplate sqlSession, String lockerPosType, int lockerPosQuantity) {
		
		int result=0;
		
		for(int i = 1; i<lockerPosQuantity; i++){
			result = sqlSession.insert("lockerPosMapper.insertLockerPos",lockerPosType);
		}
		
		return result;
		
	}

	public ArrayList<LockerPos> selectList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("lockerPosMapper.selectList");
	}

	public int deleteLockerPos(SqlSessionTemplate sqlSession, int lpno) {
		
		return sqlSession.update("lockerPosMapper.deleteLockerPos", lpno);
	}

	public int updateLockerPos(SqlSessionTemplate sqlSession, String lockerPosType, int lockerPosQuantity) {
		
		int result=0;
		
		for(int i = 1; i<lockerPosQuantity; i++){
			result = sqlSession.insert("lockerPosMapper.updateLockerPos",lockerPosType);
		}
		
		return result;
		
	}

	public LockerPosDto DetailLocker(SqlSessionTemplate sqlSession, int lpno) {
		
		return sqlSession.selectOne("lockerPosMapper.DetailLocker", lpno);
	}

	public ArrayList<LockerDtou> selectnList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("lockerPosMapper.selectnList");
	}

	public ArrayList<Member> selectmList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("lockerPosMapper.selectmList");
	}

	public ArrayList<Locker> selectLList(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("lockerPosMapper.selectLList");
	}

	public ArrayList<LockerPos> selectCategory(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("lockerPosMapper.selectCategory");
	}

	public ArrayList<LockerPos> selectFCategory(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("lockerPosMapper.selectFCategory");
	}

	public int troubleLocker(SqlSessionTemplate sqlSession, int lpno) {
		
		return sqlSession.update("lockerPosMapper.troubleLocker", lpno);
	}

}
