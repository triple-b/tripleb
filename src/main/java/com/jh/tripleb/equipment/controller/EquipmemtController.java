package com.jh.tripleb.equipment.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jh.tripleb.equipment.model.service.EquipmentService;
import com.jh.tripleb.equipment.model.vo.Equipment;
import com.jh.tripleb.notice.model.service.NoticeService;
import com.jh.tripleb.notice.model.vo.Notice;

@Controller
public class EquipmemtController {
	
	 @Autowired private EquipmentService eService;

	@RequestMapping("equiplist.eq")
	public String selectList(Model model) {		
		
		ArrayList<Equipment> list = eService.selectList();
		
		model.addAttribute("list",list);
		
		return "equipment/equipmemt";		
	}
}
