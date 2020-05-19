package com.jh.tripleb.calendar.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.jh.tripleb.calendar.model.service.CalendarService;
import com.jh.tripleb.calendar.model.vo.Calendar;
import com.jh.tripleb.trainer.model.service.TrainerService;
import com.jh.tripleb.trainer.model.vo.Trainer;

@Controller
public class CalendarController {
	
	@Autowired
	private CalendarService ucService;
	@Autowired
	private TrainerService tService;
	
	@ResponseBody
	@RequestMapping(value="list.uca", produces="application/json; charset=utf-8")
	public String listCalendar() {
		
		ArrayList<Calendar> list = ucService.listCalendar();
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd'T'HH:mm:ss").create();
		
		return gson.toJson(list);
	}
	
	
	@RequestMapping("calendar.uca")
	public ModelAndView CalendarForm(ModelAndView mv) {
		
		ArrayList<Trainer> list = tService.listTrainer();
		
		if(list != null) {
			mv.addObject("list", list).setViewName("calendar/calendarList");
		}else {
			mv.addObject("msg", "일정 조회 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value="insert.uca", produces="application/json; charset=utf-8")
	public String insertCalendar(Calendar c, String start, String end, Model model) {
		
		String s = "";
		String e = "";
		if(start.length() > 10) { // allDay false 일 때 
			s = start + ":00";
			e = end + ":00";
		}else { // allDay true 일 때 
			s = start + " 00:00:00";
			e = end + " 00:00:00";
		}
		
		// String --> TimeStamp 형변환
		java.sql.Timestamp startDate = java.sql.Timestamp.valueOf(s); 
		java.sql.Timestamp endDate = java.sql.Timestamp.valueOf(e);
		
		c.setCalStart(startDate);
		c.setCalEnd(endDate);
		
		int result = ucService.insertCalendar(c);
		
		if(result > 0) {
			return "redirect:list.uca";
		}else {
			model.addAttribute("msg", "일정 등록 실패");
			return "common/errorPage";
		}

	}
	
	@RequestMapping(value="update.uca", produces="application/json; charset=utf-8")
	public String updateCalendar(Calendar c, String start, String end, Model model) {
		
		String s = "";
		String e = "";
		if(start.length() > 10) { // allDay false 일 때 
			s = start + ":00";
			e = end + ":00";
		}else { // allDay false 일 때 
			s = start + " 00:00:00";
			e = end + " 00:00:00";
		}
		
		// String --> TimeStamp 형변환
		java.sql.Timestamp startDate = java.sql.Timestamp.valueOf(s); 
		java.sql.Timestamp endDate = java.sql.Timestamp.valueOf(e);
		
		c.setCalStart(startDate);
		c.setCalEnd(endDate);
		
		Trainer t = tService.calendarDetail(c.getTrainerName());
		c.setTrainerNo(t.getTrainerNo());
		
		System.out.println("트레이너번호 :" +t);
		System.out.println(c);
		
		int result = ucService.updateCalendar(c);
		
		if(result > 0) { // allDay false 일 때 
			return "redirect:list.uca";
		}else { // allDay false 일 때 
			model.addAttribute("msg", "일정 수정 실패");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping(value="delete.uca", produces="application/json; charset=utf-8")
	public String deleteCalendar(Calendar c, Model model) {
		
		int result = ucService.deleteCalendar(c);

		if(result > 0) { // allDay false 일 때 
			return "redirect:list.uca";
		}else { // allDay false 일 때 
			model.addAttribute("msg", "일정 삭제 실패");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping(value="dropUpdate.uca", produces="application/json; charset=utf-8")
	public String dropUpdateCalendar(Calendar c, String start, String end, Model model) {
		
		String s = "";
		String e = "";
		if(start.length() > 10) { // allDay false 일 때 
			s = start + ":00";
			e = end + ":00";
		}else { // allDay false 일 때 
			s = start + " 00:00:00";
			e = end + " 00:00:00";
		}
		
		// String --> TimeStamp 형변환
		java.sql.Timestamp startDate = java.sql.Timestamp.valueOf(s); 
		java.sql.Timestamp endDate = java.sql.Timestamp.valueOf(e);
		
		c.setCalStart(startDate);
		c.setCalEnd(endDate);
		
		int result = ucService.updateCalendar(c);
		
		if(result > 0) {
			return "redirect:list.uca";
		}else {
			model.addAttribute("msg", "일정 수정 실패");
			return "common/errorPage";
		}
		
	}
	

}
