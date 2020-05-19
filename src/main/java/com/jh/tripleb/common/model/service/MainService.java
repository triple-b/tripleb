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
	
	// 나의 pt권
	String product1(int tno);
	String product2(int tno);
	String product3(int tno);
	
	// 전체 pt권
	String productAvg1(int tCount);
	String productAvg2(int tCount);
	String productAvg3(int tCount);
	
	String trainerCount();
	
	// 전체 pt권이름
	String productName1();
	String productName2();
	String productName3();
}
