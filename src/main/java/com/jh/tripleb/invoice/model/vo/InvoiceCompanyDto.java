package com.jh.tripleb.invoice.model.vo;

import lombok.Getter;

@Getter
public class InvoiceCompanyDto {	
	
	private int companyNo;					// 회사 번호
	private String companyName;				// 회사 이름
	private String companyAddress;			// 회사 주소
	private String companyPhone;			// 회사 전화번호
	private String companyEmail;			// 회사 이메일
	private String companyLogo;				// 회사 로고이미지 경로		
	
}
