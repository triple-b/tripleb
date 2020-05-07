package com.jh.tripleb.equipCheck.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jh.tripleb.equipCheck.model.vo.EquipCheckDto;
import com.jh.tripleb.equipCheck.model.vo.EquipDto;

@Repository("ecDao")
public class EquipCheckDao {

	public ArrayList<EquipCheckDto> selectEqList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("equipcheckMapper.selectEqList");
	}

	public int updateEquip(SqlSessionTemplate sqlSession, EquipDto ec) {
		
		return sqlSession.update("equipcheckMapper.updateEquip", ec);
	}
	public int updateEquipCheck(SqlSessionTemplate sqlSession, EquipDto ec) {
		
		return sqlSession.update("equipcheckMapper.updateEquipCheck", ec);
	}

	public EquipCheckDto selectEquipCheck(SqlSessionTemplate sqlSession, int ecno) {
		
		return sqlSession.selectOne("equipcheckMapper.selectEquipCheck", ecno);
	}

	

	public int insertEquipCheck(SqlSessionTemplate sqlSession, EquipDto ec) {
		
		return sqlSession.insert("equipcheckMapper.insertEquipCheck", ec);
	}

	public int insertEquip(SqlSessionTemplate sqlSession, EquipDto ec) {
		
		return sqlSession.insert("equipcheckMapper.insertEquip", ec);
	}

}
