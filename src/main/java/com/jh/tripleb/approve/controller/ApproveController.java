package com.jh.tripleb.approve.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jh.tripleb.approve.model.service.ApproveService;
import com.jh.tripleb.approve.model.vo.Approve;
import com.jh.tripleb.classInfo.model.vo.ClassInfo;

@Controller
public class ApproveController {

	@Autowired
	private ApproveService aService;
	
	@ResponseBody
	@RequestMapping(value = "appDetail.jap", produces = "application/json; charset=utf-8")
	public ClassInfo appDetail(int classNo, HttpServletRequest request, Model model) {
		ClassInfo c = aService.detailApp(classNo);
		
		return c;
	}
	
	@ResponseBody
	public int updateCl(ClassInfo cl) {
		int result = aService.updateCl(cl);
		
		return result;
	}
	
	@RequestMapping("insertApp.jap")
	public String insertApp(Approve a, ClassInfo cl, HttpServletRequest request, Model model) {
		
		int result = aService.insertApp(a);
		
		if(result > 0) {
			int result2 = updateCl(cl);
			
			return "redirect:approveList.jcl";
		}else {
			model.addAttribute("msg","실패");
			return "common.errorPage";
		}

	}
	
	@ResponseBody
	public int updateCl2(ClassInfo cl) {
		int result = aService.updateCl2(cl);
		
		return result;
	}
	
	@RequestMapping("insertApp2.jap")
	public String insertApp2(Approve a, ClassInfo cl, HttpServletRequest request, Model model) {
		
		int result = aService.insertApp2(a);
		
		if(result > 0) {
			int result2 = updateCl2(cl);
			
			return "redirect:approveList.jcl";
		}else {
			model.addAttribute("msg","실패");
			return "common.errorPage";
		}

	}
	
}
