package com.jh.tripleb.common.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jh.tripleb.trainer.model.service.TrainerService;
import com.jh.tripleb.trainer.model.vo.Trainer;

@Controller
public class MainController {
	
	@Autowired
	private TrainerService tService;
	
	@RequestMapping("main.do")
	public String triplebMain(Model model) {
		
		model.addAttribute("one", "대충");
		model.addAttribute("two", "대충");
		model.addAttribute("three", "대충");
		model.addAttribute("four", "대충");
		
		return "main";
	}
	
	
	public ModelAndView tripleSide(ModelAndView mv, HttpSession session) {
		
		ArrayList<Trainer> onTrainer = tService.onListTrainer();
		
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
