package com.jh.tripleb.mcManagement.Controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.jh.tripleb.machine.model.vo.Machine;
import com.jh.tripleb.mcManagement.model.service.McmanagementService;
import com.jh.tripleb.mcManagement.model.vo.McManagement;
import com.jh.tripleb.mcManagement.model.vo.McManagementDto;


@Controller
public class McmanagementController {

	@Autowired
	private McmanagementService mcmService;
	
	 @RequestMapping("insert.mcm")
     public String insertMcManagement(int mcno, Model model) {
        
        McManagement mcm = new McManagement();
        
        mcm.setMcNo(mcno);
        
        int result = mcmService.insertMcManagement(mcm);
        
        if(result > 0) {
           return "redirect:mcList.mcm?type=leftmenu";
        }else {
           model.addAttribute("msg", "기구 등록 실패!");
           return "common/errorPage";
        }
        

     }
	@RequestMapping("mcList.mcm")
	public String selectList(String type, Model model) {
		
		ArrayList<McManagement> list = mcmService.selectList();
		
		model.addAttribute("list",list);
	
		if(type.equals("leftmenu")) {
			
			return "mcCheck/mcCheckListView";		
		}else {
			
			return "mcCheck/mcAllCheckList";
		}
		
	}

	@ResponseBody
	@RequestMapping(value="mcList2.mcm", produces="application/json; charset=utf-8")
	public String selectList2(){
		
		ArrayList<McManagement> list = mcmService.selectList2();
	
		Gson gson = new Gson();
		
		return gson.toJson(list);
	}
	
	
	@RequestMapping("delete.mcm")
	public String deleteMcManagement(int mano, Model model) {
		
		int result = mcmService.deleteMcManagement(mano);
		
		if(result > 0) { // 삭제 성공
			return "redirect:mcList.mcm?type=leftmenu";
		}else { // 삭제 실패
			model.addAttribute("msg", "기구관리 삭제 실패!");
			return "common/errorPage";
		}
	}
	@RequestMapping("select.mcm")
	public ModelAndView selectMcManagement(int mano, ModelAndView mv) {
		
		McManagementDto mc = mcmService.selectMcManagement(mano);

		if(mc !=null) {
			mv.addObject("mc", mc).setViewName("redirect:mcList.mcm?type=leftmenu");
		}else {
			mv.addObject("msg", "유효한 게시글 아님!").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	
	@ResponseBody
	@RequestMapping(value="selectMc1.mcm", produces="application/json; charset=utf-8")
	public String selectMachine(int mano) {
		
		McManagementDto mc = mcmService.selectMcManagement(mano);
		
		Gson gson = new Gson();

		return  gson.toJson(mc);
	}
}
