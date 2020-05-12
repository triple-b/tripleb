package com.jh.tripleb.mcManagement.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jh.tripleb.mcManagement.model.vo.McManagement;
import com.jh.tripleb.mcManagement.model.vo.McManagementDto;

@Repository("mcmDao")
public class McmanagementDao {


	public ArrayList<McManagement> selectList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("mcManagementMapper.selectList");
	}

	public int insertMcManagement(SqlSessionTemplate sqlSession, McManagement mcm) {
		
		return sqlSession.insert("mcManagementMapper.insertMcManagement",mcm);
	}

	public int deleteMcManagement(SqlSessionTemplate sqlSession, int mano) {
		
		return sqlSession.update("mcManagementMapper.deleteMcManagement", mano);
	}

	public McManagementDto selectMcManagement(SqlSessionTemplate sqlSession, int mano) {
		
		return sqlSession.selectOne("mcManagementMapper.selectMcManagement", mano);
	}

	public ArrayList<McManagement> selectList2(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("mcManagementMapper.selectList2");
	}

	public int updateMachine(SqlSessionTemplate sqlSession, McManagementDto m) {
		
		return sqlSession.update("mcManagementMapper.updateMachine",m);
	}
}
