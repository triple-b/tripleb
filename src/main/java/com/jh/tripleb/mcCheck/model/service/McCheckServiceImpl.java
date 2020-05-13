package com.jh.tripleb.mcCheck.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jh.tripleb.mcCheck.model.dao.McCheckDao;
import com.jh.tripleb.mcCheck.model.vo.McCheck;

@Service("hmcService")
public class McCheckServiceImpl implements McCheckService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private McCheckDao mccDao;
	
	@Override
	public McCheck selectMcCheck(int mccno) {
		
		return mccDao.selectMcCheck(sqlSession,mccno);
	}

	@Override
	public int updateMcCheck(McCheck m) {
		// TODO Auto-generated method stub
		return 0;
	}

	
}
