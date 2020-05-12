package com.jh.tripleb.mcManagement.model.service;

import java.util.ArrayList;

import com.jh.tripleb.mcManagement.model.vo.McManagement;
import com.jh.tripleb.mcManagement.model.vo.McManagementDto;

public interface McmanagementService {
	

	//1. 기구관리 등록
	int insertMcManagement(McManagement mcm);
	
	//2. 기구관리 리스트 조회 서비스
	ArrayList<McManagement> selectList();
	
	//3.기구 관리 수정
	int updateMcManagement(McManagement mc);
	
	//4.기구 관리 삭제
	int deleteMcManagement(int mano);
	
	//5.기구관리 상세보기 조회 서비스
	McManagementDto selectMcManagement(int mano);
	
	//6.기구관리 고장 처리
	int delMcManagement(int mano);
	
	ArrayList<McManagement> selectList2();
}
