package com.jh.tripleb.appVaca.model.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jh.tripleb.appVaca.model.service.AppVacaService;
import com.jh.tripleb.appVaca.model.vo.AppVaca;
import com.jh.tripleb.vacation.model.vo.Vacation;

@Controller
public class AppVacaController {

	@Autowired
	private AppVacaService avService;
	
	@ResponseBody
	@RequestMapping("appVacaDetail.jav")
	public Vacation appVacaDetail(int vacNo, HttpServletRequest request, Model model) {
		Vacation v = avService.avDetail(vacNo);
		
		return v;
	}
	
	// 승인
	@ResponseBody
	public int updateAppVaca(Vacation v) {
		int result = avService.updateVaca(v);
		
		return result;
	}
	
	@RequestMapping("insertAppVaca.jav")
	public String insertAppVaca(AppVaca av, Vacation v, HttpServletRequest request, Model model) {
		int result = avService.insertApp(av);
		
		if(result > 0) {
			int result2 = updateAppVaca(v);
			
			return "redirect:appVacaList.jva";
		}else {
			model.addAttribute("msg", "errorPage");
			return "common/errorPage";
		}
	}
	
	// 반려
	@ResponseBody
	public int updateAppVaca2(Vacation v) {
		int result = avService.updateVaca2(v);
		
		return result;
	}
	
	@RequestMapping("insertAppVaca2.jav")
	public String insertAppVaca2(AppVaca av, Vacation v, HttpServletRequest request, Model model) {
		int result = avService.insertApp2(av);
		
		if(result > 0) {
			int result2 = updateAppVaca2(v);
			
			return "redirect:appVacaList.jva";
		}else {
			model.addAttribute("msg", "errorPage");
			return "common/errorPage";
		}
	}
	
}
