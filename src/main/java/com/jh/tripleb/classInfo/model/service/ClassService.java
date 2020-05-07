package com.jh.tripleb.classInfo.model.service;

import java.util.ArrayList;

import com.jh.tripleb.classInfo.model.vo.ClassInfo;

public interface ClassService {

	int getListCount();
	
	ArrayList<ClassInfo> selectList();
	
	int insertClass(ClassInfo cl);
}
