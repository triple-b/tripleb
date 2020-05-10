package com.jh.tripleb.templateinfo.model.service;

import java.util.ArrayList;
import java.util.List;

import com.jh.tripleb.templateinfo.model.vo.TemplateInfo;

public interface TemplateService {
	
	/**
	 * 1. 탬플릿항목중 최상위 항목만 리턴(PriceList 표시용)
	 * @author	장미경	
	 * @return	ArrayList : 탬플릿항목중 최상위 항목 전체 리스트 객체
	 */		
	ArrayList<TemplateInfo> selectParentList();

	/**
	 * 1. 탬플릿항목 조회용 서비스(서비스항목 트리표시용)
	 * @author	장미경	
	 * @return	ArrayList : 템플릿 항목 전체 리스트 객체
	 */	
	ArrayList<TemplateInfo> selectListTemplate();
	
}
