package com.jh.tripleb.sales.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jh.tripleb.product.model.vo.Product;
import com.jh.tripleb.sales.model.service.SalesService;
import com.jh.tripleb.sales.model.vo.SalesDto;
import com.jh.tripleb.sales.model.vo.SalesSearchDto;
import com.jh.tripleb.trainer.model.vo.Trainer;

@Controller
public class SalesController {
	
	@Autowired
	private SalesService msService;

	@RequestMapping("list.msl")
	public String selectList(String startDate, String endDate, Model model) {	
			
		// 상품 리스트 
		ArrayList<Product>  plist = msService.selectListProduct();	
		model.addAttribute("plist", plist);		
				
		// 트레이너 리스트
		ArrayList<Trainer> tlist = msService.selectListTrainer();
		model.addAttribute("tlist", tlist);		
		
		// 매출 리스트(자동으로 한달 검색)
		SalesSearchDto s = new SalesSearchDto();
		s.setStartDate(startDate);
		s.setEndDate(endDate);				
				
		ArrayList<SalesDto> slist = msService.selectListSalesDto(s);
		model.addAttribute("slist", slist);	
		
		// 시작일/종료일/금액 셋팅
		int cardPrice = 0;
		int cashPrice = 0;
		int totalPrice = 0;
		for(int i=0; i<slist.size(); i++) {
			if(slist.get(i).getPayType().equals("Card")) {
				cardPrice += slist.get(i).getPayPrice();
			}else {
				cashPrice += slist.get(i).getPayPrice();
			}
			totalPrice += slist.get(i).getPayPrice();
		}
		
		String strCardPrice = Integer.toString(cardPrice);
		String strCashPrice = Integer.toString(cashPrice);
		String strTotalPrice = Integer.toString(totalPrice);
		
		HashMap<String, String> dmap = new HashMap<String, String>();
		dmap.put("startDate", startDate);
		dmap.put("endDate", endDate);
		dmap.put("cardPrice", strCardPrice);
		dmap.put("cashPrice", strCashPrice);
		dmap.put("totalPrice", strTotalPrice);
		model.addAttribute("dmap", dmap);	
			
		return "sales/salesListView";		
	}
	
	@RequestMapping("saerch.msl")
	public String selectList(SalesSearchDto s, Model model) {	
		
		System.out.println(s);
		
		// 상품 리스트 
		ArrayList<Product>  plist = msService.selectListProduct();	
		model.addAttribute("plist", plist);		
				
		// 트레이너 리스트
		ArrayList<Trainer> tlist = msService.selectListTrainer();
		model.addAttribute("tlist", tlist);		
		
		// 매출 리스트
		ArrayList<SalesDto> slist = msService.searchListSalesDto(s);
		model.addAttribute("slist", slist);	
		
		// 시작일/종료일/금액 셋팅
		int cardPrice = 0;
		int cashPrice = 0;
		int totalPrice = 0;
		for(int i=0; i<slist.size(); i++) {
			if(slist.get(i).getPayType().equals("Card")) {
				cardPrice += slist.get(i).getPayPrice();
			}else {
				cashPrice += slist.get(i).getPayPrice();
			}
			totalPrice += slist.get(i).getPayPrice();
		}		
		
		HashMap<String, String> dmap = new HashMap<String, String>();
		String startDate = s.getStartDate();
		String endDate = s.getEndDate();
		String strCardPrice = Integer.toString(cardPrice);
		String strCashPrice = Integer.toString(cashPrice);
		String strTotalPrice = Integer.toString(totalPrice);
		
		dmap.put("startDate", startDate);
		dmap.put("endDate", endDate);		
		dmap.put("cardPrice", strCardPrice);
		dmap.put("cashPrice", strCashPrice);
		dmap.put("totalPrice", strTotalPrice);
		model.addAttribute("dmap", dmap);	
		
		return "sales/salesListView";		
	}
	
	@RequestMapping("saleschart.msl")
	public String selectListChart() {		
		return "sales/salesChart";
	}
}
