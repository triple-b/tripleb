package com.jh.tripleb.sales.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.jh.tripleb.product.model.vo.Product;
import com.jh.tripleb.sales.model.service.SalesService;
import com.jh.tripleb.sales.model.vo.SalesChartDto;
import com.jh.tripleb.sales.model.vo.SalesDto;
import com.jh.tripleb.sales.model.vo.SalesProductDto;
import com.jh.tripleb.sales.model.vo.SalesSearchDto;
import com.jh.tripleb.salesGoal.model.vo.SalesGoal;
import com.jh.tripleb.templateinfo.model.vo.TemplateInfo;
import com.jh.tripleb.trainer.model.vo.Trainer;

@Controller
public class SalesController {
	
	@Autowired
	private SalesService msService;
			
	@RequestMapping("chart.msl")
	public String selectChartList(Model model) {	
						
		SimpleDateFormat fmt = new SimpleDateFormat ( "yyyy");
		
		Date time = new Date();				
		String thisYear = fmt.format(time);
		
		String[] months = new String[12];
		months[0] = thisYear + "01"; 
		months[1] = thisYear + "02"; 
		months[2] = thisYear + "03"; 
		months[3] = thisYear + "04"; 
		months[4] = thisYear + "05"; 
		months[5] = thisYear + "06"; 
		months[6] = thisYear + "07"; 
		months[7] = thisYear + "08"; 
		months[8] = thisYear + "09"; 
		months[9] = thisYear + "10"; 
		months[10] = thisYear + "11"; 
		months[11] = thisYear + "12"; 	
		
		// 월별 전체리스트 가져오기
		@SuppressWarnings("rawtypes")
		ArrayList<HashMap> saleslist = new ArrayList<>();		
		
		for(int i=0; i<months.length; i++) {		
			
			String month = months[i].substring(months[i].length()-2, months[i].length());
			if(month.substring(0,1).equals("0")) {
				month = month.substring(month.length()-1, month.length());
			}
			
			System.out.println("month :" + month);
			
			// 월별 목표액
			SalesGoal g = msService.selectGoal(Integer.parseInt(month));
			
			// 월별 매출액
			ArrayList<SalesDto> slist = msService.selectMoth(months[i]);
							
			int totalPrice = 0;
			int memberPrice = 0;
			int ptPrice = 0;			
			int cardPrice = 0;
			int cashPrice = 0;
			int salesGoal = 0;
			for(int n=0; n<slist.size(); n++) {
				totalPrice += slist.get(n).getPayPrice();	
				if(slist.get(n).getProductCategory().equals("회원권")) {
					memberPrice += slist.get(n).getPayPrice(); 
				}else {
					ptPrice += slist.get(n).getPayPrice(); 
				}
				if(slist.get(n).getPayType().equals("Card")) {
					cardPrice += slist.get(n).getPayPrice();
				}else {
					cashPrice += slist.get(n).getPayPrice();
				}
			}
			
			if(g != null) {
				salesGoal = (int)( (double)totalPrice / (double)g.getSalesPrice() * 100.0 );					
			}			
			
			HashMap<String, String> hmap = new HashMap<String, String>();

			hmap.put("date", month + "월");
			hmap.put("totalPrice", String.valueOf(totalPrice));
			hmap.put("memberPrice", String.valueOf(memberPrice));
			hmap.put("ptPrice", String.valueOf(ptPrice));
			hmap.put("cardPrice", String.valueOf(cardPrice));
			hmap.put("cashPrice", String.valueOf(cashPrice));
			hmap.put("salesGoal", String.valueOf(salesGoal));
			
			saleslist.add(hmap);
					
		}
							
		// 상품별 매출금액 
		@SuppressWarnings("rawtypes")
		ArrayList<HashMap> productlist = new ArrayList<>();	
		
		ArrayList<SalesProductDto> plist = msService.salesListProduct();
				
		for(int i=0; i<plist.size(); i++) {
			
			HashMap<String, String> hmap = new HashMap<String, String>();
			
			hmap.put("productName", plist.get(i).getProductName());
			hmap.put("price", String.valueOf(plist.get(i).getPayPrice()));
			
			productlist.add(hmap);
		}
							
		// 트레이너별 매출 금액
		@SuppressWarnings("rawtypes")
		ArrayList<HashMap> trainerlist = new ArrayList<>();	
		
		ArrayList<SalesProductDto> tlist = msService.salesListTrainer();
				
		for(int i=0; i<tlist.size(); i++) {
			
			HashMap<String, String> hmap = new HashMap<String, String>();
			
			hmap.put("trainerName", tlist.get(i).getTrainerName());
			hmap.put("price", String.valueOf(tlist.get(i).getPayPrice()));
			
			trainerlist.add(hmap);
		}
		
		System.out.println(saleslist);
		System.out.println(productlist);
		System.out.println(trainerlist);
				
		model.addAttribute("slist", saleslist);	
		model.addAttribute("plist", productlist);	
		model.addAttribute("rlist", trainerlist);
				
		return "sales/salesChart";								
		
	}
	
	@RequestMapping("saerch.msl")
	public String selectList(SalesSearchDto s, Model model) {	
		
		 String searchStr = s.getSearchStr();
	     String searchProduct = s.getSearchProduct();
	     String searchTrainer = s.getSearchTrainer();

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
	    dmap.put("searchStr", searchStr);
	    dmap.put("searchProduct", searchProduct);
	    dmap.put("searchTrainer", searchTrainer);
		model.addAttribute("dmap", dmap);	
		
		return "sales/salesListView";		
	}
	
	
}
