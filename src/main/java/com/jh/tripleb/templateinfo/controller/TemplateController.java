package com.jh.tripleb.templateinfo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TemplateController {
	
	@RequestMapping("templateset.do")
	public String selectList() {		
		return "templateinfo/templateSet";		
	}
	
}
