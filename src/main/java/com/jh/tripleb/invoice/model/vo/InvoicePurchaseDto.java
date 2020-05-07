package com.jh.tripleb.invoice.model.vo;

import lombok.Getter;

@Getter
public class InvoicePurchaseDto {
	
	private int templateItemNo;				// 서비스 항목 번호
	private String templateParentItemName;	// 상위 서비스 항목 이름
	private String templateItemName;		// 서비스항목 이름
	private String templateItemDescription; // 서비스항목 설명
	private int templateItemPrice;			// 서비스항목 가격
	private int purchaseCount;				// 구매 수량
	
}
