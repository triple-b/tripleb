package com.jh.tripleb.locker.model.service;

import java.util.ArrayList;

import com.jh.tripleb.locker.model.vo.Locker;
import com.jh.tripleb.locker.model.vo.LockerDto;

public interface LockerService {



	int insertLocker(Locker l);

	ArrayList<LockerDto> selectList();

	int collectLocker(int lcno);

}
