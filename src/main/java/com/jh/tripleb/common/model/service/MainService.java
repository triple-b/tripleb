package com.jh.tripleb.common.model.service;

public interface MainService {
	
	int currentClass(int tno);
	
	int currentStudent(int tno);
	
	int newStudent(int tno);
	
	int expStudent(int tno);

	int thisMonth();
	
	int thisMonthGoal();
}
