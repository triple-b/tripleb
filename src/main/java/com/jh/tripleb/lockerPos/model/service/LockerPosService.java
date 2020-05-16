package com.jh.tripleb.lockerPos.model.service;

import java.util.ArrayList;

import com.jh.tripleb.locker.model.vo.Locker;
import com.jh.tripleb.lockerPos.model.vo.LockerDtou;
import com.jh.tripleb.lockerPos.model.vo.LockerPos;
import com.jh.tripleb.lockerPos.model.vo.LockerPosDto;
import com.jh.tripleb.member.model.vo.Member;

public interface LockerPosService {

	

	int insertLockerPos(String lockerPosType, int lockerPosQuantity);

	ArrayList<LockerPos> selectList();

	int deleteLockerPos(int lpno);

	int updateLockerPos(String lockerPosType, int lockerPosQuantity);

	LockerPosDto DetailLocker(int lpno);

	ArrayList<LockerDtou> selectnList();

	ArrayList<Member> selectmList();

	ArrayList<Locker> selectLList();

	ArrayList<LockerPos> selectCategory();

	ArrayList<LockerPos> selectFCategory();

	int troubleLocker(int lpno);

}
