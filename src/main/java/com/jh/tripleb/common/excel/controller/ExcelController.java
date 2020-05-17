package com.jh.tripleb.common.excel.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jh.tripleb.common.excel.model.service.ExcelService;
import com.jh.tripleb.sales.model.vo.SalesDto;
import com.jh.tripleb.sales.model.vo.SalesSearchDto;

@Controller
public class ExcelController {
	
	@Autowired
	private ExcelService xService;
	
	@RequestMapping("download.do")	
	public String excelTransform(@RequestParam String target, @RequestParam int targetno, Map<String,Object> ModelMap) throws Exception{
		
			Map<String,Object> invoiceList = xService.getAllObjects("invoice", targetno);
			Map<String,Object> companyList = xService.getAllObjects("company", 1);			
			List<Object> itemList = xService.selectListPurchase("item", targetno);
		    
		    ModelMap.put("invoiceList", invoiceList);
		    ModelMap.put("companyList", companyList);
		    ModelMap.put("itemList", itemList);
		    ModelMap.put("target", target);
		    
		   	return "ExcelDownloadInvoice";    
		    		  
	}
	
	@RequestMapping("download.msl")
	public String excelTransformSales(SalesSearchDto s, Map<String,Object> ModelMap) throws Exception{
		
		List<Object> itemList = xService.selectListSalesExcel(s); 
		
		System.out.println("itemList : " + itemList);
		
		ModelMap.put("itemList", itemList);
	  
	   	return "ExcelDownloadSales";    
	    		  
}
	
}	

