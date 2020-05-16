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
public class SalesSearchDto {	 
	
	private String searchStr;			// 검색어
	private String startDate;			// 시작일
	private String endDate;				// 종료일
	private String searchProduct;		// 상품 검색어
	private String searchTrainer;		// 트레이너 검색어
	
}
