package com.jh.tripleb.machine.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jh.tripleb.machine.model.dao.MachineDao;
import com.jh.tripleb.machine.model.vo.Machine;

@Service("mService")
public class MachineServiceImpl implements MachineService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private MachineDao mDao;
	
	@Override
	public ArrayList<Machine> selectList() {
		
		return mDao.selectList(sqlSession);
	}

	@Override
	public int insertMachine(Machine m) {
		
		return mDao.insertMachine(sqlSession,m);
	}

	@Override
	public int deleteMachine(int mcno) {
		// TODO Auto-generated method stub
		return 0;
	}

}
