package com.jh.tripleb.templateinfo.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jh.tripleb.templateinfo.model.vo.TemplateInfo;

@Repository("mtDao")
public class TemplateDao {
	
	public ArrayList<TemplateInfo> selectParentList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("templateMapper.selectParentList");
	}
	
	public ArrayList<TemplateInfo> selectListTemplate(SqlSessionTemplate sqlSession) {		
		return (ArrayList)sqlSession.selectList("templateMapper.selectListTemplate");
	}
	
	

}
