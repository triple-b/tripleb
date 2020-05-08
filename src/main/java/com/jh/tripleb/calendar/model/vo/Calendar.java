package com.jh.tripleb.calendar.model.vo;

import java.sql.Timestamp;

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
	private Timestamp calStart;	// 일장 시작일
	private Timestamp calEnd;	// 종료일
	private String calStatus;	// 일정 상태
	private String calType;		// 일정 타입
	private String calColor;	// 일정 색상
	private int trainerNo;		// 트레이너 번호
	private String trainerName;	// 트레이너 이

}
