package com.jh.tripleb.product.controller;


import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.jh.tripleb.classInfo.model.service.ClassService;
import com.jh.tripleb.classInfo.model.vo.ClassInfo;
import com.jh.tripleb.mProduct.model.vo.MProduct;
import com.jh.tripleb.member.model.vo.Member;
import com.jh.tripleb.payInfo.model.vo.PayInfo;
import com.jh.tripleb.product.model.service.ProductService;
import com.jh.tripleb.product.model.vo.Product;

@Controller
public class ProductController {

	@Autowired
	private ProductService pService;
	
	@Autowired
	private ClassService cService;
	
	@RequestMapping("productList.jpr")
	public String productList(Model model) {
		int listCount = pService.getListCount();

		ArrayList<Product> list = pService.selectList();

		model.addAttribute("list", list);

		return "product/productList";
	}

	@ResponseBody
	public ArrayList<Member> searchMem(String name) {

		ArrayList<Member> list = pService.getMember(name);

		return list;
	}

	@ResponseBody
	@RequestMapping(value = "searchMem.jpr", produces = "application/json; charset=utf-8")
	public String countMem(String name) {

		int result = pService.countMem(name);

		if (result > 0) {
			ArrayList<Member> list = searchMem(name);

			return new Gson().toJson(list);
		} else {
			return new Gson().toJson("");
		}

	}

	@ResponseBody
	@RequestMapping(value = "memInfo.jpr", produces = "application/json; charset=utf-8")
	public Member selectMem(int memberNo) {

		Member m = pService.selectMem(memberNo);

		return m;
	}

	@ResponseBody
	@RequestMapping(value = "memImg.jpr", produces = "application/json; charset=utf-8")
	public Member selectImg(int memberNo) {

		Member img = pService.selectImg(memberNo);

		return img;
	}

	@RequestMapping("insertPro.jpr")
	public String insertPro(Product p, HttpServletRequest request, Model model) {
		
		int result = pService.insertPro(p);
		
		if(result > 0) {
			return "redirect:productList.jpr";
		}else {
			model.addAttribute("msg", "상품등록실패");
			return "common/errorPage";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="delete.jpr", produces = "application/json; charset=utf-8")
	public int deletePro(@RequestParam(value="checkArr[]") String[] checkArr) {
		
		int result = 0;
		
		for(int i = 0; i<checkArr.length; i++) {
			result = pService.deletePro(Integer.parseInt(checkArr[i]));
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="clList.jpr", produces = "application/json; charset=utf-8")
	public ArrayList<ClassInfo> selectcList(int productNo){
		ArrayList<ClassInfo> list = pService.selectcList(productNo);
		
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value="selectPro1.jpr", produces = "application/json; charset=utf-8")
	public Product selectPro1(int classNo) {
		Product p = pService.selectPro1(classNo);
		
		return p;
	}
	
	@ResponseBody
	@RequestMapping(value="selectMem1.jpr", produces = "application/json; charset=utf-8")
	public Member selectMem1(int memNo) {
		Member m = pService.selectMem1(memNo);
		
		return m;
	}
	
	// PT회원권 결제
	@RequestMapping("insertPay.jpr")
	public String insertPay(int memberNo, int productNo, int classNo, int price, Member m, ClassInfo cl, HttpServletRequest request, Model model) {

		PayInfo pay = new PayInfo();
		pay.setMemberNo(memberNo);
		pay.setProductNo(productNo);
		pay.setPayPrice(price);
		pay.setPayType("Card");
		
		int result = pService.insertPay(pay); // 됨
		
		cl = cService.clDetail(classNo);
		
		System.out.println(cl);
		
		m.setMemberTrainer(cl.getTrainerName());
		 
		if(result > 0) {
			int result2 = updateCl(cl); //됨
			
			
			int result3 = updateMem(m); // 됨
			
			MProduct mp = new MProduct();

			mp.setMemProductEnd(cl.getClassEndDate());
			mp.setMemberNo(memberNo);
			mp.setProductNo(productNo);
			
			int result4 = pService.insertMpro(mp);
			
			return "redirect:productList.jpr";
		}else {
			model.addAttribute("msg", "결제실패");
			return "common/errorPage";
		}
		
	}
	
	@ResponseBody
	public int updateCl(ClassInfo cl) {
		int result2 = pService.updateCl(cl);
		
		return result2;
	}
	
	@ResponseBody
	public int updateMem(Member m) {
		int result3 = pService.updateMem(m);
		
		System.out.println(result3);
		return result3;
	}
	
	// 일반회원권 결제
	@ResponseBody
	@RequestMapping(value="selectPro2.jpr", produces = "application/json; charset=utf-8")
	public Product selectPro2(int productNo) {
		Product p = pService.selectPro2(productNo);
		
		return p;
	}
	
	@ResponseBody
	@RequestMapping(value="selectMem2.jpr", produces = "application/json; charset=utf-8")
	public Member selectMem2(int memberNo) {
		Member m = pService.selectMem2(memberNo);
		
		return m;
	}
	
	
	@RequestMapping("insertPayNm.jpr")
	public String insertPayNm(int memberNo, int productNo, int productPrice, int productDays, Date sysdate1, HttpServletRequest request, Model model) {
		
		PayInfo pay2 = new PayInfo();
		pay2.setMemberNo(memberNo);
		pay2.setProductNo(productNo);
		pay2.setPayPrice(productPrice);
		pay2.setPayType("Card");
		
		int result = pService.insertPay2(pay2);
		
		if(result > 0) {
			
			MProduct mp2 = new MProduct();
			
			mp2.setMemberNo(memberNo);
			mp2.setProductNo(productNo);
			mp2.setMemProductEnd(sysdate1);
			
			int result2 = pService.insertMpro2(mp2);
			
			return "redirect:productList.jpr";
		}else {
			model.addAttribute("msg", "결제실패");
			return "common/errorPage";
		}
	}
}
