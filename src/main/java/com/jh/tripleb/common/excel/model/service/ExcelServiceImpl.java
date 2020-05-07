package com.jh.tripleb.common.excel.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jh.tripleb.common.excel.model.dao.ExcelDao;


@Service("eService")
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
	       }else if(target.equals("item")) {
	    	   return null;
	       }else {
	    	   return null;
	       }
	}
	
	public List<Object> selectListPurchase(String target, int targetNo) throws Exception {
		return xDao.selectListPurchase(sqlSession, targetNo);
	}

	/*
	 * 

	@Override
	public List<Object> getAllObjects(String target, int targetNo) {
		
	       if(target.equals("invoice")) {
	    	   return eDao.selectInvocie(sqlSession, targetNo);
	       }else if(target.equals("salesList")) {
	    	   //return eDao.selectListSales();
	    	   return null;
	       }else {
	    	   return null;
	       }
	}
	*/

}


	
