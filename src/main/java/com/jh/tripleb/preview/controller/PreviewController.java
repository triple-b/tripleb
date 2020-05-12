package com.jh.tripleb.preview.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PreviewController {
	
	@RequestMapping("preview.mpv")
	public String preview() {		
		return "preview/main_preview";		
	}
	
	@RequestMapping("slpage.mpv")
	public String selectList() {		
		return "preview/salesListView";		
	}
	
	@RequestMapping("scpage.mpv")
	public String selectListChart() {		
		return "preview/salesChart";
	}
	
}
