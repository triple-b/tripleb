package com.jh.tripleb.lockerPos.model.service;

import java.util.ArrayList;

import com.jh.tripleb.lockerPos.model.vo.LockerPos;

public interface LockerPosService {

	

	int insertLockerPos(String lockerPosType, int lockerPosQuantity);

	ArrayList<LockerPos> selectList();

	int deleteLockerPos(int lpno);

	int updateLockerPos(String lockerPosType, int lockerPosQuantity);

	LockerPos selectLocker(int lpno);

}
