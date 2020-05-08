package com.jh.tripleb.equipCheck.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jh.tripleb.equipCheck.model.dao.EquipCheckDao;
import com.jh.tripleb.equipCheck.model.vo.EquipCheckDto;
import com.jh.tripleb.equipCheck.model.vo.EquipDto;
import com.jh.tripleb.equipment.model.dao.EquipmentDao;
import com.jh.tripleb.equipment.model.vo.Equipment;




@Service("ecService")
public class EquipCheckServiceImpl implements EquipCheckService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private EquipCheckDao ecDao;
	@Autowired
	private EquipmentDao eDao;
	
	@Override
	public ArrayList<EquipCheckDto> selectEqList() {
		
		return ecDao.selectEqList(sqlSession);
	}
	@Override
	public int insertEquipCheck(EquipDto ec) {
		int result1 = ecDao.insertEquip(sqlSession, ec);
		if(result1 > 0) {
			 ArrayList<Equipment> list = eDao.selectList(sqlSession);

			 int epno = list.get(0).getEquipmentNo();

			 ec.setEquipmentNo(epno);
	
			return ecDao.insertEquipCheck(sqlSession, ec);
		} else {
			return  result1;
		}
		
	}
	@Override
	public int deleteEquipCheck(int ecn) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int updateEquipCheck(EquipDto ec) {
		int result1 = ecDao.updateEquip(sqlSession, ec);
		if(result1 > 0) {
			return ecDao.updateEquipCheck(sqlSession, ec);
		} else {
			return  result1;
		}
	}
	@Override
	public EquipCheckDto selectEquipCheck(int ecno) {
		
		return ecDao.selectEquipCheck(sqlSession, ecno);
	}
	

}
