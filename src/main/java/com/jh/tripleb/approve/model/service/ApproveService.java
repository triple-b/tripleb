package com.jh.tripleb.approve.model.service;

import com.jh.tripleb.approve.model.vo.Approve;
import com.jh.tripleb.classInfo.model.vo.ClassInfo;

public interface ApproveService {

	ClassInfo detailApp(int classNo);
	
	int insertApp(Approve a);
	
	int updateCl(ClassInfo cl);
	
	int insertApp2(Approve a);
	
	int updateCl2(ClassInfo cl);
}
