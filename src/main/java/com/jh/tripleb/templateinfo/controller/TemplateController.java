package com.jh.tripleb.templateinfo.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.jh.tripleb.templateinfo.model.service.TemplateService;
import com.jh.tripleb.templateinfo.model.vo.TemplateInfo;
import com.jh.tripleb.templateinfo.model.vo.TemplateInfoDto;

@Controller
public class TemplateController {
	
	@Autowired
	private TemplateService mtService;
	
	@RequestMapping("list.mtp")
	public String selectList(Model model) {	
		
		ArrayList<TemplateInfo> list = mtService.selectParentList();
		
		model.addAttribute("list", list);
		
		return "templateinfo/templateSet";	
	}
	
	@ResponseBody
	@RequestMapping(value="detail.mtp", produces="application/json; charset=utf-8")
	public String selectReplyList() {

		ArrayList<TemplateInfo> list = mtService.selectListTemplate();				
	
		@SuppressWarnings("rawtypes")
		ArrayList<HashMap> treelist = new ArrayList<>();		
		
		for(int i=0; i<list.size(); i++) {	
			
			HashMap<String, String> hmap = new HashMap<String, String>();
						
			// 아이템NO-상위아이템NO-가격 : 1-0-0
			String id = String.valueOf(list.get(i).getTemplateItemNo()) + "-" + 
						String.valueOf(list.get(i).getTemplateParentItemNo()) + "-" +
						String.valueOf(list.get(i).getTemplateItemPrice());
			String parent = "#";
			String text = "";
			String icon = list.get(i).getTemplateIcon();
						
			DecimalFormat df = new DecimalFormat("#,###");
			String price = df.format(list.get(i).getTemplateItemPrice());
						
			if(list.get(i).getTemplateParentItemNo() != 0) {
				//상위아이템NO-0-0
				parent = String.valueOf(list.get(i).getTemplateParentItemNo()) + "-0-0";
				text = list.get(i).getTemplateItemName() + " : " + list.get(i).getTemplateItemDescription() + " <span class='item-price'>[" + price + "원]</span>";
			}else {
				if(price.equals("0")) {
					text = "<strong>" + list.get(i).getTemplateItemName() + "</strong>";
				}else {
					
					text = "<strong>" + list.get(i).getTemplateItemName() + "</strong><span class='item-price'>[" + price + "원]</span>";
				}
				 
			}
			hmap.put("id", id);
			hmap.put("parent", parent);
			hmap.put("text", text);
			hmap.put("type", icon);
			
			treelist.add(hmap);
		}
				
		Gson gson = new Gson();
		
		return gson.toJson(treelist);
	}

	@ResponseBody
	@RequestMapping(value="list.mpv", produces="application/json; charset=utf-8")
	public String selectMenuList(String mlist) {	
		
		ArrayList<TemplateInfoDto> list = mtService.selectMenuList(mlist);
		
		Gson gson = new Gson();	
		
		return gson.toJson(list);
	}
	
}
