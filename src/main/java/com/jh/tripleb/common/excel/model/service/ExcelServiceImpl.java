package com.jh.tripleb.common.excel.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jh.tripleb.common.excel.model.dao.ExcelDao;
import com.jh.tripleb.sales.model.vo.SalesDto;
import com.jh.tripleb.sales.model.vo.SalesSearchDto;


@Service("xService")
public class ExcelServiceImpl implements ExcelService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private ExcelDao xDao;
	
	@Override
	public Map<String, Object> getAllObjects(String target, int targetNo) throws Exception {
		if(target.equals("invoice")) {
	    	   return xDao.selectInvocie(sqlSession, targetNo);
	       }else if(target.equals("company")) {
	    	   return xDao.selectCompany(sqlSession, targetNo);
	       }else {
	    	   return null;
	       }
	}
	
	public List<Object> selectListPurchase(String target, int targetNo) throws Exception {
		return xDao.selectListPurchase(sqlSession, targetNo);
	}

	@Override
	public List<Object> selectListSalesExcel(SalesSearchDto s) throws Exception {
		return xDao.selectListSalesExcel(sqlSession, s);
	}




}


	
