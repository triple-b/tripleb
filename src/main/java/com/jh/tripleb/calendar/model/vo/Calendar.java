package com.jh.tripleb.calendar.model.vo;

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
public class Calendar {
	
	private int calNo;			// 일정번호
	private String calTitle;	// 일정명
	private String calContent;	// 일정 설명
	private Date calStart;		// 일장 시작일
	private Date calEnd;		// 종료일
	private String calStatus;	// 일정 상태
	private int trainerNo;		// 트레이너 번호

}
