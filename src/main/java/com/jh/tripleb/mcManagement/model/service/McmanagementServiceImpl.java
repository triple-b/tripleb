package com.jh.tripleb.mcManagement.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jh.tripleb.mcManagement.model.dao.McmanagementDao;
import com.jh.tripleb.mcManagement.model.vo.McManagement;
import com.jh.tripleb.mcManagement.model.vo.McManagementDto;

@Service("mcmService")
public class McmanagementServiceImpl implements McmanagementService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private McmanagementDao mcmDao;

	@Override
	public int insertMcManagement(McManagement mcm) {
		
		return mcmDao.insertMcManagement(sqlSession,mcm) ;
	}
	
	@Override
	public ArrayList<McManagement> selectList() {
		
		return mcmDao.selectList(sqlSession);
	}

	@Override
	public int deleteMcManagement(int mano) {
		
		return mcmDao.deleteMcManagement(sqlSession,mano);
	}

	@Override
	public McManagementDto selectMcManagement(int mano) {
		
		return mcmDao.selectMcManagement(sqlSession,mano);
	}

	

	@Override
	public ArrayList<McManagement> selectList2() {
		return mcmDao.selectList2(sqlSession);
	}

	@Override
	public int updateMachine(McManagementDto m) {
		
		return mcmDao.updateMachine(sqlSession, m);
	}

	@Override
	public int troubleMcManagement(int mano) {
		// TODO Auto-generated method stub
		return mcmDao.troubleMcManagement(sqlSession,mano);
	}




}
