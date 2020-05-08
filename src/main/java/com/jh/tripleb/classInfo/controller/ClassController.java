package com.jh.tripleb.classInfo.controller;

import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jh.tripleb.classInfo.model.service.ClassService;
import com.jh.tripleb.classInfo.model.vo.ClassInfo;

@Controller
public class ClassController {

	@Autowired
	private ClassService cService;
	
	@RequestMapping("classList.jcl")
	public String selectClList(Model model) {
		int listCount = cService.getListCount();
		
		// 깃 좀 그만하자!
		ArrayList<ClassInfo> list = cService.selectList();
		
		return "classInfo/classList";
	}
	
	
//	@RequestMapping(value="insertClass.jcl" , produces="application/json; charset=utf-8")
	@RequestMapping("insertClass.jcl")
	public String insertClass(ClassInfo cl, HttpServletRequest request, Model model) {
		
		int result = cService.insertClass(cl);
		System.out.println(result);
		if(result > 0) {
			return "";
		}else {
			model.addAttribute("msg", "등록실패");
			return "common/errorPage";
		}
	}
}
