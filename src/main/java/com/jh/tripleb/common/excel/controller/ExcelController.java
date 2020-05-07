package com.jh.tripleb.common.excel.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jh.tripleb.common.excel.model.service.ExcelService;

@Controller
public class ExcelController {
	
	@Autowired
	private ExcelService eService;
	
	@RequestMapping("download.do")
	public String excelTransform(@RequestParam String target, @RequestParam int targetno, Map<String,Object> ModelMap) throws Exception{
		
			Map<String,Object> invoiceList = eService.getAllObjects("invoice", targetno);
			Map<String,Object> companyList = eService.getAllObjects("company", 1);			
			List<Object> itemList = eService.selectListPurchase("item", targetno);
		    
		    ModelMap.put("invoiceList", invoiceList);
		    ModelMap.put("companyList", companyList);
		    ModelMap.put("itemList", itemList);

		    return "ExcelDownloadInvoice";
		    		  
	}
	
}	

