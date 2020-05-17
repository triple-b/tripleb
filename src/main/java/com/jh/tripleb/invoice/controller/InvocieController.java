package com.jh.tripleb.invoice.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jh.tripleb.companyInfo.model.vo.CompanyInfo;
import com.jh.tripleb.invoice.model.service.InvoiceService;
import com.jh.tripleb.invoice.model.vo.Invoice;
import com.jh.tripleb.invoice.model.vo.InvoiceCompanyDto;
import com.jh.tripleb.invoice.model.vo.InvoicePurchaseDto;
import com.jh.tripleb.purchase.model.vo.Purchase;

@Controller
public class InvocieController {
	
	@Autowired
	private InvoiceService iService;
	
	@RequestMapping("list.miv")
	public String selectListInvoice(Model model) {
		
		// Invoice 전체 리스트 조회
		ArrayList<Invoice> list = iService.selectListInvoice();
		
		model.addAttribute("list", list);		
		
		return "invoice/invoiceListView";
	}
	
	@RequestMapping("detail.miv")
	public ModelAndView selectInvocie(int ino, ModelAndView mv) {
		
		Invoice i = iService.selectInvocie(ino);
		
		if(i != null) {
			InvoiceCompanyDto c = iService.selectCompanyInfo(1);
			
			ArrayList<InvoicePurchaseDto> plist = iService.selectListPurchase(ino);
												
			mv.addObject("i", i)
			  .addObject("c", c)
			  .addObject("plist", plist)
			  .setViewName("invoice/invoiceDetailView");
		}else {
			mv.addObject("msg", "계약서 문서를 찾을 수 없습니다.")
			  .setViewName("common/errorPage");
		}	
		
		return mv;
				
	}
	
	// 계약서 저장 및 메일발송(계약서 첨부)
	@RequestMapping("insert.miv")
	public String insertInvocie(Invoice i, Model model) {
		
		int result = iService.insertInvocie(i);
		
		if(result > 0) {				
			// 계약서 엑셀파일로 저장				
			return "redirect:download.do?target=invoicemail&targetno=" + result;				
		}else {				
			model.addAttribute("msg", "계약서 저장 실패");
			return "common/errorPage";			
		}		
	}
	
	// 계약서 구매취소
	@RequestMapping("update.miv")
	public String updateInvocie(Invoice i, Model model) {
		
		int result = iService.updateInvocie(i);
		
		if(result > 0) {	
			return "redirect:list.miv";
		}else {				
			model.addAttribute("msg", "구매취소 처리 실패");
			return "common/errorPage";			
		}				
				
	}
	
}
