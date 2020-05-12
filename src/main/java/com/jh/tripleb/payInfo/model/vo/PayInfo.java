package com.jh.tripleb.payInfo.model.vo;

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
public class PayInfo {
	
	private int payNo;				// 결제번호
	private String payType;			// 상품결제방법
	private Date payDate;			// 결제일
	private int payPrice;			// 결제금액
	private int memberNo;			// 회원번호
	private int productNo;			// 상품권번호

}
