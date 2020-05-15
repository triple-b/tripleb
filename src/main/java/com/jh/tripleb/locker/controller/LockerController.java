package com.jh.tripleb.locker.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jh.tripleb.locker.model.service.LockerService;
import com.jh.tripleb.locker.model.vo.Locker;

@Controller
public class LockerController {
	@Autowired private LockerService LService;
	
	@RequestMapping("enroll.hlc")
	public String insertLocker(Locker l,Model model) {
		System.out.println(l);
	int result = LService.insertLocker(l);
	
	if(result > 0) { // 락커 등록 성공
		
		return "redirect:lockerlist.hlo";
	}else { //락커 등록 실패
		
		model.addAttribute("msg", "락커 등록 실패!");
		return "common/errorPage";
}
	}
}