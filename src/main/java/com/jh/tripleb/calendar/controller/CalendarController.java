package com.jh.tripleb.calendar.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.jh.tripleb.calendar.model.service.CalendarService;
import com.jh.tripleb.calendar.model.vo.Calendar;
import com.jh.tripleb.trainer.model.service.TrainerService;
import com.jh.tripleb.trainer.model.vo.Trainer;

@Controller
public class CalendarController {
	
	@Autowired
	private CalendarService ucService;
	private TrainerService tService;
	
	@ResponseBody
	@RequestMapping(value="list.uca", produces="application/json; charset=utf-8")
	public String listCalendar() {
		
		ArrayList<Calendar> list = ucService.listCalendar();
		return new Gson().toJson(list);
	}
	
	// 임시 수정
	@RequestMapping("calendar.uca")
	public ModelAndView CalendarForm(ModelAndView mv) {
		ArrayList<Trainer> list = tService.calListTrainer();
		
		if(list != null) {			
			mv.addObject("list", list).setViewName("calendar/calendarList");
		}else {
			mv.addObject("msg", "일정 조회 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	

}
