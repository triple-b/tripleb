package com.jh.tripleb.invoice.model.vo;

import java.sql.Date;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Invoice {
	
	private int invoiceNo;					// 구매번호
	private int invoiceNumber;				// 계약서 번호
	private Date invoiceDate;				// 계약서 발급일
	private Date invoiceDueDate;			// 계약서 실행일
	private String invoicePname;			// 구매처 이름
	private String invoicePaddress; 		// 구매처 주소
	private String invoicePphone;			// 구매처 전화번호
	private String invoicePemail;			// 구매처 이메일
	private String invoicePurl;				// 구매처 서비스 url
	private String invoiceItemList;			//	구매항목
	private int invoiceTotalPrice;			// 총 구매액
	private String invoiceStatus;			// 구매상태 (Y:유지 N:취소)
	private Date invoiceCancelDate;			// 구매취소일
	private String invoiceCancelReason;		// 구매취소사유

}
