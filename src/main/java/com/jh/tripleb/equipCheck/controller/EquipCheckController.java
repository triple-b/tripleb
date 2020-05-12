package com.jh.tripleb.equipCheck.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jh.tripleb.equipCheck.model.service.EquipCheckService;
import com.jh.tripleb.equipCheck.model.vo.EquipCheckDto;
import com.jh.tripleb.equipCheck.model.vo.EquipDto;
import com.jh.tripleb.equipment.model.service.EquipmentService;
import com.jh.tripleb.equipment.model.vo.Equipment;

@Controller
public class EquipCheckController {
	@Autowired 
	private EquipmentService eService;
	@Autowired 
	private EquipCheckService ecService;
	
	@RequestMapping("equipChecklist.eq")
	public String selectEqList(Model model) {		
		
		ArrayList<EquipCheckDto> elist = ecService.selectEqList();
		ArrayList<Equipment> list = eService.selectList();
		
		model.addAttribute("elist",elist);		
		model.addAttribute("list",list);
		
		return "equipment/equipmemt";		
	}
	@RequestMapping("insert.eq")
	public String insertEquipment(Equipment e,Model model) {
		
		int result = eService.insertEquipment(e);
		
		if(result > 0) { // 비품관리 등록 성공
			
			return "redirect:equipChecklist.eq";
		}else { //비품관리 등록 실패
			
			model.addAttribute("msg", "비품관리 작성 실패!");
			return "common/errorPage";
		}
				
	}
	
	@RequestMapping("updateForm.ep")
		public ModelAndView updateForm(int eno, ModelAndView mv ){
		
		Equipment e = eService.selectEquipment(eno);
		
		mv.addObject("e", e).setViewName("equipment/equipmentUpdateForm");
		
		
		return mv;
		
	}
	
	@RequestMapping("update.ep")
	public ModelAndView updateEquipment(Equipment e ,ModelAndView mv) {
		
		int result = eService.updateEquipment(e);
		
		if(result > 0) { // 수정 성공했을경우 -->상세보기 요청
			mv.setViewName("redirect:equipChecklist.eq");
		}else { // 수정실패했을경우 --> errorPage
			mv.addObject("msg", "유효한 게시글 아님!");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping("delete.ep")
	public String deleteEquipment(int eno, Model model){
	
		int result = eService.deleteEquiment(eno);
		
		if(result > 0) { // 삭제 성공
			return "redirect:equipChecklist.eq";
		}else { // 삭제 실패
			model.addAttribute("msg", "공지사항 삭제 실패!");
			return "common/errorPage";
		}
	}
	@RequestMapping("updateForm.epc")
	public ModelAndView updateForm1(int ecno, ModelAndView mv ){
	
	EquipCheckDto ec = ecService.selectEquipCheck(ecno);
	
	mv.addObject("ec", ec).setViewName("equipment/equipCheckUpdate");
	
	
	return mv;
	
}

@RequestMapping("update.epc")
public ModelAndView updateEquipCheck(EquipDto ec ,ModelAndView mv) {
	
	
	
	int result = ecService.updateEquipCheck(ec);
	
	if(result > 0) { // 수정 성공했을경우 -->상세보기 요청
		mv.setViewName("redirect:equipChecklist.eq");
	}else { // 수정실패했을경우 --> errorPage
		mv.addObject("msg", "유효한 게시글 아님!");
		mv.setViewName("common/errorPage");
	}
	
	return mv;
}
@RequestMapping("insert.epc")
public String insertEquipCheck(EquipDto ec,Model model) {
	
	
	
	int result = ecService.insertEquipCheck(ec);
	
	if(result > 0) { // 비품관리 등록 성공
		
		return "redirect:equipChecklist.eq";
	}else { //비품관리 등록 실패
		
		model.addAttribute("msg", "비품관리 작성 실패!");
		return "common/errorPage";
	}
			
}

}
