package com.jh.tripleb.locker.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.jh.tripleb.locker.model.service.LockerService;
import com.jh.tripleb.locker.model.vo.Locker;
import com.jh.tripleb.locker.model.vo.LockerDto;

@Controller
public class LockerController {
	@Autowired private LockerService LService;
	
	@ResponseBody
	@RequestMapping(value="Lockerlist.hlc", produces="application/json; charset=utf-8")
	public String selectList() {
		
		ArrayList<LockerDto> list = LService.selectList();
		Gson gson = new Gson();

		return gson.toJson(list);
	}
	
	
	@RequestMapping("lockerEnroll.hlc")
	public String insertLocker(Locker l,Model model,HttpServletRequest request) {
	

	int result = LService.insertLocker(l);
	
	
	
	if(result > 0) { // 락커 등록 성공
		
		return "redirect:lockerlist.hlo";
	}else { //락커 등록 실패
		
		model.addAttribute("msg", "락커 등록 실패!");
		return "common/errorPage";
		  }
	
	}
	
	@RequestMapping("collect.hlc")
	public String collectLocker(int lcno, Model model) {
		
		int result = LService.collectLocker(lcno);
		
		if(result > 0) { // 고장 성공
			return "redirect:lockerlist.hlo";
		}else { // 고장 실패
			model.addAttribute("msg", "락커고장  실패!");
			return "common/errorPage";
		}
	}
}