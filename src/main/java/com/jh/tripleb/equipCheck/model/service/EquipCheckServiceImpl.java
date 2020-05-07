package com.jh.tripleb.equipCheck.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jh.tripleb.equipCheck.model.dao.EquipCheckDao;
import com.jh.tripleb.equipCheck.model.vo.EquipCheckDto;
import com.jh.tripleb.equipCheck.model.vo.EquipDto;




@Service("ecService")
public class EquipCheckServiceImpl implements EquipCheckService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private EquipCheckDao ecDao;
	
	@Override
	public ArrayList<EquipCheckDto> selectEqList() {
		
		return ecDao.selectEqList(sqlSession);
	}
	@Override
	public int insertEquipCheck(EquipDto ec) {
		int result1 = ecDao.insertEquip(sqlSession, ec);
		if(result1 > 0) {
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
