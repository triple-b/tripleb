package com.jh.tripleb.invoice.model.service;

import java.util.ArrayList;

import com.jh.tripleb.companyInfo.model.vo.CompanyInfo;
import com.jh.tripleb.invoice.model.vo.Invoice;
import com.jh.tripleb.invoice.model.vo.InvoiceCompanyDto;
import com.jh.tripleb.invoice.model.vo.InvoicePurchaseDto;

public interface InvoiceService {

	/**
	 * 1. 계약서 전체 조회용 서비스
	 * @author	장미경	
	 * @return	ArrayList : 조회된 계약서 전체 리스트 객체
	 */	
	ArrayList<Invoice> selectListInvoice();
	
	/**
	 * 2-1. 계약서 상세 조회용 서비스
	 * @param	ino : 조회할 계약서 번호
	 * @return	Invoice : 조회된 계약서 객체
	 */	
	Invoice selectInvocie(int invoiceNo);
	
	/**
	 * 2-2. 회사정보 조회용 서비스
	 * @param	cno : 조회할 회사 이름
	 * @return	CompanyInfo : 조회된 회사정보 객체
	 */	
	InvoiceCompanyDto selectCompanyInfo(int companyNo);
	
	/**
	 * 2-3. 계약서별 구매정보 전체 조회용 서비스
	 * @param	invoiceNo : 조회할 회사 이름
	 * @return	ArrayList : 조회된 구매정보 전체 리스트 객체
	 */
	ArrayList<InvoicePurchaseDto> selectListPurchase(int invoiceNo);
		
	// 3-2. 계약서 저장
	int insertInvocie(Invoice i);
	
	// 3-3. 구매정보 저장
	//int insertPurchase(Purchase p)
	
	/**
	 * 4. 계약서 수정용  서비스
	 * @author	장미경	
	 * @Param	InvoiceNo : 수정할 계약서 번호
	 * @return	result : 수행결과
	 */		
	//int updateInvocie(Invoice i);
	
	

}
