package com.jh.tripleb.purchase.model.vo;

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
public class Purchase {
	
	private int purchaseNo;			// 구매번호
	private int purchaseCount;		// 구매수량
	private int templateItemNo;		// 서비스 항목 번호
	private int invoiceNo;			// 계약서 구매번호

}
