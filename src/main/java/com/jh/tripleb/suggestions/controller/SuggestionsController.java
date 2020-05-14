package com.jh.tripleb.suggestions.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jh.tripleb.suggestions.model.service.SuggestionsService;
import com.jh.tripleb.suggestions.model.vo.Suggestions;


@Controller
public class SuggestionsController {

	@Autowired
	private SuggestionsService sService;
	
	@RequestMapping("selectSugList.jsu")
	public String selectList(Model model) {
		int listCount = sService.getListCount();
		
		ArrayList<Suggestions> list = sService.selectList();
		
		model.addAttribute("list", list);
		return "suggestions/suggestionsList";
	}
	
	@RequestMapping("insertSugForm.jsu")
	public String insertSug() {
		return "suggestions/insertSugForm";
	}
	
	@RequestMapping("insertSug.jsu")
	public String insertSug(Suggestions s, HttpServletRequest request, Model model) {
		
		int result = sService.insertSug(s);
		
		if(result > 0) {
			return "redirect:selectSugList.jsu";
		}else {
			model.addAttribute("msg", "작성 실패");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("detail.jsu")
	public ModelAndView selectSug(int sugNo, ModelAndView mv) {
		
		Suggestions s = sService.selectSug(sugNo);
		
		mv.addObject("s", s).setViewName("suggestions/sugDetailView");
		
		return mv;
	}
	
	@RequestMapping("updateForm.jsu")
	public ModelAndView updateForm(int sugNo, ModelAndView mv) {
		
		Suggestions s = sService.selectSug(sugNo);
		
		mv.addObject("s", s).setViewName("suggestions/sugUpdateForm");
		
		return mv;
	}
	
	@RequestMapping("update.jsu")
	public ModelAndView updateSug(Suggestions s, HttpServletRequest request, ModelAndView mv) {
		int result = sService.updateSug(s);
		
		if(result > 0) {
			mv.addObject("sugNo", s.getSugNo()).setViewName("redirect:detail.jsu");
		}else {
			mv.addObject("msg", "수정실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
}
