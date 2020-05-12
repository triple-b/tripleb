package com.jh.tripleb.mcAllCheck.Controller;



import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jh.tripleb.mcAllCheck.model.service.McAllCheckService;
import com.jh.tripleb.mcAllCheck.model.vo.mcAllCheck;
import com.jh.tripleb.mcAllCheck.model.vo.mcAllCheckDto;
import com.jh.tripleb.notice.model.vo.Notice;


@Controller
public class McAllCheckController {
	
	@Autowired
	private McAllCheckService macService;
	
	@RequestMapping("mcCheck.hmc")
	public String selectList(Model model) {
		
		ArrayList<mcAllCheck> List = macService.selectList();
		
		model.addAttribute("List",List);
		
		return "mcCheck/mcAllCheckList";
	}
	
	@RequestMapping("detail.hmc")
	public ModelAndView selectMcAllCheck(int macno, ModelAndView mv) {
		
		mcAllCheck ma = macService.selectMcAllCheck(macno);
		
		if(ma !=null) {
			mv.addObject("ma", ma).setViewName("mcCheck/mcAllCheckDetail");
		}else {
			mv.addObject("msg", "유효한 게시글 아님!");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	@RequestMapping("insert.hmc")
	public String insertMcAllCheck(mcAllCheckDto m, Model model) {
		
		System.out.println("insertMcAllCheck");
		System.out.println(m.getMachineNoList());  
		System.out.println(m.getMachineChkContentList());

		int result = macService.insertMcAllCheck(m);
		
		System.out.println(result);		
		
		if(result > 0) {
			return "redirect:mcCheck.hmc";
		}else { 		
			model.addAttribute("msg", "시설점검관리 작성 실패!");
			return "common/errorPage";
		}
		
}
}
