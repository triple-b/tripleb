package com.jh.tripleb.mProduct.model.vo;

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
public class MProduct {
	
	private int memProductNo;		// 보유상품번호
	private Date memProductStart;	// 시작일
	private Date memProductEnd;		// 종료일
	private int memberNo;			// 회원번호
	private int productNo;			// 상품권번호
	
}
