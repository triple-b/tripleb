package com.jh.tripleb.templateinfo.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jh.tripleb.templateinfo.model.dao.TemplateDao;
import com.jh.tripleb.templateinfo.model.vo.TemplateInfo;

@Service("mtService")
public class TemplateServiceImpl implements TemplateService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private TemplateDao mtDao;
	
	@Override
	public ArrayList<TemplateInfo> selectParentList() {		
		return mtDao.selectParentList(sqlSession);
	}
	
	@Override
	public ArrayList<TemplateInfo> selectListTemplate() {
		return mtDao.selectListTemplate(sqlSession);
	}

}
