package com.jh.tripleb.common.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jh.tripleb.calendar.model.vo.Calendar;
import com.jh.tripleb.common.model.service.MainService;
import com.jh.tripleb.notice.model.service.NoticeService;
import com.jh.tripleb.notice.model.vo.Notice;
import com.jh.tripleb.trainer.model.service.TrainerService;
import com.jh.tripleb.trainer.model.vo.Trainer;

@Controller
public class MainController {
	
	@Autowired 
	private NoticeService nService;
	@Autowired
	private TrainerService tService;
	@Autowired
	private MainService umService;
	
	
	@RequestMapping("main.do")
	public String triplebMain(Model model, HttpSession session) {
		
		Trainer t = (Trainer)session.getAttribute("loginUser");

		ArrayList<Notice> nlist = nService.mainNotice(); // 공지사항 리스트
		int current = umService.currentClass(t.getTrainerNo()); // 진행중인 수업 개수
		int currentStudent = umService.currentStudent(t.getTrainerNo()); // 진행 중인 회원
		int newStudent = umService.newStudent(t.getTrainerNo()); // 30일 이내 신규 회원
		int expStudent = umService.expStudent(t.getTrainerNo()); // 30일 이내 신규 회원
		ArrayList<Calendar> clist = umService.todayCal(t.getTrainerNo()); // 오늘 일정
		
		String thisMonth = umService.thisMonth(); // 이번달 총수입
		int thisMonthGoal = umService.thisMonthGoal(); // 이번달 총수입

		Double goal = 0.0;
		if(thisMonth != null) {
			goal = Integer.parseInt(thisMonth) / (thisMonthGoal * 0.01) ; // 월달성률
		}else {
			model.addAttribute("goal", 0);
		}
		
		if(goal == 0) {
			model.addAttribute("goal", 0);
		}else {
			model.addAttribute("goal", goal);
		}
		
		
		model.addAttribute("current", current);
		model.addAttribute("currentStudent", currentStudent);
		model.addAttribute("newStudent", newStudent);
		model.addAttribute("expStudent", expStudent);
		model.addAttribute("goal", goal);
		model.addAttribute("notice", nlist);
		model.addAttribute("calendar", clist);
		
		return "main";
	}
	
	
	public ModelAndView tripleSide(ModelAndView mv, HttpSession session) {
		
		ArrayList<Trainer> onTrainer = tService.listTrainer();
		
		if(onTrainer != null) {
			session.setAttribute("onTrainer", onTrainer);
			mv.setViewName("redirect:/");
		}else {
			mv.addObject("msg", "트레이너 조회 실패");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
		
	}

}
