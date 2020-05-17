package com.jh.tripleb.locker.model.service;

import java.util.ArrayList;

import com.jh.tripleb.locker.model.vo.Locker;
import com.jh.tripleb.locker.model.vo.LockerDto;
import com.jh.tripleb.lockerPos.model.vo.LockerPos;

public interface LockerService {



	int insertLocker(Locker l);

	ArrayList<LockerDto> selectList();

	int collectLocker(int lcno);
	
	ArrayList<Locker> selectLockerPos();

	int updateLockerPos();

	int updateMember(Locker l);

	int changeLcStatus(int lpno);
	
	LockerPos selectLcPos(int lcno);
}
