package com.jh.tripleb.mcAllCheck.Controller;



import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jh.tripleb.mcAllCheck.model.service.McAllCheckService;
import com.jh.tripleb.mcAllCheck.model.vo.mcAllCheck;


@Controller
public class McAllCheckController {
	
	@Autowired
	private McAllCheckService macService;
	
	@RequestMapping("mcCheck.hmc")
	public String selectList(Model model) {
		
		ArrayList<mcAllCheck> list = macService.selectList();
		
		model.addAttribute("list",list);
		
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
}
