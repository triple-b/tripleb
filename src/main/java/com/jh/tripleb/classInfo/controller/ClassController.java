package com.jh.tripleb.classInfo.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.jh.tripleb.classInfo.model.service.ClassService;
import com.jh.tripleb.classInfo.model.vo.ClassInfo;
import com.jh.tripleb.member.model.vo.Member;
import com.jh.tripleb.product.model.vo.Product;

@Controller
public class ClassController {

	@Autowired
	private ClassService cService;
	
	@RequestMapping("classList.jcl")
	public String selectClList(Model model) {
		int listCount = cService.getListCount();
		
		ArrayList<ClassInfo> list = cService.selectList();
		
		model.addAttribute("list", list);
		
		return "classInfo/classList";
	}
	
	@RequestMapping("insertClass.jcl")
	public String insertClass(ClassInfo cl, HttpServletRequest request, Model model) {
		
		int result = cService.insertClass(cl);
		
		if(result > 0) {
			
			return "redirect:approveList.jcl";
		}else {
			model.addAttribute("msg", "등록실패");
			return "common/errorPage";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="proList.jcl", produces = "application/json; charset=utf-8")
	public ArrayList<Product> proList(Product p) {
		
		int listCount = cService.getpListCount();
		
		ArrayList<Product> list = cService.selectpList();
		
		return list;
	}
		
	@RequestMapping("approveList.jcl")
	public String selectAgrList(Model model) {
		
		ArrayList<ClassInfo> alist = cService.selectaList();
		
		model.addAttribute("alist", alist);
		
		return "approve/approveList";
	}
	
	@ResponseBody
	@RequestMapping(value = "delete.jcl", produces = "application/json; charset=utf-8")
	public int deleteCl(@RequestParam(value="checkArr[]") String[] checkArr) {

		int result = 0;
		
		for(int i = 0; i<checkArr.length; i++) {
			result = cService.deleteCl(Integer.parseInt(checkArr[i]));
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="classDetail.jcl", produces = "application/json; charset=utf-8")
	public String clDetail(int classNo, HttpServletRequest request, Model model) {
		ClassInfo c = cService.clDetail(classNo);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		return gson.toJson(c);
	}
	
	@ResponseBody
	@RequestMapping(value="stuList.jcl", produces = "application/json; charset=utf-8")
	public ArrayList<Member> stuList(int classNo, Model model){
		ArrayList<Member> list = cService.stuList(classNo);
		
		model.addAttribute("list", list);
		return list;
	}
}
