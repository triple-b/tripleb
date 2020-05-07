package com.jh.tripleb.appVaca.model.vo;

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
public class AppVaca {
	
	private int appVacNo;			// 휴가결재번호
	private Date appVacReply;		// 결재 요청일
	private Date appVacDate;		// 결재일
	private String appVacStatus;	// 결재 상태 (N: 미승인 Y:승인 R:반려)
	private String appVacComment;	// 결재 의견
	private int vacNo;				// 휴가 번호
	private int confirmerNo;		// 결재자 번호

}
