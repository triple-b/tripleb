package com.jh.tripleb.lockerPos.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jh.tripleb.lockerPos.model.vo.LockerPos;

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

}
