package com.jh.tripleb.vacation.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.jh.tripleb.trainer.model.vo.Trainer;
import com.jh.tripleb.vacation.model.service.VacationService;
import com.jh.tripleb.vacation.model.vo.Vacation;

@Controller
public class VacationController {

	@Autowired
	private VacationService vService;
	
	@RequestMapping("vacation.jva")
	public String selectList(HttpSession session, Model model) {
		
		
		
		Trainer t = (Trainer) session.getAttribute("loginUser"); 
		
		int trainerNo = t.getTrainerNo();
		
		ArrayList<Vacation> list = vService.selectList(trainerNo);
		
		model.addAttribute("vlist", list);
		 
		return "vacation/vacationList";
	}
	
	@RequestMapping("vacApprove.jva")
	public String insertVac(Vacation v, HttpServletRequest request, Model model) {
		System.out.println(v);
		int result = vService.insertVac(v);
		
		if(result > 0) {
			return "redirect:appVacaList.jva";
		}else {
			model.addAttribute("msg", "휴가작성실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("appVacaList.jva")
	public String selectVList(Model model) {
		ArrayList<Vacation> list = vService.selectVList();
		
		model.addAttribute("vlist", list);
		
		return "appVaca/appVacaList";
	}
	
	@ResponseBody
	@RequestMapping(value="myVacaList.jva", produces="application/json; charset=utf-8")
	public String selectMyList(int trainerNo) {
		
		ArrayList<Vacation> list = vService.selectMyList(trainerNo);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
	    return gson.toJson(list);
	}
	
	@RequestMapping("vacationAll.jva")
	public String selectAllList(Model model) {
		
		ArrayList<Vacation> list = vService.selectAllList();
		
		model.addAttribute("vlist", list);
		 
		return "vacation/vacationList";
	}
}
