package com.jh.tripleb.product.model.service;

import java.util.ArrayList;

import com.jh.tripleb.classInfo.model.vo.ClassInfo;
import com.jh.tripleb.mProduct.model.vo.MProduct;
import com.jh.tripleb.member.model.vo.Member;
import com.jh.tripleb.payInfo.model.vo.PayInfo;
import com.jh.tripleb.product.model.vo.Product;
import com.jh.tripleb.student.model.vo.Student;

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
	
	Product selectPro1(int classNo);
	
	Member selectMem1(int memNo);
	
	int insertPay(PayInfo pay);
	
	int updateCl(ClassInfo cl);
	
	int updateMem(Member m);
	
	int insertMpro(MProduct mp);
	
	Product selectPro2(int productNo);
	
	Member selectMem2(int memberNo);
	
	int insertPay2(PayInfo pay2);
	
	int insertMpro2(MProduct mp2);
	
	int insertStu(Student stu);
}
