package com.jh.tripleb.equipment.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jh.tripleb.equipment.model.vo.Equipment;

@Repository("eDao")
public class EquipmentDao {


	public ArrayList<Equipment> selectList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("equipmentMapper.selectList");
		
	}

	public int updateEquipment(SqlSessionTemplate sqlSession, Equipment e) {
		
		return sqlSession.update("equipmentMapper.updateEquipment", e);
	}

	public int deleteEquiment(SqlSessionTemplate sqlSession, int eno) {
		
		return sqlSession.update("equipmentMapper.deleteEquiment", eno);
	}

	public Equipment selectEquipment(SqlSessionTemplate sqlSession, int eno) {
		
		return sqlSession.selectOne("equipmentMapper.selectEquipment", eno);
	}

	public int insertEquipment(SqlSessionTemplate sqlSession, Equipment e) {
		
		return sqlSession.insert("equipmentMapper.insertEquipment", e);
	}

}
