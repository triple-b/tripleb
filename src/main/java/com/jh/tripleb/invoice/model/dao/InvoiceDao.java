package com.jh.tripleb.invoice.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jh.tripleb.companyInfo.model.vo.CompanyInfo;
import com.jh.tripleb.invoice.model.vo.Invoice;
import com.jh.tripleb.invoice.model.vo.InvoiceCompanyDto;
import com.jh.tripleb.invoice.model.vo.InvoicePurchaseDto;

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

}
