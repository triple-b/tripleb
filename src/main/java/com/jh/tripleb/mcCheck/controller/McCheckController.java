package com.jh.tripleb.mcCheck.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jh.tripleb.mcCheck.model.service.McCheckService;
import com.jh.tripleb.mcCheck.model.vo.McCheck;

@Controller
public class McCheckController {
	
	@Autowired private McCheckService hmcService;
	
	@RequestMapping("updateForm.mcc")
	public ModelAndView updateForm(int mccno, ModelAndView mv) {
	
		McCheck m = hmcService.selectMcCheck(mccno);
		
		mv.addObject("m", m).setViewName("mcCheck/mcCheckUpdateForm");
		
		return mv;
		
	}

}
