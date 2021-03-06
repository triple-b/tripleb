package com.jh.tripleb.approve.model.vo;

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
public class Approve {
	
	private int approveNo;			// 수업결재 번호
	private Date approveReply;		// 수업결재 요청일
	private Date approveDate;		// 결재일
	private String approveStatus;	// 결재 상태 ('N' : 승인대기, 'Y' : 승인완료  'R' : 반려)
	private String approveComment;  // 결재 의견
	private int classNo;			// 수업번호
	private int trainerNo;			// 요청자번호
	private int confirmerNo;		// 결재자번호
	
	private int confirmerName;		// 결재자이름
}
