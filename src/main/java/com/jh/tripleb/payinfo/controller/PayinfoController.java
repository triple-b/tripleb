package com.jh.tripleb.payinfo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PayinfoController {
	
	@RequestMapping("saleslist.do")
	public String selectList() {		
		return "payinfo/salesListView";		
	}
	
	@RequestMapping("saleschart.do")
	public String selectListChart() {		
		return "payinfo/salesChart";
	}
}
