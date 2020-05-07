package com.jh.tripleb.trainer.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jh.tripleb.trainer.model.service.TrainerService;
import com.jh.tripleb.trainer.model.vo.Trainer;

@Controller
public class TrainerController {
	
	@Autowired
	private TrainerService tService;
	
	@RequestMapping("loginForm.utr")
	public String loginForm() {
		return "trainer/loginTrainer";
	}
	
	@RequestMapping("login.utr")
	public ModelAndView loginTrainer(Trainer t, HttpSession session, ModelAndView mv) {
		
		Trainer loginUser = tService.loginTrainer(t);
		
		if(loginUser != null) {
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("redirect:/");
		}else {
			mv.addObject("msg", "로그인 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
		
	}
	
	@RequestMapping("change.utr")
	public ModelAndView changeTrainer(Trainer t, HttpSession session, ModelAndView mv) {
		
		Trainer loginUser = tService.changeTrainer(t);
		
		if(loginUser != null) {
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("redirect:/");
		}else {
			mv.addObject("msg", "로그인 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
		
		
	}
	
	@RequestMapping("profileForm.utr")
	public String profileForm() {
		return "trainer/profileTrainer";
	}
	
	
	@RequestMapping("update.utr")
	public String updateTrainerProfile(Trainer t, HttpSession session, Model model) {
		
		int result = tService.updateTrainerProfile(t);
		
		if(result > 0) {
			session.setAttribute("loginUser", tService.changeTrainer(t));
			return "redirect:profileForm.utr";
			
		}else {
			model.addAttribute("msg", "프로필 수정 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("trainerList.jtr")
	public String trainerList() {
		return "trainer/trainerList";
	}

}
