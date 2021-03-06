package com.jh.tripleb.common.excel.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jh.tripleb.sales.model.vo.SalesDto;
import com.jh.tripleb.sales.model.vo.SalesSearchDto;

@Repository("xDao")
public class ExcelDao {		
	
	@SuppressWarnings("unchecked") 
	public Map<String, Object> selectInvocie(SqlSessionTemplate sqlSession, int ino) throws Exception{ 
		return (Map<String, Object>)sqlSession.selectOne("invoiceMapper.selectInvoiceMap", ino); 
		
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectCompany(SqlSessionTemplate sqlSession, int ino) throws Exception{ 
		return (Map<String, Object>)sqlSession.selectOne("invoiceMapper.selectCompanyMap", ino); 		
	}
	

	public List<Object> selectListPurchase(SqlSessionTemplate sqlSession, int ino) throws Exception{ 
		return (List<Object>)sqlSession.selectList("invoiceMapper.selectListPurchaseMap", ino);		
	}	
	
	public List<Object> selectListSalesExcel(SqlSessionTemplate sqlSession, SalesSearchDto s) throws Exception{ 
		return (List<Object>)sqlSession.selectList("salesMapper.selectListSalesExcel", s);		
	}	
	
}
