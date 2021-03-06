package com.jh.tripleb.classInfo.model.service;

import java.util.ArrayList;

import com.jh.tripleb.approve.model.vo.Approve;
import com.jh.tripleb.classInfo.model.vo.ClassInfo;
import com.jh.tripleb.member.model.vo.Member;
import com.jh.tripleb.product.model.vo.Product;

public interface ClassService {

	int getListCount();
	
	ArrayList<ClassInfo> selectList(int trainerNo);
	
	ArrayList<ClassInfo> selectList();
	
	int insertClass(ClassInfo cl);
	
	int insertApp(Approve a);
	
	int getpListCount();
	
	ArrayList<Product> selectpList();
	
	ArrayList<ClassInfo> selectaList();
	
	int deleteCl(int checkArr);
	
	ClassInfo clDetail(int classNo);
	
	ArrayList<Member> stuList(int classNo);
}
