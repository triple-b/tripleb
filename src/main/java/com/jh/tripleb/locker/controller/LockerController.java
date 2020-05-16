package com.jh.tripleb.locker.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.jh.tripleb.locker.model.service.LockerService;
import com.jh.tripleb.locker.model.vo.Locker;
import com.jh.tripleb.locker.model.vo.LockerDto;
import com.jh.tripleb.lockerPos.model.service.LockerPosService;
import com.jh.tripleb.member.model.vo.MemberDtoU;

@Controller
public class LockerController {
	
	@Autowired private LockerService LService;
	@Autowired private LockerPosService LpService;
	
	@ResponseBody
	@RequestMapping(value="Lockerlist.hlc", produces="application/json; charset=utf-8")
	public String selectList() {
		
		ArrayList<LockerDto> list = LService.selectList();
		Gson gson = new Gson();

		return gson.toJson(list);
	}
	
	
	@RequestMapping("lockerEnroll.hlc")
	public ModelAndView insertLocker(String lockerPosNo, String memberNo, String lockerStartDate, String lockerEndDate, Model model, ModelAndView mv) {
	
		
		System.out.println(lockerPosNo);
		System.out.println(memberNo);
		System.out.println(lockerStartDate);
		System.out.println(lockerEndDate);
		
		String[] lno = lockerPosNo.split(",");
		String[] mno = memberNo.split(",");
		String[] lsd = lockerStartDate.split(",");
		String[] led = lockerEndDate.split(",");
	
		ArrayList <Locker> splitList = new ArrayList<Locker>();
		for(int i=0; i<lno.length; i++) {
			splitList.add(new Locker(Integer.parseInt(lno[i]),
										Date.valueOf(lsd[i]),
										Date.valueOf(led[i]),
										Date.valueOf("2020-05-16"),
										"Y", Integer.parseInt(lno[i]),
										Integer.parseInt(mno[i])));
		}
		
		int result = 0;
		for(Locker l : splitList) {
			result = LService.insertLocker(l);
		}
		
		if(result> 0) {
			
			int result1 = LService.updateLockerPos();
				if(result1 > 0) { // 락커 등록 성공
					mv.setViewName("redirect:lockerlist.hlo");
				}else { //락커 등록 실패
					mv.addObject("msg", "락커 등록 실패!").setViewName("common/errorPage");
				}

		}

		return mv;
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