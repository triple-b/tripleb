package com.jh.tripleb.locker.model.Dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jh.tripleb.locker.model.vo.Locker;

@Repository("LDao")
public class LockerDao {

	public int insertLocker(SqlSessionTemplate sqlSession, Locker l) {
		
		return sqlSession.insert("lockerMapper.insertLocker",l);
	}

}
