package com.jh.tripleb.payinfo.model.vo;

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
	private String payCardName;		// 카드명
	private String payCardNo;		// 카드번호
	private String payCardAppNo;	// 카드승인번호
	private Date payDate;			// 결제일
	private int payPrice;			// 결제금액
	private int memberNo;			// 회원번호
	private int productNo;			// 상품권번호

}
