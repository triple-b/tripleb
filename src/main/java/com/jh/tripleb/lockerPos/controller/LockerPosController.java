package com.jh.tripleb.lockerPos.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.jh.tripleb.lockerPos.model.service.LockerPosService;
import com.jh.tripleb.lockerPos.model.vo.LockerPos;
import com.jh.tripleb.mcManagement.model.vo.McManagementDto;
import com.jh.tripleb.notice.model.vo.Notice;

@Controller
public class LockerPosController {
	
	@Autowired private LockerPosService LpService;
	
	@RequestMapping("lockerlist.hlo")
	public String selectList(Model model) {
		
		ArrayList<LockerPos> list = LpService.selectList();
		
		model.addAttribute("list", list);
	
		
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
		
		LockerPos lp = LpService.selectLocker(lpno);
		
		Gson gson = new Gson();

		return  gson.toJson(lp);
	}
	
	
	
}
