package com.jh.tripleb.equipment.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jh.tripleb.equipment.model.dao.EquipmentDao;
import com.jh.tripleb.equipment.model.vo.Equipment;

@Service("eService")
public class EquipmentServiceImpl implements EquipmentService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private EquipmentDao eDao;

	@Override
	public ArrayList<Equipment> selectList() {
		
		return eDao.selectList(sqlSession);
	}

	@Override
	public int insertEquipment(Equipment e) {
		return eDao.insertEquipment(sqlSession, e);
	}

	@Override
	public int deleteEquiment(int eno) {
		return eDao.deleteEquiment(sqlSession, eno);
	}

	@Override
	public int updateEquipment(Equipment e) {
		
		return eDao.updateEquipment(sqlSession, e);
	}

	@Override
	public Equipment selectEquipment(int eno) {
		
		return eDao.selectEquipment(sqlSession, eno);
	}

}
