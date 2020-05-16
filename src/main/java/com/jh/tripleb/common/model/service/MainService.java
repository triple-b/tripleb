package com.jh.tripleb.common.model.service;

import java.util.ArrayList;

import com.jh.tripleb.calendar.model.vo.Calendar;

public interface MainService {
	
	int currentClass(int tno);
	
	int currentStudent(int tno);
	
	int newStudent(int tno);
	
	int expStudent(int tno);

	int thisMonth();
	
	int thisMonthGoal();
	
	ArrayList<Calendar> todayCal(int tno);
}
