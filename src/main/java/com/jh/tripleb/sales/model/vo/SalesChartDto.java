package com.jh.tripleb.sales.model.vo;

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
public class SalesChartDto {
	
	private String dateKey;		// YYYYMM
	private int totalPrice;		// 전체 금액
	private int memberPrice;	// 회원권 금액
	private int ptPrice;		// pt 금액	
	private int cardPrice;		// 카드결제 금액
	private int cashPrice;		// 현금결제 금액
	

}
