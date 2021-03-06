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
		int expStudent = umService.expStudent(t.getTrainerNo()); // 7일 이내 만기 회원
		ArrayList<Calendar> clist = umService.todayCal(t.getTrainerNo()); // 오늘 일정
		
		// 나의 pt권 수입
		String pro1 = umService.product1(t.getTrainerNo()); // 상품권 1
		String pro2 = umService.product2(t.getTrainerNo()); // 상품권 2
		String pro3 = umService.product3(t.getTrainerNo()); // 상품권 3
		
		String tnt = umService.trainerCount(); // 트레이너 인원
		int tCount = 0;
		if(tnt != null) {
			tCount = Integer.parseInt(tnt.substring(0, 1));
		}
		
		// 매출 높은 pt권 전체 평균
		String avg1 = umService.productAvg1(tCount); // 전체 평균 1
		String avg2 = umService.productAvg2(tCount); // 전체 평균 2
		String avg3 = umService.productAvg3(tCount); // 전체 평균 3
		
		// 매출 높은 PT권 이름
		String pn1 = umService.productName1(); // 전체 평균 1
		String pn2 = umService.productName2(); // 전체 평균 2
		String pn3 = umService.productName3(); // 전체 평균 3
		
		
		int product1 = 0;
		int product2 = 0;
		int product3 = 0;
		int all1 = 0;
		int all2 = 0;
		int all3 = 0;
		
		
		System.out.println(avg2);
		
		
		if(pro1 != null) {
			product1 = Integer.parseInt(pro1);
		}
		
		if(pro2 != null) {
			product2 = Integer.parseInt(pro2);
		}
		
		if(pro3 != null) {
			product3 = Integer.parseInt(pro3);
		}
		if(avg1 != null) {
			all1 = Integer.parseInt(avg1);
		}
		
		if(avg2 != null) {
			all2 = Integer.parseInt(avg2);
		}
		
		if(avg3 != null) {
			all3 = Integer.parseInt(avg3);
		}
		
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
		model.addAttribute("product1", product1);
		model.addAttribute("product2", product2);
		model.addAttribute("product3", product3);
		model.addAttribute("avg1", all1);
		model.addAttribute("avg2", all2);
		model.addAttribute("avg3", all3);
		model.addAttribute("pn1", pn1);
		model.addAttribute("pn2", pn2);
		model.addAttribute("pn3", pn3);
		
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
