package com.jh.tripleb.mcAllCheck.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jh.tripleb.mcAllCheck.model.dao.McAllCheckDao;
import com.jh.tripleb.mcAllCheck.model.vo.mcAllCheck;

@Service("macService")
public class McAllCheckServiceImpl implements McAllCheckService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private McAllCheckDao macDao;
	@Override
	public ArrayList<mcAllCheck> selectList() {
		
		return macDao.selectList(sqlSession);
	}
	@Override
	public int insertMcAllCheck(mcAllCheck mac) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public mcAllCheck selectMcAllCheck(int macno) {
		
		return macDao.selectMcAllCheck(sqlSession, macno);
	}
}
