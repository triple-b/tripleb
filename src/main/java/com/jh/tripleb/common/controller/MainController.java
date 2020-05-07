package com.jh.tripleb.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("main.do")
	public String triplebMain(Model model) {
		
		model.addAttribute("one", "대충");
		model.addAttribute("two", "대충");
		model.addAttribute("three", "대충");
		model.addAttribute("four", "대충");
		
		return "main";
	}

}
