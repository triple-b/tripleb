package com.jh.tripleb.vacation.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.jh.tripleb.vacation.model.vo.Vacation;

public interface VacationService {

	ArrayList<Vacation> selectList(int trainerNo);
	
	int insertVac(Vacation v);
	
	ArrayList<Vacation> selectVList();
	
	ArrayList<Vacation> selectMyList(int trainerNo);
	
	ArrayList<Vacation> selectAllList();
}
