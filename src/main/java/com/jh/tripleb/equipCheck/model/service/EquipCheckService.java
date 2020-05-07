package com.jh.tripleb.equipCheck.model.service;

import java.util.ArrayList;

import com.jh.tripleb.equipCheck.model.vo.EquipCheckDto;
import com.jh.tripleb.equipCheck.model.vo.EquipDto;


public interface EquipCheckService {

	// 1. 비품점검 리스트 조회용 서비스
	//1_1. 현재 요청한 페이지에 보여져야할 리스트 조회용 서비스
	ArrayList<EquipCheckDto> selectEqList();
	
	// 2. 비품점검 작성용 서비스
	int insertEquipCheck(EquipDto ec);
	
	// 3. 비품점검 리스트 서비스
	EquipCheckDto selectEquipCheck(int ecno);
	
	// 4. 비품점검 삭제용 서비스
	int deleteEquipCheck(int ecn);
	
	// 5. 비품점검 수정용 서비스
	int updateEquipCheck(EquipDto ec);
	
}
