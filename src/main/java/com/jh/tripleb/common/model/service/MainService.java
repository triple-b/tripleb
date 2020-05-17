package com.jh.tripleb.common.model.service;

import java.util.ArrayList;

import com.jh.tripleb.calendar.model.vo.Calendar;

public interface MainService {
	
	int currentClass(int tno);
	
	int currentStudent(int tno);
	
	int newStudent(int tno);
	
	int expStudent(int tno);

	String thisMonth();
	
	int thisMonthGoal();
	
	ArrayList<Calendar> todayCal(int tno);
	
	String product1(int tno);
	String product2(int tno);
	String product3(int tno);
}
