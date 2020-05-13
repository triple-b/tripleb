package com.jh.tripleb.mcAllCheck.model.service;

import java.util.ArrayList;

import com.jh.tripleb.mcAllCheck.model.vo.mcAllCheck;
import com.jh.tripleb.mcAllCheck.model.vo.mcAllCheckDto;
import com.jh.tripleb.mcAllCheck.model.vo.mcAllDto;

public interface McAllCheckService {

	//1. 기구점검 리스트 조회 서비스
	ArrayList<mcAllCheck> selectList();
	
	//2. 기구점검 점검 등록
	
	int insertMcAllCheck(mcAllCheckDto m);

	//3. 기구점검 상세보기 조회 소비스

	ArrayList<mcAllDto> selectMcCheck(int macno);

	
	
}
