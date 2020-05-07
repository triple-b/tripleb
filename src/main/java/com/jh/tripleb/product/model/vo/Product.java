package com.jh.tripleb.product.model.vo;

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
public class Product {
	
	private int productNo;			// 상품권번호
	private String productName;		// 상품권이름
	private int productPrice;		// 상품 근액
	private String productCategory;	// 분류 (회원권, PT권)
	private int productDays;		// 이용기간 (30, 90, 120)
	private String productStatus;	// 상품권 상태 ( Y:유지 N:삭제)
	private String weekDay;			// 주중, 주말
	private String morAfter;		// 오전, 오후
	private String times;			// 주 2회, 3회

}
