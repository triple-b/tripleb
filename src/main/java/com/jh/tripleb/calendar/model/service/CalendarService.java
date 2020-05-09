package com.jh.tripleb.calendar.model.service;

import java.util.ArrayList;

import com.jh.tripleb.calendar.model.vo.Calendar;

public interface CalendarService {
	
	ArrayList<Calendar> listCalendar();
	
	int insertCalendar(Calendar c);
	
	int updateCalendar(Calendar c);
	
	int deleteCalendar(Calendar c);

}
