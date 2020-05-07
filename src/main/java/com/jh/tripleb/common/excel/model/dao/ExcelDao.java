package com.jh.tripleb.common.excel.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("eDao")
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
	
}
