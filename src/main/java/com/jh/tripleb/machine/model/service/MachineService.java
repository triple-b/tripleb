package com.jh.tripleb.machine.model.service;

import java.util.ArrayList;

import com.jh.tripleb.machine.model.vo.Machine;

public interface MachineService {

	//1. 기구 리스트 조회용 서비스
	ArrayList<Machine> selectList();
	
	//2. 기구 등록 서비스
	int insertMachine(Machine m);
	
	//3. 기구 삭제 서비스
	int deleteMachine(int mcno);
}
