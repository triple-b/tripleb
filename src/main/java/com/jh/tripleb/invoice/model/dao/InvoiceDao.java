package com.jh.tripleb.invoice.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jh.tripleb.companyInfo.model.vo.CompanyInfo;
import com.jh.tripleb.invoice.model.vo.Invoice;
import com.jh.tripleb.invoice.model.vo.InvoiceCompanyDto;
import com.jh.tripleb.invoice.model.vo.InvoicePurchaseDto;
import com.jh.tripleb.templateinfo.model.vo.TemplateInfo;

@Repository("iDao")
public class InvoiceDao {
	
	public ArrayList<Invoice> selectListInvoice(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("invoiceMapper.selectListInvoice");
	}
	
	public Invoice selectInvocie(SqlSessionTemplate sqlSession, int ino) {
		return (Invoice)sqlSession.selectOne("invoiceMapper.selectInvoice", ino);
	}
	
	public InvoiceCompanyDto selectCompanyInfo(SqlSessionTemplate sqlSession, int cno) {
		return (InvoiceCompanyDto)sqlSession.selectOne("invoiceMapper.selectCompanyInfo", cno);
	}
	
	public ArrayList<InvoicePurchaseDto> selectListPurchase(SqlSessionTemplate sqlSession, int ino) {
		return (ArrayList)sqlSession.selectList("invoiceMapper.selectListPurchase", ino);
	}

	public int insertInvocie(SqlSessionTemplate sqlSession, Invoice i) {
		return sqlSession.insert("invoiceMapper.insertInvocie", i);
	}

	public TemplateInfo selectTemplateInfo(SqlSessionTemplate sqlSession, int tno) {
		return sqlSession.selectOne("templateMapper.selectParent", tno);
	}
	
	public int selectInvoiceCount(SqlSessionTemplate sqlSession, String str) {
		return sqlSession.selectOne("invoiceMapper.selectInvoiceCount", str);
	}
	
	public int insertPurchase(SqlSessionTemplate sqlSession, HashMap<String, Integer> paramNo) {
		return sqlSession.insert("invoiceMapper.insertPurchase", paramNo);
	}
	
	public int updateInvocie(SqlSessionTemplate sqlSession, Invoice i) {
		return sqlSession.update("invoiceMapper.updateInvocie", i);
	}
	
}
