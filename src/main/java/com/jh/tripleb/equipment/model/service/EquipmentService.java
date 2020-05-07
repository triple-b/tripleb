package com.jh.tripleb.equipment.model.service;

import java.util.ArrayList;

import com.jh.tripleb.equipment.model.vo.Equipment;



public interface EquipmentService {

	// 1. 비품관리 리스트 조회용 서비스
		//1_1. 현재 요청한 페이지에 보여져야할 리스트 조회용 서비스
		ArrayList<Equipment> selectList();
		
		// 2. 비품관리 작성용 서비스
		int insertEquipment(Equipment e);
		
		
		// 3. 비품관리 삭제용 서비스
		int deleteEquiment(int eno);
		
		// 4. 비품관리 수정용 서비스
		int updateEquipment(Equipment e);
		
		//5. 비품관리 조회 서비스
		Equipment selectEquipment(int eno);
}
