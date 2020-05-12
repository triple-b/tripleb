package com.jh.tripleb.payInfo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PayInfoController {
	
	@RequestMapping("saleslist.do")
	public String selectList() {		
		return "payinfo/salesListView";		
	}
	
	@RequestMapping("saleschart.do")
	public String selectListChart() {		
		return "payinfo/salesChart";
	}
}
