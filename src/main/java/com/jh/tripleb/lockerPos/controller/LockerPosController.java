package com.jh.tripleb.lockerPos.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.jh.tripleb.locker.model.vo.Locker;
import com.jh.tripleb.lockerPos.model.service.LockerPosService;
import com.jh.tripleb.lockerPos.model.vo.LockerDtou;
import com.jh.tripleb.lockerPos.model.vo.LockerPos;
import com.jh.tripleb.lockerPos.model.vo.LockerPosDto;
import com.jh.tripleb.member.model.vo.Member;

@Controller
public class LockerPosController {
	
	@Autowired private LockerPosService LpService;
	
	@RequestMapping("lockerlist.hlo")
	public String selectList(Model model) {
		
		ArrayList<LockerPos> list = LpService.selectList(); // 락커포스 전체 리스트
		// 모달
		ArrayList<LockerDtou> nlist = LpService.selectnList(); // 일괄등록 비등록 락커들
		ArrayList<Member> mlist = LpService.selectmList(); // 락커에 비등록된 회원
		ArrayList<Locker> Llist = LpService.selectLList(); // 락커 리스트
		
		model.addAttribute("list", list);
		model.addAttribute("nlist", nlist);
		model.addAttribute("mlist", mlist);
		model.addAttribute("Llist", Llist);
	
		
		return "locker/lockerListView";
	}
	
	@RequestMapping("lockerEnroll.hlo")
	public String insertLockerPos(String lockerPosType, int lockerPosQuantity, Model model) {
			
			int result = LpService.insertLockerPos(lockerPosType,lockerPosQuantity);

			
			if(result > 0) { 
				
				return "redirect:lockerlist.hlo";
			}else {
				
				model.addAttribute("msg", "공지사항 작성 실패!");
				return "common/errorPage";
			}
							
}

	@RequestMapping("delete.hlo")
	public String deleteLockerPos(int lpno, Model model) {
	
		int result = LpService.deleteLockerPos(lpno);
		
		if(result > 0) { // 삭제 성공
			return "redirect:lockerlist.hlo";
		}else { // 삭제 실패
			model.addAttribute("msg", "락커 삭제 실패!");
			return "common/errorPage";
		}
}
	
	@RequestMapping("lockerUpdate.hlo")
	public String updateLockerPos(String lockerPosType, int lockerPosQuantity, Model model) {
			
			int result = LpService.updateLockerPos(lockerPosType,lockerPosQuantity);

			
			if(result > 0) { 
				
				return "redirect:lockerlist.hlo";
			}else {
				
				model.addAttribute("msg", "공지사항 작성 실패!");
				return "common/errorPage";
			}
							
}
	
	@ResponseBody
	@RequestMapping(value="selectlk.hlo", produces="application/json; charset=utf-8")
	public String selectLocker(int lpno) {
		
		LockerPosDto lp = LpService.DetailLocker(lpno);
		
		Gson gson = new Gson();

		return  gson.toJson(lp);
	}
	
	@RequestMapping("category.hlo")
	public String selectCategory(String gender, Model model) {
		
		System.out.println(gender);
		if(gender == "M") {
			ArrayList<LockerPos> list = LpService.selectCategory();
			
			model.addAttribute("list", list);
			return "redirect:lockerlist.hlo";
		}else if(gender == "F") {
			ArrayList<LockerPos> list = LpService.selectFCategory();
			model.addAttribute("list", list);
			return "redirect:lockerlist.hlo";
		}else {
			return "redirect:lockerlist.hlo";
		}
		
	}
	@RequestMapping("trouble.hlo")
	public String troubleLocker(int lpno, Model model) {
		
		int result = LpService.troubleLocker(lpno);
		
		if(result > 0) { // 고장 성공
			return "redirect:lockerlist.hlo";
		}else { // 고장 실패
			model.addAttribute("msg", "락커고장  실패!");
			return "common/errorPage";
		}
	}
	
}
