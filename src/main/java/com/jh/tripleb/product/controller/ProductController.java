package com.jh.tripleb.product.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.jh.tripleb.member.model.vo.Member;
import com.jh.tripleb.product.model.service.ProductService;
import com.jh.tripleb.product.model.vo.Product;

@Controller
public class ProductController {

	@Autowired
	private ProductService pService;

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
}
