package com.jh.tripleb.invoice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jh.tripleb.companyInfo.model.vo.CompanyInfo;
import com.jh.tripleb.invoice.model.dao.InvoiceDao;
import com.jh.tripleb.invoice.model.vo.Invoice;
import com.jh.tripleb.invoice.model.vo.InvoiceCompanyDto;
import com.jh.tripleb.invoice.model.vo.InvoicePurchaseDto;

@Service("iService")
public class InvoiceServiceImpl implements InvoiceService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private InvoiceDao iDao;

	@Override
	public ArrayList<Invoice> selectListInvoice() {	
		return iDao.selectListInvoice(sqlSession);
	}

	@Override
	public Invoice selectInvocie(int ino) {
		return iDao.selectInvocie(sqlSession, ino);
	}

	@Override
	public InvoiceCompanyDto selectCompanyInfo(int cno) {	
		return iDao.selectCompanyInfo(sqlSession, cno);
	}

	@Override
	public ArrayList<InvoicePurchaseDto> selectListPurchase(int ino) {
		return iDao.selectListPurchase(sqlSession, ino);
	}
	

}
