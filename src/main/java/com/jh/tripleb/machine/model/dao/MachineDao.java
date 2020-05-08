package com.jh.tripleb.machine.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jh.tripleb.machine.model.vo.Machine;

@Repository("hmDao")
public class MachineDao {

	public int insertMachine(SqlSessionTemplate sqlSession, Machine m) {
		
		return sqlSession.insert("machineMapper.insertMachine", m);
	}

	public ArrayList<Machine> selectList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("machineMapper.selectList");
	}

	public int deleteMachine(SqlSessionTemplate sqlSession, int mcno) {
		
		return sqlSession.update("machineMapper.deleteMachine", mcno);
	}

}
