package com.jh.tripleb.mcCheck.model.service;

import com.jh.tripleb.mcCheck.model.vo.McCheck;

public interface McCheckService {

	//1.시설점검 상세보기 수정
		McCheck selectMcCheck(int mccno);
		
		//2.시설점검 수정용 서비스
		int updateMcCheck(McCheck m);
}
