package com.jh.tripleb.vacation.model.vo;

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
public class Vacation {
	
	private int vacNo;			// 휴가번호
	private Date vacStDate;		// 휴가시작일
	private Date vacEndDate;	// 휴가종료일
	private String vacCause;	// 휴가 사유
	private String varStatus;	// 휴가 상태 (Y:유지, N:취소)
	private int trainerNo;		// 트레이너 번호
	

}
