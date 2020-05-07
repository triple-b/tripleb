package com.jh.tripleb.calendar.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.jh.tripleb.calendar.model.service.CalendarService;
import com.jh.tripleb.calendar.model.vo.Calendar;

@Controller
public class CalendarController {
	
	@Autowired
	private CalendarService cService;
	
	@ResponseBody
	@RequestMapping(value="list.uca", produces="application/json; charset=utf-8")
	public String listCalendar() {
		
		ArrayList<Calendar> list = cService.listCalendar();
		return new Gson().toJson(list);
	}
	

}
