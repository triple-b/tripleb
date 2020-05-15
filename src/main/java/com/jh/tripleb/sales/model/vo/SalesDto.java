package com.jh.tripleb.sales.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class SalesDto {
			
	private Date payDate;				// 결제일
	private String productCategory;		// 분류 (회원권, PT권)
	private String productName;			// 상품권이름
	private String memberTrainer;		// 담당 트레이너
	private String memberName;			// 회원이름
	private int payPrice;				// 결제금액	
	private String payType;				// 상품결제방법

}
