package com.jh.tripleb.product.model.service;

import java.util.ArrayList;

import com.jh.tripleb.classInfo.model.vo.ClassInfo;
import com.jh.tripleb.member.model.vo.Member;
import com.jh.tripleb.product.model.vo.Product;

public interface ProductService {

	int getListCount();
	
	ArrayList<Product> selectList();
	
	ArrayList<Member> getMember(String name);
	
	int countMem(String name);
	
	Member selectMem(int memberNo);
	
	Member selectImg(int memberNo);
	
	int insertPro(Product p);
	
	int deletePro(int checkArr);
	
	ArrayList<ClassInfo> selectcList(int productNo);
}
